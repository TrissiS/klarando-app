'use client'

import { Suspense, useEffect, useMemo, useState } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import AdminCategoriesSection from '@/app/Components/admin/AdminCategoriesSection'
import AdminIngredientsSection from '@/app/Components/admin/AdminIngredientsSection'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import AdminProductsSection from '@/app/Components/admin/AdminProductsSection'
import ProductIngredientsManager from '@/app/Components/admin/ProductIngredientsManager'
import {
  createCategory,
  createIngredient,
  createProductIngredient,
  createProductModifier,
  createProduct,
  getCalculationList,
  deleteCategory,
  deleteIngredient,
  deleteProduct,
  getCategories,
  getIngredients,
  getProductIngredients,
  getProductModifiers,
  getProducts,
  getBusinessTemplateDetail,
  getBusinessTemplates,
  getStoredAccessToken,
  updateCategory,
  updateIngredient,
  updateProduct,
  type Category,
  type Ingredient,
  type Product,
  type UnitEanEntry,
  type BusinessTemplateDetail,
  type BusinessTemplateOverview,
  type ProductCalculation,
  type ProductNutrition,
} from '@/lib/api'

type ProductTab = 'products' | 'categories' | 'ingredients' | 'modifiers' | 'pricing'

function isProductTab(value: string | null): value is ProductTab {
  return (
    value === 'products' ||
    value === 'categories' ||
    value === 'ingredients' ||
    value === 'modifiers' ||
    value === 'pricing'
  )
}

function suggestUniqueProductNameForCopy(products: Product[], sourceName: string) {
  const used = new Set(
    products.map((entry) => entry.name.trim().toLowerCase()).filter((entry) => entry.length > 0)
  )

  const normalized = sourceName.trim()
  if (!normalized) {
    return 'Neues Produkt'
  }

  const base = normalized
  let candidate = `${base} (Kopie)`
  let counter = 2
  while (used.has(candidate.toLowerCase())) {
    candidate = `${base} (Kopie ${counter})`
    counter += 1
  }

  return candidate
}

function toPriceDraftMap(products: Product[]) {
  return Object.fromEntries(products.map((product) => [product.id, String(Number(product.price).toFixed(2))]))
}

const INTEGER_ONLY_INGREDIENT_UNITS = new Set(['Stueck', 'Dose'])

type NutritionDraft = {
  referenceUnit: 'g' | 'ml' | 'portion'
  customReferenceLabel: string
  energyKj: string
  energyKcal: string
  fat: string
  saturatedFat: string
  carbohydrates: string
  sugar: string
  protein: string
  salt: string
  fiber: string
  portionSize: string
  portionUnit: string
}

const DEFAULT_NUTRITION_DRAFT: NutritionDraft = {
  referenceUnit: 'g',
  customReferenceLabel: '',
  energyKj: '',
  energyKcal: '',
  fat: '',
  saturatedFat: '',
  carbohydrates: '',
  sugar: '',
  protein: '',
  salt: '',
  fiber: '',
  portionSize: '',
  portionUnit: '',
}

function parseNutritionNumber(value: string): number | null {
  const trimmed = value.trim()
  if (!trimmed) return null
  const normalized = trimmed.replace(',', '.')
  const parsed = Number(normalized)
  return Number.isFinite(parsed) ? parsed : null
}

function nutritionDraftFromProduct(nutrition: ProductNutrition | null | undefined): NutritionDraft {
  if (!nutrition) {
    return { ...DEFAULT_NUTRITION_DRAFT }
  }

  return {
    referenceUnit:
      nutrition.referenceUnit === 'ml' || nutrition.referenceUnit === 'portion'
        ? nutrition.referenceUnit
        : 'g',
    customReferenceLabel: nutrition.customReferenceLabel || '',
    energyKj: nutrition.energyKj != null ? String(nutrition.energyKj) : '',
    energyKcal: nutrition.energyKcal != null ? String(nutrition.energyKcal) : '',
    fat: nutrition.fat != null ? String(nutrition.fat) : '',
    saturatedFat: nutrition.saturatedFat != null ? String(nutrition.saturatedFat) : '',
    carbohydrates: nutrition.carbohydrates != null ? String(nutrition.carbohydrates) : '',
    sugar: nutrition.sugar != null ? String(nutrition.sugar) : '',
    protein: nutrition.protein != null ? String(nutrition.protein) : '',
    salt: nutrition.salt != null ? String(nutrition.salt) : '',
    fiber: nutrition.fiber != null ? String(nutrition.fiber) : '',
    portionSize: nutrition.portionSize != null ? String(nutrition.portionSize) : '',
    portionUnit: nutrition.portionUnit || '',
  }
}

function nutritionPayloadFromDraft(draft: NutritionDraft): ProductNutrition | null {
  const energyKj = parseNutritionNumber(draft.energyKj)
  const energyKcal = parseNutritionNumber(draft.energyKcal)
  const fat = parseNutritionNumber(draft.fat)
  const saturatedFat = parseNutritionNumber(draft.saturatedFat)
  const carbohydrates = parseNutritionNumber(draft.carbohydrates)
  const sugar = parseNutritionNumber(draft.sugar)
  const protein = parseNutritionNumber(draft.protein)
  const salt = parseNutritionNumber(draft.salt)
  const fiber = parseNutritionNumber(draft.fiber)
  const portionSize = parseNutritionNumber(draft.portionSize)
  const portionUnit = draft.portionUnit.trim()
  const customReferenceLabel = draft.customReferenceLabel.trim()

  const hasValues =
    energyKj != null ||
    energyKcal != null ||
    fat != null ||
    saturatedFat != null ||
    carbohydrates != null ||
    sugar != null ||
    protein != null ||
    salt != null ||
    fiber != null ||
    portionSize != null ||
    portionUnit.length > 0 ||
    customReferenceLabel.length > 0

  if (!hasValues) {
    return null
  }

  const referenceAmount = draft.referenceUnit === 'portion' ? '1' : '100'
  return {
    referenceAmount,
    referenceUnit: draft.referenceUnit,
    customReferenceLabel: customReferenceLabel || null,
    energyKj,
    energyKcal,
    fat,
    saturatedFat,
    carbohydrates,
    sugar,
    protein,
    salt,
    fiber,
    portionSize,
    portionUnit: portionUnit || null,
  }
}

function isIntegerOnlyIngredientUnit(unit?: string | null) {
  return Boolean(unit && INTEGER_ONLY_INGREDIENT_UNITS.has(unit))
}

function parseMinimumStockByUnit(value: string, unit: string) {
  const parsed = Number(value || 0)
  if (!Number.isFinite(parsed) || parsed < 0) {
    return {
      ok: false as const,
      value: 0,
      error: 'Mindestbestand muss >= 0 sein.',
    }
  }

  if (isIntegerOnlyIngredientUnit(unit) && !Number.isInteger(parsed)) {
    return {
      ok: false as const,
      value: 0,
      error: 'Bei Einheit Stueck oder Dose sind nur ganze Zahlen erlaubt.',
    }
  }

  return {
    ok: true as const,
    value: parsed,
    error: '',
  }
}

function formatMinimumStockDraftByUnit(value: string, unit: string) {
  const parsed = Number(value || 0)
  if (!Number.isFinite(parsed)) {
    return '0'
  }

  if (isIntegerOnlyIngredientUnit(unit)) {
    return String(Math.round(parsed))
  }

  return String(parsed)
}

function AdminProductsPageContent() {
  const router = useRouter()
  const searchParams = useSearchParams()

  const [activeTab, setActiveTab] = useState<ProductTab>('products')

  const [products, setProducts] = useState<Product[]>([])
  const [categories, setCategories] = useState<Category[]>([])
  const [ingredients, setIngredients] = useState<Ingredient[]>([])
  const [ingredientsLoaded, setIngredientsLoaded] = useState(false)

  const [productNumber, setProductNumber] = useState('')
  const [productName, setProductName] = useState('')
  const [productImageUrl, setProductImageUrl] = useState('')
  const [productEan, setProductEan] = useState('')
  const [productUnitEans, setProductUnitEans] = useState<UnitEanEntry[]>([])
  const [beverageContainerType, setBeverageContainerType] = useState<
    'NONE' | 'EINWEG' | 'MEHRWEG'
  >('NONE')
  const [isBeverage, setIsBeverage] = useState(false)
  const [contentVolumeLiters, setContentVolumeLiters] = useState('')
  const [ageRestriction, setAgeRestriction] = useState<'NONE' | 'AGE_16' | 'AGE_18'>('NONE')
  const [isVegetarian, setIsVegetarian] = useState(false)
  const [isVegan, setIsVegan] = useState(false)
  const [isSpicy, setIsSpicy] = useState(false)
  const [isVerySpicy, setIsVerySpicy] = useState(false)
  const [isNew, setIsNew] = useState(false)
  const [isPopular, setIsPopular] = useState(false)
  const [productDeposit, setProductDeposit] = useState('0')
  const [articleInfo, setArticleInfo] = useState('')
  const [foodBusinessOperator, setFoodBusinessOperator] = useState('')
  const [nutritionInfo, setNutritionInfo] = useState('')
  const [nutritionDraft, setNutritionDraft] = useState<NutritionDraft>({
    ...DEFAULT_NUTRITION_DRAFT,
  })
  const [price, setPrice] = useState('')
  const [vatRate, setVatRate] = useState('19')
  const [categoryId, setCategoryId] = useState('')
  const [available, setAvailable] = useState('true')
  const [editingProductId, setEditingProductId] = useState<string | null>(null)
  const [loadedProductNumber, setLoadedProductNumber] = useState<string>('')
  const [savingProduct, setSavingProduct] = useState(false)
  const [productNumberError, setProductNumberError] = useState('')
  const [deletingProductId, setDeletingProductId] = useState<string | null>(null)
  const [creatingIngredientProductId, setCreatingIngredientProductId] = useState<string | null>(null)
  const [copyingProductId, setCopyingProductId] = useState<string | null>(null)

  const [categoryName, setCategoryName] = useState('')
  const [categoryImageUrl, setCategoryImageUrl] = useState('')
  const [categorySortOrder, setCategorySortOrder] = useState('0')
  const [editingCategoryId, setEditingCategoryId] = useState<string | null>(null)
  const [savingCategory, setSavingCategory] = useState(false)
  const [deletingCategoryId, setDeletingCategoryId] = useState<string | null>(null)

  const [ingredientName, setIngredientName] = useState('')
  const [ingredientCategory, setIngredientCategory] = useState<'FOOD' | 'PACKAGING'>('FOOD')
  const [ingredientUnit, setIngredientUnit] = useState('g')
  const [recipeUnit, setRecipeUnit] = useState('g')
  const [gramsPerPurchaseUnit, setGramsPerPurchaseUnit] = useState('')
  const [purchasePrice, setPurchasePrice] = useState('')
  const [minimumStock, setMinimumStock] = useState('0')
  const [consumptionFactorPercent, setConsumptionFactorPercent] = useState('0')
  const [deposit, setDeposit] = useState('0')
  const [ingredientEan, setIngredientEan] = useState('')
  const [ingredientUnitEans, setIngredientUnitEans] = useState<UnitEanEntry[]>([])
  const [allergens, setAllergens] = useState('')
  const [supplier, setSupplier] = useState('')
  const [articleNumber, setArticleNumber] = useState('')
  const [productTemplateId, setProductTemplateId] = useState('')
  const [editingIngredientId, setEditingIngredientId] = useState<string | null>(null)
  const [savingIngredient, setSavingIngredient] = useState(false)
  const [deletingIngredientId, setDeletingIngredientId] = useState<string | null>(null)

  const [pricingSearch, setPricingSearch] = useState('')
  const [pricingCategoryFilter, setPricingCategoryFilter] = useState('ALL')
  const [draftPrices, setDraftPrices] = useState<Record<string, string>>({})
  const [savingPriceIds, setSavingPriceIds] = useState<Set<string>>(new Set())
  const [calculationRows, setCalculationRows] = useState<ProductCalculation[]>([])
  const [loadingCalculation, setLoadingCalculation] = useState(false)
  const [modifierWorkspaceProductId, setModifierWorkspaceProductId] = useState('')

  const [loadingCore, setLoadingCore] = useState(true)
  const [loadingIngredients, setLoadingIngredients] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [templateOverviews, setTemplateOverviews] = useState<BusinessTemplateOverview[]>([])
  const [templateDetail, setTemplateDetail] = useState<BusinessTemplateDetail | null>(null)
  const [templateImportDialogOpen, setTemplateImportDialogOpen] = useState(false)
  const [templateImportLoading, setTemplateImportLoading] = useState(false)
  const [templateImportSaving, setTemplateImportSaving] = useState(false)
  const [selectedTemplateId, setSelectedTemplateId] = useState('')
  const [selectedTemplateProductId, setSelectedTemplateProductId] = useState('')
  const [importProductNumber, setImportProductNumber] = useState('')
  const [importProductEan, setImportProductEan] = useState('')
  const [importPrice, setImportPrice] = useState('')
  const [importCategoryId, setImportCategoryId] = useState('')
  const productNumberLocked = Boolean(editingProductId && loadedProductNumber.trim())

  async function loadCoreData() {
    try {
      setLoadingCore(true)
      const [productData, categoryData] = await Promise.all([getProducts(), getCategories()])
      setProducts(productData)
      setCategories(categoryData)
      setDraftPrices(toPriceDraftMap(productData))
    } catch (loadError) {
      setError(loadError instanceof Error ? loadError.message : 'Produkte konnten nicht geladen werden')
    } finally {
      setLoadingCore(false)
    }
  }

  async function refreshProductsOnly() {
    const productData = await getProducts()
    setProducts(productData)
    setDraftPrices(toPriceDraftMap(productData))
  }

  async function refreshCategoriesOnly() {
    const categoryData = await getCategories()
    setCategories(categoryData)
  }

  async function loadIngredientsData(force = false) {
    if (!force && ingredientsLoaded) return
    try {
      setLoadingIngredients(true)
      const [ingredientData, productData] = await Promise.all([getIngredients(), getProducts()])
      setIngredients(ingredientData)
      setProducts(productData)
      setDraftPrices(toPriceDraftMap(productData))
      setIngredientsLoaded(true)
    } catch (loadError) {
      setError(loadError instanceof Error ? loadError.message : 'Zutaten konnten nicht geladen werden')
    } finally {
      setLoadingIngredients(false)
    }
  }

  async function loadCalculationData() {
    try {
      setLoadingCalculation(true)
      const rows = await getCalculationList()
      setCalculationRows(rows)
    } catch {
      setCalculationRows([])
    } finally {
      setLoadingCalculation(false)
    }
  }

  useEffect(() => {
    void loadCoreData()
  }, [])

  useEffect(() => {
    const token = getStoredAccessToken()
    if (!token) {
      return
    }
    ;(async () => {
      try {
        const rows = await getBusinessTemplates(token)
        setTemplateOverviews(rows)
        if (rows[0]?.id) {
          setSelectedTemplateId(rows[0].id)
        }
      } catch {
        // ignore optional helper data
      }
    })()
  }, [])

  useEffect(() => {
    const token = getStoredAccessToken()
    if (!token || !selectedTemplateId) {
      setTemplateDetail(null)
      return
    }
    let cancelled = false
    ;(async () => {
      try {
        setTemplateImportLoading(true)
        const detail = await getBusinessTemplateDetail(token, selectedTemplateId)
        if (!cancelled) {
          setTemplateDetail(detail)
        }
      } catch {
        if (!cancelled) {
          setTemplateDetail(null)
        }
      } finally {
        if (!cancelled) {
          setTemplateImportLoading(false)
        }
      }
    })()
    return () => {
      cancelled = true
    }
  }, [selectedTemplateId])

  useEffect(() => {
    const tabFromUrl = searchParams.get('tab')
    setActiveTab(isProductTab(tabFromUrl) ? tabFromUrl : 'products')
  }, [searchParams])

  useEffect(() => {
    if (activeTab === 'ingredients') {
      void loadIngredientsData()
    }
    if (activeTab === 'pricing') {
      void loadCalculationData()
    }
  }, [activeTab])

  useEffect(() => {
    if (products.length === 0) {
      setModifierWorkspaceProductId('')
      return
    }

    if (
      modifierWorkspaceProductId &&
      products.some((entry) => entry.id === modifierWorkspaceProductId)
    ) {
      return
    }

    setModifierWorkspaceProductId(products[0].id)
  }, [products, modifierWorkspaceProductId])

  function setTab(tab: ProductTab) {
    setActiveTab(tab)
    const params = new URLSearchParams(searchParams.toString())
    if (tab === 'products') {
      params.delete('tab')
    } else {
      params.set('tab', tab)
    }
    const query = params.toString()
    router.replace(query ? `/admin/products?${query}` : '/admin/products')
  }

  function resetProductForm() {
    setProductNumber('')
    setLoadedProductNumber('')
    setProductName('')
    setProductImageUrl('')
    setProductEan('')
    setProductUnitEans([])
    setBeverageContainerType('NONE')
    setIsBeverage(false)
    setContentVolumeLiters('')
    setAgeRestriction('NONE')
    setIsVegetarian(false)
    setIsVegan(false)
    setIsSpicy(false)
    setIsVerySpicy(false)
    setIsNew(false)
    setIsPopular(false)
    setProductDeposit('0')
    setArticleInfo('')
    setFoodBusinessOperator('')
    setNutritionInfo('')
    setNutritionDraft({ ...DEFAULT_NUTRITION_DRAFT })
    setPrice('')
    setVatRate('19')
    setCategoryId('')
    setAvailable('true')
    setEditingProductId(null)
  }

  function resetCategoryForm() {
    setCategoryName('')
    setCategoryImageUrl('')
    setCategorySortOrder('0')
    setEditingCategoryId(null)
  }

  function resetIngredientForm() {
    setIngredientName('')
    setIngredientCategory('FOOD')
    setIngredientUnit('g')
    setRecipeUnit('g')
    setGramsPerPurchaseUnit('')
    setPurchasePrice('')
    setMinimumStock('0')
    setConsumptionFactorPercent('0')
    setDeposit('0')
    setIngredientEan('')
    setIngredientUnitEans([])
    setAllergens('')
    setSupplier('')
    setArticleNumber('')
    setProductTemplateId('')
    setEditingIngredientId(null)
  }

  async function handleProductImageFile(file: File | null) {
    if (!file) return
    if (!file.type.startsWith('image/')) {
      setError('Bitte eine gueltige Bilddatei auswaehlen.')
      return
    }
    const maxBytes = 6 * 1024 * 1024
    if (file.size > maxBytes) {
      setError('Produktbild ist zu gross (max. 6 MB).')
      return
    }

    const fileReader = new FileReader()
    const dataUrl = await new Promise<string>((resolve, reject) => {
      fileReader.onload = () => resolve(String(fileReader.result || ''))
      fileReader.onerror = () => reject(new Error('Produktbild konnte nicht gelesen werden'))
      fileReader.readAsDataURL(file)
    })

    setProductImageUrl(dataUrl)
    setError('')
  }

  async function handleCategoryImageFile(file: File | null) {
    if (!file) return
    if (!file.type.startsWith('image/')) {
      setError('Bitte eine gueltige Bilddatei auswaehlen.')
      return
    }
    const maxBytes = 3 * 1024 * 1024
    if (file.size > maxBytes) {
      setError('Kategoriebild ist zu gross (max. 3 MB).')
      return
    }

    const fileReader = new FileReader()
    const dataUrl = await new Promise<string>((resolve, reject) => {
      fileReader.onload = () => resolve(String(fileReader.result || ''))
      fileReader.onerror = () => reject(new Error('Kategoriebild konnte nicht gelesen werden'))
      fileReader.readAsDataURL(file)
    })

    setCategoryImageUrl(dataUrl)
    setError('')
  }

  async function handleProductSubmit(e: React.FormEvent) {
    e.preventDefault()

    try {
      setSavingProduct(true)
      setError('')
      setSuccess('')
      setProductNumberError('')

      const payload = {
        categoryId: categoryId || null,
        productNumber: productNumber.trim() || null,
        name: productName,
        imageUrl: productImageUrl.trim() || null,
        ean: productEan.trim() || null,
        unitEans: productUnitEans,
        beverageContainerType,
        isBeverage,
        contentVolumeLiters: contentVolumeLiters.trim() ? Number(contentVolumeLiters) : null,
        deposit: Number(productDeposit || 0),
        ageRestriction,
        isVegetarian,
        isVegan,
        isSpicy,
        isVerySpicy,
        isNew,
        isPopular,
        articleInfo: articleInfo.trim() || null,
        foodBusinessOperator: foodBusinessOperator.trim() || null,
        nutritionInfo: nutritionInfo.trim() || null,
        nutrition: nutritionPayloadFromDraft(nutritionDraft),
        price: Number(price),
        vatRate: Number(vatRate),
        available: available === 'true',
      }

      if (payload.available && !payload.productNumber) {
        const message = 'Bitte Produktnummer vergeben, bevor der Artikel verkauft werden kann.'
        setProductNumberError(message)
        setError(message)
        return
      }

      if (editingProductId) {
        await updateProduct(editingProductId, {
          productNumber: payload.productNumber || null,
          name: payload.name,
          imageUrl: payload.imageUrl,
          ean: payload.ean,
          unitEans: payload.unitEans,
          beverageContainerType: payload.beverageContainerType,
          isBeverage: payload.isBeverage,
          contentVolumeLiters: payload.contentVolumeLiters,
          deposit: payload.deposit,
          ageRestriction: payload.ageRestriction,
          isVegetarian: payload.isVegetarian,
          isVegan: payload.isVegan,
          isSpicy: payload.isSpicy,
          isVerySpicy: payload.isVerySpicy,
          isNew: payload.isNew,
          isPopular: payload.isPopular,
          articleInfo: payload.articleInfo,
          foodBusinessOperator: payload.foodBusinessOperator,
          nutritionInfo: payload.nutritionInfo,
          nutrition: payload.nutrition,
          price: payload.price,
          vatRate: payload.vatRate,
          categoryId: payload.categoryId,
          available: payload.available,
        })
        setSuccess('Produkt erfolgreich aktualisiert.')
        setLoadedProductNumber(payload.productNumber || '')
      } else {
        await createProduct(payload)
        setSuccess('Produkt erfolgreich erstellt.')
      }

      resetProductForm()
      await loadCoreData()
      if (ingredientsLoaded) {
        await loadIngredientsData(true)
      }
    } catch (submitError) {
      const message =
        submitError instanceof Error ? submitError.message : 'Produkt konnte nicht gespeichert werden'
      setError(message)
      if (message.toLowerCase().includes('artikelnummer') || message.toLowerCase().includes('produktnummer')) {
        setProductNumberError(message)
      }
    } finally {
      setSavingProduct(false)
    }
  }

  function openTemplateProductDialog() {
    setTemplateImportDialogOpen(true)
    setError('')
    setSuccess('')
    setProductNumberError('')
  }

  function preloadTemplateProduct(productId: string) {
    setSelectedTemplateProductId(productId)
    const selectedProduct = templateDetail?.products.find((entry) => entry.id === productId)
    if (!selectedProduct) {
      return
    }
    setImportProductNumber(selectedProduct.productNumber || '')
    setImportProductEan(selectedProduct.ean || '')
    setImportPrice(String(Number(selectedProduct.price).toFixed(2)))
    const matchedCategory = categories.find(
      (category) =>
        category.name.trim().toLowerCase() ===
        (selectedProduct.category?.name || '').trim().toLowerCase()
    )
    setImportCategoryId(matchedCategory?.id || '')
  }

  async function handleImportTemplateProduct() {
    const selectedProduct = templateDetail?.products.find(
      (entry) => entry.id === selectedTemplateProductId
    )
    if (!selectedProduct) {
      setError('Bitte ein Vorlagenprodukt auswählen.')
      return
    }

    const resolvedNumber = importProductNumber.trim() || selectedProduct.productNumber || ''
    const duplicate = resolvedNumber
      ? products.find(
          (entry) =>
            (entry.productNumber || '').trim().toLowerCase() ===
            resolvedNumber.trim().toLowerCase()
        )
      : null
    if (duplicate) {
      setProductNumberError(`Diese Produktnummer ist bereits vergeben: ${resolvedNumber}`)
      setError(`Produktnummer ${resolvedNumber} existiert bereits in dieser Filiale.`)
      return
    }

    const shouldBeAvailable = Boolean(resolvedNumber)

    try {
      setTemplateImportSaving(true)
      setError('')
      setProductNumberError('')
      await createProduct({
        categoryId: importCategoryId || null,
        productNumber: resolvedNumber || null,
        name: selectedProduct.name,
        imageUrl: selectedProduct.imageUrl || null,
        ean: (importProductEan.trim() || selectedProduct.ean || null) as string | null,
        unitEans: [],
        beverageContainerType: 'NONE',
        isBeverage: false,
        contentVolumeLiters: null,
        deposit: 0,
        ageRestriction: 'NONE',
        isVegetarian: false,
        isVegan: false,
        isSpicy: false,
        isVerySpicy: false,
        isNew: false,
        isPopular: false,
        articleInfo: null,
        foodBusinessOperator: null,
        nutritionInfo: null,
        nutrition: null,
        price: Number(importPrice || selectedProduct.price),
        vatRate: Number(selectedProduct.vatRate || 7),
        available: shouldBeAvailable,
      })
      await loadCoreData()
      setTemplateImportDialogOpen(false)
      setSuccess(
        shouldBeAvailable
          ? `Produkt "${selectedProduct.name}" aus Vorlage übernommen.`
          : `Produkt "${selectedProduct.name}" übernommen. Bitte Produktnummer vergeben, um den Artikel verfügbar zu schalten.`
      )
    } catch (importError) {
      const message =
        importError instanceof Error ? importError.message : 'Vorlagenprodukt konnte nicht übernommen werden'
      setError(message)
      if (message.toLowerCase().includes('artikelnummer') || message.toLowerCase().includes('produktnummer')) {
        setProductNumberError(message)
      }
    } finally {
      setTemplateImportSaving(false)
    }
  }

  async function handleDeleteProduct(product: Product) {
    if (!window.confirm(`Produkt "${product.name}" wirklich loeschen?`)) {
      return
    }

    try {
      setDeletingProductId(product.id)
      setError('')
      setSuccess('')
      await deleteProduct(product.id)

      if (editingProductId === product.id) {
        resetProductForm()
      }

      await loadCoreData()
      if (ingredientsLoaded) {
        await loadIngredientsData(true)
      }
      setSuccess('Produkt erfolgreich geloescht.')
    } catch (deleteError) {
      setError(deleteError instanceof Error ? deleteError.message : 'Produkt konnte nicht geloescht werden')
    } finally {
      setDeletingProductId(null)
    }
  }

  async function handleCreateIngredientFromProduct(product: Product) {
    try {
      setCreatingIngredientProductId(product.id)
      setError('')
      setSuccess('')
      await createIngredient({
        name: product.name,
        unit: 'Stueck',
        recipeUnit: 'Stueck',
        gramsPerPurchaseUnit: null,
        purchasePrice: Number(product.price),
        minimumStock: 0,
        consumptionFactorPercent: 0,
        deposit: 0,
        ean: product.ean || null,
        unitEans: product.unitEans || [],
        supplier: '',
        articleNumber: product.productNumber || '',
        allergens: (product.allergens || []).join(','),
      })
      setSuccess(`Produkt "${product.name}" wurde als Zutat angelegt.`)
      if (activeTab === 'ingredients' || ingredientsLoaded) {
        await loadIngredientsData(true)
      }
    } catch (createError) {
      setError(createError instanceof Error ? createError.message : 'Produkt konnte nicht als Zutat angelegt werden')
    } finally {
      setCreatingIngredientProductId(null)
    }
  }

  async function handleCopyProduct(product: Product) {
    try {
      setCopyingProductId(product.id)
      setError('')
      setSuccess('')

      const [sourceIngredients, sourceModifiers] = await Promise.all([
        getProductIngredients(product.id),
        getProductModifiers(product.id),
      ])

      const copiedProduct = await createProduct({
        categoryId: product.categoryId || null,
        productNumber: '',
        name: suggestUniqueProductNameForCopy(products, product.name),
        imageUrl: product.imageUrl || null,
        ean: product.ean || null,
        unitEans: product.unitEans || [],
        beverageContainerType: product.beverageContainerType || 'NONE',
        isBeverage: product.isBeverage || false,
        contentVolumeLiters:
          product.contentVolumeLiters != null ? Number(product.contentVolumeLiters) : null,
        deposit: Number(product.deposit || 0),
        ageRestriction: product.ageRestriction || 'NONE',
        isVegetarian: product.isVegetarian || false,
        isVegan: product.isVegan || false,
        isSpicy: product.isSpicy || false,
        isVerySpicy: product.isVerySpicy || false,
        isNew: product.isNew || false,
        isPopular: product.isPopular || false,
        articleInfo: product.articleInfo || null,
        foodBusinessOperator: product.foodBusinessOperator || null,
        nutritionInfo: product.nutritionInfo || null,
        nutrition: product.nutrition || null,
        price: Number(product.price),
        vatRate: Number(product.vatRate),
        available: product.available,
      })

      for (const item of sourceIngredients) {
        await createProductIngredient({
          productId: copiedProduct.id,
          ingredientId: item.ingredientId,
          quantity: Number(item.quantity),
        })
      }

      for (const modifier of sourceModifiers) {
        await createProductModifier({
          productId: copiedProduct.id,
          ingredientId: modifier.ingredientId || null,
          kind: modifier.kind,
          name: modifier.name,
          priceDelta: Number(modifier.priceDelta),
          isDefaultSelected: modifier.isDefaultSelected,
          isActive: modifier.isActive,
          sortOrder: modifier.sortOrder,
        })
      }

      await loadCoreData()
      if (ingredientsLoaded) {
        await loadIngredientsData(true)
      }

      setSuccess(`Produkt "${product.name}" wurde als "${copiedProduct.name}" kopiert.`)
    } catch (copyError) {
      setError(copyError instanceof Error ? copyError.message : 'Produkt konnte nicht kopiert werden')
    } finally {
      setCopyingProductId(null)
    }
  }

  async function handleCategorySubmit(e: React.FormEvent) {
    e.preventDefault()
    try {
      setSavingCategory(true)
      setError('')
      setSuccess('')

      const payload = {
        name: categoryName,
        sortOrder: Number(categorySortOrder),
        imageUrl: categoryImageUrl.trim() || null,
      }

      if (editingCategoryId) {
        await updateCategory(editingCategoryId, payload)
        setSuccess('Kategorie erfolgreich aktualisiert.')
      } else {
        await createCategory(payload)
        setSuccess('Kategorie erfolgreich erstellt.')
      }

      resetCategoryForm()
      await refreshCategoriesOnly()
      await refreshProductsOnly()
    } catch (submitError) {
      setError(submitError instanceof Error ? submitError.message : 'Kategorie konnte nicht gespeichert werden')
    } finally {
      setSavingCategory(false)
    }
  }

  async function handleDeleteCategory(category: Category) {
    if (!window.confirm(`Kategorie "${category.name}" wirklich loeschen?`)) {
      return
    }

    try {
      setDeletingCategoryId(category.id)
      setError('')
      setSuccess('')
      await deleteCategory(category.id)
      if (editingCategoryId === category.id) {
        resetCategoryForm()
      }
      await refreshCategoriesOnly()
      await refreshProductsOnly()
      setSuccess('Kategorie erfolgreich geloescht.')
    } catch (deleteError) {
      setError(deleteError instanceof Error ? deleteError.message : 'Kategorie konnte nicht geloescht werden')
    } finally {
      setDeletingCategoryId(null)
    }
  }

  function applyProductTemplate(templateId: string) {
    const product = products.find((entry) => entry.id === templateId)
    if (!product) {
      return
    }

    setProductTemplateId(templateId)
    setIngredientName(product.name)
    setIngredientCategory('FOOD')
    setIngredientUnit('Stueck')
    setRecipeUnit('Stueck')
    setGramsPerPurchaseUnit('')
    setPurchasePrice(String(product.price))
    setMinimumStock('0')
    setConsumptionFactorPercent('0')
    setDeposit('0')
    setIngredientEan(product.ean || '')
    setIngredientUnitEans(product.unitEans || [])
    setAllergens((product.allergens || []).join(','))
    setArticleNumber(product.productNumber || '')
    setError('')
    setSuccess(`Produktvorlage "${product.name}" wurde uebernommen.`)
  }

  async function handleIngredientSubmit(e: React.FormEvent) {
    e.preventDefault()

    try {
      setSavingIngredient(true)
      setError('')
      setSuccess('')
      const parsedMinimumStock = parseMinimumStockByUnit(minimumStock || '0', ingredientUnit)
      if (!parsedMinimumStock.ok) {
        throw new Error(parsedMinimumStock.error)
      }
      const normalizedUnitEans = ingredientUnitEans.map((entry) => {
        const rawCount = Number(entry.unitCount || 1)
        const validCount = Number.isFinite(rawCount) && rawCount > 0 ? rawCount : 1
        return {
          ...entry,
          unitCount: isIntegerOnlyIngredientUnit(ingredientUnit)
            ? Math.max(1, Math.round(validCount))
            : validCount,
        }
      })

      if (editingIngredientId) {
        await updateIngredient(editingIngredientId, {
          name: ingredientName,
          category: ingredientCategory,
          unit: ingredientUnit,
          recipeUnit: recipeUnit || null,
          gramsPerPurchaseUnit: gramsPerPurchaseUnit ? Number(gramsPerPurchaseUnit) : null,
          purchasePrice: Number(purchasePrice),
          minimumStock: parsedMinimumStock.value,
          consumptionFactorPercent: Number(consumptionFactorPercent || 0),
          deposit: Number(deposit),
          ean: ingredientEan || null,
          unitEans: normalizedUnitEans,
          allergens: allergens || null,
          supplier: supplier || null,
          articleNumber: articleNumber || null,
        })
        setSuccess('Zutat erfolgreich aktualisiert.')
      } else {
        await createIngredient({
          name: ingredientName,
          category: ingredientCategory,
          unit: ingredientUnit,
          recipeUnit: recipeUnit || null,
          gramsPerPurchaseUnit: gramsPerPurchaseUnit ? Number(gramsPerPurchaseUnit) : null,
          purchasePrice: Number(purchasePrice),
          minimumStock: parsedMinimumStock.value,
          consumptionFactorPercent: Number(consumptionFactorPercent || 0),
          deposit: Number(deposit),
          ean: ingredientEan || null,
          unitEans: normalizedUnitEans,
          allergens,
          supplier,
          articleNumber,
        })
        setSuccess('Zutat erfolgreich erstellt.')
      }

      resetIngredientForm()
      await loadIngredientsData(true)
    } catch (submitError) {
      setError(submitError instanceof Error ? submitError.message : 'Zutat konnte nicht gespeichert werden')
    } finally {
      setSavingIngredient(false)
    }
  }

  async function handleDeleteIngredient(ingredient: Ingredient) {
    if (!window.confirm(`Zutat "${ingredient.name}" wirklich loeschen?`)) {
      return
    }

    try {
      setDeletingIngredientId(ingredient.id)
      setError('')
      setSuccess('')
      await deleteIngredient(ingredient.id)
      if (editingIngredientId === ingredient.id) {
        resetIngredientForm()
      }
      await loadIngredientsData(true)
      setSuccess('Zutat erfolgreich geloescht.')
    } catch (deleteError) {
      setError(deleteError instanceof Error ? deleteError.message : 'Zutat konnte nicht geloescht werden')
    } finally {
      setDeletingIngredientId(null)
    }
  }

  const filteredPricingProducts = useMemo(() => {
    const query = pricingSearch.trim().toLowerCase()
    return products.filter((product) => {
      if (query) {
        const matchesQuery =
          product.name.toLowerCase().includes(query) ||
          (product.productNumber || '').toLowerCase().includes(query)
        if (!matchesQuery) return false
      }
      if (pricingCategoryFilter !== 'ALL' && product.categoryId !== pricingCategoryFilter) {
        return false
      }
      return true
    })
  }, [products, pricingSearch, pricingCategoryFilter])

  const dirtyPricingProductIds = useMemo(
    () =>
      filteredPricingProducts
        .filter((product) => draftPrices[product.id] !== String(Number(product.price).toFixed(2)))
        .map((product) => product.id),
    [filteredPricingProducts, draftPrices]
  )
  const calculationByProductId = useMemo(
    () => new Map(calculationRows.map((row) => [row.productId, row])),
    [calculationRows]
  )

  async function saveProductPrice(product: Product) {
    const raw = draftPrices[product.id]
    const parsed = Number(raw)
    if (!Number.isFinite(parsed) || parsed < 0) {
      setError(`Ungueltiger Preis bei ${product.name}`)
      return
    }

    try {
      setSavingPriceIds((current) => new Set(current).add(product.id))
      setError('')
      await updateProduct(product.id, {
        name: product.name,
        price: parsed,
        vatRate: Number(product.vatRate),
        categoryId: product.categoryId,
        available: product.available,
      })
      setSuccess(`Preis fuer ${product.name} gespeichert.`)
      await refreshProductsOnly()
      await loadCalculationData()
      if (ingredientsLoaded) {
        await loadIngredientsData(true)
      }
    } catch (saveError) {
      setError(saveError instanceof Error ? saveError.message : 'Preis konnte nicht gespeichert werden')
    } finally {
      setSavingPriceIds((current) => {
        const next = new Set(current)
        next.delete(product.id)
        return next
      })
    }
  }

  async function saveAllDirtyPrices() {
    const dirtyProducts = filteredPricingProducts.filter((product) => dirtyPricingProductIds.includes(product.id))
    if (dirtyProducts.length === 0) {
      setSuccess('Keine Preisaenderung vorhanden.')
      return
    }

    try {
      setError('')
      setSuccess('')
      setSavingPriceIds(new Set(dirtyProducts.map((entry) => entry.id)))

      for (const product of dirtyProducts) {
        const parsed = Number(draftPrices[product.id])
        if (!Number.isFinite(parsed) || parsed < 0) {
          throw new Error(`Ungueltiger Preis bei ${product.name}`)
        }

        await updateProduct(product.id, {
          name: product.name,
          price: parsed,
          vatRate: Number(product.vatRate),
          categoryId: product.categoryId,
          available: product.available,
        })
      }

      setSuccess(`${dirtyProducts.length} Preise gespeichert.`)
      await refreshProductsOnly()
      await loadCalculationData()
      if (ingredientsLoaded) {
        await loadIngredientsData(true)
      }
    } catch (saveError) {
      setError(saveError instanceof Error ? saveError.message : 'Preise konnten nicht gespeichert werden')
    } finally {
      setSavingPriceIds(new Set())
    }
  }

  return (
    <Suspense fallback={<div className="p-4 text-sm text-rose-900/75">Lade Ansicht...</div>}>
      <AdminLayout
        title="Produkte"
        subtitle="Produkte, Kategorien, Zutaten, Extras und Preise zentral in einem Bereich verwalten"
      >
      {error ? (
        <div className="mb-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          {error}
        </div>
      ) : null}
      {success ? (
        <div className="mb-4 rounded-2xl border border-green-200 bg-green-50 px-4 py-3 text-sm text-green-700">
          {success}
        </div>
      ) : null}

      {activeTab === 'products' ? (
        <>
          <AdminProductsSection
            products={products}
            categories={categories}
            loading={loadingCore}
            productNumber={productNumber}
            setProductNumber={setProductNumber}
            productName={productName}
            setProductName={setProductName}
            productImageUrl={productImageUrl}
            setProductImageUrl={setProductImageUrl}
            productEan={productEan}
            setProductEan={setProductEan}
            productUnitEans={productUnitEans}
            setProductUnitEans={setProductUnitEans}
            beverageContainerType={beverageContainerType}
            setBeverageContainerType={setBeverageContainerType}
            isBeverage={isBeverage}
            setIsBeverage={setIsBeverage}
            contentVolumeLiters={contentVolumeLiters}
            setContentVolumeLiters={setContentVolumeLiters}
            productDeposit={productDeposit}
            setProductDeposit={setProductDeposit}
            ageRestriction={ageRestriction}
            setAgeRestriction={setAgeRestriction}
            isVegetarian={isVegetarian}
            setIsVegetarian={setIsVegetarian}
            isVegan={isVegan}
            setIsVegan={setIsVegan}
            isSpicy={isSpicy}
            setIsSpicy={setIsSpicy}
            isVerySpicy={isVerySpicy}
            setIsVerySpicy={setIsVerySpicy}
            isNew={isNew}
            setIsNew={setIsNew}
            isPopular={isPopular}
            setIsPopular={setIsPopular}
            articleInfo={articleInfo}
            setArticleInfo={setArticleInfo}
            foodBusinessOperator={foodBusinessOperator}
            setFoodBusinessOperator={setFoodBusinessOperator}
            nutritionInfo={nutritionInfo}
            setNutritionInfo={setNutritionInfo}
            nutritionDraft={nutritionDraft}
            setNutritionDraft={setNutritionDraft}
            onProductImageFileChange={(file) => void handleProductImageFile(file)}
            price={price}
            setPrice={setPrice}
            vatRate={vatRate}
            setVatRate={setVatRate}
            categoryId={categoryId}
            setCategoryId={setCategoryId}
            available={available}
            setAvailable={setAvailable}
            savingProduct={savingProduct}
            productNumberError={productNumberError}
            productNumberLocked={productNumberLocked}
            editingProductId={editingProductId}
            deletingProductId={deletingProductId}
            creatingIngredientProductId={creatingIngredientProductId}
            copyingProductId={copyingProductId}
            onSubmit={handleProductSubmit}
            onEdit={(product) => {
              setEditingProductId(product.id)
              setProductNumber(product.productNumber || '')
              setLoadedProductNumber(product.productNumber || '')
              setProductName(product.name)
              setProductImageUrl(product.imageUrl || '')
              setProductEan(product.ean || '')
              setProductUnitEans(product.unitEans || [])
              setBeverageContainerType(product.beverageContainerType || 'NONE')
              setIsBeverage(product.isBeverage || false)
              setContentVolumeLiters(product.contentVolumeLiters || '')
              setAgeRestriction(product.ageRestriction || 'NONE')
              setIsVegetarian(product.isVegetarian || false)
              setIsVegan(product.isVegan || false)
              setIsSpicy(product.isSpicy || false)
              setIsVerySpicy(product.isVerySpicy || false)
              setIsNew(product.isNew || false)
              setIsPopular(product.isPopular || false)
              setProductDeposit(product.deposit || '0')
              setArticleInfo(product.articleInfo || '')
              setFoodBusinessOperator(product.foodBusinessOperator || '')
              setNutritionInfo(product.nutritionInfo || '')
              setNutritionDraft(nutritionDraftFromProduct(product.nutrition))
              setPrice(product.price)
              setVatRate(product.vatRate)
              setCategoryId(product.categoryId ?? '')
              setAvailable(product.available ? 'true' : 'false')
              setError('')
              setSuccess('')
            }}
            onDelete={(product) => void handleDeleteProduct(product)}
            onCreateIngredientFromProduct={(product) => void handleCreateIngredientFromProduct(product)}
            onCopy={(product) => void handleCopyProduct(product)}
            onCancelEdit={resetProductForm}
            onOpenTemplateImportDialog={openTemplateProductDialog}
          />

          {templateImportDialogOpen ? (
            <div className="fixed inset-0 z-[90] flex items-center justify-center bg-slate-950/55 p-4">
              <div className="max-h-[92vh] w-full max-w-2xl overflow-y-auto rounded-3xl border border-[var(--brand-border)] bg-white p-5">
                <h3 className="text-lg font-semibold text-[var(--brand-ink)]">
                  Produkt aus Vorlage übernehmen
                </h3>
                <p className="mt-1 text-sm text-rose-900/70">
                  Vor dem Übernehmen kannst du Produktnummer, Kategorie, EAN und Preis anpassen.
                </p>

                <div className="mt-4 grid gap-3 md:grid-cols-2">
                  <label className="block">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">Vorlage</span>
                    <select
                      value={selectedTemplateId}
                      onChange={(event) => {
                        setSelectedTemplateId(event.target.value)
                        setSelectedTemplateProductId('')
                      }}
                      className="input-ui w-full"
                    >
                      {templateOverviews.map((template) => (
                        <option key={template.id} value={template.id}>
                          {template.name}
                        </option>
                      ))}
                    </select>
                  </label>
                  <label className="block">
                    <span className="mb-1 block text-sm font-medium text-rose-900/85">Produkt</span>
                    <select
                      value={selectedTemplateProductId}
                      onChange={(event) => preloadTemplateProduct(event.target.value)}
                      className="input-ui w-full"
                    >
                      <option value="">Produkt auswählen</option>
                      {(templateDetail?.products || []).map((product) => (
                        <option key={product.id} value={product.id}>
                          {product.name}
                        </option>
                      ))}
                    </select>
                  </label>
                </div>

                {templateImportLoading ? (
                  <p className="mt-3 text-sm text-rose-900/70">Vorlagenprodukte werden geladen...</p>
                ) : null}

                {selectedTemplateProductId ? (
                  <div className="mt-4 grid gap-3 md:grid-cols-2">
                    <label className="block md:col-span-2">
                      <span className="mb-1 block text-sm font-medium text-rose-900/85">Produktname</span>
                      <input
                        value={
                          templateDetail?.products.find((entry) => entry.id === selectedTemplateProductId)
                            ?.name || ''
                        }
                        disabled
                        className="input-ui w-full bg-slate-50"
                      />
                    </label>
                    <label className="block">
                      <span className="mb-1 block text-sm font-medium text-rose-900/85">
                        Produktnummer (empfohlen)
                      </span>
                      <input
                        value={importProductNumber}
                        onChange={(event) => setImportProductNumber(event.target.value)}
                        placeholder="z. B. DÖN-001"
                        className="input-ui w-full"
                      />
                    </label>
                    <label className="block">
                      <span className="mb-1 block text-sm font-medium text-rose-900/85">EAN</span>
                      <input
                        value={importProductEan}
                        onChange={(event) => setImportProductEan(event.target.value)}
                        className="input-ui w-full"
                      />
                    </label>
                    <label className="block">
                      <span className="mb-1 block text-sm font-medium text-rose-900/85">Verkaufspreis</span>
                      <input
                        type="number"
                        step="0.01"
                        value={importPrice}
                        onChange={(event) => setImportPrice(event.target.value)}
                        className="input-ui w-full"
                      />
                    </label>
                    <label className="block">
                      <span className="mb-1 block text-sm font-medium text-rose-900/85">Kategorie</span>
                      <select
                        value={importCategoryId}
                        onChange={(event) => setImportCategoryId(event.target.value)}
                        className="input-ui w-full"
                      >
                        <option value="">Keine Kategorie</option>
                        {categories.map((category) => (
                          <option key={category.id} value={category.id}>
                            {category.name}
                          </option>
                        ))}
                      </select>
                    </label>
                  </div>
                ) : null}

                <div className="mt-5 flex justify-end gap-2">
                  <button
                    type="button"
                    onClick={() => setTemplateImportDialogOpen(false)}
                    className="rounded-xl border border-[var(--brand-border)] bg-rose-50 px-4 py-2 text-sm font-semibold text-rose-900 hover:bg-rose-100"
                  >
                    Abbrechen
                  </button>
                  <button
                    type="button"
                    onClick={() => void handleImportTemplateProduct()}
                    disabled={!selectedTemplateProductId || templateImportSaving}
                    className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white hover:bg-slate-800 disabled:opacity-60"
                  >
                    {templateImportSaving ? 'Übernehme...' : 'Übernehmen'}
                  </button>
                </div>
              </div>
            </div>
          ) : null}

          <div className="mt-6">
            <ProductIngredientsManager
              productId={editingProductId}
              productName={productName}
              products={products}
            />
          </div>
        </>
      ) : null}

      {activeTab === 'categories' ? (
        <AdminCategoriesSection
          categories={categories}
          loading={loadingCore}
          categoryName={categoryName}
          setCategoryName={setCategoryName}
          categoryImageUrl={categoryImageUrl}
          setCategoryImageUrl={setCategoryImageUrl}
          onCategoryImageFileChange={(file) => void handleCategoryImageFile(file)}
          categorySortOrder={categorySortOrder}
          setCategorySortOrder={setCategorySortOrder}
          savingCategory={savingCategory}
          editingCategoryId={editingCategoryId}
          deletingCategoryId={deletingCategoryId}
          onSubmit={handleCategorySubmit}
          onEdit={(category) => {
            setEditingCategoryId(category.id)
            setCategoryName(category.name)
            setCategoryImageUrl(category.imageUrl || '')
            setCategorySortOrder(String(category.sortOrder))
            setError('')
            setSuccess('')
          }}
          onDelete={(category) => void handleDeleteCategory(category)}
          onCancelEdit={resetCategoryForm}
        />
      ) : null}

      {activeTab === 'ingredients' ? (
        <AdminIngredientsSection
          ingredients={ingredients}
          products={products}
          productTemplateId={productTemplateId}
          loading={loadingIngredients}
          ingredientName={ingredientName}
          setIngredientName={setIngredientName}
          ingredientCategory={ingredientCategory}
          setIngredientCategory={setIngredientCategory}
          ingredientUnit={ingredientUnit}
          setIngredientUnit={setIngredientUnit}
          recipeUnit={recipeUnit}
          setRecipeUnit={setRecipeUnit}
          gramsPerPurchaseUnit={gramsPerPurchaseUnit}
          setGramsPerPurchaseUnit={setGramsPerPurchaseUnit}
          purchasePrice={purchasePrice}
          setPurchasePrice={setPurchasePrice}
          minimumStock={minimumStock}
          setMinimumStock={setMinimumStock}
          consumptionFactorPercent={consumptionFactorPercent}
          setConsumptionFactorPercent={setConsumptionFactorPercent}
          deposit={deposit}
          setDeposit={setDeposit}
          ingredientEan={ingredientEan}
          setIngredientEan={setIngredientEan}
          ingredientUnitEans={ingredientUnitEans}
          setIngredientUnitEans={setIngredientUnitEans}
          allergens={allergens}
          setAllergens={setAllergens}
          supplier={supplier}
          setSupplier={setSupplier}
          articleNumber={articleNumber}
          setArticleNumber={setArticleNumber}
          savingIngredient={savingIngredient}
          editingIngredientId={editingIngredientId}
          deletingIngredientId={deletingIngredientId}
          onSubmit={handleIngredientSubmit}
          onApplyProductTemplate={applyProductTemplate}
          setProductTemplateId={setProductTemplateId}
          onEdit={(ingredient) => {
            setEditingIngredientId(ingredient.id)
            setProductTemplateId('')
            setIngredientName(ingredient.name)
            setIngredientCategory(ingredient.category || 'FOOD')
            setIngredientUnit(ingredient.unit)
            setRecipeUnit(ingredient.recipeUnit || ingredient.unit)
            setGramsPerPurchaseUnit(ingredient.gramsPerPurchaseUnit || '')
            setPurchasePrice(ingredient.purchasePrice)
            setMinimumStock(
              formatMinimumStockDraftByUnit(ingredient.minimumStock || '0', ingredient.unit)
            )
            setConsumptionFactorPercent(ingredient.consumptionFactorPercent || '0')
            setDeposit(ingredient.deposit)
            setIngredientEan(ingredient.ean || '')
            setIngredientUnitEans(ingredient.unitEans || [])
            setAllergens(ingredient.allergens || '')
            setSupplier(ingredient.supplier || '')
            setArticleNumber(ingredient.articleNumber || '')
            setError('')
            setSuccess('')
          }}
          onDelete={(ingredient) => void handleDeleteIngredient(ingredient)}
          onCancelEdit={resetIngredientForm}
        />
      ) : null}

      {activeTab === 'modifiers' ? (
        <section className="min-w-0 space-y-4 rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <div>
            <h2 className="text-lg font-semibold text-[var(--brand-ink)]">Extras & Optionen</h2>
            <p className="mt-1 text-sm text-rose-900/70">
              Verwalte Optionsgruppen, Aufpreise und Pflicht-/Mehrfachauswahl je Produkt.
            </p>
          </div>
          <label className="block max-w-md">
            <span className="mb-1 block text-sm font-medium text-rose-900/85">Produkt auswählen</span>
            <select
              value={modifierWorkspaceProductId}
              onChange={(event) => setModifierWorkspaceProductId(event.target.value)}
              className="input-ui w-full"
            >
              {products.map((product) => (
                <option key={product.id} value={product.id}>
                  {product.productNumber ? `${product.productNumber} - ` : ''}
                  {product.name}
                </option>
              ))}
            </select>
          </label>
          <ProductIngredientsManager
            productId={modifierWorkspaceProductId || null}
            productName={products.find((entry) => entry.id === modifierWorkspaceProductId)?.name || ''}
            products={products}
          />
        </section>
      ) : null}

      {activeTab === 'pricing' ? (
        <section className="min-w-0 rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
          <div className="flex flex-wrap items-end gap-3">
            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">Suche</span>
              <input
                value={pricingSearch}
                onChange={(event) => setPricingSearch(event.target.value)}
                placeholder="Name oder Nummer"
                className="w-[260px] rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
              />
            </label>
            <label className="block">
              <span className="mb-1 block text-sm font-medium text-rose-900/85">Kategorie</span>
              <select
                value={pricingCategoryFilter}
                onChange={(event) => setPricingCategoryFilter(event.target.value)}
                className="w-[220px] rounded-xl border border-[var(--brand-border)] px-3 py-2 text-sm outline-none transition focus:border-[var(--brand-orange)] focus:ring-2 focus:ring-orange-200/60"
              >
                <option value="ALL">Alle Kategorien</option>
                {categories.map((category) => (
                  <option key={category.id} value={category.id}>
                    {category.name}
                  </option>
                ))}
              </select>
            </label>
            <button
              type="button"
              onClick={() => void saveAllDirtyPrices()}
              className="rounded-xl bg-slate-900 px-4 py-2.5 text-sm font-medium text-white transition hover:bg-slate-800"
              disabled={savingPriceIds.size > 0}
            >
              {savingPriceIds.size > 0 ? 'Speichere...' : `Alle Aenderungen speichern (${dirtyPricingProductIds.length})`}
            </button>
          </div>

          <div className="mt-4 max-w-full overflow-x-auto rounded-2xl border border-[var(--brand-border)]">
            <table className="w-full min-w-[1320px] border-collapse">
              <thead>
                <tr>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Produkt
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Kategorie
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    VK Brutto
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    VK Netto
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Wareneinsatz
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    MwSt.
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Pfand
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Marge
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Aufschlag
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Neuer VK Brutto
                  </th>
                  <th className="bg-rose-50/60 px-3 py-2 text-left text-xs uppercase tracking-wide text-rose-900/75">
                    Aktion
                  </th>
                </tr>
              </thead>
              <tbody>
                {loadingCore ? (
                  <tr>
                    <td className="px-3 py-3 text-sm text-rose-900/70" colSpan={10}>
                      Lade Produkte...
                    </td>
                  </tr>
                ) : filteredPricingProducts.length === 0 ? (
                  <tr>
                    <td className="px-3 py-3 text-sm text-rose-900/70" colSpan={10}>
                      Keine Produkte gefunden.
                    </td>
                  </tr>
                ) : (
                  filteredPricingProducts.map((product) => {
                    const calculation = calculationByProductId.get(product.id)
                    const currentPrice = String(Number(product.price).toFixed(2))
                    const nextPrice = draftPrices[product.id] ?? currentPrice
                    const isDirty = nextPrice !== currentPrice
                    const isSaving = savingPriceIds.has(product.id)
                    const vatRateValue = Number(product.vatRate || 0)
                    const vatFactor = 1 + vatRateValue / 100
                    const currentPriceNumber = Number(product.price || 0)
                    const netPrice = vatFactor > 0 ? currentPriceNumber / vatFactor : currentPriceNumber
                    const purchaseCost = Number(calculation?.totalCost ?? 0)
                    const marginEur = currentPriceNumber - purchaseCost
                    const marginPercent = currentPriceNumber > 0 ? (marginEur / currentPriceNumber) * 100 : 0
                    const markupPercent = purchaseCost > 0 ? (marginEur / purchaseCost) * 100 : 0
                    const depositValue = Number(product.deposit || 0)

                    return (
                      <tr key={product.id}>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          <p className="font-medium text-[var(--brand-ink)]">{product.name}</p>
                          <p className="text-xs text-rose-900/70">Nr. {product.productNumber || '-'}</p>
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                          {product.category?.name || '-'}
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                          {currentPrice} EUR
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                          {netPrice.toFixed(2)} EUR
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                          {loadingCalculation ? '...' : `${purchaseCost.toFixed(2)} EUR`}
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                          {vatRateValue.toFixed(2)} %
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                          {depositValue > 0 ? `${depositValue.toFixed(2)} EUR` : '-'}
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                          {marginEur.toFixed(2)} EUR ({marginPercent.toFixed(1)} %)
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm text-rose-900/85">
                          {Number.isFinite(markupPercent) ? `${markupPercent.toFixed(1)} %` : '-'}
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          <input
                            type="number"
                            step="0.01"
                            value={nextPrice}
                            onChange={(event) =>
                              setDraftPrices((current) => ({ ...current, [product.id]: event.target.value }))
                            }
                            className={`w-36 rounded-lg border px-2.5 py-1.5 text-sm outline-none transition ${
                              isDirty ? 'border-orange-400 bg-orange-50' : 'border-[var(--brand-border)] bg-white'
                            }`}
                          />
                        </td>
                        <td className="border-t border-slate-100 px-3 py-2 text-sm">
                          <button
                            type="button"
                            onClick={() => void saveProductPrice(product)}
                            disabled={!isDirty || isSaving}
                            className="rounded-lg bg-slate-900 px-3 py-1.5 text-xs font-medium text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
                          >
                            {isSaving ? 'Speichert...' : 'Preis speichern'}
                          </button>
                        </td>
                      </tr>
                    )
                  })
                )}
              </tbody>
            </table>
          </div>
        </section>
      ) : null}
      </AdminLayout>
    </Suspense>
  )
}

export default function AdminProductsPage() {
  return (
    <Suspense fallback={<div className="p-4 text-sm text-rose-900/75">Lade Produkte...</div>}>
      <AdminProductsPageContent />
    </Suspense>
  )
}
