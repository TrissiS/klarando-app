"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.TenantImportError = void 0;
exports.importBusinessTemplateToTenant = importBusinessTemplateToTenant;
const client_1 = require("@prisma/client");
const prisma_1 = require("./prisma");
class TenantImportError extends Error {
    constructor(code, message, details) {
        super(message);
        this.code = code;
        this.details = details;
        this.name = 'TenantImportError';
    }
}
exports.TenantImportError = TenantImportError;
function normalizeKey(value) {
    return value.trim().toLowerCase();
}
function toAllergenCodeString(allergens) {
    if (allergens.length === 0) {
        return null;
    }
    return allergens.join(',');
}
const DEFAULT_IMPORT_OPTIONS = {
    importCategories: true,
    importProducts: true,
    importIngredients: true,
    importProductIngredients: true,
    importAllergens: true,
    importPriceSuggestions: true,
    overwriteExisting: false,
};
function resolveImportOptions(options) {
    return {
        importCategories: typeof options?.importCategories === 'boolean'
            ? options.importCategories
            : DEFAULT_IMPORT_OPTIONS.importCategories,
        importProducts: typeof options?.importProducts === 'boolean'
            ? options.importProducts
            : DEFAULT_IMPORT_OPTIONS.importProducts,
        importIngredients: typeof options?.importIngredients === 'boolean'
            ? options.importIngredients
            : DEFAULT_IMPORT_OPTIONS.importIngredients,
        importProductIngredients: typeof options?.importProductIngredients === 'boolean'
            ? options.importProductIngredients
            : DEFAULT_IMPORT_OPTIONS.importProductIngredients,
        importAllergens: typeof options?.importAllergens === 'boolean'
            ? options.importAllergens
            : DEFAULT_IMPORT_OPTIONS.importAllergens,
        importPriceSuggestions: typeof options?.importPriceSuggestions === 'boolean'
            ? options.importPriceSuggestions
            : DEFAULT_IMPORT_OPTIONS.importPriceSuggestions,
        overwriteExisting: typeof options?.overwriteExisting === 'boolean'
            ? options.overwriteExisting
            : DEFAULT_IMPORT_OPTIONS.overwriteExisting,
    };
}
async function importBusinessTemplateToTenant(input, dbClient) {
    const options = resolveImportOptions(input.options);
    const db = dbClient ?? prisma_1.prisma;
    const tenantExists = await db.tenant.findUnique({
        where: { id: input.tenantId },
        select: { id: true },
    });
    if (!tenantExists) {
        throw new TenantImportError('TENANT_NOT_FOUND', 'Tenant für Template-Import nicht gefunden.', `tenantId=${input.tenantId}`);
    }
    const template = await db.businessTemplate.findUnique({
        where: { id: input.templateId },
        include: {
            categories: {
                orderBy: [{ sortOrder: 'asc' }, { name: 'asc' }],
            },
            ingredients: {
                orderBy: [{ name: 'asc' }],
            },
            products: {
                include: {
                    ingredientLinks: true,
                },
                orderBy: [{ name: 'asc' }],
            },
        },
    });
    if (!template || !template.isActive) {
        throw new TenantImportError('TEMPLATE_IMPORT_FAILED', 'Vorlage nicht gefunden oder deaktiviert.');
    }
    const runImport = async (tx) => {
        const existingCategories = await tx.category.findMany({
            where: { tenantId: input.tenantId },
            select: { id: true, name: true },
        });
        const existingIngredients = await tx.ingredient.findMany({
            where: { tenantId: input.tenantId },
            select: { id: true, name: true },
        });
        const existingProducts = await tx.product.findMany({
            where: { tenantId: input.tenantId },
            select: { id: true, name: true, productNumber: true, categoryId: true },
        });
        const categoryByName = new Map(existingCategories.map((item) => [normalizeKey(item.name), item.id]));
        const ingredientByName = new Map(existingIngredients.map((item) => [normalizeKey(item.name), item.id]));
        const productByNumber = new Map(existingProducts.map((item) => [normalizeKey(item.productNumber), item.id]));
        const productByName = new Map(existingProducts.map((item) => [normalizeKey(item.name), item.id]));
        const templateCategoryToTenantCategory = new Map();
        const templateIngredientToTenantIngredient = new Map();
        const templateProductToTenantProduct = new Map();
        let categoriesCreated = 0;
        let ingredientsCreated = 0;
        let productsCreated = 0;
        let productsUpdated = 0;
        let productIngredientsCreated = 0;
        let allergensApplied = 0;
        let skippedExisting = 0;
        for (const templateCategory of template.categories) {
            const normalizedName = normalizeKey(templateCategory.name);
            let tenantCategoryId = categoryByName.get(normalizedName);
            if (!tenantCategoryId && options.importCategories) {
                const createdCategory = await tx.category.create({
                    data: {
                        tenantId: input.tenantId,
                        name: templateCategory.name,
                        sortOrder: templateCategory.sortOrder,
                    },
                    select: { id: true },
                });
                tenantCategoryId = createdCategory.id;
                categoryByName.set(normalizedName, tenantCategoryId);
                categoriesCreated += 1;
            }
            else if (tenantCategoryId && options.importCategories && options.overwriteExisting) {
                await tx.category.update({
                    where: { id: tenantCategoryId },
                    data: {
                        sortOrder: templateCategory.sortOrder,
                    },
                });
            }
            else if (tenantCategoryId && !options.overwriteExisting) {
                skippedExisting += 1;
            }
            if (tenantCategoryId) {
                templateCategoryToTenantCategory.set(templateCategory.id, tenantCategoryId);
            }
        }
        for (const templateIngredient of template.ingredients) {
            const normalizedName = normalizeKey(templateIngredient.name);
            let tenantIngredientId = ingredientByName.get(normalizedName);
            if (!tenantIngredientId && options.importIngredients) {
                const allergenPayload = options.importAllergens
                    ? toAllergenCodeString(templateIngredient.allergens)
                    : null;
                const createdIngredient = await tx.ingredient.create({
                    data: {
                        tenantId: input.tenantId,
                        name: templateIngredient.name,
                        category: templateIngredient.category,
                        unit: templateIngredient.unit,
                        recipeUnit: templateIngredient.recipeUnit,
                        gramsPerPurchaseUnit: templateIngredient.gramsPerPurchaseUnit,
                        purchasePrice: templateIngredient.purchasePrice,
                        minimumStock: templateIngredient.minimumStock,
                        consumptionFactorPercent: 0,
                        deposit: new client_1.Prisma.Decimal('0'),
                        allergens: allergenPayload,
                        supplier: templateIngredient.supplier,
                        articleNumber: templateIngredient.articleNumber,
                    },
                    select: { id: true },
                });
                tenantIngredientId = createdIngredient.id;
                ingredientByName.set(normalizedName, tenantIngredientId);
                ingredientsCreated += 1;
                if (allergenPayload) {
                    allergensApplied += 1;
                }
            }
            else if (tenantIngredientId && options.importIngredients && options.overwriteExisting) {
                const allergenPayload = options.importAllergens
                    ? toAllergenCodeString(templateIngredient.allergens)
                    : undefined;
                await tx.ingredient.update({
                    where: { id: tenantIngredientId },
                    data: {
                        category: templateIngredient.category,
                        unit: templateIngredient.unit,
                        recipeUnit: templateIngredient.recipeUnit,
                        gramsPerPurchaseUnit: templateIngredient.gramsPerPurchaseUnit,
                        purchasePrice: templateIngredient.purchasePrice,
                        minimumStock: templateIngredient.minimumStock,
                        supplier: templateIngredient.supplier,
                        articleNumber: templateIngredient.articleNumber,
                        ...(allergenPayload !== undefined ? { allergens: allergenPayload } : {}),
                    },
                });
                if (allergenPayload) {
                    allergensApplied += 1;
                }
            }
            else if (tenantIngredientId && !options.overwriteExisting) {
                skippedExisting += 1;
            }
            if (tenantIngredientId) {
                templateIngredientToTenantIngredient.set(templateIngredient.id, tenantIngredientId);
            }
        }
        for (const templateProduct of template.products) {
            const normalizedProductNumber = normalizeKey(templateProduct.productNumber);
            const normalizedProductName = normalizeKey(templateProduct.name);
            let tenantProductId = productByNumber.get(normalizedProductNumber) || productByName.get(normalizedProductName);
            if (!tenantProductId && options.importProducts) {
                const createdProduct = await tx.product.create({
                    data: {
                        tenantId: input.tenantId,
                        categoryId: templateProduct.categoryId
                            ? templateCategoryToTenantCategory.get(templateProduct.categoryId) || null
                            : null,
                        productNumber: templateProduct.productNumber,
                        name: templateProduct.name,
                        imageUrl: templateProduct.imageUrl,
                        price: options.importPriceSuggestions
                            ? templateProduct.price
                            : new client_1.Prisma.Decimal('0'),
                        vatRate: options.importPriceSuggestions
                            ? templateProduct.vatRate
                            : new client_1.Prisma.Decimal('19.00'),
                        available: templateProduct.available,
                    },
                    select: { id: true },
                });
                tenantProductId = createdProduct.id;
                productsCreated += 1;
            }
            else if (tenantProductId && options.importProducts && options.overwriteExisting) {
                await tx.product.update({
                    where: { id: tenantProductId },
                    data: {
                        categoryId: templateProduct.categoryId
                            ? templateCategoryToTenantCategory.get(templateProduct.categoryId) || null
                            : null,
                        name: templateProduct.name,
                        imageUrl: templateProduct.imageUrl,
                        available: templateProduct.available,
                        ...(options.importPriceSuggestions
                            ? {
                                price: templateProduct.price,
                                vatRate: templateProduct.vatRate,
                            }
                            : {}),
                    },
                });
                productsUpdated += 1;
            }
            else if (tenantProductId && !options.overwriteExisting) {
                skippedExisting += 1;
            }
            if (tenantProductId) {
                productByNumber.set(normalizedProductNumber, tenantProductId);
                productByName.set(normalizedProductName, tenantProductId);
                templateProductToTenantProduct.set(templateProduct.id, tenantProductId);
            }
        }
        if (!options.importProductIngredients) {
            return {
                templateId: template.id,
                tenantId: input.tenantId,
                options,
                categoriesCreated,
                productsCreated,
                productsUpdated,
                ingredientsCreated,
                productIngredientsCreated,
                allergensApplied,
                skippedExisting,
                createdCategories: categoriesCreated,
                createdIngredients: ingredientsCreated,
                createdProducts: productsCreated,
                createdProductIngredients: productIngredientsCreated,
            };
        }
        const tenantProductIds = Array.from(templateProductToTenantProduct.values());
        const tenantIngredientIds = Array.from(templateIngredientToTenantIngredient.values());
        const existingLinks = await tx.productIngredient.findMany({
            where: {
                productId: { in: tenantProductIds.length > 0 ? tenantProductIds : ['__never__'] },
                ingredientId: { in: tenantIngredientIds.length > 0 ? tenantIngredientIds : ['__never__'] },
            },
            select: {
                productId: true,
                ingredientId: true,
            },
        });
        const existingLinkSet = new Set(existingLinks.map((link) => `${link.productId}::${link.ingredientId}`));
        for (const templateProduct of template.products) {
            const tenantProductId = templateProductToTenantProduct.get(templateProduct.id);
            if (!tenantProductId) {
                continue;
            }
            for (const templateLink of templateProduct.ingredientLinks) {
                const tenantIngredientId = templateIngredientToTenantIngredient.get(templateLink.templateIngredientId);
                if (!tenantIngredientId) {
                    continue;
                }
                const dedupeKey = `${tenantProductId}::${tenantIngredientId}`;
                if (existingLinkSet.has(dedupeKey)) {
                    skippedExisting += 1;
                    continue;
                }
                await tx.productIngredient.create({
                    data: {
                        productId: tenantProductId,
                        ingredientId: tenantIngredientId,
                        quantity: templateLink.quantity,
                    },
                });
                existingLinkSet.add(dedupeKey);
                productIngredientsCreated += 1;
            }
        }
        return {
            templateId: template.id,
            tenantId: input.tenantId,
            options,
            categoriesCreated,
            productsCreated,
            productsUpdated,
            ingredientsCreated,
            productIngredientsCreated,
            allergensApplied,
            skippedExisting,
            createdCategories: categoriesCreated,
            createdIngredients: ingredientsCreated,
            createdProducts: productsCreated,
            createdProductIngredients: productIngredientsCreated,
        };
    };
    if (dbClient) {
        return runImport(dbClient);
    }
    return prisma_1.prisma.$transaction(async (tx) => runImport(tx));
}
