import { API_BASE_URL, resolveTenantId } from './config'
import { apiFetch, apiJson, normalizeApiPath } from './api-client'

export type Category = {
  id: string
  tenantId: string
  name: string
  sortOrder: number
  imageUrl: string | null
  createdAt: string
}

export type ProductCategory = {
  id: string
  tenantId: string
  name: string
  sortOrder: number
  imageUrl: string | null
  createdAt: string
}

export type UnitEanEntry = {
  label: string
  ean: string
  unitCount: number
  unitLabel: string | null
}

export type Product = {
  id: string
  tenantId: string
  categoryId: string | null
  productNumber: string | null
  name: string
  imageUrl: string | null
  ean: string | null
  unitEans: UnitEanEntry[]
  beverageContainerType: 'NONE' | 'EINWEG' | 'MEHRWEG'
  deposit: string
  articleInfo: string | null
  foodBusinessOperator: string | null
  nutritionInfo: string | null
  price: string
  vatRate: string
  available: boolean
  createdAt: string
  category?: ProductCategory | null
  allergens?: string[]
}

export type ScreenBackgroundMode = 'COLOR' | 'IMAGE' | 'VIDEO'
export type ScreenOverlayAnimation = 'NONE' | 'FLOAT' | 'SLIDE' | 'SPARKLE'
export type ScreenOrientation = 'LANDSCAPE' | 'PORTRAIT'
export type ScreenCardStyle =
  | 'SOFT'
  | 'SHARP'
  | 'GLASS'
  | 'BOLD'
  | 'OUTLINE'
  | 'MINIMAL'
  | 'LIST'
export type ScreenOfferWindowPosition = 'RIGHT' | 'LEFT' | 'TOP' | 'BOTTOM'
export type ScreenOfferWindowSize = 'S' | 'M' | 'L'
export type ScreenTickerPosition = 'TOP' | 'BOTTOM'
export type ScreenTickerDataSource = 'CUSTOM' | 'NEWS_API' | 'WEATHER_API' | 'TRAFFIC_API'
export type ScreenPriceDisplayMode =
  | 'EUR_SUFFIX'
  | 'EUR_PREFIX'
  | 'CURRENCY_SYMBOL'
  | 'NO_DECIMALS'
  | 'COMMA_DECIMAL'
export type ScreenProductSortMode =
  | 'CUSTOM'
  | 'CATEGORY_THEN_CUSTOM'
  | 'CATEGORY_THEN_NAME'
  | 'NAME_ASC'
  | 'PRICE_ASC'
  | 'PRICE_DESC'
export type ScreenAllergenLegendPosition =
  | 'TOP_LEFT'
  | 'TOP_RIGHT'
  | 'BOTTOM_LEFT'
  | 'BOTTOM_RIGHT'
  | 'BOTTOM_CENTER'

export type ScreenConfig = {
  id: string
  tenantId: string
  title: string
  subtitle: string | null
  fontFamily: string
  defaultOrientation: ScreenOrientation
  defaultResolutionWidth: number
  defaultResolutionHeight: number
  productFontSize: number
  ingredientFontSize: number
  categoryFontSize: number
  priceFontSize: number
  backgroundMode: ScreenBackgroundMode
  backgroundValue: string | null
  backgroundMediaUrl: string | null
  overlayAnimation: ScreenOverlayAnimation
  cardStyle: ScreenCardStyle
  cardPadding: number
  cardBackgroundOpacity: number
  cardBorderOpacity: number
  productSortMode: ScreenProductSortMode
  defaultColumnCount: number
  showCategoryHeaders: boolean
  showCategoryOnCard: boolean
  categoryUppercase: boolean
  accentColor: string
  textColor: string
  productNameColor: string
  ingredientTextColor: string
  categoryTextColor: string
  priceTextColor: string
  showAllergens: boolean
  allergenLegendEnabled: boolean
  allergenLegendPosition: ScreenAllergenLegendPosition
  showPrices: boolean
  pricePinnedLeft: boolean
  priceDisplayMode: ScreenPriceDisplayMode
  showUnavailable: boolean
  showProductNumber: boolean
  logoUrl: string | null
  logoSize: number
  offerWindowEnabled: boolean
  offerWindowTitle: string | null
  offerWindowText: string | null
  offerWindowPosition: ScreenOfferWindowPosition
  offerWindowSize: ScreenOfferWindowSize
  offerWindowWidthPx: number
  offerWindowHeightPx: number
  offerWindowXPercent: number
  offerWindowYPercent: number
  offerWindowReserveSpace: boolean
  offerWindowBackgroundColor: string
  offerWindowTextColor: string
  offerWindowOpacity: number
  offerMediaUrls: string[]
  offerMediaRotateSec: number
  tickerEnabled: boolean
  tickerPosition: ScreenTickerPosition
  tickerShowClock: boolean
  tickerDataSource: ScreenTickerDataSource
  tickerCustomText: string | null
  tickerApiUrl: string | null
  tickerRefreshSec: number
  tickerClockFontSize: number
  tickerFontSize: number
  tickerInsetPx: number
  tickerOffsetPx: number
  tickerBackgroundColor: string
  tickerTextColor: string
  createdAt: string
  updatedAt: string
}

export type ScreenProduct = {
  id: string
  tenantId: string
  productNumber: string | null
  name: string
  price: string
  beverageContainerType: 'NONE' | 'EINWEG' | 'MEHRWEG'
  deposit: string
  available: boolean
  category: ProductCategory | null
  allergens: string[]
  ingredients: Array<{
    name: string
    allergens: string[]
  }>
  sizeOptions: Array<{
    id: string
    name: string
    priceDelta: number
    totalPrice: number
    isDefaultSelected: boolean
  }>
  screen: {
    displayCategory: string | null
    sortOrder: number
    showOnScreen: boolean
    isFeatured: boolean
    badgeText: string | null
    highlightColor: string | null
    updatedAt: string | null
  }
}

export type ScreenDeviceOrientation = ScreenOrientation

export type ScreenDevice = {
  id: string
  tenantId: string
  name: string
  deviceCode: string
  location: string | null
  isActive: boolean
  orientation: ScreenDeviceOrientation
  resolutionWidth: number
  resolutionHeight: number
  refreshIntervalSec: number
  showPricesOverride: boolean | null
  showAllergensOverride: boolean | null
  showUnavailableOverride: boolean | null
  showProductNumberOverride: boolean | null
  offerWindowEnabledOverride: boolean | null
  offerWindowPositionOverride: ScreenOfferWindowPosition | null
  offerWindowSizeOverride: ScreenOfferWindowSize | null
  offerMediaUrlsOverride: string[]
  offerMediaRotateSecOverride: number | null
  cardStyleOverride: ScreenCardStyle | null
  columnCountOverride: number | null
  selectedCategoryIds: string[]
  selectedProductIds: string[]
  backgroundMediaUrlOverride: string | null
  accentColorOverride: string | null
  textColorOverride: string | null
  notes: string | null
  lastSeenAt: string | null
  createdAt: string
  updatedAt: string
}

export type PublicScreenFeed = {
  device: {
    id: string
    name: string
    location: string | null
    deviceCode: string
    orientation: ScreenDeviceOrientation
    resolutionWidth: number
    resolutionHeight: number
    refreshIntervalSec: number
    selectedCategoryIds?: string[]
    selectedProductIds?: string[]
  }
  config: ScreenConfig
  products: ScreenProduct[]
  activeActions: Array<{
    id: string
    name: string
    description: string | null
    imageUrl: string | null
    displayAsMenu: boolean
    hidePriceOnScreen: boolean
    valueType: ActionValueType
    value: string
    priceLabel: string | null
    productCount: number
    products: Array<{
      productId: string
      name: string
      productNumber: string | null
      available: boolean
      price: string
      imageUrl: string | null
    }>
  }>
  pickupAnnouncements: Array<{
    orderId: string
    pickupNumber: number
    announcedAt: string | null
    announceUntil: string | null
    terminal: {
      id: string
      name: string
      terminalCode: string
      location: string | null
    } | null
    pickupDisplay: {
      id: string
      name: string
      displayCode: string
    } | null
  }>
  generatedAt: string
}

export type Ingredient = {
  id: string
  tenantId: string
  name: string
  category: 'FOOD' | 'PACKAGING'
  unit: string
  recipeUnit: string | null
  gramsPerPurchaseUnit: string | null
  purchasePrice: string
  minimumStock: string
  consumptionFactorPercent: string
  deposit: string
  ean: string | null
  unitEans: UnitEanEntry[]
  allergens: string | null
  supplier: string | null
  articleNumber: string | null
  createdAt: string
}

export type BusinessDayCode =
  | 'MONDAY'
  | 'TUESDAY'
  | 'WEDNESDAY'
  | 'THURSDAY'
  | 'FRIDAY'
  | 'SATURDAY'
  | 'SUNDAY'

export type BusinessDailyWindow = {
  day: BusinessDayCode
  isClosed: boolean
  open: string | null
  close: string | null
}

export type BusinessHolidayWindow = {
  date: string
  label: string | null
  isClosed: boolean
  open: string | null
  close: string | null
}

export type BusinessServiceAreaStrategy =
  | 'ZIP_LIST'
  | 'RADIUS'
  | 'ZIP_OR_RADIUS'
  | 'ZIP_AND_RADIUS'
  | 'POLYGON'

export type BusinessServiceAreaPolygonPoint = {
  lat: number
  lng: number
}

export type BusinessServiceArea = {
  enabled: boolean
  strategy: BusinessServiceAreaStrategy
  zipCodes: string[]
  excludedZipCodes: string[]
  excludedStreets: string[]
  radiusKm: number | null
  polygonPath: BusinessServiceAreaPolygonPoint[]
  centerLatitude: number | null
  centerLongitude: number | null
  centerZipCode: string | null
  centerCity: string | null
  centerStreet: string | null
  notes: string | null
}

export type BusinessCustomerAppListingDisplaySettings = {
  showLogo: boolean
  showChainName: boolean
  showAddress: boolean
  showAvailabilityBadges: boolean
  showMinOrderValue: boolean
  showDeliveryFeeNote: boolean
  showDistance: boolean
}

export type BusinessCustomerAppSubMenuItem = {
  id: string
  label: string
  route: string
  enabled: boolean
  sortOrder: number
}

export type BusinessCustomerAppMenuItem = {
  id: string
  label: string
  route: string
  enabled: boolean
  sortOrder: number
  children: BusinessCustomerAppSubMenuItem[]
}

export type BusinessCustomerAppNavigationSettings = {
  bottomTabs: BusinessCustomerAppMenuItem[]
}

export type BusinessCustomerAppSettings = {
  listingEnabled: boolean
  orderingEnabled: boolean
  guestRegistrationEnabled: boolean
  guestCheckoutEnabled: boolean
  orderHeaderImageUrl: string | null
  localInfoTitle: string | null
  localInfoText: string | null
  listingDisplay: BusinessCustomerAppListingDisplaySettings
  navigation: BusinessCustomerAppNavigationSettings
}

export type BusinessComplianceSettings = {
  cookieConsentRequired: boolean
  requirePrivacyConsentAtSignup: boolean
  requireTermsConsentAtCheckout: boolean
  orderButtonLabel: string
  dpoEmail: string | null
  securityContactEmail: string | null
  retentionDaysOrders: number | null
  retentionDaysCustomerData: number | null
  retentionDaysLogs: number | null
  enablePseudonymizedAnalytics: boolean
}

export type BusinessDriverSettings = {
  enabled: boolean
  allowOwnDevice: boolean
  defaultAccessHours: number
  maxActiveOrders: number
  locationTrackingEnabled: boolean
  locationUpdateSeconds: number
  customerLiveTrackingEnabled: boolean
}

export type BusinessSettings = {
  businessName: string | null
  legalName: string | null
  operatorName: string | null
  street: string | null
  zipCode: string | null
  city: string | null
  country: string | null
  phone: string | null
  email: string | null
  website: string | null
  imprintUrl: string | null
  privacyPolicyUrl: string | null
  termsUrl: string | null
  supportEmail: string | null
  accountDeletionEmail: string | null
  vatId: string | null
  taxNumber: string | null
  revenueId: string | null
  taxOffice: string | null
  payoutAccountHolder: string | null
  payoutBankName: string | null
  payoutIban: string | null
  payoutBic: string | null
  payoutEmail: string | null
  payoutReference: string | null
  deliveryFeeNote: string | null
  minOrderValue: string | null
  logoUrl: string | null
  coverImageUrl: string | null
  thumbnailUrl: string | null
  originalFileName: string | null
  openingHours: BusinessDailyWindow[]
  holidayHours: BusinessHolidayWindow[]
  deliveryHours: BusinessDailyWindow[]
  deliveryArea: BusinessServiceArea
  pickupArea: BusinessServiceArea
  driver: BusinessDriverSettings
  customerApp: BusinessCustomerAppSettings
  compliance: BusinessComplianceSettings
  notes: string | null
}

export type TenantImageUploadType = 'logo' | 'cover' | 'list' | 'thumbnail'

export type TenantImageUploadResult = {
  ok: boolean
  imageType: TenantImageUploadType
  url: string
  originalFileName: string | null
  listImageUrl?: string | null
  thumbnailUrl?: string | null
  dimensions: {
    width: number
    height: number
  }
  note?: string
}

export type PlatformBrandingMode =
  | 'ICON_ONLY'
  | 'WORDMARK_ONLY'
  | 'ICON_WORDMARK'
  | 'WORDMARK_ICON'

export type PlatformBrandingSettings = {
  iconUrl: string | null
  wordmarkUrl: string | null
  sidebarMode: PlatformBrandingMode
  headerMode: PlatformBrandingMode
  sidebarIconSize: number
  sidebarWordmarkHeight: number
  headerIconSize: number
  headerWordmarkHeight: number
}

export const DEFAULT_PLATFORM_BRANDING_SETTINGS: PlatformBrandingSettings = {
  iconUrl: '/klarando_icon.png',
  wordmarkUrl: '/klarando_logo_wordmark.png',
  sidebarMode: 'ICON_WORDMARK',
  headerMode: 'ICON_WORDMARK',
  sidebarIconSize: 56,
  sidebarWordmarkHeight: 44,
  headerIconSize: 44,
  headerWordmarkHeight: 36,
}

export type PublicTenantDiscoveryMode = 'all' | 'delivery' | 'pickup'

export type PublicTenantDiscoveryTenant = {
  tenantId: string
  tenantName: string
  ratingAverage: number | null
  ratingCount: number
  chain: {
    id: string
    name: string
    code: string
  } | null
  contact: {
    phone: string | null
    email: string | null
    website: string | null
    supportEmail: string | null
    accountDeletionEmail: string | null
  }
  legal: {
    imprintUrl: string | null
    privacyPolicyUrl: string | null
    termsUrl: string | null
  }
  address: {
    street: string | null
    zipCode: string | null
    city: string | null
    country: string | null
  }
  logoUrl: string | null
  deliveryFeeNote: string | null
  minOrderValue: string | null
  customerApp: BusinessCustomerAppSettings
  services: {
    delivery: {
      available: boolean
      strategy: BusinessServiceAreaStrategy
      matchedByZip: boolean
      matchedByRadius: boolean
      matchedByPolygon: boolean
      distanceKm: number | null
    }
    pickup: {
      available: boolean
      strategy: BusinessServiceAreaStrategy
      matchedByZip: boolean
      matchedByRadius: boolean
      matchedByPolygon: boolean
      distanceKm: number | null
    }
  }
}

export type PublicTenantDiscoveryResponse = {
  query: {
    zipCode: string
    street: string | null
    mode: PublicTenantDiscoveryMode
    latitude: number | null
    longitude: number | null
  }
  total: number
  tenants: PublicTenantDiscoveryTenant[]
}

export type SupplierIngredient = {
  id: string
  name: string
  unit: string
  purchasePrice: string
  articleNumber: string | null
  ean: string | null
}

export type SupplierMaster = {
  id: string
  tenantId: string
  name: string
  contactName: string | null
  phone: string | null
  email: string | null
  notes: string | null
  createdAt: string
  updatedAt: string
  ingredientCount: number
  ingredients: SupplierIngredient[]
}

export type StockMovementType =
  | 'GOODS_RECEIPT'
  | 'WRITE_OFF'
  | 'INVENTORY_COUNT'

export type StockOverviewRow = {
  ingredientId: string
  ingredientName: string
  unit: string
  supplier: string | null
  articleNumber: string | null
  purchasePrice: string
  minimumStock: number
  consumptionFactorPercent: number
  belowMinimum: boolean
  suggestedOrderQuantity: number
  currentQuantity: number
  stockValue: number
  lastMovementAt: string | null
}

export type StockMovementRecord = {
  id: string
  tenantId: string
  ingredientId: string
  type: StockMovementType
  quantityDelta: string
  resultingQuantity: string
  countedQuantity: string | null
  unitCost: string | null
  reference: string | null
  note: string | null
  createdByUserId: string | null
  createdAt: string
  ingredient: {
    id: string
    name: string
    unit: string
    supplier: string | null
    articleNumber: string | null
  }
  createdByUser: {
    id: string
    name: string
    email: string
  } | null
}

export type ActionKind = 'DAILY' | 'WEEKLY' | 'ONE_TIME'
export type ActionValueType = 'PERCENT' | 'FIXED_PRICE'

export type ActionProductLink = {
  id: string
  actionId: string
  productId: string
  createdAt: string
  product: {
    id: string
    name: string
    productNumber: string | null
    price: string
    available: boolean
  }
}

export type ActionCampaign = {
  id: string
  tenantId: string
  name: string
  description: string | null
  imageUrl: string | null
  displayAsMenu: boolean
  hidePriceOnScreen: boolean
  kind: ActionKind
  valueType: ActionValueType
  value: string
  isActive: boolean
  startAt: string | null
  endAt: string | null
  weeklyDays: number[]
  dailyStartTime: string | null
  dailyEndTime: string | null
  createdAt: string
  updatedAt: string
  products: ActionProductLink[]
}

export type StaffShiftStatus = 'PLANNED' | 'COMPLETED' | 'CANCELED'

export type StaffMember = {
  id: string
  tenantId: string
  userId: string | null
  name: string
  position: string | null
  phone: string | null
  email: string | null
  hourlyRate: string | null
  weeklyTargetHours: string | null
  isActive: boolean
  createdAt: string
  updatedAt: string
}

export type StaffShift = {
  id: string
  tenantId: string
  staffMemberId: string
  shiftDate: string
  startTime: string
  endTime: string
  breakMinutes: number
  status: StaffShiftStatus
  note: string | null
  createdByUserId: string | null
  createdAt: string
  updatedAt: string
  staffMember: {
    id: string
    name: string
    position: string | null
    isActive: boolean
    hourlyRate: string | null
  }
}

export type StaffSetting = {
  id: string
  tenantId: string
  planningDays: number
  defaultShiftStart: string
  defaultShiftEnd: string
  defaultBreakMinutes: number
  overtimeThresholdHours: string | null
  createdAt: string
  updatedAt: string
}

export type StaffEvaluationRow = {
  employeeId: string
  name: string
  position: string | null
  isActive: boolean
  plannedHours: number
  completedHours: number
  canceledHours: number
  plannedShifts: number
  completedShifts: number
  canceledShifts: number
  targetHours: number | null
  hourlyRate: number | null
  estimatedLaborCost: number | null
}

export type StaffEvaluationResult = {
  rows: StaffEvaluationRow[]
  totals: {
    employeeCount: number
    plannedHours: number
    completedHours: number
    canceledHours: number
    plannedShifts: number
    completedShifts: number
    canceledShifts: number
    estimatedLaborCost: number
  }
}

export type ProductIngredient = {
  id: string
  productId: string
  ingredientId: string
  quantity: string
  createdAt: string
  ingredient: Ingredient
}

export type ProductModifier = {
  id: string
  tenantId: string
  productId: string
  ingredientId: string | null
  name: string
  kind: 'OPTION' | 'SIZE'
  priceDelta: string
  isDefaultSelected: boolean
  isActive: boolean
  sortOrder: number
  createdAt: string
  updatedAt: string
  ingredient: {
    id: string
    name: string
    unit: string
  } | null
}

export type OrderItem = {
  id: string
  orderId: string
  productId: string
  quantity: number
  price: string
  unitBasePrice: string | null
  unitModifierDelta: string | null
  productionStatus: 'OPEN' | 'DONE' | string
  productionDoneAt: string | null
  modifierSnapshot: Array<{
    id: string
    name: string
    ingredientId: string | null
    ingredientName: string | null
    priceDelta: number
  }> | null
  createdAt: string
  product: Product
}

export type OrderPaymentMethod = 'CASH' | 'CARD' | 'PAYPAL' | 'KLARNA'

export type OrderTerminal = {
  id: string
  tenantId: string
  name: string
  terminalCode: string
  location: string | null
  customerLogoUrl: string | null
  customerAccentColor: string
  customerBgFromColor: string
  customerBgToColor: string
  customerCardColor: string
  autoScaleLayout: boolean
  isActive: boolean
  allowCashPayment: boolean
  allowCardPayment: boolean
  autoForwardToKitchen: boolean
  cashDisplayId: string | null
  kitchenDisplayId: string | null
  pickupDisplayId: string | null
  cashDisplay?: {
    id: string
    name: string
    displayCode: string
    displayRole: OrderDisplayRole
  } | null
  kitchenDisplay?: {
    id: string
    name: string
    displayCode: string
    displayRole: OrderDisplayRole
  } | null
  pickupDisplay?: {
    id: string
    name: string
    displayCode: string
    displayRole: OrderDisplayRole
  } | null
  notes: string | null
  createdAt: string
  updatedAt: string
}

export type PublicTerminalProduct = Product & {
  allergens: string[]
  ingredients: Array<{
    name: string
    allergens: string[]
  }>
  modifiers: Array<{
    id: string
    name: string
    kind: 'OPTION' | 'SIZE'
    ingredientId: string | null
    ingredientName: string | null
    priceDelta: string
    isDefaultSelected: boolean
  }>
}

export type PublicOrderTerminalConfig = {
  terminal: {
    id: string
    tenantId: string
    name: string
    terminalCode: string
    location: string | null
    customerLogoUrl: string | null
    customerAccentColor: string
    customerBgFromColor: string
    customerBgToColor: string
    customerCardColor: string
    autoScaleLayout: boolean
    isActive: boolean
    allowCashPayment: boolean
    allowCardPayment: boolean
    autoForwardToKitchen: boolean
    cashDisplayId: string | null
    kitchenDisplayId: string | null
    pickupDisplayId: string | null
  }
  products: PublicTerminalProduct[]
  generatedAt: string
}

export type OrderDisplayRole = 'CASH' | 'KITCHEN' | 'PICKUP'
export type OrderDisplayStatusAnimationMode = 'NONE' | 'BLINK' | 'PULSE' | 'GLOW'
export type OrderDisplayBackgroundMediaMode = 'NONE' | 'IMAGE' | 'VIDEO'
export type OrderDisplayAgeAlertAnimationMode = 'NONE' | 'BLINK' | 'PULSE'

export type OrderDisplay = {
  id: string
  tenantId: string
  name: string
  displayCode: string
  displayRole: OrderDisplayRole
  location: string | null
  isActive: boolean
  refreshIntervalSec: number
  sortMode: 'PRIORITY_OLDEST' | 'PRIORITY_NEWEST' | 'DONE_FIRST_OPEN_LAST' | string
  doneAutoHideSec: number
  sourceTerminalIds: string[]
  announceOnMenuScreens: boolean
  menuAnnouncementDurationSec: number
  displayBackgroundColor: string
  orderCardBackgroundColor: string
  statusColorPendingPayment: string
  statusColorOpen: string
  statusColorPreparing: string
  statusColorDone: string
  showOrderAge: boolean
  showTerminalInfo: boolean
  showPaymentInfo: boolean
  showTotal: boolean
  showItems: boolean
  showStatusBadge: boolean
  showPickupNumber: boolean
  showOrderNumber: boolean
  autoScaleLayout: boolean
  pickupShowOnlyNumber: boolean
  pickupShowOpen: boolean
  pickupShowPreparing: boolean
  pickupShowDone: boolean
  statusAnimationMode: OrderDisplayStatusAnimationMode | string
  statusAnimationDurationMs: number
  orderAgeFontSize: number
  orderAgeAlertThresholdSec: number
  orderAgeAlertAnimationMode: OrderDisplayAgeAlertAnimationMode | string
  backgroundMediaMode: OrderDisplayBackgroundMediaMode | string
  backgroundMediaUrl: string | null
  notes: string | null
  createdAt: string
  updatedAt: string
}

export type PublicOrderDisplayFeed = {
  display: {
    id: string
    tenantId: string
    name: string
    displayCode: string
    displayRole: OrderDisplayRole
    location: string | null
    isActive: boolean
    refreshIntervalSec: number
    sortMode: 'PRIORITY_OLDEST' | 'PRIORITY_NEWEST' | 'DONE_FIRST_OPEN_LAST' | string
    doneAutoHideSec: number
    sourceTerminalIds: string[]
    announceOnMenuScreens: boolean
    menuAnnouncementDurationSec: number
    displayBackgroundColor: string
    orderCardBackgroundColor: string
    statusColorPendingPayment: string
    statusColorOpen: string
    statusColorPreparing: string
    statusColorDone: string
    showOrderAge: boolean
    showTerminalInfo: boolean
    showPaymentInfo: boolean
    showTotal: boolean
    showItems: boolean
    showStatusBadge: boolean
    showPickupNumber: boolean
    showOrderNumber: boolean
    autoScaleLayout: boolean
    pickupShowOnlyNumber: boolean
    pickupShowOpen: boolean
    pickupShowPreparing: boolean
    pickupShowDone: boolean
    statusAnimationMode: OrderDisplayStatusAnimationMode | string
    statusAnimationDurationMs: number
    orderAgeFontSize: number
    orderAgeAlertThresholdSec: number
    orderAgeAlertAnimationMode: OrderDisplayAgeAlertAnimationMode | string
    backgroundMediaMode: OrderDisplayBackgroundMediaMode | string
    backgroundMediaUrl: string | null
    notes: string | null
  }
  orders: Order[]
  drivers: Array<{
    id: string
    name: string
  }>
  activeDriverDevices: DriverDeviceSession[]
  generatedAt: string
}

export type PublicOrderDisplayReceiptJobKind = 'CUSTOMER' | 'KITCHEN'

export type PublicOrderDisplayReceiptJob = {
  kind: PublicOrderDisplayReceiptJobKind
  templateId: string
  codepage: string
  charsPerLine: number
  commands: Array<
    | {
        type: 'TEXT'
        text: string
        align: 'LEFT' | 'CENTER' | 'RIGHT'
        emphasis: 'NORMAL' | 'BOLD'
        scale: 'S' | 'M' | 'L' | 'XL'
      }
    | {
        type: 'QR'
        value: string
        align: 'LEFT' | 'CENTER' | 'RIGHT'
        size: 'S' | 'M' | 'L'
        label?: string
      }
    | {
        type: 'FEED'
        lines: number
      }
    | {
        type: 'CUT'
      }
  >
  escposBase64: string
  escposHex: string
  bytesLength: number
}

export type PublicOrderDisplayReceiptJobsResponse = {
  ok: boolean
  displayCode: string
  orderId: string
  requestedAt: string
  jobs: PublicOrderDisplayReceiptJob[]
}

export type DriverDeviceSession = {
  sessionId: string
  tenantId: string
  displayCode: string
  displayId: string | null
  deviceLabel: string
  issuedAt: string
  expiresAt: string
  lastHeartbeatAt: string | null
  revokedAt: string | null
  driverUserId: string | null
  driverName: string | null
  isActive: boolean
  isOnline: boolean
}

export type DriverDeviceSessionCreateResponse = {
  ok: true
  sessionId: string
  displayCode: string
  tenantId: string
  deviceLabel: string
  accessHours: number
  expiresAt: string
  pairingToken: string
  pairingPayload: string
  qrImageUrl: string
}

export type OrderDeskDeviceBinding = {
  id: string
  deviceSerial: string
  tenantId: string
  displayId: string
  displayCode: string
  deviceAlias: string | null
  deviceModel: string | null
  devicePlatform: string | null
  appVersion: string | null
  boundByUserId: string | null
  boundAt: string
  firstBoundAt: string
  lastSeenAt: string | null
  isActive: boolean
  resetAt: string | null
  resetByUserId: string | null
  resetReason: string | null
  createdAt: string
  updatedAt: string
  display?: {
    id: string
    name: string
    displayCode: string
    displayRole: OrderDisplayRole
    isActive?: boolean
  } | null
}

export type OrderDeskPairingSessionCreateResponse = {
  ok: true
  sessionId: string
  tenantId: string
  displayId: string
  displayCode: string
  deviceAlias: string
  expiresAt: string
  pairingToken: string
  pairingPayload: string
  qrImageUrl: string
}

export type PublicOrderDeskBindResponse = {
  ok: true
  authToken: string
  binding: {
    id: string
    tenantId: string
    displayId: string
    displayCode: string
    deviceSerial: string
    deviceAlias: string | null
    deviceModel: string | null
    devicePlatform: string | null
    appVersion: string | null
    firstBoundAt: string
    boundAt: string
    lastSeenAt: string | null
    isActive: boolean
  }
  display: {
    id: string
    displayCode: string
  }
  mode: 'BOUND' | 'REBOUND' | string
  expiresAt: string
  secondsUntilExpiry: number
}

export type Order = {
  id: string
  tenantId: string
  terminalId: string | null
  appCustomerAccountId: string | null
  customerName: string | null
  customerPhone: string | null
  customerAddress: string | null
  customerZipCode: string | null
  customerCity: string | null
  serviceType: 'DELIVERY' | 'PICKUP' | string | null
  subtotal: string
  deliveryFee: string
  cashDisplayId: string | null
  kitchenDisplayId: string | null
  pickupDisplayId: string | null
  pickupNumber: number | null
  pickupAnnouncedAt: string | null
  pickupAnnounceUntil: string | null
  acceptedAt: string | null
  estimatedReadyAt: string | null
  estimatedMinutes: number | null
  assignedDriverId: string | null
  assignedDriverName: string | null
  driverAssignedAt: string | null
  driverDepartedAt: string | null
  driverLocation?: {
    latitude: number
    longitude: number
    accuracyMeters: number | null
    heading: number | null
    speedKmh: number | null
    updatedAt: string
  } | null
  total: string
  status: string
  sourceChannel: string
  paymentStatus: 'PAID' | 'UNPAID' | string
  paymentMethod: OrderPaymentMethod | null
  paidAt: string | null
  forwardedToKitchenAt: string | null
  createdAt: string
  complaintOpen?: boolean
  complaintCount?: number
  latestComplaintAt?: string | null
  latestComplaintMessage?: string | null
  latestComplaintImageCount?: number
  complaints?: Array<{
    id: string
    message: string
    images: string[]
    createdAt: string
    createdBy: string | null
    isResolved: boolean
  }>
  signatureCaptured?: boolean
  signatureCapturedAt?: string | null
  signatureSignerName?: string | null
  signatureImageDataUrl?: string | null
  terminal?: {
    id: string
    name: string
    terminalCode: string
    location: string | null
  } | null
  tenant?: {
    id: string
    name: string
    chain?: {
      id: string
      name: string
    } | null
  } | null
  appCustomerAccount?: {
    id: string
    email: string
    fullName: string
  } | null
  assignedDriver?: {
    id: string
    name: string
    email: string
  } | null
  items: OrderItem[]
}

export type OrderManagementResponse = {
  total: number
  byStatus: Record<string, number>
  bySource: Record<string, number>
  orders: Order[]
}

export type AdminOrderDashboard = {
  periodDays: number
  from: string
  to: string
  totals: {
    revenue: number
    totalOrders: number
    paidOrders: number
    unpaidOrders: number
    openOrders: number
  }
  topProducts: Array<{
    productId: string
    productName: string
    quantity: number
    revenue: number
  }>
  flopProducts: Array<{
    productId: string
    productName: string
    quantity: number
    revenue: number
  }>
}

export type SuperadminSalesDashboard = {
  periodDays: number
  from: string
  to: string
  totals: {
    revenue: number
    paidOrders: number
    tenants: number
    chains: number
    activeTenantsWithRevenue: number
  }
  chains: Array<{
    chainId: string
    chainName: string
    paidOrders: number
    revenue: number
    tenantCount: number
  }>
  tenants: Array<{
    tenantId: string
    tenantName: string
    chainId: string | null
    chainName: string | null
    paidOrders: number
    revenue: number
  }>
}

export type OrderRatingListEntry = {
  id: string
  orderId: string | null
  chainId?: string | null
  chainName?: string | null
  tenantId: string | null
  tenantName: string | null
  stars: number
  comment: string | null
  createdAt: string
}

export type AdminOrderRatingsDashboard = {
  periodDays: number
  from: string
  totalRatings: number
  averageRating: number | null
  pendingRatings72h: {
    windowHours: number
    unratedTotal: number
    currentlyRateable: number
    waitingForCooldown: number
    expiredWithoutRating: number
  }
  tenants: Array<{
    tenantId: string
    tenantName: string
    ratingCount: number
    ratingAverage: number
    lastRatedAt: string | null
  }>
  latest: OrderRatingListEntry[]
}

export type SuperadminOrderRatingsDashboard = {
  periodDays: number
  from: string
  totalRatings: number
  averageRating: number | null
  pendingRatings72h: {
    windowHours: number
    unratedTotal: number
    currentlyRateable: number
    waitingForCooldown: number
    expiredWithoutRating: number
  }
  chains: Array<{
    chainId: string
    chainName: string
    ratingCount: number
    ratingAverage: number
  }>
  tenants: Array<{
    tenantId: string
    tenantName: string
    ratingCount: number
    ratingAverage: number
  }>
  latest: OrderRatingListEntry[]
}

export type ChainadminTenantRight = {
  tenantId: string
  tenantName: string
  superadminGranted: boolean
  canViewRevenue: boolean
  canManageAppOrders: boolean
  canManageDelivery: boolean
  canManagePickup: boolean
  canViewPurchasing: boolean
  canViewStaffPlanning: boolean
  canOverrideSettings: boolean
  notes: string | null
}

export type ChainadminAccessRightsResponse = {
  chainAdminUserId: string
  chainId: string
  rights: ChainadminTenantRight[]
}

export type ChainadminDashboard = {
  periodDays: number
  from: string
  to: string
  totals: {
    revenue: number
    paidOrders: number
    purchasingVolume: number
    plannedShifts: number
    activeStaff: number
    tenants: number
  }
  tenants: Array<{
    tenantId: string
    tenantName: string
    paidOrders: number
    revenue: number
    purchasingVolume: number
    plannedShifts: number
    activeStaff: number
    rights: Omit<ChainadminTenantRight, 'tenantId' | 'tenantName'> | null
  }>
}

export type CashClosingDailyStatus =
  | 'OPEN'
  | 'SUBMITTED'
  | 'APPROVED'
  | 'RETURNED'
  | 'REOPEN_REQUESTED'
  | 'REOPENED'

export type CashClosingDailyPayload = {
  countedCash: number
  cashExpenses: number
  tipsCash: number
  tipsCard: number
  keepInRegisterTarget: number | null
  countSheet: Record<string, number> | null
  note: string | null
}

export type CashClosingDailyComputed = {
  orderCount: number
  paidOrderCount: number
  unpaidOrderCount: number
  appOrderCount: number
  appPickupOrderCount: number
  appDeliveryOrderCount: number
  takeawayOrderCount: number
  onSiteOrderCount: number
  terminalOrderCount: number
  posOrderCount: number
  appPickupTotal: number
  appDeliveryTotal: number
  takeawayTotal: number
  onSiteTotal: number
  grossTotal: number
  subtotalTotal: number
  deliveryFeeTotal: number
  paidCashTotal: number
  paidCardTotal: number
  paidPaypalTotal: number
  paidKlarnaTotal: number
  goodsReceiptValue: number
  writeOffValue: number
  inventoryCorrections: number
}

export type CashClosingDailyResponse = {
  tenantId: string
  tenantName: string
  chainId: string | null
  closingDate: string
  computed: CashClosingDailyComputed
  payload: CashClosingDailyPayload | null
  settlement: {
    expectedCash: number
    cashDifference: number
    keepInRegisterTarget: number
    bankDepositRaw: number
    bankDepositRounded: number
    cashAfterDeposit: number
  } | null
  status: CashClosingDailyStatus
  canSubmit: boolean
  canRequestReopen: boolean
  draft: {
    id: string
    createdAt: string
  } | null
  submission: {
    id: string
    createdAt: string
  } | null
  review: {
    id: string
    createdAt: string
    decision: 'APPROVED' | 'RETURNED' | null
    note: string | null
  } | null
  reopenRequest: {
    id: string
    createdAt: string
    reason: string | null
  } | null
  reopenReview: {
    id: string
    createdAt: string
    decision: 'APPROVED' | 'REJECTED' | null
    note: string | null
  } | null
  dailyPdf: {
    id: string
    createdAt: string
    generatedAt: string | null
    fileName: string
    sha256: string | null
    byteLength: number | null
  } | null
}

export type CashClosingMonthlyResponse = {
  tenantId: string
  tenantName: string
  chainId: string | null
  month: string
  totals: {
    orderCount: number
    grossTotal: number
    subtotalTotal: number
    deliveryFeeTotal: number
    paidCashTotal: number
  }
  days: Array<{
    closingDate: string
    submissionId: string
    submittedAt: string
    status: 'SUBMITTED' | 'APPROVED' | 'RETURNED'
    review: {
      id: string
      decision: 'APPROVED' | 'RETURNED' | null
      createdAt: string
    } | null
  }>
  monthlySubmission: {
    id: string
    createdAt: string
  } | null
  monthlyReview: {
    id: string
    createdAt: string
    decision: 'APPROVED' | 'RETURNED' | null
    note: string | null
  } | null
  status: 'OPEN' | 'SUBMITTED' | 'APPROVED' | 'RETURNED'
  canSubmit: boolean
}

export type ChainadminCashClosingQueue = {
  month: string
  pendingDaily: Array<{
    submissionId: string
    tenantId: string
    tenantName: string
    closingDate: string
    submittedAt: string
    payload: CashClosingDailyPayload | null
    computed: Record<string, unknown> | null
  }>
  pendingReopenRequests: Array<{
    requestId: string
    submissionId: string
    tenantId: string | null
    tenantName: string | null
    closingDate: string | null
    reason: string | null
    requestedAt: string
  }>
  pendingMonthly: Array<{
    submissionId: string
    tenantId: string
    tenantName: string
    month: string
    submittedAt: string
    note: string | null
    dayCount: number
    totals: Record<string, unknown> | null
  }>
}

export type BackendHealthOverview = {
  ok: boolean
  message?: string
  backendVersion: string | null
  buildDateUtc: string | null
  uptimeSeconds: number
  startedAt: string
  serverTime: string
}

export type BackendVersionOverview = {
  version: string | null
  buildNumber: number
  releaseName: string | null
  gitCommit: string | null
  buildTime: string | null
  environment: string | null
}

const fetch = apiFetch
const buildApiUrl = (path: string) => normalizeApiPath(path)

export async function getBackendHealthOverview(): Promise<BackendHealthOverview> {
  const res = await fetch(`${API_BASE_URL}/api/health`)
  if (!res.ok) {
    throw new Error('Backend-Health konnte nicht geladen werden')
  }
  return res.json()
}

export async function getBackendVersionOverview(): Promise<BackendVersionOverview> {
  const res = await fetch(`${API_BASE_URL}/api/version`)
  if (!res.ok) {
    throw new Error('Backend-Version konnte nicht geladen werden')
  }
  return res.json()
}

export async function getCategories(): Promise<Category[]> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    return []
  }
  const res = await fetch(`${API_BASE_URL}/api/categories?tenantId=${tenantId}`, {
    headers: authHeaders(),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Kategorien konnten nicht geladen werden')
  }

  return res.json()
}

export async function createCategory(data: {
  name: string
  sortOrder: number
  imageUrl?: string | null
}): Promise<Category> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    throw new Error('Keine Filiale ausgewaehlt')
  }
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/categories`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      name: data.name,
      sortOrder: data.sortOrder,
      imageUrl: data.imageUrl ?? null,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Kategorie konnte nicht erstellt werden')
  }

  return res.json()
}

export async function getProducts(options?: { availableOnly?: boolean }): Promise<Product[]> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    return []
  }
  const query = new URLSearchParams({
    tenantId,
  })

  if (options?.availableOnly) {
    query.set('availableOnly', 'true')
  }

  const res = await fetch(`${API_BASE_URL}/api/products?${query.toString()}`, {
    headers: authHeaders(),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Produkte konnten nicht geladen werden')
  }

  return res.json()
}

export async function createProduct(data: {
  categoryId: string | null
  productNumber?: string | null
  name: string
  imageUrl?: string | null
  ean?: string | null
  unitEans?: UnitEanEntry[]
  beverageContainerType?: 'NONE' | 'EINWEG' | 'MEHRWEG'
  deposit?: number
  articleInfo?: string | null
  foodBusinessOperator?: string | null
  nutritionInfo?: string | null
  price: number
  vatRate: number
  available: boolean
}): Promise<Product> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    throw new Error('Keine Filiale ausgewaehlt')
  }
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/products`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      categoryId: data.categoryId,
      productNumber: data.productNumber,
      name: data.name,
      imageUrl: data.imageUrl ?? null,
      ean: data.ean ?? null,
      unitEans: data.unitEans ?? [],
      beverageContainerType: data.beverageContainerType ?? 'NONE',
      deposit: data.deposit ?? 0,
      articleInfo: data.articleInfo ?? null,
      foodBusinessOperator: data.foodBusinessOperator ?? null,
      nutritionInfo: data.nutritionInfo ?? null,
      price: data.price,
      vatRate: data.vatRate,
      available: data.available,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Produkt konnte nicht erstellt werden')
  }

  return res.json()
}

export async function updateProduct(
  id: string,
  data: {
    productNumber?: string | null
    name: string
    imageUrl?: string | null
    ean?: string | null
    unitEans?: UnitEanEntry[]
    beverageContainerType?: 'NONE' | 'EINWEG' | 'MEHRWEG'
    deposit?: number
    articleInfo?: string | null
    foodBusinessOperator?: string | null
    nutritionInfo?: string | null
    price: number
    vatRate: number
    categoryId: string | null
    available: boolean
  }
): Promise<Product> {
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/products/${id}`, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Produkt konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function deleteProduct(id: string): Promise<void> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    throw new Error('Keine Filiale ausgewaehlt')
  }
  const token = readBrowserAccessToken()
  const query = new URLSearchParams({
    tenantId,
  })

  const res = await fetch(`${API_BASE_URL}/api/products/${id}?${query.toString()}`, {
    method: 'DELETE',
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Produkt konnte nicht geloescht werden')
  }
}

export function getStoredAccessToken() {
  if (typeof window === 'undefined') {
    return ''
  }

  try {
    const sessionRaw = window.localStorage.getItem('sessionUser')
    if (sessionRaw) {
      const parsed = JSON.parse(sessionRaw) as { accessToken?: string }
      const sessionToken = (parsed.accessToken || '').trim()
      if (
        sessionToken &&
        sessionToken.toLowerCase() !== 'undefined' &&
        sessionToken.toLowerCase() !== 'null'
      ) {
        window.localStorage.setItem('accessToken', sessionToken)
        return sessionToken
      }
    }
  } catch {
    // ignore malformed session payload
  }

  const localToken = (window.localStorage.getItem('accessToken') || '').trim()
  if (
    localToken &&
    localToken.toLowerCase() !== 'undefined' &&
    localToken.toLowerCase() !== 'null'
  ) {
    return localToken
  }

  return ''
}

function readBrowserAccessToken() {
  return getStoredAccessToken()
}

export function getStoredTenantId() {
  if (typeof window === 'undefined') {
    return resolveTenantId()
  }

  try {
    const sessionRaw = window.localStorage.getItem('sessionUser')
    if (sessionRaw) {
      const parsed = JSON.parse(sessionRaw) as {
        tenantId?: string | null
        activeTenantId?: string | null
      }
      const sessionTenantId = (parsed.tenantId || '').trim()
      if (sessionTenantId) {
        return sessionTenantId
      }
      const activeTenantId = (parsed.activeTenantId || '').trim()
      if (activeTenantId) {
        return activeTenantId
      }
    }
  } catch {
    // ignore malformed session payload
  }

  const localTenantId = (window.localStorage.getItem('tenantId') || '').trim()
  if (localTenantId) {
    return localTenantId
  }
  const defaultTenantId = (window.localStorage.getItem('klarando.defaultTenantId') || '').trim()
  if (defaultTenantId) {
    return defaultTenantId
  }

  return resolveTenantId()
}

async function apiAuthJson<T>(url: string, options: RequestInit = {}, fallbackError: string): Promise<T> {
  const token = readBrowserAccessToken()
  if (!token) {
    throw new Error('Nicht eingeloggt')
  }

  const headers = new Headers(options.headers || undefined)
  headers.set('Authorization', `Bearer ${token}`)

  const res = await fetch(url, {
    ...options,
    headers,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || fallbackError)
  }

  return res.json()
}

function formatBusinessSettingsValidationError(
  errorData: {
    error?: string
    missingRequiredFields?: Array<{ key?: string; label?: string }>
  } | null,
  fallback: string
) {
  const missingFields = Array.isArray(errorData?.missingRequiredFields)
    ? errorData!.missingRequiredFields
        .map((entry) => entry?.label?.trim())
        .filter((entry): entry is string => Boolean(entry))
    : []

  if (missingFields.length === 0) {
    return errorData?.error || fallback
  }

  return `${errorData?.error || fallback} Fehlend: ${missingFields.join(', ')}`
}

export async function getBusinessSettings(): Promise<BusinessSettings> {
  const tenantId = resolveTenantId()
  const query = new URLSearchParams({
    tenantId,
  })

  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/business-settings?${query.toString()}`, {
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Einstellungen konnten nicht geladen werden')
  }

  return res.json()
}

export async function updateBusinessSettings(
  settings: BusinessSettings
): Promise<BusinessSettings> {
  const tenantId = resolveTenantId()
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/business-settings`, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      settings,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(
      formatBusinessSettingsValidationError(
        errorData,
        'Einstellungen konnten nicht gespeichert werden'
      )
    )
  }

  return res.json()
}

export async function uploadBusinessSettingsImage(
  imageType: TenantImageUploadType,
  file: File,
  tenantId = resolveTenantId()
): Promise<TenantImageUploadResult> {
  const token = readBrowserAccessToken()
  if (!token) {
    throw new Error('Nicht eingeloggt')
  }
  if (!tenantId) {
    throw new Error('Bitte zuerst eine Filiale auswählen.')
  }

  const formData = new FormData()
  formData.append('tenantId', tenantId)
  formData.append('imageType', imageType)
  formData.append('file', file)

  const res = await fetch(`${API_BASE_URL}/api/business-settings/upload-image`, {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${token}`,
    },
    body: formData,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bild konnte nicht hochgeladen werden')
  }

  return res.json()
}

export async function getBusinessSettingsForTenant(
  token: string,
  tenantId: string
): Promise<BusinessSettings> {
  const query = new URLSearchParams({
    tenantId,
  })

  const res = await fetch(`${API_BASE_URL}/api/business-settings?${query.toString()}`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Filial-Einstellungen konnten nicht geladen werden')
  }

  return res.json()
}

export async function getMyEffectiveFeatureModules(
  tenantId = resolveTenantId(),
  token = readBrowserAccessToken()
): Promise<EffectiveFeatureSetResponse> {
  if (!token) {
    throw new Error('Kein Access-Token gefunden')
  }
  if (!tenantId) {
    throw new Error('Bitte zuerst eine Filiale auswählen.')
  }

  return getEffectiveFeatureModules(token, tenantId)
}

export async function updateBusinessSettingsForTenant(
  token: string,
  tenantId: string,
  settings: BusinessSettings
): Promise<BusinessSettings> {
  const res = await fetch(`${API_BASE_URL}/api/business-settings`, {
    method: 'PUT',
    headers: authHeaders(token),
    body: JSON.stringify({
      tenantId,
      settings,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(
      formatBusinessSettingsValidationError(
        errorData,
        'Filial-Einstellungen konnten nicht gespeichert werden'
      )
    )
  }

  return res.json()
}

export type TenantPaypalPaymentConfig = {
  id: string
  tenantId: string
  paypalMerchantId: string | null
  paypalEmail: string | null
  paypalOnboardingStatus: 'NOT_STARTED' | 'PENDING' | 'VERIFIED' | 'RESTRICTED' | 'DISABLED'
  paypalEnvironment: 'SANDBOX' | 'LIVE'
  paypalPaymentsEnabled: boolean
  klarandoPlatformFeePercent: string | null
  klarandoPlatformFeeFixed: number | null
  currency: string
}

export type TenantStripeConnectStatus = {
  tenantId: string
  stripeAccountId: string | null
  chargesEnabled: boolean
  payoutsEnabled: boolean
  detailsSubmitted: boolean
  onboardingCompleted: boolean
}

export type SuperadminStripeTenantStatusRow = {
  id: string
  name: string
  chain: {
    id: string
    name: string
  } | null
  paymentConfig: {
    stripeAccountId: string | null
    stripeChargesEnabled: boolean
    stripePayoutsEnabled: boolean
    stripeDetailsSubmitted: boolean
    stripeOnboardingCompleted: boolean
  } | null
}

export async function createStripeConnectedAccount(
  token: string,
  tenantId: string
): Promise<{
  ok: boolean
  tenantId: string
  stripeAccountId: string
  created: boolean
  onboardingUrl: string
  expiresAt: number
}> {
  return apiJson(
    buildApiUrl('/api/payments/connect/account'),
    {
      method: 'POST',
      headers: authHeaders(token),
      body: JSON.stringify({ tenantId }),
    },
    'Stripe-Konto konnte nicht verbunden werden'
  )
}

export async function createStripeAccountLink(
  token: string,
  tenantId: string
): Promise<{
  ok: boolean
  tenantId: string
  stripeAccountId: string
  onboardingUrl: string
  expiresAt: number
}> {
  return apiJson(
    buildApiUrl('/api/payments/connect/account-link'),
    {
      method: 'POST',
      headers: authHeaders(token),
      body: JSON.stringify({ tenantId }),
    },
    'Stripe-Onboarding-Link konnte nicht erstellt werden'
  )
}

export async function getStripeConnectStatus(
  token: string,
  tenantId: string
): Promise<TenantStripeConnectStatus> {
  const query = new URLSearchParams({ tenantId })
  return apiJson<TenantStripeConnectStatus>(
    buildApiUrl(`/api/payments/connect/status?${query.toString()}`),
    {
      headers: authHeaders(token),
    },
    'Stripe-Status konnte nicht geladen werden'
  )
}

export async function createStripePaymentIntent(input: {
  token: string
  tenantId: string
  orderId: string
  amountCents: number
}): Promise<{
  paymentId: string
  orderId: string
  tenantId: string
  paymentIntentId: string
  clientSecret: string | null
  amountCents: number
  currency: string
  platformFeeCents: number
}> {
  return apiJson(
    buildApiUrl('/api/payments/create-intent'),
    {
      method: 'POST',
      headers: authHeaders(input.token),
      body: JSON.stringify({
        tenantId: input.tenantId,
        orderId: input.orderId,
        amountCents: input.amountCents,
      }),
    },
    'Stripe PaymentIntent konnte nicht erstellt werden'
  )
}

export async function createStripeRefund(input: {
  token: string
  paymentId: string
  amountCents?: number
  reason?: string
}): Promise<{
  paymentId: string
  refundId: string
  stripeRefundId: string
  status: string | null
  amountCents: number
}> {
  return apiJson(
    buildApiUrl('/api/payments/refund'),
    {
      method: 'POST',
      headers: authHeaders(input.token),
      body: JSON.stringify({
        paymentId: input.paymentId,
        amountCents: input.amountCents,
        reason: input.reason,
      }),
    },
    'Stripe-Erstattung konnte nicht erstellt werden'
  )
}

export async function getSuperadminStripeTenantStatuses(
  token: string
): Promise<SuperadminStripeTenantStatusRow[]> {
  return apiJson<SuperadminStripeTenantStatusRow[]>(
    buildApiUrl('/api/payments/superadmin/tenants'),
    {
      headers: authHeaders(token),
    },
    'Stripe-Tenantstatus konnte nicht geladen werden'
  )
}

export async function getTenantPaypalPaymentConfig(
  token: string,
  tenantId: string
): Promise<TenantPaypalPaymentConfig> {
  const query = new URLSearchParams({ tenantId })
  return apiJson<TenantPaypalPaymentConfig>(
    buildApiUrl(`/api/payments/paypal/config?${query.toString()}`),
    { headers: authHeaders(token) },
    'PayPal-Einstellungen konnten nicht geladen werden'
  )
}

export async function updateTenantPaypalPaymentConfig(
  token: string,
  tenantId: string,
  settings: Partial<{
    paypalMerchantId: string | null
    paypalEmail: string | null
    paypalOnboardingStatus: string | null
    paypalEnvironment: string | null
    paypalPaymentsEnabled: boolean
    klarandoPlatformFeePercent: number | string | null
    klarandoPlatformFeeFixed: number | null
  }>
): Promise<TenantPaypalPaymentConfig> {
  return apiJson<TenantPaypalPaymentConfig>(
    buildApiUrl('/api/payments/paypal/config'),
    {
      method: 'PUT',
      headers: authHeaders(token),
      body: JSON.stringify({
        tenantId,
        settings,
      }),
    },
    'PayPal-Einstellungen konnten nicht gespeichert werden'
  )
}

export async function createPaypalCheckoutOrder(input: {
  token: string
  orderId: string
}): Promise<{
  orderId: string
  paypalOrderId: string
  approvalUrl: string
  status: string
  environment: 'sandbox' | 'live'
}> {
  return apiJson(
    buildApiUrl('/api/payments/paypal/create-order'),
    {
      method: 'POST',
      headers: authHeaders(input.token),
      body: JSON.stringify({
        orderId: input.orderId,
      }),
    },
    'PayPal-Order konnte nicht erstellt werden'
  )
}

export async function capturePaypalCheckoutOrder(input: {
  token?: string
  orderId?: string
  paypalOrderId: string
}): Promise<{
  ok: boolean
  orderId: string
  paypalOrderId: string
  captureId: string | null
  status: string | null
  paymentStatus: 'PAID' | 'FAILED'
}> {
  return apiJson(
    buildApiUrl('/api/payments/paypal/capture-order'),
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        ...(input.token ? { Authorization: `Bearer ${input.token}` } : {}),
      },
      body: JSON.stringify({
        orderId: input.orderId,
        paypalOrderId: input.paypalOrderId,
      }),
    },
    'PayPal-Order konnte nicht bestätigt werden'
  )
}

export async function getPlatformBrandingSettings(
  token?: string
): Promise<PlatformBrandingSettings> {
  const accessToken = token ?? readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/platform-branding`, {
    headers: accessToken ? { Authorization: `Bearer ${accessToken}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Branding-Einstellungen konnten nicht geladen werden')
  }

  const data = (await res.json()) as Partial<PlatformBrandingSettings>
  return {
    ...DEFAULT_PLATFORM_BRANDING_SETTINGS,
    ...data,
  }
}

export async function updatePlatformBrandingSettings(
  settings: PlatformBrandingSettings,
  token?: string
): Promise<PlatformBrandingSettings> {
  const accessToken = token ?? readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/platform-branding`, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
      ...(accessToken ? { Authorization: `Bearer ${accessToken}` } : {}),
    },
    body: JSON.stringify({
      settings,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Branding-Einstellungen konnten nicht gespeichert werden')
  }

  const data = (await res.json()) as Partial<PlatformBrandingSettings>
  return {
    ...DEFAULT_PLATFORM_BRANDING_SETTINGS,
    ...data,
  }
}

export async function getPublicTenantDiscovery(params: {
  zipCode: string
  street?: string | null
  mode?: PublicTenantDiscoveryMode
  latitude?: number | null
  longitude?: number | null
}): Promise<PublicTenantDiscoveryResponse> {
  const query = new URLSearchParams({
    zipCode: params.zipCode,
  })

  if (params.street && params.street.trim()) {
    query.set('street', params.street.trim())
  }

  if (params.mode && params.mode !== 'all') {
    query.set('mode', params.mode)
  }

  if (typeof params.latitude === 'number' && Number.isFinite(params.latitude)) {
    query.set('latitude', String(params.latitude))
  }

  if (typeof params.longitude === 'number' && Number.isFinite(params.longitude)) {
    query.set('longitude', String(params.longitude))
  }

  const res = await fetch(`${API_BASE_URL}/api/tenants/public/discovery?${query.toString()}`)

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Filialsuche konnte nicht geladen werden')
  }

  return res.json()
}

export async function getScreenConfig(): Promise<ScreenConfig> {
  const tenantId = resolveTenantId()
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/screen/config?tenantId=${tenantId}`, {
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bildschirm-Konfiguration konnte nicht geladen werden')
  }

  return res.json()
}

export async function updateScreenConfig(
  data: Partial<{
    title: string
    subtitle: string | null
    fontFamily: string | null
    defaultOrientation: ScreenOrientation
    defaultResolutionWidth: number
    defaultResolutionHeight: number
    productFontSize: number
    ingredientFontSize: number
    categoryFontSize: number
    priceFontSize: number
    backgroundMode: ScreenBackgroundMode
    backgroundValue: string | null
    backgroundMediaUrl: string | null
    overlayAnimation: ScreenOverlayAnimation
    cardStyle: ScreenCardStyle
    cardPadding: number
    cardBackgroundOpacity: number
    cardBorderOpacity: number
    productSortMode: ScreenProductSortMode
    defaultColumnCount: number
    showCategoryHeaders: boolean
    showCategoryOnCard: boolean
    categoryUppercase: boolean
    accentColor: string | null
    textColor: string | null
    productNameColor: string | null
    ingredientTextColor: string | null
    categoryTextColor: string | null
    priceTextColor: string | null
    showAllergens: boolean
    allergenLegendEnabled: boolean
    allergenLegendPosition: ScreenAllergenLegendPosition
    showPrices: boolean
    pricePinnedLeft: boolean
    priceDisplayMode: ScreenPriceDisplayMode
    showUnavailable: boolean
    showProductNumber: boolean
    logoUrl: string | null
    logoSize: number
    offerWindowEnabled: boolean
    offerWindowTitle: string | null
    offerWindowText: string | null
    offerWindowPosition: ScreenOfferWindowPosition
    offerWindowSize: ScreenOfferWindowSize
    offerWindowWidthPx: number
    offerWindowHeightPx: number
    offerWindowXPercent: number
    offerWindowYPercent: number
    offerWindowReserveSpace: boolean
    offerWindowBackgroundColor: string | null
    offerWindowTextColor: string | null
    offerWindowOpacity: number
    offerMediaUrls: string[] | string | null
    offerMediaRotateSec: number
    tickerEnabled: boolean
    tickerPosition: ScreenTickerPosition
    tickerShowClock: boolean
    tickerDataSource: ScreenTickerDataSource
    tickerCustomText: string | null
    tickerApiUrl: string | null
    tickerRefreshSec: number
    tickerClockFontSize: number
    tickerFontSize: number
    tickerInsetPx: number
    tickerOffsetPx: number
    tickerBackgroundColor: string | null
    tickerTextColor: string | null
  }>
): Promise<ScreenConfig> {
  const tenantId = resolveTenantId()
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/screen/config`, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      ...data,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bildschirm-Konfiguration konnte nicht gespeichert werden')
  }

  return res.json()
}

export async function getScreenProducts(options?: {
  categoryId?: string
  showOnScreen?: boolean
}): Promise<ScreenProduct[]> {
  const tenantId = resolveTenantId()
  const query = new URLSearchParams({
    tenantId,
  })

  if (options?.categoryId) {
    query.set('categoryId', options.categoryId)
  }

  if (options?.showOnScreen !== undefined) {
    query.set('showOnScreen', options.showOnScreen ? 'true' : 'false')
  }

  const res = await fetch(`${API_BASE_URL}/api/screen/products?${query.toString()}`, {
    headers: authHeaders(),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bildschirm-Produkte konnten nicht geladen werden')
  }

  return res.json()
}

export async function updateScreenProduct(
  productId: string,
  data: Partial<{
    displayCategory: string | null
    sortOrder: number
    showOnScreen: boolean
    isFeatured: boolean
    badgeText: string | null
    highlightColor: string | null
  }>
): Promise<ScreenProduct> {
  const tenantId = resolveTenantId()
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/screen/products/${productId}`, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      ...data,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bildschirm-Produkt konnte nicht gespeichert werden')
  }

  return res.json()
}

export async function getScreenDevices(): Promise<ScreenDevice[]> {
  const tenantId = resolveTenantId()
  const res = await fetch(`${API_BASE_URL}/api/screen/devices?tenantId=${tenantId}`, {
    headers: authHeaders(),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bildschirme konnten nicht geladen werden')
  }

  return res.json()
}

export async function createScreenDevice(
  data: {
    name: string
    deviceCode?: string
    location?: string | null
    orientation: ScreenDeviceOrientation
    resolutionWidth: number
    resolutionHeight: number
    refreshIntervalSec: number
    isActive: boolean
    showPricesOverride?: boolean | null
    showAllergensOverride?: boolean | null
    showUnavailableOverride?: boolean | null
    showProductNumberOverride?: boolean | null
    offerWindowEnabledOverride?: boolean | null
    offerWindowPositionOverride?: ScreenOfferWindowPosition | null
    offerWindowSizeOverride?: ScreenOfferWindowSize | null
    offerMediaUrlsOverride?: string[] | string | null
    offerMediaRotateSecOverride?: number | null
    cardStyleOverride?: ScreenCardStyle | null
    columnCountOverride?: number | null
    selectedCategoryIds?: string[]
    selectedProductIds?: string[]
    backgroundMediaUrlOverride?: string | null
    accentColorOverride?: string | null
    textColorOverride?: string | null
    notes?: string | null
  }
): Promise<ScreenDevice> {
  const tenantId = resolveTenantId()
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/screen/devices`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      ...data,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bildschirm konnte nicht erstellt werden')
  }

  return res.json()
}

export async function updateScreenDevice(
  id: string,
  data: Partial<{
    name: string
    location: string | null
    orientation: ScreenDeviceOrientation
    resolutionWidth: number
    resolutionHeight: number
    refreshIntervalSec: number
    isActive: boolean
    showPricesOverride: boolean | null
    showAllergensOverride: boolean | null
    showUnavailableOverride: boolean | null
    showProductNumberOverride: boolean | null
    offerWindowEnabledOverride: boolean | null
    offerWindowPositionOverride: ScreenOfferWindowPosition | null
    offerWindowSizeOverride: ScreenOfferWindowSize | null
    offerMediaUrlsOverride: string[] | string | null
    offerMediaRotateSecOverride: number | null
    cardStyleOverride: ScreenCardStyle | null
    columnCountOverride: number | null
    selectedCategoryIds: string[]
    selectedProductIds: string[]
    backgroundMediaUrlOverride: string | null
    accentColorOverride: string | null
    textColorOverride: string | null
    notes: string | null
  }>
): Promise<ScreenDevice> {
  const tenantId = resolveTenantId()
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/screen/devices/${id}`, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      ...data,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bildschirm konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function deleteScreenDevice(id: string): Promise<void> {
  const tenantId = resolveTenantId()
  const query = new URLSearchParams({
    tenantId,
  })

  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/screen/devices/${id}?${query.toString()}`, {
    method: 'DELETE',
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bildschirm konnte nicht geloescht werden')
  }
}

export async function getPublicScreenFeed(deviceCode: string): Promise<PublicScreenFeed> {
  const res = await fetch(`${API_BASE_URL}/api/screen/public/devices/${deviceCode}/feed`, {
    cache: 'no-store',
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bildschirm-Feed konnte nicht geladen werden')
  }

  return res.json()
}

export async function getIngredients(): Promise<Ingredient[]> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    return []
  }
  const res = await fetch(`${API_BASE_URL}/api/ingredients?tenantId=${tenantId}`, {
    headers: authHeaders(),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Zutaten konnten nicht geladen werden')
  }

  return res.json()
}

export async function getSuppliers(): Promise<SupplierMaster[]> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    return []
  }
  const res = await fetch(
    `${API_BASE_URL}/api/suppliers?tenantId=${tenantId}&includeIngredients=true`,
    {
      headers: authHeaders(),
    }
  )

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Lieferanten konnten nicht geladen werden')
  }

  return res.json()
}

export async function updateCategory(
  id: string,
  data: {
    name: string
    sortOrder: number
    imageUrl?: string | null
  }
): Promise<Category> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    throw new Error('Keine Filiale ausgewaehlt')
  }
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/categories/${id}`, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      ...data,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Kategorie konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function deleteCategory(id: string): Promise<void> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    throw new Error('Keine Filiale ausgewaehlt')
  }
  const token = readBrowserAccessToken()
  const query = new URLSearchParams({
    tenantId,
  })

  const res = await fetch(`${API_BASE_URL}/api/categories/${id}?${query.toString()}`, {
    method: 'DELETE',
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Kategorie konnte nicht geloescht werden')
  }
}

export async function createSupplier(data: {
  name: string
  contactName?: string
  phone?: string
  email?: string
  notes?: string
}): Promise<SupplierMaster> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    throw new Error('Keine Filiale ausgewaehlt')
  }
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/suppliers`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      name: data.name,
      contactName: data.contactName,
      phone: data.phone,
      email: data.email,
      notes: data.notes,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Lieferant konnte nicht erstellt werden')
  }

  return res.json()
}

export async function updateSupplier(
  id: string,
  data: Partial<{
    name: string
    contactName: string | null
    phone: string | null
    email: string | null
    notes: string | null
  }>
): Promise<SupplierMaster> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    throw new Error('Keine Filiale ausgewaehlt')
  }
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/suppliers/${id}`, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      ...data,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Lieferant konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function deleteSupplier(id: string): Promise<void> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    throw new Error('Keine Filiale ausgewaehlt')
  }
  const token = readBrowserAccessToken()
  const query = new URLSearchParams({
    tenantId,
  })

  const res = await fetch(`${API_BASE_URL}/api/suppliers/${id}?${query.toString()}`, {
    method: 'DELETE',
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Lieferant konnte nicht geloescht werden')
  }
}

export async function getStockOverview(): Promise<StockOverviewRow[]> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    return []
  }
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/stock/overview?tenantId=${tenantId}`, {
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Lagerbestand konnte nicht geladen werden')
  }

  return res.json()
}

export async function getStockMovements(options?: {
  ingredientId?: string
  type?: StockMovementType
  limit?: number
}): Promise<StockMovementRecord[]> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    return []
  }
  const token = readBrowserAccessToken()
  const query = new URLSearchParams({
    tenantId,
  })

  if (options?.ingredientId) {
    query.set('ingredientId', options.ingredientId)
  }

  if (options?.type) {
    query.set('type', options.type)
  }

  if (options?.limit) {
    query.set('limit', String(options.limit))
  }

  const res = await fetch(`${API_BASE_URL}/api/stock/movements?${query.toString()}`, {
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Lagerbewegungen konnten nicht geladen werden')
  }

  return res.json()
}

export async function createGoodsReceipt(data: {
  ingredientId: string
  quantity: number
  unitCost?: number
  reference?: string
  note?: string
}): Promise<StockMovementRecord> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    throw new Error('Keine Filiale ausgewaehlt')
  }
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/stock/goods-receipt`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      ingredientId: data.ingredientId,
      quantity: data.quantity,
      unitCost: data.unitCost,
      reference: data.reference,
      note: data.note,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Wareneingang konnte nicht gebucht werden')
  }

  return res.json()
}

export async function createWriteOff(data: {
  ingredientId: string
  quantity: number
  reference?: string
  note?: string
}): Promise<StockMovementRecord> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    throw new Error('Keine Filiale ausgewaehlt')
  }
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/stock/write-off`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      ingredientId: data.ingredientId,
      quantity: data.quantity,
      reference: data.reference,
      note: data.note,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Ausbuchung konnte nicht gebucht werden')
  }

  return res.json()
}

export async function createInventoryCount(data: {
  ingredientId: string
  countedQuantity: number
  note?: string
}): Promise<StockMovementRecord> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    throw new Error('Keine Filiale ausgewaehlt')
  }
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/stock/inventory-count`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      ingredientId: data.ingredientId,
      countedQuantity: data.countedQuantity,
      note: data.note,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Inventur konnte nicht gebucht werden')
  }

  return res.json()
}

export async function getActions(): Promise<ActionCampaign[]> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    return []
  }
  const res = await fetch(`${API_BASE_URL}/api/actions?tenantId=${tenantId}`, {
    headers: authHeaders(),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Aktionen konnten nicht geladen werden')
  }

  return res.json()
}

export async function getActiveActions(): Promise<ActionCampaign[]> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    return []
  }
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/actions/active?tenantId=${tenantId}`, {
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Aktive Aktionen konnten nicht geladen werden')
  }

  return res.json()
}

export async function createAction(data: {
  name: string
  description?: string
  imageUrl?: string | null
  displayAsMenu?: boolean
  hidePriceOnScreen?: boolean
  kind: ActionKind
  valueType: ActionValueType
  value: number
  isActive: boolean
  startAt?: string | null
  endAt?: string | null
  weeklyDays?: number[]
  dailyStartTime?: string | null
  dailyEndTime?: string | null
  productIds: string[]
}): Promise<ActionCampaign> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    throw new Error('Keine Filiale ausgewaehlt')
  }
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/actions`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      ...data,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Aktion konnte nicht erstellt werden')
  }

  return res.json()
}

export async function updateAction(
  id: string,
  data: Partial<{
    name: string
    description: string | null
    imageUrl: string | null
    displayAsMenu: boolean
    hidePriceOnScreen: boolean
    kind: ActionKind
    valueType: ActionValueType
    value: number
    isActive: boolean
    startAt: string | null
    endAt: string | null
    weeklyDays: number[]
    dailyStartTime: string | null
    dailyEndTime: string | null
    productIds: string[]
  }>
): Promise<ActionCampaign> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    throw new Error('Keine Filiale ausgewaehlt')
  }
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/actions/${id}`, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      ...data,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Aktion konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function deleteAction(id: string): Promise<void> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    throw new Error('Keine Filiale ausgewaehlt')
  }
  const token = readBrowserAccessToken()
  const query = new URLSearchParams({
    tenantId,
  })

  const res = await fetch(`${API_BASE_URL}/api/actions/${id}?${query.toString()}`, {
    method: 'DELETE',
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Aktion konnte nicht geloescht werden')
  }
}

export async function getStaffSettings(): Promise<StaffSetting> {
  const tenantId = resolveTenantId()
  const res = await fetch(`${API_BASE_URL}/api/staff/settings?tenantId=${tenantId}`)

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Mitarbeiter-Einstellungen konnten nicht geladen werden')
  }

  return res.json()
}

export async function updateStaffSettings(data: {
  planningDays: number
  defaultShiftStart: string
  defaultShiftEnd: string
  defaultBreakMinutes: number
  overtimeThresholdHours?: number | null
}): Promise<StaffSetting> {
  const tenantId = resolveTenantId()
  const res = await fetch(`${API_BASE_URL}/api/staff/settings`, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      tenantId,
      ...data,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Mitarbeiter-Einstellungen konnten nicht gespeichert werden')
  }

  return res.json()
}

export async function getStaffMembers(): Promise<StaffMember[]> {
  const tenantId = resolveTenantId()
  const res = await fetch(`${API_BASE_URL}/api/staff/employees?tenantId=${tenantId}`)

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Mitarbeiter konnten nicht geladen werden')
  }

  return res.json()
}

export async function createStaffMember(data: {
  name: string
  position?: string
  phone?: string
  email?: string
  hourlyRate?: number | null
  weeklyTargetHours?: number | null
  isActive?: boolean
}): Promise<StaffMember> {
  const tenantId = resolveTenantId()
  const res = await fetch(`${API_BASE_URL}/api/staff/employees`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      tenantId,
      ...data,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Mitarbeiter konnte nicht erstellt werden')
  }

  return res.json()
}

export async function updateStaffMember(
  id: string,
  data: Partial<{
    name: string
    position: string | null
    phone: string | null
    email: string | null
    hourlyRate: number | null
    weeklyTargetHours: number | null
    isActive: boolean
  }>
): Promise<StaffMember> {
  const tenantId = resolveTenantId()
  const res = await fetch(`${API_BASE_URL}/api/staff/employees/${id}`, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      tenantId,
      ...data,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Mitarbeiter konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function getStaffShifts(options?: {
  employeeId?: string
  from?: string
  to?: string
}): Promise<StaffShift[]> {
  const tenantId = resolveTenantId()
  const query = new URLSearchParams({
    tenantId,
  })

  if (options?.employeeId) {
    query.set('employeeId', options.employeeId)
  }

  if (options?.from) {
    query.set('from', options.from)
  }

  if (options?.to) {
    query.set('to', options.to)
  }

  const res = await fetch(`${API_BASE_URL}/api/staff/shifts?${query.toString()}`)

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Schichten konnten nicht geladen werden')
  }

  return res.json()
}

export async function createStaffShift(data: {
  staffMemberId: string
  shiftDate: string
  startTime: string
  endTime: string
  breakMinutes?: number
  status?: StaffShiftStatus
  note?: string
}): Promise<StaffShift> {
  const tenantId = resolveTenantId()
  const res = await fetch(`${API_BASE_URL}/api/staff/shifts`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      tenantId,
      ...data,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Schicht konnte nicht erstellt werden')
  }

  return res.json()
}

export async function updateStaffShift(
  id: string,
  data: Partial<{
    staffMemberId: string
    shiftDate: string
    startTime: string
    endTime: string
    breakMinutes: number
    status: StaffShiftStatus
    note: string | null
  }>
): Promise<StaffShift> {
  const tenantId = resolveTenantId()
  const res = await fetch(`${API_BASE_URL}/api/staff/shifts/${id}`, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      tenantId,
      ...data,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Schicht konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function deleteStaffShift(id: string): Promise<void> {
  const tenantId = resolveTenantId()
  const query = new URLSearchParams({
    tenantId,
  })

  const res = await fetch(`${API_BASE_URL}/api/staff/shifts/${id}?${query.toString()}`, {
    method: 'DELETE',
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Schicht konnte nicht geloescht werden')
  }
}

export async function getStaffEvaluation(options?: {
  from?: string
  to?: string
}): Promise<StaffEvaluationResult> {
  const tenantId = resolveTenantId()
  const query = new URLSearchParams({
    tenantId,
  })

  if (options?.from) {
    query.set('from', options.from)
  }

  if (options?.to) {
    query.set('to', options.to)
  }

  const res = await fetch(`${API_BASE_URL}/api/staff/evaluation?${query.toString()}`)

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Auswertung konnte nicht geladen werden')
  }

  return res.json()
}

export async function createIngredient(data: {
  name: string
  category?: 'FOOD' | 'PACKAGING'
  unit: string
  recipeUnit?: string | null
  gramsPerPurchaseUnit?: number | null
  purchasePrice: number
  minimumStock?: number
  consumptionFactorPercent?: number
  deposit: number
  ean?: string | null
  unitEans?: UnitEanEntry[]
  supplier: string
  articleNumber: string
  allergens?: string
}): Promise<Ingredient> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    throw new Error('Keine Filiale ausgewaehlt')
  }
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/ingredients`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      name: data.name,
      category: data.category ?? 'FOOD',
      unit: data.unit,
      recipeUnit: data.recipeUnit ?? data.unit,
      gramsPerPurchaseUnit: data.gramsPerPurchaseUnit ?? null,
      purchasePrice: data.purchasePrice,
      minimumStock: data.minimumStock ?? 0,
      consumptionFactorPercent: data.consumptionFactorPercent ?? 0,
      deposit: data.deposit,
      ean: data.ean ?? null,
      unitEans: data.unitEans ?? [],
      supplier: data.supplier,
      articleNumber: data.articleNumber,
      allergens: data.allergens,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Zutat konnte nicht erstellt werden')
  }

  return res.json()
}

export async function getProductIngredients(
  productId: string
): Promise<ProductIngredient[]> {
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/product-ingredients?productId=${productId}`, {
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    throw new Error('Produkt-Zutaten konnten nicht geladen werden')
  }

  return res.json()
}

export async function createProductIngredient(data: {
  productId: string
  ingredientId: string
  quantity: number
}): Promise<ProductIngredient> {
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/product-ingredients`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      productId: data.productId,
      ingredientId: data.ingredientId,
      quantity: data.quantity,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Produkt-Zutat konnte nicht erstellt werden')
  }

  return res.json()
}

export async function getCalculation(productId: string) {
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/calculation/${productId}`, {
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Kalkulation konnte nicht geladen werden')
  }

  return res.json()
}

export async function updateProductIngredient(
  id: string,
  data: {
    quantity: number
  }
): Promise<ProductIngredient> {
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/product-ingredients/${id}`, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      quantity: data.quantity,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Produkt-Zutat konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function deleteProductIngredient(id: string): Promise<void> {
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/product-ingredients/${id}`, {
    method: 'DELETE',
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Produkt-Zutat konnte nicht geloescht werden')
  }
}

export async function getOrders(): Promise<Order[]> {
  const tenantId = resolveTenantId()
  const token = readBrowserAccessToken()
  return apiJson<Order[]>(
    buildApiUrl(`/api/orders?tenantId=${tenantId}`),
    { headers: token ? { Authorization: `Bearer ${token}` } : undefined },
    'Bestellungen konnten nicht geladen werden'
  )
}

export async function createOrder(
  items: Array<{ productId: string; quantity: number }>,
  options?: Partial<{
    terminalId: string | null
    sourceChannel: string
    paymentMethod: OrderPaymentMethod | null
    markPaid: boolean
    forwardToKitchen: boolean
    serviceType: 'DELIVERY' | 'PICKUP'
    customerName: string | null
    customerPhone: string | null
    customerAddress: string | null
    customerZipCode: string | null
    customerCity: string | null
    appAuthToken: string | null
  }>
): Promise<Order> {
  const tenantId = resolveTenantId()
  const res = await fetch(`${API_BASE_URL}/api/orders`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(options?.appAuthToken
        ? {
            Authorization: `Bearer ${options.appAuthToken}`,
          }
        : {}),
    },
    body: JSON.stringify({
      tenantId,
      items,
      ...options,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bestellung konnte nicht erstellt werden')
  }

  return res.json()
}

export async function getOrderManagementList(params?: {
  tenantId?: string
  chainId?: string
  source?: 'ALL' | 'APP_ONLY' | 'TERMINAL_ONLY' | string
  status?: string
  limit?: number
}): Promise<OrderManagementResponse> {
  const query = new URLSearchParams()
  if (params?.tenantId) {
    query.set('tenantId', params.tenantId)
  }
  if (params?.chainId) {
    query.set('chainId', params.chainId)
  }
  if (params?.source) {
    query.set('source', params.source)
  }
  if (params?.status) {
    query.set('status', params.status)
  }
  if (typeof params?.limit === 'number' && Number.isFinite(params.limit)) {
    query.set('limit', String(Math.trunc(params.limit)))
  }

  return apiAuthJson<OrderManagementResponse>(
    `${API_BASE_URL}/api/orders/management?${query.toString()}`,
    {},
    'Bestelluebersicht konnte nicht geladen werden'
  )
}

export async function getCashClosingDaily(params: {
  date: string
  tenantId?: string
}): Promise<CashClosingDailyResponse> {
  const token = readBrowserAccessToken()
  const query = new URLSearchParams({
    date: params.date,
  })
  if (params.tenantId) {
    query.set('tenantId', params.tenantId)
  }

  const res = await fetch(`${API_BASE_URL}/api/cash-closings/admin/daily?${query.toString()}`, {
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Tagesabschluss konnte nicht geladen werden')
  }

  return res.json()
}

function parseDownloadFileName(contentDisposition: string | null, fallback: string) {
  if (!contentDisposition) return fallback
  const utf8Match = /filename\*=UTF-8''([^;]+)/i.exec(contentDisposition)
  if (utf8Match?.[1]) {
    try {
      return decodeURIComponent(utf8Match[1])
    } catch {
      return fallback
    }
  }
  const plainMatch = /filename="?([^";]+)"?/i.exec(contentDisposition)
  if (plainMatch?.[1]) return plainMatch[1]
  return fallback
}

export async function downloadCashClosingDailyPdf(params: {
  date: string
  tenantId?: string
}): Promise<{
  fileName: string
  blob: Blob
}> {
  const token = readBrowserAccessToken()
  const query = new URLSearchParams({
    date: params.date,
  })
  if (params.tenantId) {
    query.set('tenantId', params.tenantId)
  }

  const res = await fetch(`${API_BASE_URL}/api/cash-closings/admin/daily/pdf?${query.toString()}`, {
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Tagesabschluss-PDF konnte nicht geladen werden')
  }

  const fileName = parseDownloadFileName(res.headers.get('content-disposition'), `Tagesabschluss_${params.date}.pdf`)
  return {
    fileName,
    blob: await res.blob(),
  }
}

export async function saveCashClosingDaily(data: {
  date: string
  tenantId?: string
  countedCash: number
  cashExpenses: number
  tipsCash: number
  tipsCard: number
  keepInRegisterTarget?: number | null
  countSheet?: Record<string, number> | null
  note?: string | null
  submit?: boolean
}): Promise<{
  ok: boolean
  entryId: string
  action: string
}> {
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/cash-closings/admin/daily`, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Tagesabschluss konnte nicht gespeichert werden')
  }

  return res.json()
}

export async function requestCashClosingDailyReopen(data: {
  date: string
  tenantId?: string
  reason?: string | null
}): Promise<{
  ok: boolean
  requestId: string
  submissionId: string
}> {
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/cash-closings/admin/daily/reopen-request`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Wiedereroeffnung konnte nicht angefragt werden')
  }

  return res.json()
}

export async function getCashClosingMonthly(params: {
  month: string
  tenantId?: string
}): Promise<CashClosingMonthlyResponse> {
  const token = readBrowserAccessToken()
  const query = new URLSearchParams({
    month: params.month,
  })
  if (params.tenantId) {
    query.set('tenantId', params.tenantId)
  }

  const res = await fetch(`${API_BASE_URL}/api/cash-closings/admin/monthly?${query.toString()}`, {
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Monatsabschluss konnte nicht geladen werden')
  }

  return res.json()
}

export async function submitCashClosingMonthly(data: {
  month: string
  tenantId?: string
  note?: string | null
  dayCount?: number
  totals?: Record<string, unknown>
}): Promise<{
  ok: boolean
  submissionId: string
  month: string
  tenantId: string
}> {
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/cash-closings/admin/monthly/submit`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Monatsabschluss konnte nicht eingereicht werden')
  }

  return res.json()
}

export async function getAdminOrderDashboard(
  days = 30,
  tenantId = resolveTenantId(),
  token?: string
): Promise<AdminOrderDashboard> {
  if (!tenantId) {
    throw new Error('Bitte zuerst eine Filiale auswählen.')
  }
  const query = new URLSearchParams({
    tenantId,
    days: String(days),
  })

  const res = await fetch(`${API_BASE_URL}/api/orders/dashboard/admin?${query.toString()}`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Admin-Umsatzdaten konnten nicht geladen werden')
  }

  return res.json()
}

export async function getAdminOrderRatingsDashboard(
  days = 180,
  tenantId = resolveTenantId(),
  token?: string
): Promise<AdminOrderRatingsDashboard> {
  if (!tenantId) {
    throw new Error('Bitte zuerst eine Filiale auswählen.')
  }
  const query = new URLSearchParams({
    tenantId,
    days: String(days),
  })

  const res = await fetch(`${API_BASE_URL}/api/orders/ratings/admin?${query.toString()}`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bewertungen konnten nicht geladen werden')
  }

  return res.json()
}

export async function submitPublicOrderRating(
  orderId: string,
  stars: number,
  comment?: string | null
): Promise<{
  ok: boolean
  orderId: string
  tenantId: string
  stars: number
  comment: string | null
}> {
  const res = await fetch(`${API_BASE_URL}/api/orders/${orderId}/rating`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      stars,
      comment: comment || null,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bewertung konnte nicht gespeichert werden')
  }

  return res.json()
}

export async function getProductModifiers(productId: string): Promise<ProductModifier[]> {
  const query = new URLSearchParams({
    productId,
  })
  const token = readBrowserAccessToken()

  const res = await fetch(`${API_BASE_URL}/api/product-modifiers?${query.toString()}`, {
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Produktoptionen konnten nicht geladen werden')
  }

  return res.json()
}

export async function createProductModifier(data: {
  productId: string
  ingredientId?: string | null
  kind?: 'OPTION' | 'SIZE'
  name?: string
  priceDelta: number
  isDefaultSelected?: boolean
  isActive?: boolean
  sortOrder?: number
}): Promise<ProductModifier> {
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/product-modifiers`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Produktoption konnte nicht erstellt werden')
  }

  return res.json()
}

export async function updateProductModifier(
  id: string,
  data: Partial<{
    ingredientId: string | null
    kind: 'OPTION' | 'SIZE'
    name: string
    priceDelta: number
    isDefaultSelected: boolean
    isActive: boolean
    sortOrder: number
  }>
): Promise<ProductModifier> {
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/product-modifiers/${id}`, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Produktoption konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function deleteProductModifier(id: string): Promise<void> {
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/product-modifiers/${id}`, {
    method: 'DELETE',
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Produktoption konnte nicht geloescht werden')
  }
}

export async function getOrderTerminals(): Promise<OrderTerminal[]> {
  const tenantId = resolveTenantId()
  const res = await fetch(`${API_BASE_URL}/api/order-terminals?tenantId=${tenantId}`, {
    headers: authHeaders(),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bestellterminals konnten nicht geladen werden')
  }

  return res.json()
}

export async function getOrderDisplays(): Promise<OrderDisplay[]> {
  const tenantId = resolveTenantId()
  const res = await fetch(`${API_BASE_URL}/api/order-displays?tenantId=${tenantId}`, {
    headers: authHeaders(),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bestell-Displays konnten nicht geladen werden')
  }

  return res.json()
}

export async function getOrderDeskDeviceBindings(params?: {
  includeInactive?: boolean
}): Promise<{
  total: number
  bindings: OrderDeskDeviceBinding[]
  generatedAt: string
}> {
  const tenantId = resolveTenantId()
  const token = readBrowserAccessToken()
  const query = new URLSearchParams({
    tenantId,
  })
  if (typeof params?.includeInactive === 'boolean') {
    query.set('includeInactive', String(params.includeInactive))
  }
  const res = await fetch(`${API_BASE_URL}/api/orderdesk-devices/bindings?${query.toString()}`, {
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'OrderDesk-Bindings konnten nicht geladen werden')
  }

  return res.json()
}

export async function createOrderDeskPairingSession(data: {
  displayId?: string | null
  displayCode?: string | null
  deviceAlias?: string | null
  expiresMinutes?: number
}): Promise<OrderDeskPairingSessionCreateResponse> {
  const tenantId = resolveTenantId()
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/orderdesk-devices/pairing-session`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      ...data,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'OrderDesk-QR konnte nicht erstellt werden')
  }

  return res.json()
}

export async function resetOrderDeskDeviceBinding(
  bindingId: string,
  reason?: string
): Promise<{
  ok: true
  binding: OrderDeskDeviceBinding
}> {
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/orderdesk-devices/bindings/${bindingId}/reset`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      reason: reason?.trim() || undefined,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'OrderDesk-Binding konnte nicht zurueckgesetzt werden')
  }

  return res.json()
}

export async function createOrderDisplay(data: {
  name: string
  displayCode?: string
  displayRole?: OrderDisplayRole
  location?: string | null
  isActive?: boolean
  refreshIntervalSec?: number
  sortMode?: 'PRIORITY_OLDEST' | 'PRIORITY_NEWEST' | 'DONE_FIRST_OPEN_LAST'
  doneAutoHideSec?: number
  sourceTerminalIds?: string[]
  announceOnMenuScreens?: boolean
  menuAnnouncementDurationSec?: number
  displayBackgroundColor?: string
  orderCardBackgroundColor?: string
  statusColorPendingPayment?: string
  statusColorOpen?: string
  statusColorPreparing?: string
  statusColorDone?: string
  showOrderAge?: boolean
  showTerminalInfo?: boolean
  showPaymentInfo?: boolean
  showTotal?: boolean
  showItems?: boolean
  showStatusBadge?: boolean
  showPickupNumber?: boolean
  showOrderNumber?: boolean
  autoScaleLayout?: boolean
  pickupShowOnlyNumber?: boolean
  pickupShowOpen?: boolean
  pickupShowPreparing?: boolean
  pickupShowDone?: boolean
  statusAnimationMode?: OrderDisplayStatusAnimationMode
  statusAnimationDurationMs?: number
  orderAgeFontSize?: number
  orderAgeAlertThresholdSec?: number
  orderAgeAlertAnimationMode?: OrderDisplayAgeAlertAnimationMode
  backgroundMediaMode?: OrderDisplayBackgroundMediaMode
  backgroundMediaUrl?: string | null
  notes?: string | null
}): Promise<OrderDisplay> {
  const tenantId = resolveTenantId()
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/order-displays`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      ...data,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bestell-Display konnte nicht erstellt werden')
  }

  return res.json()
}

export async function updateOrderDisplay(
  id: string,
  data: Partial<{
    name: string
    displayRole: OrderDisplayRole
    location: string | null
    isActive: boolean
    refreshIntervalSec: number
    sortMode: 'PRIORITY_OLDEST' | 'PRIORITY_NEWEST' | 'DONE_FIRST_OPEN_LAST'
    doneAutoHideSec: number
    sourceTerminalIds: string[]
    announceOnMenuScreens: boolean
    menuAnnouncementDurationSec: number
    displayBackgroundColor: string
    orderCardBackgroundColor: string
    statusColorPendingPayment: string
    statusColorOpen: string
    statusColorPreparing: string
    statusColorDone: string
    showOrderAge: boolean
    showTerminalInfo: boolean
    showPaymentInfo: boolean
    showTotal: boolean
    showItems: boolean
    showStatusBadge: boolean
    showPickupNumber: boolean
    showOrderNumber: boolean
    autoScaleLayout: boolean
    pickupShowOnlyNumber: boolean
    pickupShowOpen: boolean
    pickupShowPreparing: boolean
    pickupShowDone: boolean
    statusAnimationMode: OrderDisplayStatusAnimationMode
    statusAnimationDurationMs: number
    orderAgeFontSize: number
    orderAgeAlertThresholdSec: number
    orderAgeAlertAnimationMode: OrderDisplayAgeAlertAnimationMode
    backgroundMediaMode: OrderDisplayBackgroundMediaMode
    backgroundMediaUrl: string | null
    notes: string | null
  }>
): Promise<OrderDisplay> {
  const tenantId = resolveTenantId()
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/order-displays/${id}`, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      ...data,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bestell-Display konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function deleteOrderDisplay(id: string): Promise<void> {
  const tenantId = resolveTenantId()
  const query = new URLSearchParams({
    tenantId,
  })

  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/order-displays/${id}?${query.toString()}`, {
    method: 'DELETE',
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bestell-Display konnte nicht geloescht werden')
  }
}

export async function createOrderTerminal(data: {
  name: string
  terminalCode?: string
  location?: string | null
  customerLogoUrl?: string | null
  customerAccentColor?: string
  customerBgFromColor?: string
  customerBgToColor?: string
  customerCardColor?: string
  autoScaleLayout?: boolean
  isActive?: boolean
  allowCashPayment?: boolean
  allowCardPayment?: boolean
  autoForwardToKitchen?: boolean
  cashDisplayId?: string | null
  kitchenDisplayId?: string | null
  pickupDisplayId?: string | null
  notes?: string | null
}): Promise<OrderTerminal> {
  const tenantId = resolveTenantId()
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/order-terminals`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      ...data,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bestellterminal konnte nicht erstellt werden')
  }

  return res.json()
}

export async function updateOrderTerminal(
  id: string,
  data: Partial<{
    name: string
    location: string | null
    customerLogoUrl: string | null
    customerAccentColor: string
    customerBgFromColor: string
    customerBgToColor: string
    customerCardColor: string
    autoScaleLayout: boolean
    isActive: boolean
    allowCashPayment: boolean
    allowCardPayment: boolean
    autoForwardToKitchen: boolean
    cashDisplayId: string | null
    kitchenDisplayId: string | null
    pickupDisplayId: string | null
    notes: string | null
  }>
): Promise<OrderTerminal> {
  const tenantId = resolveTenantId()
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/order-terminals/${id}`, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({
      tenantId,
      ...data,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bestellterminal konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function deleteOrderTerminal(id: string): Promise<void> {
  const tenantId = resolveTenantId()
  const query = new URLSearchParams({
    tenantId,
  })

  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/order-terminals/${id}?${query.toString()}`, {
    method: 'DELETE',
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bestellterminal konnte nicht geloescht werden')
  }
}

export async function getPublicTerminalConfig(
  terminalCode: string
): Promise<PublicOrderTerminalConfig> {
  const res = await fetch(
    `${API_BASE_URL}/api/order-terminals/public/${terminalCode}/config`
  )

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Terminal-Konfiguration konnte nicht geladen werden')
  }

  return res.json()
}

export async function createPublicTerminalOrder(
  terminalCode: string,
  data: {
    items: Array<{ productId: string; quantity: number; modifierIds?: string[] }>
    paymentMethod?: OrderPaymentMethod | null
    markPaid?: boolean
    forwardToKitchen?: boolean
  }
): Promise<Order> {
  const res = await fetch(
    `${API_BASE_URL}/api/order-terminals/public/${terminalCode}/orders`,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(data),
    }
  )

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Terminal-Bestellung konnte nicht erstellt werden')
  }

  return res.json()
}

export async function getPublicOrderDisplayFeed(
  displayCode: string
): Promise<PublicOrderDisplayFeed> {
  const res = await fetch(`${API_BASE_URL}/api/order-displays/public/${displayCode}/feed`)

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bestell-Display Feed konnte nicht geladen werden')
  }

  return res.json()
}

export async function getPublicOrderDisplayReceiptJobs(
  displayCode: string,
  orderId: string,
  params?: {
    kind?: 'customer' | 'kitchen' | 'both'
    trackingUrl?: string
    locale?: string
    timeZone?: string
  }
): Promise<PublicOrderDisplayReceiptJobsResponse> {
  const query = new URLSearchParams()
  if (params?.kind) query.set('kind', params.kind)
  if (params?.trackingUrl) query.set('trackingUrl', params.trackingUrl)
  if (params?.locale) query.set('locale', params.locale)
  if (params?.timeZone) query.set('timeZone', params.timeZone)
  const suffix = query.toString().length > 0 ? `?${query.toString()}` : ''

  const res = await fetch(
    `${API_BASE_URL}/api/order-displays/public/${displayCode}/orders/${orderId}/receipt-jobs${suffix}`
  )

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Receipt-Jobs konnten nicht geladen werden')
  }

  return res.json()
}

export async function createPublicDriverDeviceSession(
  displayCode: string,
  data?: {
    accessHours?: number
    deviceLabel?: string
  }
): Promise<DriverDeviceSessionCreateResponse> {
  const res = await fetch(`${API_BASE_URL}/api/order-displays/public/${displayCode}/driver-devices/session`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(data ?? {}),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Fahrergeraet-QR konnte nicht erstellt werden')
  }

  return res.json()
}

export async function getPublicActiveDriverDevices(
  displayCode: string
): Promise<{
  total: number
  sessions: DriverDeviceSession[]
  generatedAt: string
}> {
  const res = await fetch(`${API_BASE_URL}/api/order-displays/public/${displayCode}/driver-devices/active`)

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Aktive Fahrergeraete konnten nicht geladen werden')
  }

  return res.json()
}

export async function revokePublicDriverDeviceSession(
  displayCode: string,
  sessionId: string
): Promise<{
  ok: boolean
  sessionId: string
}> {
  const res = await fetch(`${API_BASE_URL}/api/order-displays/public/${displayCode}/driver-devices/revoke`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ sessionId }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Fahrergeraet konnte nicht getrennt werden')
  }

  return res.json()
}

export async function bindPublicOrderDeskDevice(data: {
  pairingTokenOrPayload: string
  deviceSerial: string
  deviceAlias?: string
  deviceModel?: string
  devicePlatform?: string
  appVersion?: string
}): Promise<PublicOrderDeskBindResponse> {
  const res = await fetch(`${API_BASE_URL}/api/orderdesk-devices/public/bind`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      pairingToken: data.pairingTokenOrPayload,
      deviceSerial: data.deviceSerial,
      deviceAlias: data.deviceAlias,
      deviceModel: data.deviceModel,
      devicePlatform: data.devicePlatform,
      appVersion: data.appVersion,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'OrderDesk konnte nicht verbunden werden')
  }

  return res.json()
}

export async function sendPublicOrderDeskHeartbeat(authToken: string): Promise<{
  ok: boolean
  bindingId: string
  displayCode: string
  serverTime: string
}> {
  const res = await fetch(`${API_BASE_URL}/api/orderdesk-devices/public/heartbeat`, {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${authToken}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({}),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'OrderDesk-Heartbeat fehlgeschlagen')
  }

  return res.json()
}

export async function updatePublicOrderDisplayOrderStatus(
  displayCode: string,
  orderId: string,
  status: 'pending_payment' | 'open' | 'preparing' | 'out_for_delivery' | 'done' | 'archived'
): Promise<Order> {
  const res = await fetch(
    `${API_BASE_URL}/api/order-displays/public/${displayCode}/orders/${orderId}/status`,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ status }),
    }
  )

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bestellstatus konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function dispatchPublicOrderDisplayOrder(
  displayCode: string,
  orderId: string,
  data: {
    driverUserId?: string | null
    driverName?: string | null
    estimatedMinutes?: number | null
  }
): Promise<Order> {
  const res = await fetch(
    `${API_BASE_URL}/api/order-displays/public/${displayCode}/orders/${orderId}/dispatch`,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(data),
    }
  )

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Fahrerzuweisung konnte nicht gespeichert werden')
  }

  return res.json()
}

export async function acceptPublicOrderDisplayOrder(
  displayCode: string,
  orderId: string,
  estimatedMinutes: number
): Promise<Order> {
  const res = await fetch(
    `${API_BASE_URL}/api/order-displays/public/${displayCode}/orders/${orderId}/accept`,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ estimatedMinutes }),
    }
  )

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Bestellannahme konnte nicht gespeichert werden')
  }

  return res.json()
}

export async function updatePublicOrderDisplayItemStatus(
  displayCode: string,
  orderId: string,
  itemId: string,
  status: 'OPEN' | 'DONE'
): Promise<Order> {
  const res = await fetch(
    `${API_BASE_URL}/api/order-displays/public/${displayCode}/orders/${orderId}/items/${itemId}/status`,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ status }),
    }
  )

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Positionsstatus konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function updatePublicOrderDisplayPaymentStatus(
  displayCode: string,
  orderId: string,
  paid: boolean
): Promise<Order> {
  const res = await fetch(
    `${API_BASE_URL}/api/order-displays/public/${displayCode}/orders/${orderId}/payment`,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ paid }),
    }
  )

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Zahlungsstatus konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function updateOrderStatus(
  orderId: string,
  status: 'pending_payment' | 'open' | 'preparing' | 'out_for_delivery' | 'done' | 'archived'
) {
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/orders/${orderId}/status`, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify({ status }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Status konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function resolveOrderComplaint(orderId: string, complaintId: string) {
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/orders/${orderId}/complaints/${complaintId}/resolve`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Reklamation konnte nicht erledigt werden')
  }

  return res.json()
}

export type ProductCalculation = {
  productId: string
  productName: string
  available: boolean
  vatRate?: number
  sellingPrice: number
  sellingPriceGross?: number
  sellingPriceNet?: number
  totalCost: number
  totalCostGross?: number
  totalCostNet?: number
  margin: number
  marginGross?: number
  marginNet?: number
  marginPercent: number
  costPercent: number
  costPercentNet?: number
  allergens: string[]
  ingredients: Array<{
    name: string
    unit: string
    purchaseUnit?: string
    quantity: number
    purchaseQuantity?: number
    price: number
    priceNet?: number
    priceGross?: number
    cost: number
    costNet?: number
    costGross?: number
    conversionApplied?: boolean
    allergens: string[]
  }>
}

export async function getCalculationList(): Promise<ProductCalculation[]> {
  const tenantId = resolveTenantId()
  if (!tenantId) {
    return []
  }
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/calculation?tenantId=${tenantId}`, {
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Kalkulationsliste konnte nicht geladen werden')
  }

  return res.json()
}

export async function updateIngredient(
  id: string,
  data: Partial<{
    name: string
    category: 'FOOD' | 'PACKAGING'
    unit: string
    recipeUnit: string | null
    gramsPerPurchaseUnit: number | null
    purchasePrice: number
    minimumStock: number
    consumptionFactorPercent: number
    deposit: number
    ean: string | null
    unitEans: UnitEanEntry[]
    supplier: string | null
    articleNumber: string | null
    allergens: string | null
  }>
): Promise<Ingredient> {
  const token = readBrowserAccessToken()
  const res = await fetch(`${API_BASE_URL}/api/ingredients/${id}`, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
    },
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Zutat konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function deleteIngredient(id: string): Promise<void> {
  const tenantId = resolveTenantId()
  const query = new URLSearchParams({
    tenantId,
  })

  const res = await fetch(`${API_BASE_URL}/api/ingredients/${id}?${query.toString()}`, {
    method: 'DELETE',
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Zutat konnte nicht geloescht werden')
  }
}

export type AccessRole = 'SUPERADMIN' | 'CHAINADMIN' | 'ADMIN' | 'STAFF' | 'DRIVER'

export type AccessPermission =
  | 'TENANTS_READ'
  | 'TENANTS_WRITE'
  | 'USERS_READ'
  | 'USERS_WRITE'
  | 'PRODUCTS_READ'
  | 'PRODUCTS_WRITE'
  | 'INVENTORY_READ'
  | 'INVENTORY_WRITE'
  | 'ORDERS_READ'
  | 'ORDERS_WRITE'
  | 'SETTINGS_READ'
  | 'SETTINGS_WRITE'
  | 'AUDIT_READ'

export type AccessUser = {
  id: string
  email: string
  name: string
  role: AccessRole
  isActive: boolean
  chainId: string | null
  tenantId: string | null
  createdAt: string
  updatedAt?: string
}

export type ManagedChain = {
  id: string
  name: string
  code: string
}

export type ManagedTenant = {
  id: string
  name: string
  email: string | null
  chainId: string | null
  createdAt?: string
  separateDatabase?: {
    enabled: boolean
    created: boolean
    databaseName: string | null
  }
}

export type BusinessTemplateAllergenCode =
  | 'A'
  | 'B'
  | 'C'
  | 'D'
  | 'E'
  | 'F'
  | 'G'
  | 'H'
  | 'I'
  | 'J'
  | 'K'
  | 'L'
  | 'M'
  | 'N'

export type BusinessTemplateType =
  | 'DONER_KEBAP'
  | 'PIZZERIA'
  | 'BURGER_SMASHBURGER'
  | 'GRILL_IMBISS'
  | 'ASIAN'
  | 'CAFE_BAKERY'
  | 'BEVERAGE_DELIVERY'
  | 'KIOSK_SPATI'
  | 'RESTAURANT_GENERAL'
  | 'STEAKHOUSE_GRILLHOUSE'
  | 'SUSHI'
  | 'VEGAN_HEALTHY'
  | 'FOODTRUCK'
  | 'ICECREAM_DESSERT'
  | 'BAR_LOUNGE'

export type BusinessTemplateOverview = {
  id: string
  key: string
  type: BusinessTemplateType
  name: string
  description: string | null
  sortOrder: number
  updatedAt: string
  _count: {
    categories: number
    ingredients: number
    products: number
  }
}

export type BusinessTemplateDetail = {
  id: string
  key: string
  type: BusinessTemplateType
  name: string
  description: string | null
  isActive: boolean
  sortOrder: number
  categories: Array<{
    id: string
    templateId: string
    name: string
    sortOrder: number
  }>
  ingredients: Array<{
    id: string
    templateId: string
    name: string
    category: 'FOOD' | 'PACKAGING'
    unit: string
    recipeUnit: string | null
    allergens: BusinessTemplateAllergenCode[]
    supplier: string | null
    articleNumber: string | null
  }>
  products: Array<{
    id: string
    templateId: string
    categoryId: string | null
    productNumber: string | null
    ean: string | null
    name: string
    imageUrl: string | null
    price: string
    vatRate: string
    available: boolean
    category: {
      id: string
      name: string
      sortOrder: number
    } | null
    ingredientLinks: Array<{
      id: string
      quantity: string
      ingredient: {
        id: string
        name: string
        allergens: BusinessTemplateAllergenCode[]
      }
    }>
  }>
}

export type BusinessTemplateFull = BusinessTemplateDetail

export type BusinessTemplateImportResult = {
  templateId: string
  tenantId: string
  templateVersion: string
  importedAt: string
  options: BusinessTemplateImportOptions
  categoriesCreated: number
  productsCreated: number
  productsUpdated: number
  ingredientsCreated: number
  productIngredientsCreated: number
  allergensApplied: number
  skippedExisting: number
  createdCategories: number
  createdIngredients: number
  createdProducts: number
  createdProductIngredients: number
}

export type BusinessTemplateImportOptions = {
  importCategories: boolean
  importProducts: boolean
  importIngredients: boolean
  importProductIngredients: boolean
  importAllergens: boolean
  importPriceSuggestions: boolean
  overwriteExisting: boolean
}

export type OnboardingBusinessPayload = {
  company: {
    name: string
    type: 'INDEPENDENT' | 'CHAIN' | 'FRANCHISE'
    contactName: string
    email: string
    phone?: string | null
  }
  admin: {
    name: string
    email: string
    password: string
    role: 'CHAINADMIN' | 'ADMIN'
  }
  branch: {
    name: string
    addressLine?: string | null
    email?: string | null
  }
  templateImport?: {
    templateId?: string | null
    enabled?: boolean
    options?: Partial<BusinessTemplateImportOptions>
  }
}

export type OnboardingBusinessResponse = {
  chain: {
    id: string
    name: string
    code: string
    type: 'INDEPENDENT' | 'CHAIN' | 'FRANCHISE'
    status: 'ACTIVE' | 'PAUSED' | 'ARCHIVED' | 'LOCKED'
  }
  tenant: {
    id: string
    name: string
    status: 'ACTIVE' | 'PAUSED' | 'ARCHIVED' | 'LOCKED'
  }
  admin: {
    id: string
    name: string
    email: string
    role: AccessRole
  }
  templateImport: BusinessTemplateImportResult | null
}

export type DatabaseAssignmentType = 'UNASSIGNED' | 'CHAIN' | 'TENANT'

export type DatabaseManagementChain = {
  id: string
  name: string
  code: string
  database: {
    databaseName: string
    databaseUrl: string
    updatedAt: string
  } | null
}

export type DatabaseManagementTenant = {
  id: string
  name: string
  chainId: string | null
  chainName: string | null
  chainCode: string | null
  database: {
    databaseName: string
    databaseUrl: string
    updatedAt: string
  } | null
}

export type DatabaseManagementUnassigned = {
  id: string
  databaseName: string
  databaseUrl: string
  label: string | null
  createdAt: string
  updatedAt: string
}

export type DatabaseManagementOverview = {
  chains: DatabaseManagementChain[]
  tenants: DatabaseManagementTenant[]
  unassigned: DatabaseManagementUnassigned[]
}

export type DatabaseManagementAdminOverview = {
  generatedAt: string
  users: Array<{
    id: string
    email: string
    name: string
    role: AccessRole
    isActive: boolean
    createdAt: string
    chain: {
      id: string
      name: string
      code: string
      databaseName: string | null
    } | null
    tenant: {
      id: string
      name: string
      databaseName: string | null
    } | null
    effectiveDatabaseName: string | null
  }>
  chains: Array<{
    id: string
    name: string
    code: string
    tenantCount: number
    userCount: number
    databaseName: string | null
    databaseUpdatedAt: string | null
  }>
  tenants: Array<{
    id: string
    name: string
    chainId: string | null
    chainName: string | null
    chainCode: string | null
    productCount: number
    categoryCount: number
    ingredientCount: number
    userCount: number
    databaseName: string | null
    databaseUpdatedAt: string | null
  }>
  unassignedDatabases: Array<{
    id: string
    databaseName: string
    label: string | null
    createdAt: string
    updatedAt: string
  }>
}

export type CustomerMasterRecord = {
  id: string
  chainId: string | null
  tenantId: string
  firstName: string
  lastName: string | null
  email: string | null
  phone: string | null
  street: string | null
  zipCode: string | null
  city: string | null
  birthDate: string | null
  loyaltyCode: string | null
  marketingOptIn: boolean
  isActive: boolean
  notes: string | null
  createdByUserId: string | null
  createdAt: string
  updatedAt: string
  tenant?: {
    id: string
    name: string
    chainId: string | null
  } | null
  chain?: {
    id: string
    name: string
    code: string
  } | null
}

export type AppCustomerAnalyticsTopEntry = {
  name: string
  count: number
}

export type AppCustomerAnalyticsTenantBreakdown = {
  tenantId: string
  tenantName: string
  chainName: string | null
  count: number
}

export type AppCustomerAnalyticsRecord = {
  id: string
  email: string
  fullName: string
  phone: string | null
  street: string | null
  zipCode: string | null
  city: string | null
  marketingOptIn: boolean
  isActive: boolean
  deletionRequestedAt: string | null
  lastLoginAt: string | null
  createdAt: string
  updatedAt: string
  metrics: {
    orderCount: number
    paidOrderCount: number
    totalRevenue: number
    avgOrderValue: number
    firstOrderAt: string | null
    lastOrderAt: string | null
    topProducts: AppCustomerAnalyticsTopEntry[]
    topCategories: AppCustomerAnalyticsTopEntry[]
    favoriteServiceType: string | null
    primaryLocation: {
      zipCode: string | null
      city: string | null
    } | null
    tenantBreakdown: AppCustomerAnalyticsTenantBreakdown[]
  }
}

export type AppCustomerAnalyticsResponse = {
  generatedAt: string
  behaviorDays: number
  rows: AppCustomerAnalyticsRecord[]
}

export type AppCustomerCampaignResponse = {
  ok: boolean
  channel: 'EMAIL' | 'PUSH' | 'EMAIL_AND_PUSH'
  queuedAt: string
  recipientCount: number
  recipientsPreview: Array<{
    id: string
    email: string
    fullName: string
    lastLoginAt: string | null
  }>
}

export type SuperadminDriverOverviewRow = {
  id: string
  email: string
  name: string
  role: AccessRole
  isActive: boolean
  chainId: string | null
  tenantId: string | null
  createdAt: string
  updatedAt: string
  chain: {
    id: string
    name: string
    code: string
  } | null
  tenant: {
    id: string
    name: string
    chainId: string | null
  } | null
  stats: {
    totalAssignedOrders: number
    activeDeliveries: number
    completedDeliveries: number
    todayAssignedOrders: number
    lastAssignmentAt: string | null
  }
}

export type SuperadminDriverOverviewResponse = {
  generatedAt: string
  rows: SuperadminDriverOverviewRow[]
}

export type SuperadminDriverDetailResponse = {
  driver: {
    id: string
    email: string
    name: string
    role: AccessRole
    isActive: boolean
    chainId: string | null
    tenantId: string | null
    createdAt: string
    updatedAt: string
    chain: {
      id: string
      name: string
      code: string
    } | null
    tenant: {
      id: string
      name: string
    } | null
  }
  summary: {
    totalAssignedOrders: number
    activeDeliveries: number
    completedDeliveries: number
    lastAssignmentAt: string | null
  }
  recentOrders: Array<{
    id: string
    tenantId: string
    status: string
    sourceChannel: string
    serviceType: string | null
    total: string
    paymentStatus: string
    pickupNumber: number | null
    customerName: string | null
    customerAddress: string | null
    customerZipCode: string | null
    customerCity: string | null
    estimatedMinutes: number | null
    driverAssignedAt: string | null
    driverDepartedAt: string | null
    createdAt: string
    tenant: {
      id: string
      name: string
      chain: {
        id: string
        name: string
        code: string
      } | null
    } | null
  }>
}

export type DisplayDeviceType =
  | 'MENU'
  | 'OFFERS'
  | 'PICKUP_NUMBERS'
  | 'KITCHEN'
  | 'ADVERTISING'
  | 'MIXED'

export type DisplayDeviceStatus = 'online' | 'offline' | 'inactive'

export type DisplayDeviceOverviewRow = {
  id: string
  entityId: string
  sourceKind: 'ORDER_DISPLAY' | 'SCREEN_DEVICE' | 'DISPLAY_DEVICE'
  screenId?: string | null
  tenantId: string
  tenantName: string | null
  chainId: string | null
  chainName: string | null
  name: string
  displayType: DisplayDeviceType
  code: string
  isActive: boolean
  lastSeenAt: string | null
  lastSyncAt: string | null
  resolution: string | null
  deviceInfo: {
    alias: string | null
    model: string | null
    platform: string | null
    appVersion: string | null
    source: 'ORDERDESK_BINDING' | 'SCREEN_DEVICE' | 'DISPLAY_DEVICE'
    diagnostics?: {
      effectiveResolution: string | null
      devicePixelRatio: number | null
      orientation: string | null
      fullscreenSupported: boolean | null
      touchSupported: boolean | null
      estimatedPerformanceClass: string | null
      supportedVideoFormats: string[]
      recommendedResolution: string | null
      lastDiagnosticsAt: string | null
    } | null
  } | null
  status: DisplayDeviceStatus
  previewPath: string
  editablePath: string
  pairingSupported: boolean
}

export type DisplayDeviceOverviewResponse = {
  generatedAt: string
  rows: DisplayDeviceOverviewRow[]
  summary: {
    total: number
    online: number
    offline: number
    inactive: number
  }
}

export type DisplayDevicePreviewResponse = {
  id: string
  sourceKind: 'ORDER_DISPLAY' | 'SCREEN_DEVICE'
  displayType: DisplayDeviceType
  previewUrl: string
  status: DisplayDeviceStatus
  isActive: boolean
  serverTime: string
}

export type FeatureModuleCategory =
  | 'BESTELLUNG'
  | 'KATALOG'
  | 'BETRIEB'
  | 'GERAETE'
  | 'FINANZEN'
  | 'PLATTFORM'

export type FeatureModuleKey =
  | 'ORDERS'
  | 'PRODUCTS'
  | 'CATEGORIES'
  | 'INGREDIENTS'
  | 'ALLERGENS'
  | 'STOCK'
  | 'SUPPLIERS'
  | 'STAFF'
  | 'DRIVERS'
  | 'DISPLAYS'
  | 'DISPLAY_DESIGN'
  | 'SIGNAGE_STUDIO'
  | 'ORDERDESK'
  | 'TERMINALS'
  | 'POS'
  | 'DELIVERY_ZONES'
  | 'RATINGS'
  | 'TIPS'
  | 'LOYALTY'
  | 'PAYMENT'
  | 'ANALYTICS'
  | 'CASH_CLOSING'
  | 'PLATFORM_BRANDING'

export type FeatureModuleDefinition = {
  key: FeatureModuleKey
  name: string
  description: string
  category: FeatureModuleCategory
  defaultEnabled: boolean
  adminNavPath: string | null
  requiredPermissions: AccessPermission[]
  dependencies: FeatureModuleKey[]
}

export type FeaturePackageTemplate = {
  key: string
  name: string
  description: string
  features: FeatureModuleKey[]
}

export type EffectiveFeatureModuleEntry = {
  key: FeatureModuleKey
  enabled: boolean
  source: 'default' | 'chain' | 'tenant'
  name: string
  description: string
  category: FeatureModuleCategory
  adminNavPath: string | null
  requiredPermissions: AccessPermission[]
  dependencies: FeatureModuleKey[]
  dependencyIssues: FeatureModuleKey[]
}

export type EffectiveFeatureSetResponse = {
  tenantId: string
  chainId: string | null
  modules: EffectiveFeatureModuleEntry[]
}

export type FeatureModuleOverviewRow = {
  tenantId: string
  tenantName: string
  chainId: string | null
  chainName: string | null
  enabledModules: number
  disabledModules: number
  modules: EffectiveFeatureModuleEntry[]
}

export type FeatureModuleOverviewResponse = {
  generatedAt: string
  rows: FeatureModuleOverviewRow[]
}

export type BillingPlanType =
  | 'REVENUE_SHARE'
  | 'MONTHLY_FIXED'
  | 'ORDER_PACKAGE'
  | 'HYBRID'
  | 'CUSTOM'

export type BillingPeriodType = 'MONTHLY' | 'WEEKLY'
export type FeeBearerType = 'CUSTOMER' | 'TENANT' | 'PLATFORM'

export type TenantBillingPlanSettings = {
  tenantId: string
  chainId: string | null
  planType: BillingPlanType
  monthlyFeeCents: number
  includedOrders: number
  commissionPercent: number
  commissionAfterIncludedOrdersPercent: number | null
  fixedFeePerOrderCents: number
  billingPeriod: BillingPeriodType
  activeFrom: string
  activeUntil: string | null
  isActive: boolean
  notes: string | null
  updatedBy: string | null
}

export type TenantBillingSettingsData = {
  tenantId: string
  chainId: string | null
  paymentFeeBearer: FeeBearerType
  countOnlyPaidOrders: boolean
  countOnlyCompletedOrders: boolean
  excludeCanceledOrders: boolean
  revenueMode: string
  currency: string
  timezone: string
  notes: string | null
  isActive: boolean
  updatedBy: string | null
}

export type BillingProfileData = {
  id?: string
  tenantId: string | null
  chainId: string | null
  companyName: string
  legalForm?: string | null
  contactEmail: string | null
  contactPerson?: string | null
  phone?: string | null
  website?: string | null
  vatId: string | null
  taxNumber?: string | null
  street: string | null
  zipCode: string | null
  city: string | null
  countryCode: string
  invoiceEmail: string | null
  paymentMethod?: string | null
  paymentTermsDays?: number | null
  paymentStatus?: string | null
  sepaActive?: boolean
  sepaMandateReference?: string | null
  sepaCreditorId?: string | null
  bankName?: string | null
  iban?: string | null
  bic?: string | null
  stripeCustomerId?: string | null
  paymentProviderStatus?: string | null
  plannedDebitAt?: string | null
  lastDebitAt?: string | null
  lastChargebackStatus?: string | null
  invoiceLogoUrl?: string | null
  standardPaymentTargetDays?: number | null
  managingDirector?: string | null
  approvedBy?: string | null
  sentAt?: string | null
  paidAt?: string | null
  cancelledAt?: string | null
  createdBy?: string | null
  updatedBy?: string | null
  billingCycleDay: number
  sepaPreNotificationDays: number
  notes: string | null
}

export type PlatformBillingSettings = {
  id?: string
  scopeKey: string
  companyName?: string | null
  legalForm?: string | null
  street?: string | null
  zipCode?: string | null
  city?: string | null
  countryCode: string
  vatId?: string | null
  taxNumber?: string | null
  managingDirector?: string | null
  invoiceEmail?: string | null
  phone?: string | null
  website?: string | null
  bankName?: string | null
  iban?: string | null
  bic?: string | null
  sepaCreditorId?: string | null
  invoiceLogoUrl?: string | null
  standardPaymentTargetDays?: number | null
  invoicePrimaryColor?: string | null
  invoiceAccentColor?: string | null
  invoiceFooter?: string | null
  invoicePaymentInfo?: string | null
  invoiceTaxNotice?: string | null
  invoiceEinvoiceNotice?: string | null
  invoiceReminderNotice?: string | null
  einvoiceFormatHint?: string | null
  paymentProviderStatus?: string | null
  plannedDebitAt?: string | null
  lastDebitAt?: string | null
  lastChargebackStatus?: string | null
  createdBy?: string | null
  updatedBy?: string | null
  approvedBy?: string | null
  sentAt?: string | null
  paidAt?: string | null
  cancelledAt?: string | null
}

export type BillingUsageSnapshot = {
  periodStart: string
  periodEnd: string
  ordersTotal: number
  ordersCounted: number
  ordersCanceled: number
  revenueGrossCents: number
  revenueCountedCents: number
}

export type AdminFinanceOverviewResponse = {
  tenant: {
    id: string
    name: string
    chainId: string | null
  }
  period: {
    days: number
    from: string
    to: string
  }
  feeConfig: {
    commissionPercent: number
    fixedFeePerOrderCents: number
  }
  summary: {
    grossAmountCents: number
    klarandoFeeCents: number
    merchantPayoutAmountCents: number
    tipAmountCents: number
  }
  transactions: Array<{
    orderId: string
    orderNumber: number | null
    paymentMethod: string | null
    paymentStatus: string
    grossAmountCents: number
    deliveryFeeCents: number
    tipAmountCents: number
    klarandoFeeCents: number
    merchantPayoutAmountCents: number
    customerNameMasked: string | null
    createdAt: string
  }>
}

export type AccessContext = {
  me: {
    id: string
    role: AccessRole
    chainId: string | null
    tenantId: string | null
  } | null
  chains: ManagedChain[]
  tenants: ManagedTenant[]
}

export type AuditLogEntry = {
  id: string
  actorUserId: string | null
  actorEmail: string | null
  actorRole: AccessRole | null
  chainId: string | null
  tenantId: string | null
  module: string
  action: string
  targetType: string | null
  targetId: string | null
  metadata: unknown
  createdAt: string
}

export type AccessLoginResponse = {
  token: string
  user: {
    id: string
    email: string
    name: string
    role: AccessRole
    chainId: string | null
    tenantId: string | null
  }
  permissions: AccessPermission[]
}

export type AccessUserPermissionsResponse = {
  userId: string
  role: AccessRole
  permissions: AccessPermission[]
}

function resolveAuthToken(token?: string) {
  const normalized = (token || '').trim()
  if (normalized) {
    return normalized
  }

  const browserToken = readBrowserAccessToken()
  if (browserToken) {
    return browserToken
  }

  throw new Error('Nicht eingeloggt')
}

function authHeaders(token?: string) {
  const resolvedToken = resolveAuthToken(token)
  return {
    'Content-Type': 'application/json',
    Authorization: `Bearer ${resolvedToken}`,
  }
}

export async function loginAccess(email: string, password: string): Promise<AccessLoginResponse> {
  return apiJson<AccessLoginResponse>(
    buildApiUrl('/api/auth/login'),
    {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ email, password }),
    },
    'Login fehlgeschlagen'
  )
}

export async function bootstrapSuperadmin(data: {
  email: string
  password: string
  name: string
}) {
  const res = await fetch(`${API_BASE_URL}/api/auth/bootstrap-superadmin`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Superadmin konnte nicht erstellt werden')
  }

  return res.json()
}

export async function getAccessUsers(token: string): Promise<AccessUser[]> {
  return apiJson<AccessUser[]>(
    buildApiUrl('/api/access/users'),
    { headers: authHeaders(token) },
    'Benutzer konnten nicht geladen werden'
  )
}

export async function getAccessContext(token: string): Promise<AccessContext> {
  return apiJson<AccessContext>(
    buildApiUrl('/api/access/context'),
    { headers: authHeaders(token) },
    'Kontext konnte nicht geladen werden'
  )
}

export async function getFeatureModuleCatalog(token: string): Promise<{
  modules: FeatureModuleDefinition[]
  packages: FeaturePackageTemplate[]
}> {
  const res = await fetch(`${API_BASE_URL}/api/access/features/catalog`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Feature-Katalog konnte nicht geladen werden')
  }

  return res.json()
}

export async function getEffectiveFeatureModules(
  token: string,
  tenantId?: string
): Promise<EffectiveFeatureSetResponse> {
  const query = new URLSearchParams()
  if (tenantId) {
    query.set('tenantId', tenantId)
  }
  const queryPart = query.toString()
  const res = await fetch(
    `${API_BASE_URL}/api/access/features/effective${queryPart ? `?${queryPart}` : ''}`,
    {
      headers: authHeaders(token),
    }
  )

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Feature-Scope konnte nicht geladen werden')
  }

  return res.json()
}

export async function getFeatureModuleOverview(
  token: string,
  filters: {
    tenantId?: string
    chainId?: string
  } = {}
): Promise<FeatureModuleOverviewResponse> {
  const query = new URLSearchParams()
  if (filters.tenantId) {
    query.set('tenantId', filters.tenantId)
  }
  if (filters.chainId) {
    query.set('chainId', filters.chainId)
  }

  const queryPart = query.toString()
  const res = await fetch(
    `${API_BASE_URL}/api/access/features/overview${queryPart ? `?${queryPart}` : ''}`,
    {
      headers: authHeaders(token),
    }
  )

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Feature-Uebersicht konnte nicht geladen werden')
  }

  return res.json()
}

export async function updateTenantFeatureModules(
  token: string,
  tenantId: string,
  payload: {
    featureKey?: FeatureModuleKey
    enabled?: boolean
    enabledBySuperadmin?: boolean
    features?: Array<{ featureKey: FeatureModuleKey; enabled: boolean }>
  }
): Promise<{ ok: boolean; tenantId: string; effective: EffectiveFeatureSetResponse | null }> {
  const res = await fetch(`${API_BASE_URL}/api/access/features/tenant/${tenantId}`, {
    method: 'PUT',
    headers: authHeaders(token),
    body: JSON.stringify(payload),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Feature-Einstellungen konnten nicht gespeichert werden')
  }

  return res.json()
}

export async function applyTenantFeaturePackage(
  token: string,
  tenantId: string,
  packageKey: string
): Promise<{ ok: boolean; packageKey: string; tenantId: string; effective: EffectiveFeatureSetResponse | null }> {
  const res = await fetch(`${API_BASE_URL}/api/access/features/tenant/${tenantId}/apply-package`, {
    method: 'POST',
    headers: authHeaders(token),
    body: JSON.stringify({ packageKey }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Feature-Paket konnte nicht angewendet werden')
  }

  return res.json()
}

export async function getChainFeatureModules(
  token: string,
  chainId: string
): Promise<{
  chain: { id: string; name: string; code: string }
  settings: Array<{
    id: string
    chainId: string
    featureKey: FeatureModuleKey
    enabled: boolean
    enabledBySuperadmin: boolean
    updatedBy: string | null
    createdAt: string
    updatedAt: string
  }>
}> {
  const res = await fetch(`${API_BASE_URL}/api/access/features/chain/${chainId}`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Chain-Feature-Scope konnte nicht geladen werden')
  }

  return res.json()
}

export async function updateChainFeatureModules(
  token: string,
  chainId: string,
  payload: {
    featureKey?: FeatureModuleKey
    enabled?: boolean
    enabledBySuperadmin?: boolean
    features?: Array<{ featureKey: FeatureModuleKey; enabled: boolean }>
  }
): Promise<{
  ok: boolean
  chainId: string
  settings: Array<{
    id: string
    chainId: string
    featureKey: FeatureModuleKey
    enabled: boolean
    enabledBySuperadmin: boolean
    updatedBy: string | null
    createdAt: string
    updatedAt: string
  }>
}> {
  const res = await fetch(`${API_BASE_URL}/api/access/features/chain/${chainId}`, {
    method: 'PUT',
    headers: authHeaders(token),
    body: JSON.stringify(payload),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Chain-Feature-Scope konnte nicht gespeichert werden')
  }

  return res.json()
}

export async function getTenantBillingConfig(
  token: string,
  tenantId: string
): Promise<{
  tenant: { id: string; name: string; chainId: string | null; chainName: string | null }
  plan: TenantBillingPlanSettings
  settings: TenantBillingSettingsData
  billingProfile: BillingProfileData
  usage: BillingUsageSnapshot
  commissionRules: Array<{
    id: string
    tenantId: string
    chainId: string | null
    name: string
    ruleType: 'PERCENT' | 'FIXED_PER_ORDER' | 'HYBRID' | 'THRESHOLD'
    isActive: boolean
    priority: number
    commissionPercent: number | null
    fixedFeePerOrderCents: number | null
    appliesAfterOrders: number | null
    activeFrom: string | null
    activeUntil: string | null
    createdAt: string
    updatedAt: string
  }>
}> {
  const res = await fetch(`${API_BASE_URL}/api/access/billing/tenant/${tenantId}`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Abrechnung konnte nicht geladen werden')
  }

  return res.json()
}

export async function updateTenantBillingConfig(
  token: string,
  tenantId: string,
  payload: Partial<
    TenantBillingPlanSettings &
      TenantBillingSettingsData & {
        settingsNotes: string | null
        billingModel: string | null
        paymentMethod: string | null
        paymentTermsDays: number | null
        billingEmail: string | null
        invoiceEmail: string | null
        adminRecipients: string | null
        profileCompanyName: string | null
        profileStreet: string | null
        profileZipCode: string | null
        profileCity: string | null
        profileCountryCode: string | null
        profileVatId: string | null
        profileContactEmail: string | null
        profileLegalForm: string | null
        profileTaxNumber: string | null
        profileManagingDirector: string | null
        profilePhone: string | null
        profileWebsite: string | null
        profileContactPerson: string | null
        profilePaymentMethod: string | null
        profilePaymentTermsDays: number | null
        profilePaymentStatus: string | null
        profileSepaActive: boolean | null
        profileSepaCreditorId: string | null
        profileBankName: string | null
        profileIban: string | null
        profileBic: string | null
        profileInvoiceLogoUrl: string | null
        profileStripeCustomerId: string | null
        profilePaymentProviderStatus: string | null
        sepaMandateReference: string | null
        sepaMandateSignedAt: string | null
      }
  >
): Promise<{
  ok: boolean
  tenantId: string
  plan: TenantBillingPlanSettings
  settings: TenantBillingSettingsData
  billingProfile?: BillingProfileData
}> {
  const res = await fetch(`${API_BASE_URL}/api/access/billing/tenant/${tenantId}`, {
    method: 'PUT',
    headers: authHeaders(token),
    body: JSON.stringify(payload),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Abrechnung konnte nicht gespeichert werden')
  }

  return res.json()
}

export async function getBillingOverview(
  token: string,
  filters: {
    tenantId?: string
    chainId?: string
  } = {}
): Promise<{
  generatedAt: string
  rows: Array<{
    tenantId: string
    tenantName: string
    chainId: string | null
    chainName: string | null
    plan: TenantBillingPlanSettings | null
  }>
}> {
  const query = new URLSearchParams()
  if (filters.tenantId) {
    query.set('tenantId', filters.tenantId)
  }
  if (filters.chainId) {
    query.set('chainId', filters.chainId)
  }

  const queryPart = query.toString()
  const res = await fetch(
    `${API_BASE_URL}/api/access/billing/overview${queryPart ? `?${queryPart}` : ''}`,
    {
      headers: authHeaders(token),
    }
  )

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Abrechnungsuebersicht konnte nicht geladen werden')
  }

  return res.json()
}

export async function syncTenantBillingUsage(
  token: string,
  tenantId: string,
  payload: { periodStart?: string; periodEnd?: string } = {}
): Promise<{ ok: boolean; tenantId: string; usagePeriodId: string; snapshot: BillingUsageSnapshot }> {
  const res = await fetch(`${API_BASE_URL}/api/access/billing/tenant/${tenantId}/usage/sync`, {
    method: 'POST',
    headers: authHeaders(token),
    body: JSON.stringify(payload),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Usage-Sync konnte nicht ausgefuehrt werden')
  }

  return res.json()
}

export async function getAdminFinanceOverview(
  token: string,
  tenantId: string,
  days = 30
): Promise<AdminFinanceOverviewResponse> {
  const query = new URLSearchParams({
    tenantId,
    days: String(days),
  })
  const res = await fetch(`${API_BASE_URL}/api/finance/overview?${query.toString()}`, {
    headers: authHeaders(token),
  })
  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Finanzübersicht konnte nicht geladen werden')
  }
  return res.json()
}

export type BillingPreviewItem = {
  tenantId: string
  tenantName: string
  chainId: string | null
  planType: string
  monthlyFeeCents: number
  commissionPercent: number
  estimatedTotalCents: number
  invoiceStatus: string
}

export type BillingPreviewResponse = {
  period: {
    key: string
    start: string
    end: string
  }
  invoicesPreview: BillingPreviewItem[]
}

export type FinanceUsageCurrent = BillingTenantRow & {
  month: string
  remainingIncludedOrders: number
  infoMessage: string
  thresholdMessage: string
}

export async function getFinanceUsageCurrent(
  token: string,
  params: { tenantId: string; month?: string }
): Promise<FinanceUsageCurrent> {
  const query = new URLSearchParams({ tenantId: params.tenantId })
  if (params.month) query.set('month', params.month)
  return apiJson<FinanceUsageCurrent>(
    buildApiUrl(`/api/finance/usage/current?${query.toString()}`),
    { headers: authHeaders(token) },
    'Usage-Daten konnten nicht geladen werden'
  )
}

export type ChainFinanceUsageCurrent = {
  month: string
  chainId: string
  summary: BillingSummaryResponse['summary']
  rows: BillingTenantRow[]
}

export async function getChainFinanceUsageCurrent(
  token: string,
  params: { month?: string; chainId?: string } = {}
): Promise<ChainFinanceUsageCurrent> {
  const query = new URLSearchParams()
  if (params.month) query.set('month', params.month)
  if (params.chainId) query.set('chainId', params.chainId)
  const suffix = query.toString() ? `?${query.toString()}` : ''
  return apiJson<ChainFinanceUsageCurrent>(
    buildApiUrl(`/api/finance/chain/usage/current${suffix}`),
    { headers: authHeaders(token) },
    'Chain-Usage konnte nicht geladen werden'
  )
}

export async function getChainFinanceInvoices(
  token: string,
  params: { chainId?: string } = {}
): Promise<BillingInvoice[]> {
  const query = new URLSearchParams()
  if (params.chainId) query.set('chainId', params.chainId)
  const suffix = query.toString() ? `?${query.toString()}` : ''
  return apiJson<BillingInvoice[]>(
    buildApiUrl(`/api/finance/chain/invoices${suffix}`),
    { headers: authHeaders(token) },
    'Chain-Rechnungen konnten nicht geladen werden'
  )
}

export type BillingTenantRow = {
  tenantId: string
  tenantName: string
  chainId: string | null
  chainName: string | null
  planType: string
  monthlyFeeCents: number
  includedOrders: number
  ordersCounted: number
  extraOrders: number
  includedUsagePercent: number
  countedRevenueCents: number
  commissionPercentApplied: number
  commissionCents: number
  fixedFeePerOrderCents: number
  fixedFeesCents: number
  totalFeeNetCents: number
  vatRatePercent: number
  vatCents: number
  totalFeeGrossCents: number
  marginNetCents: number
  status: string
  warnings: string[]
}

export type BillingSummaryResponse = {
  month: string
  periodStart: string
  periodEnd: string
  summary: {
    tenants: number
    platformRevenueNetCents: number
    platformRevenueGrossCents: number
    estimatedMarginNetCents: number
    openInvoices: number
    paidInvoices: number
    includedTenants: number
    chargeableTenants: number
  }
}

export type BillingTenantsResponse = {
  month: string
  rows: BillingTenantRow[]
}

export type BillingInvoice = {
  id: string
  invoiceNumber: string
  tenantId: string | null
  chainId: string | null
  recipientType: string
  status: string
  totalGrossCents: number
  openAmountCents: number
  currency: string
  periodStart: string
  periodEnd: string
  createdAt: string
  tenant?: { id: string; name: string } | null
  chain?: { id: string; name: string } | null
  lifecycleStatus?: string
  latestCollection?: {
    id: string
    status: string
    dueAt: string | null
    failedAt: string | null
    failureReason: string | null
    createdAt: string
  } | null
}

export type BillingMailboxMessage = {
  id: string
  title: string
  body: string
  messageType: string
  status: string | null
  actionUrl: string | null
  readAt: string | null
  createdAt: string
}

export async function getBillingPreview(token: string, period: string): Promise<BillingPreviewResponse> {
  const query = new URLSearchParams({ period })
  return apiJson<BillingPreviewResponse>(
    buildApiUrl(`/api/billing/superadmin/preview?${query.toString()}`),
    { headers: authHeaders(token) },
    'Rechnungsvorschau konnte nicht geladen werden'
  )
}

export async function finalizeBillingRun(token: string, period: string): Promise<{ billingRunId: string; invoicesCreated: number }> {
  return apiJson<{ billingRunId: string; invoicesCreated: number }>(
    buildApiUrl('/api/billing/superadmin/finalize'),
    {
      method: 'POST',
      headers: authHeaders(token),
      body: JSON.stringify({ period }),
    },
    'Monatslauf konnte nicht finalisiert werden'
  )
}

export async function getBillingSummary(
  token: string,
  params: { month: string; chainId?: string; tenantId?: string }
): Promise<BillingSummaryResponse> {
  const query = new URLSearchParams({ month: params.month })
  if (params.chainId) query.set('chainId', params.chainId)
  if (params.tenantId) query.set('tenantId', params.tenantId)
  return apiJson<BillingSummaryResponse>(
    buildApiUrl(`/api/billing/summary?${query.toString()}`),
    { headers: authHeaders(token) },
    'Billing-Summary konnte nicht geladen werden'
  )
}

export async function getBillingTenants(
  token: string,
  params: { month: string; chainId?: string; tenantId?: string; status?: string }
): Promise<BillingTenantsResponse> {
  const query = new URLSearchParams({ month: params.month })
  if (params.chainId) query.set('chainId', params.chainId)
  if (params.tenantId) query.set('tenantId', params.tenantId)
  if (params.status) query.set('status', params.status)
  return apiJson<BillingTenantsResponse>(
    buildApiUrl(`/api/billing/tenants?${query.toString()}`),
    { headers: authHeaders(token) },
    'Tenant-Abrechnung konnte nicht geladen werden'
  )
}

export async function createBillingRunPreview(
  token: string,
  params: { month: string; chainId?: string; tenantId?: string }
): Promise<{ month: string; rows: BillingTenantRow[]; warnings: Array<{ tenantId: string; message: string }> }> {
  return apiJson<{ month: string; rows: BillingTenantRow[]; warnings: Array<{ tenantId: string; message: string }> }>(
    buildApiUrl('/api/billing/runs/preview'),
    {
      method: 'POST',
      headers: authHeaders(token),
      body: JSON.stringify(params),
    },
    'Abrechnungsvorschau konnte nicht erzeugt werden'
  )
}

export async function createBillingRun(
  token: string,
  params: { month: string }
): Promise<{ billingRunId: string; invoicesCreated: number; invoiceIds: string[] }> {
  return apiJson<{ billingRunId: string; invoicesCreated: number; invoiceIds: string[] }>(
    buildApiUrl('/api/billing/runs'),
    {
      method: 'POST',
      headers: authHeaders(token),
      body: JSON.stringify(params),
    },
    'Monatsabrechnung konnte nicht erstellt werden'
  )
}

export async function finalizeBillingInvoice(
  token: string,
  invoiceId: string
): Promise<{ ok: boolean; invoiceId: string; status: string; lifecycleStatus?: string; emailDeliveryStatus?: string; simulationMode?: boolean }> {
  return apiJson<{ ok: boolean; invoiceId: string; status: string; lifecycleStatus?: string; emailDeliveryStatus?: string; simulationMode?: boolean }>(
    buildApiUrl(`/api/billing/invoices/${encodeURIComponent(invoiceId)}/finalize`),
    {
      method: 'POST',
      headers: authHeaders(token),
    },
    'Rechnung konnte nicht finalisiert werden'
  )
}

export async function getBillingInvoices(token: string, params: { tenantId?: string; chainId?: string } = {}): Promise<BillingInvoice[]> {
  const query = new URLSearchParams()
  if (params.tenantId) query.set('tenantId', params.tenantId)
  if (params.chainId) query.set('chainId', params.chainId)
  const suffix = query.toString() ? `?${query.toString()}` : ''
  return apiJson<BillingInvoice[]>(
    buildApiUrl(`/api/billing/invoices${suffix}`),
    { headers: authHeaders(token) },
    'Rechnungen konnten nicht geladen werden'
  )
}

export async function getBillingMailboxMessages(token: string, params: { tenantId?: string; chainId?: string } = {}): Promise<BillingMailboxMessage[]> {
  const query = new URLSearchParams()
  if (params.tenantId) query.set('tenantId', params.tenantId)
  if (params.chainId) query.set('chainId', params.chainId)
  const suffix = query.toString() ? `?${query.toString()}` : ''
  return apiJson<BillingMailboxMessage[]>(
    buildApiUrl(`/api/billing/mailbox${suffix}`),
    { headers: authHeaders(token) },
    'Postfach konnte nicht geladen werden'
  )
}

export type PromotionPlacementKey =
  | 'MAIN_APP'
  | 'PUBLIC_HOMEPAGE'
  | 'ADMIN_DASHBOARD'
  | 'CUSTOMER_APP'
  | 'MERCHANT_APP'
  | 'DRIVER_APP'

export type PromotionTargetAudience =
  | 'ALL'
  | 'CUSTOMER'
  | 'ADMIN'
  | 'DRIVER'
  | 'CHAINADMIN'
  | 'SUPERADMIN'

export type PlatformPromotion = {
  id: string
  title: string
  description: string | null
  imageUrl: string | null
  buttonText: string | null
  linkUrl: string | null
  productLink: string | null
  merchantLink: string | null
  priority: number
  isActive: boolean
  rotationSeconds: number
  startsAt: string | null
  endsAt: string | null
  placements: Array<{ id: string; placement: PromotionPlacementKey; isEnabled: boolean }>
  targetings: Array<{ id: string; audience: PromotionTargetAudience; isEnabled: boolean }>
  createdAt: string
  updatedAt: string
}

export type PromotionCreateInput = {
  title: string
  description?: string | null
  imageUrl?: string | null
  buttonText?: string | null
  linkUrl?: string | null
  productLink?: string | null
  merchantLink?: string | null
  priority?: number
  isActive?: boolean
  rotationSeconds?: number
  startsAt?: string | null
  endsAt?: string | null
  placement?: PromotionPlacementKey
  targetAudience?: PromotionTargetAudience
}

export async function getPromotionsAdmin(token: string): Promise<PlatformPromotion[]> {
  return apiJson<PlatformPromotion[]>(
    buildApiUrl('/api/promotions/admin'),
    { headers: authHeaders(token) },
    'Aktionen konnten nicht geladen werden'
  )
}

export async function createPromotion(token: string, input: PromotionCreateInput): Promise<PlatformPromotion> {
  return apiJson<PlatformPromotion>(
    buildApiUrl('/api/promotions/admin'),
    {
      method: 'POST',
      headers: authHeaders(token),
      body: JSON.stringify(input),
    },
    'Aktion konnte nicht erstellt werden'
  )
}

export async function updatePromotion(
  token: string,
  promotionId: string,
  input: Partial<PromotionCreateInput>
): Promise<PlatformPromotion> {
  return apiJson<PlatformPromotion>(
    buildApiUrl(`/api/promotions/admin/${encodeURIComponent(promotionId)}`),
    {
      method: 'PATCH',
      headers: authHeaders(token),
      body: JSON.stringify(input),
    },
    'Aktion konnte nicht aktualisiert werden'
  )
}

export async function getActivePromotions(
  placement: PromotionPlacementKey,
  audience: PromotionTargetAudience = 'ALL'
): Promise<PlatformPromotion[]> {
  const query = new URLSearchParams({ placement, audience })
  return apiJson<PlatformPromotion[]>(
    buildApiUrl(`/api/promotions/active?${query.toString()}`),
    { method: 'GET' },
    'Aktionen konnten nicht geladen werden'
  )
}

export async function getManagedTenants(token: string): Promise<ManagedTenant[]> {
  return apiJson<ManagedTenant[]>(
    buildApiUrl('/api/tenants'),
    { headers: authHeaders(token) },
    'Tenants konnten nicht geladen werden'
  )
}

export async function getBusinessTemplates(token: string): Promise<BusinessTemplateOverview[]> {
  return apiJson<BusinessTemplateOverview[]>(
    buildApiUrl('/api/business-templates'),
    { headers: authHeaders(token) },
    'Vorlagen konnten nicht geladen werden'
  )
}

export async function getBusinessTemplateDetail(
  token: string,
  templateId: string
): Promise<BusinessTemplateDetail> {
  return apiJson<BusinessTemplateDetail>(
    buildApiUrl(`/api/business-templates/${encodeURIComponent(templateId)}`),
    { headers: authHeaders(token) },
    'Vorlagen-Details konnten nicht geladen werden'
  )
}

export async function getBusinessTemplateFull(
  token: string,
  templateId: string
): Promise<BusinessTemplateFull> {
  const res = await fetch(`${API_BASE_URL}/api/business-templates/${encodeURIComponent(templateId)}/full`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Vorlagen-Details konnten nicht geladen werden')
  }

  return res.json()
}

export async function createBusinessTemplateCategory(
  token: string,
  templateId: string,
  payload: { name: string; sortOrder?: number }
) {
  const res = await fetch(`${API_BASE_URL}/api/business-templates/${encodeURIComponent(templateId)}/category`, {
    method: 'POST',
    headers: authHeaders(token),
    body: JSON.stringify(payload),
  })
  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Kategorie konnte nicht erstellt werden')
  }
  return res.json()
}

export async function createBusinessTemplateIngredient(
  token: string,
  templateId: string,
  payload: { name: string; unit: string; category?: 'FOOD' | 'PACKAGING'; allergens?: string[] }
) {
  const res = await fetch(`${API_BASE_URL}/api/business-templates/${encodeURIComponent(templateId)}/ingredient`, {
    method: 'POST',
    headers: authHeaders(token),
    body: JSON.stringify(payload),
  })
  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Zutat konnte nicht erstellt werden')
  }
  return res.json()
}

export async function createBusinessTemplateProduct(
  token: string,
  templateId: string,
  payload: {
    productNumber?: string | null
    ean?: string | null
    name: string
    categoryId?: string | null
    price?: number
  }
) {
  const res = await fetch(`${API_BASE_URL}/api/business-templates/${encodeURIComponent(templateId)}/product`, {
    method: 'POST',
    headers: authHeaders(token),
    body: JSON.stringify(payload),
  })
  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Produkt konnte nicht erstellt werden')
  }
  return res.json()
}

export async function createBusinessTemplateProductIngredient(
  token: string,
  templateId: string,
  payload: { templateProductId: string; templateIngredientId: string; quantity?: number }
) {
  const res = await fetch(`${API_BASE_URL}/api/business-templates/${encodeURIComponent(templateId)}/product-ingredient`, {
    method: 'POST',
    headers: authHeaders(token),
    body: JSON.stringify(payload),
  })
  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Verknüpfung konnte nicht erstellt werden')
  }
  return res.json()
}

export async function importBusinessTemplate(
  token: string,
  templateId: string,
  tenantId: string,
  importOptions?: Partial<BusinessTemplateImportOptions>
): Promise<BusinessTemplateImportResult> {
  return apiJson<BusinessTemplateImportResult>(
    buildApiUrl(`/api/business-templates/${encodeURIComponent(templateId)}/import`),
    {
      method: 'POST',
      headers: authHeaders(token),
      body: JSON.stringify({
        tenantId,
        ...(importOptions ? { importOptions } : {}),
      }),
    },
    'Vorlage konnte nicht importiert werden'
  )
}

export async function onboardBusiness(
  token: string,
  payload: OnboardingBusinessPayload
): Promise<OnboardingBusinessResponse> {
  return apiJson<OnboardingBusinessResponse>(
    buildApiUrl('/api/onboarding/business'),
    {
      method: 'POST',
      headers: authHeaders(token),
      body: JSON.stringify(payload),
    },
    'Onboarding konnte nicht abgeschlossen werden'
  )
}

export async function requestPasswordReset(email: string): Promise<{ ok: boolean; message: string }> {
  return apiJson<{ ok: boolean; message: string }>(
    buildApiUrl('/api/auth/forgot-password'),
    {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email }),
    },
    'Anfrage konnte nicht gesendet werden'
  )
}

export async function performPasswordReset(
  token: string,
  password: string
): Promise<{ ok: boolean; message: string }> {
  return apiJson<{ ok: boolean; message: string }>(
    buildApiUrl('/api/auth/reset-password'),
    {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ token, password }),
    },
    'Passwort konnte nicht zurückgesetzt werden'
  )
}

export async function createManagedTenant(
  token: string,
  data: {
    name: string
    email?: string
    chainId?: string | null
    copyFromTenantId?: string | null
  }
): Promise<ManagedTenant> {
  return apiJson<ManagedTenant>(
    buildApiUrl('/api/tenants'),
    {
      method: 'POST',
      headers: authHeaders(token),
      body: JSON.stringify(data),
    },
    'Tenant konnte nicht erstellt werden'
  )
}

export async function updateManagedTenant(
  token: string,
  id: string,
  data: Partial<{
    name: string
    email: string | null
    chainId: string | null
  }>
): Promise<ManagedTenant> {
  const res = await fetch(`${API_BASE_URL}/api/tenants/${id}`, {
    method: 'PATCH',
    headers: authHeaders(token),
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Filiale konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function deleteManagedTenant(
  token: string,
  id: string
): Promise<{
  ok: boolean
  tenantId: string
  tenantName: string
  releasedDatabaseName: string | null
  deletedCounts: {
    products: number
    categories: number
    users: number
    orders: number
    ingredients: number
  }
}> {
  const res = await fetch(`${API_BASE_URL}/api/tenants/${id}`, {
    method: 'DELETE',
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Filiale konnte nicht geloescht werden')
  }

  return res.json()
}

export async function getCustomerMasterList(
  token: string,
  params?: {
    tenantId?: string
    chainId?: string
    q?: string
    active?: boolean
    limit?: number
  }
): Promise<CustomerMasterRecord[]> {
  const query = new URLSearchParams()
  if (params?.tenantId) query.set('tenantId', params.tenantId)
  if (params?.chainId) query.set('chainId', params.chainId)
  if (params?.q) query.set('q', params.q)
  if (typeof params?.active === 'boolean') query.set('active', String(params.active))
  if (typeof params?.limit === 'number' && Number.isFinite(params.limit)) {
    query.set('limit', String(Math.round(params.limit)))
  }

  const suffix = query.toString().length > 0 ? `?${query.toString()}` : ''
  const res = await fetch(`${API_BASE_URL}/api/customers${suffix}`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Kundenstamm konnte nicht geladen werden')
  }

  return res.json()
}

export async function getAppCustomerAnalytics(
  token: string,
  params?: {
    tenantId?: string
    chainId?: string
    q?: string
    marketingOptIn?: boolean
    isActive?: boolean
    limit?: number
    behaviorDays?: number
  }
): Promise<AppCustomerAnalyticsResponse> {
  const query = new URLSearchParams()
  if (params?.tenantId) query.set('tenantId', params.tenantId)
  if (params?.chainId) query.set('chainId', params.chainId)
  if (params?.q) query.set('q', params.q)
  if (typeof params?.marketingOptIn === 'boolean') {
    query.set('marketingOptIn', String(params.marketingOptIn))
  }
  if (typeof params?.isActive === 'boolean') {
    query.set('isActive', String(params.isActive))
  }
  if (typeof params?.limit === 'number' && Number.isFinite(params.limit)) {
    query.set('limit', String(Math.round(params.limit)))
  }
  if (typeof params?.behaviorDays === 'number' && Number.isFinite(params.behaviorDays)) {
    query.set('behaviorDays', String(Math.round(params.behaviorDays)))
  }

  const suffix = query.toString().length > 0 ? `?${query.toString()}` : ''
  const res = await fetch(`${API_BASE_URL}/api/customers/app-accounts${suffix}`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'App-Kundenanalyse konnte nicht geladen werden')
  }

  return res.json()
}

export async function sendAppCustomerCampaign(
  token: string,
  data: {
    channel: 'EMAIL' | 'PUSH' | 'EMAIL_AND_PUSH'
    subject?: string | null
    title?: string | null
    message: string
    chainId?: string | null
    tenantId?: string | null
    q?: string | null
  }
): Promise<AppCustomerCampaignResponse> {
  const res = await fetch(`${API_BASE_URL}/api/customers/app-accounts/campaigns`, {
    method: 'POST',
    headers: authHeaders(token),
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Marketingkampagne konnte nicht versendet werden')
  }

  return res.json()
}

export async function getSuperadminDriverOverview(
  token: string,
  params?: {
    chainId?: string
    tenantId?: string
    q?: string
    includeInactive?: boolean
    limit?: number
  }
): Promise<SuperadminDriverOverviewResponse> {
  const query = new URLSearchParams()
  if (params?.chainId) query.set('chainId', params.chainId)
  if (params?.tenantId) query.set('tenantId', params.tenantId)
  if (params?.q) query.set('q', params.q)
  if (typeof params?.includeInactive === 'boolean') {
    query.set('includeInactive', String(params.includeInactive))
  }
  if (typeof params?.limit === 'number' && Number.isFinite(params.limit)) {
    query.set('limit', String(Math.round(params.limit)))
  }

  const suffix = query.toString().length > 0 ? `?${query.toString()}` : ''
  const res = await fetch(`${API_BASE_URL}/api/access/drivers/overview${suffix}`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Fahrer-Uebersicht konnte nicht geladen werden')
  }

  return res.json()
}

export async function getSuperadminDriverDetail(
  token: string,
  driverId: string
): Promise<SuperadminDriverDetailResponse> {
  const res = await fetch(`${API_BASE_URL}/api/access/drivers/${driverId}`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Fahrer-Details konnten nicht geladen werden')
  }

  return res.json()
}

export async function getDisplayDeviceOverview(
  token: string,
  params?: {
    tenantId?: string
    chainId?: string
    status?: DisplayDeviceStatus | 'all'
    displayType?: DisplayDeviceType | 'all'
    q?: string
  }
): Promise<DisplayDeviceOverviewResponse> {
  const query = new URLSearchParams()
  if (params?.tenantId) query.set('tenantId', params.tenantId)
  if (params?.chainId) query.set('chainId', params.chainId)
  if (params?.status && params.status !== 'all') query.set('status', params.status)
  if (params?.displayType && params.displayType !== 'all') query.set('displayType', params.displayType)
  if (params?.q) query.set('q', params.q)

  const suffix = query.toString().length > 0 ? `?${query.toString()}` : ''
  const res = await fetch(`${API_BASE_URL}/api/access/displays/overview${suffix}`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Display-Uebersicht konnte nicht geladen werden')
  }

  return res.json()
}

export async function getDisplayDevicePreview(
  token: string,
  displayRef: string
): Promise<DisplayDevicePreviewResponse> {
  const res = await fetch(`${API_BASE_URL}/api/access/displays/${encodeURIComponent(displayRef)}/preview`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Display-Vorschau konnte nicht geladen werden')
  }

  return res.json()
}

export async function updateDisplayDeviceActiveState(
  token: string,
  displayRef: string,
  isActive: boolean
): Promise<{
  id: string
  sourceKind: 'ORDER_DISPLAY' | 'SCREEN_DEVICE'
  isActive: boolean
  status: DisplayDeviceStatus
  updatedAt: string
}> {
  const res = await fetch(`${API_BASE_URL}/api/access/displays/${encodeURIComponent(displayRef)}/active`, {
    method: 'PATCH',
    headers: authHeaders(token),
    body: JSON.stringify({ isActive }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Display-Status konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function regenerateDisplayPairingCode(
  token: string,
  displayRef: string,
  data?: {
    deviceAlias?: string
    expiresMinutes?: number
  }
): Promise<{
  ok: true
  sessionId: string
  displayId: string
  displayCode: string
  tenantId: string
  expiresAt: string
  pairingPayload: string
  qrImageUrl: string
}> {
  const res = await fetch(`${API_BASE_URL}/api/access/displays/${encodeURIComponent(displayRef)}/pairing-code`, {
    method: 'POST',
    headers: authHeaders(token),
    body: JSON.stringify({
      deviceAlias: data?.deviceAlias || undefined,
      expiresMinutes: data?.expiresMinutes ?? undefined,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Pairing-Code konnte nicht erzeugt werden')
  }

  return res.json()
}

export async function claimDisplayPairingSession(
  token: string,
  data: {
    pairingToken?: string | null
    pairingCode?: string | null
    tenantId: string
    displayId?: string | null
    screenId?: string | null
    displayName?: string | null
    resolutionWidth?: number
    resolutionHeight?: number
    orientation?: string
  }
): Promise<{
  display: {
    id: string
    tenantId: string
    screenId: string | null
    name: string
    status: string
  }
  pairing?: {
    sessionId: string
    state: string
    claimedAt: string
    hasPairingToken: boolean
    hasPairingCode: boolean
  }
  message: string
}> {
  const res = await fetch(`${API_BASE_URL}/api/admin/displays/pairing/claim`, {
    method: 'POST',
    headers: authHeaders(token),
    body: JSON.stringify({
      pairingToken: data.pairingToken || undefined,
      pairingCode: data.pairingCode || undefined,
      tenantId: data.tenantId,
      displayId: data.displayId || undefined,
      screenId: data.screenId || undefined,
      displayName: data.displayName || undefined,
      resolutionWidth: data.resolutionWidth || undefined,
      resolutionHeight: data.resolutionHeight || undefined,
      orientation: data.orientation || undefined,
    }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.message || errorData?.error || 'Display konnte nicht verbunden werden')
  }

  return res.json()
}

export async function createCustomerMaster(
  token: string,
  data: {
    tenantId: string
    firstName: string
    lastName?: string | null
    email?: string | null
    phone?: string | null
    street?: string | null
    zipCode?: string | null
    city?: string | null
    birthDate?: string | null
    loyaltyCode?: string | null
    marketingOptIn?: boolean
    isActive?: boolean
    notes?: string | null
  }
): Promise<CustomerMasterRecord> {
  const res = await fetch(`${API_BASE_URL}/api/customers`, {
    method: 'POST',
    headers: authHeaders(token),
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Kunde konnte nicht erstellt werden')
  }

  return res.json()
}

export async function updateCustomerMaster(
  token: string,
  id: string,
  data: Partial<{
    firstName: string
    lastName: string | null
    email: string | null
    phone: string | null
    street: string | null
    zipCode: string | null
    city: string | null
    birthDate: string | null
    loyaltyCode: string | null
    marketingOptIn: boolean
    isActive: boolean
    notes: string | null
  }>
): Promise<CustomerMasterRecord> {
  const res = await fetch(`${API_BASE_URL}/api/customers/${id}`, {
    method: 'PATCH',
    headers: authHeaders(token),
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Kunde konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function archiveCustomerMaster(token: string, id: string): Promise<void> {
  const res = await fetch(`${API_BASE_URL}/api/customers/${id}`, {
    method: 'DELETE',
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Kunde konnte nicht archiviert werden')
  }
}

export async function getChains(token: string): Promise<ManagedChain[]> {
  const res = await fetch(`${API_BASE_URL}/api/chains`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Ketten konnten nicht geladen werden')
  }

  return res.json()
}

export async function createChain(
  token: string,
  data: {
    name: string
    code: string
  }
): Promise<ManagedChain> {
  const res = await fetch(`${API_BASE_URL}/api/chains`, {
    method: 'POST',
    headers: authHeaders(token),
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Kette konnte nicht erstellt werden')
  }

  return res.json()
}

export async function updateManagedChain(
  token: string,
  id: string,
  data: Partial<{
    name: string
    code: string
  }>
): Promise<ManagedChain> {
  const res = await fetch(`${API_BASE_URL}/api/chains/${id}`, {
    method: 'PATCH',
    headers: authHeaders(token),
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Kette konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function deleteManagedChain(
  token: string,
  id: string
): Promise<{
  ok: boolean
  chainId: string
  chainName: string
  releasedDatabaseName: string | null
}> {
  const res = await fetch(`${API_BASE_URL}/api/chains/${id}`, {
    method: 'DELETE',
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Kette konnte nicht geloescht werden')
  }

  return res.json()
}

export async function createAccessUser(
  token: string,
  data: {
    email: string
    name: string
    password: string
    role: AccessRole
    chainId?: string | null
    tenantId?: string | null
  }
) {
  return apiJson(
    buildApiUrl('/api/access/users'),
    {
      method: 'POST',
      headers: authHeaders(token),
      body: JSON.stringify(data),
    },
    'Benutzer konnte nicht erstellt werden'
  )
}

export async function updateAccessUser(
  token: string,
  id: string,
  data: Partial<{
    name: string
    role: AccessRole
    chainId: string | null
    tenantId: string | null
    password: string
    isActive: boolean
  }>
) {
  const res = await fetch(`${API_BASE_URL}/api/access/users/${id}`, {
    method: 'PATCH',
    headers: authHeaders(token),
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Benutzer konnte nicht aktualisiert werden')
  }

  return res.json()
}

export async function deleteAccessUser(token: string, id: string): Promise<void> {
  const res = await fetch(`${API_BASE_URL}/api/access/users/${id}`, {
    method: 'DELETE',
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Benutzer konnte nicht geloescht werden')
  }
}

export async function getPermissionMatrix(token: string) {
  const res = await fetch(`${API_BASE_URL}/api/auth/permissions/matrix`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Rollenrechte konnten nicht geladen werden')
  }

  return res.json() as Promise<Array<{ role: AccessRole; permission: AccessPermission }>>
}

export async function getDatabaseManagementOverview(
  token: string
): Promise<DatabaseManagementOverview> {
  const res = await fetch(`${API_BASE_URL}/api/database-management/overview`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Datenbank-Uebersicht konnte nicht geladen werden')
  }

  return res.json()
}

export async function getDatabaseManagementAdminOverview(
  token: string
): Promise<DatabaseManagementAdminOverview> {
  const res = await fetch(`${API_BASE_URL}/api/database-management/admin-overview`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Admin-Uebersicht konnte nicht geladen werden')
  }

  return res.json()
}

export async function createEmptyManagedDatabase(
  token: string,
  data: {
    label?: string
    databaseName?: string
    assignType: DatabaseAssignmentType
    chainId?: string
    tenantId?: string
    templateDatabase?: string
  }
) {
  const res = await fetch(`${API_BASE_URL}/api/database-management/create-empty`, {
    method: 'POST',
    headers: authHeaders(token),
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Leere Datenbank konnte nicht erstellt werden')
  }

  return res.json() as Promise<{
    ok: boolean
    assignType: DatabaseAssignmentType
    database: {
      databaseName: string
      databaseUrl: string
      created: boolean
    }
  }>
}

export async function assignManagedDatabase(
  token: string,
  data: {
    databaseName: string
    assignType: Exclude<DatabaseAssignmentType, 'UNASSIGNED'>
    chainId?: string
    tenantId?: string
  }
) {
  const res = await fetch(`${API_BASE_URL}/api/database-management/assign`, {
    method: 'POST',
    headers: authHeaders(token),
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Datenbank konnte nicht zugewiesen werden')
  }

  return res.json() as Promise<{
    ok: boolean
    assignType: Exclude<DatabaseAssignmentType, 'UNASSIGNED'>
    database: {
      databaseName: string
      databaseUrl: string
    }
  }>
}

export async function deleteManagedDatabase(
  token: string,
  databaseName: string
): Promise<{
  ok: boolean
  databaseName: string
  removedAssignments: {
    removedChains: number
    removedTenants: number
    removedUnassigned: number
  }
}> {
  const res = await fetch(
    `${API_BASE_URL}/api/database-management/${encodeURIComponent(databaseName)}`,
    {
      method: 'DELETE',
      headers: authHeaders(token),
    }
  )

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Datenbank konnte nicht geloescht werden')
  }

  return res.json()
}

export async function getAccessUserPermissions(
  token: string,
  userId: string
): Promise<AccessUserPermissionsResponse> {
  const res = await fetch(`${API_BASE_URL}/api/access/users/${userId}/permissions`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Benutzerrechte konnten nicht geladen werden')
  }

  return res.json()
}

export async function updateAccessUserPermissions(
  token: string,
  userId: string,
  permissions: AccessPermission[]
): Promise<AccessUserPermissionsResponse> {
  const res = await fetch(`${API_BASE_URL}/api/access/users/${userId}/permissions`, {
    method: 'PUT',
    headers: authHeaders(token),
    body: JSON.stringify({ permissions }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Benutzerrechte konnten nicht gespeichert werden')
  }

  return res.json()
}

export async function getAuditLogs(token: string, limit = 100): Promise<AuditLogEntry[]> {
  const res = await fetch(`${API_BASE_URL}/api/access/audit?limit=${limit}`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Audit-Logs konnten nicht geladen werden')
  }

  return res.json()
}

export async function getSuperadminSalesDashboard(
  token: string,
  days = 30
): Promise<SuperadminSalesDashboard> {
  const res = await fetch(`${API_BASE_URL}/api/orders/dashboard/superadmin?days=${days}`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Superadmin-Umsatzdaten konnten nicht geladen werden')
  }

  return res.json()
}

export async function getSuperadminOrderRatingsDashboard(
  token: string,
  days = 180
): Promise<SuperadminOrderRatingsDashboard> {
  const res = await fetch(`${API_BASE_URL}/api/orders/ratings/superadmin?days=${days}`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Superadmin-Bewertungen konnten nicht geladen werden')
  }

  return res.json()
}

export async function getChainadminDashboard(
  token: string,
  days = 30,
  chainId?: string
): Promise<ChainadminDashboard> {
  const query = new URLSearchParams({
    days: String(days),
  })
  if (chainId) {
    query.set('chainId', chainId)
  }

  const res = await fetch(`${API_BASE_URL}/api/chainadmin/dashboard?${query.toString()}`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Kettenadmin-Dashboard konnte nicht geladen werden')
  }

  return res.json()
}

export async function getChainadminAccessRights(
  token: string,
  chainAdminUserId?: string
): Promise<ChainadminAccessRightsResponse> {
  const query = new URLSearchParams()
  if (chainAdminUserId) {
    query.set('chainAdminUserId', chainAdminUserId)
  }

  const suffix = query.toString().length > 0 ? `?${query.toString()}` : ''
  const res = await fetch(`${API_BASE_URL}/api/chainadmin/access-rights${suffix}`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Filialrechte konnten nicht geladen werden')
  }

  return res.json()
}

export async function updateChainadminAccessRight(
  token: string,
  data: {
    chainAdminUserId?: string
    tenantId: string
    superadminGranted?: boolean
    canViewRevenue?: boolean
    canManageAppOrders?: boolean
    canManageDelivery?: boolean
    canManagePickup?: boolean
    canViewPurchasing?: boolean
    canViewStaffPlanning?: boolean
    canOverrideSettings?: boolean
    notes?: string | null
  }
) {
  const res = await fetch(`${API_BASE_URL}/api/chainadmin/access-rights`, {
    method: 'PUT',
    headers: authHeaders(token),
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Filialrechte konnten nicht gespeichert werden')
  }

  return res.json()
}

export async function getChainadminCashClosingQueue(
  token: string,
  params: {
    month: string
    chainId?: string
    tenantId?: string
  }
): Promise<ChainadminCashClosingQueue> {
  const query = new URLSearchParams({
    month: params.month,
  })
  if (params.chainId) {
    query.set('chainId', params.chainId)
  }
  if (params.tenantId) {
    query.set('tenantId', params.tenantId)
  }

  const res = await fetch(`${API_BASE_URL}/api/cash-closings/chainadmin/queue?${query.toString()}`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Abschluss-Queue konnte nicht geladen werden')
  }

  return res.json()
}

export async function reviewChainadminDailyClosing(
  token: string,
  data: {
    submissionId: string
    decision: 'APPROVED' | 'RETURNED'
    note?: string | null
  }
): Promise<{
  ok: boolean
  reviewId: string
  submissionId: string
  decision: 'APPROVED' | 'RETURNED'
}> {
  const res = await fetch(`${API_BASE_URL}/api/cash-closings/chainadmin/review/daily`, {
    method: 'POST',
    headers: authHeaders(token),
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Tagesabschluss konnte nicht bewertet werden')
  }

  return res.json()
}

export async function reviewChainadminReopenRequest(
  token: string,
  data: {
    requestId: string
    decision: 'APPROVED' | 'REJECTED'
    note?: string | null
  }
): Promise<{
  ok: boolean
  reviewId: string
  requestId: string
  submissionId: string
  decision: 'APPROVED' | 'REJECTED'
}> {
  const res = await fetch(`${API_BASE_URL}/api/cash-closings/chainadmin/review/reopen`, {
    method: 'POST',
    headers: authHeaders(token),
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Wiedereroeffnung konnte nicht bewertet werden')
  }

  return res.json()
}

export async function reviewChainadminMonthlyClosing(
  token: string,
  data: {
    submissionId: string
    decision: 'APPROVED' | 'RETURNED'
    note?: string | null
  }
): Promise<{
  ok: boolean
  reviewId: string
  submissionId: string
  decision: 'APPROVED' | 'RETURNED'
}> {
  const res = await fetch(`${API_BASE_URL}/api/cash-closings/chainadmin/review/monthly`, {
    method: 'POST',
    headers: authHeaders(token),
    body: JSON.stringify(data),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Monatsabschluss konnte nicht bewertet werden')
  }

  return res.json()
}

export type CmsPageStatus = 'DRAFT' | 'PUBLISHED' | 'ARCHIVED'

export type CmsBlockType =
  | 'Hero'
  | 'FeatureGrid'
  | 'TextImage'
  | 'FAQ'
  | 'CTA'
  | 'PromotionSlider'
  | 'LegalNoticeBlock'

export type CmsBlock = {
  type: CmsBlockType
  data: Record<string, unknown>
}

export type CmsPage = {
  id: string
  key: string
  slug: string
  title: string
  status: CmsPageStatus
  seoTitle: string | null
  seoDescription: string | null
  ogImageUrl: string | null
  contentJson: CmsBlock[]
  publishedAt: string | null
  createdAt: string
  updatedAt: string
}

export type CmsRevision = {
  id: string
  pageId: string
  version: number
  contentJson: CmsBlock[]
  seoTitle: string | null
  seoDescription: string | null
  createdByUserId: string | null
  createdByUser?: { id: string; name: string; email: string } | null
  createdAt: string
}

export async function getCmsPages(token: string): Promise<CmsPage[]> {
  return apiJson<CmsPage[]>('/api/cms/pages', {
    headers: authHeaders(token),
  }, 'CMS-Seiten konnten nicht geladen werden')
}

export async function getCmsPageById(token: string, id: string): Promise<CmsPage> {
  return apiJson<CmsPage>(`/api/cms/pages/${id}`, {
    headers: authHeaders(token),
  }, 'CMS-Seite konnte nicht geladen werden')
}

export async function createCmsPage(
  token: string,
  payload: Partial<CmsPage> & { key: string; slug: string; title: string }
): Promise<CmsPage> {
  return apiJson<CmsPage>('/api/cms/pages', {
    method: 'POST',
    headers: authHeaders(token),
    body: JSON.stringify(payload),
  }, 'CMS-Seite konnte nicht erstellt werden')
}

export async function updateCmsPage(
  token: string,
  id: string,
  payload: Partial<CmsPage>
): Promise<CmsPage> {
  return apiJson<CmsPage>(`/api/cms/pages/${id}`, {
    method: 'PATCH',
    headers: authHeaders(token),
    body: JSON.stringify(payload),
  }, 'CMS-Seite konnte nicht aktualisiert werden')
}

export async function publishCmsPage(token: string, id: string): Promise<CmsPage> {
  return apiJson<CmsPage>(`/api/cms/pages/${id}/publish`, {
    method: 'POST',
    headers: authHeaders(token),
  }, 'CMS-Seite konnte nicht veröffentlicht werden')
}

export async function getCmsRevisions(token: string, id: string): Promise<CmsRevision[]> {
  return apiJson<CmsRevision[]>(`/api/cms/pages/${id}/revisions`, {
    headers: authHeaders(token),
  }, 'CMS-Versionen konnten nicht geladen werden')
}

export async function getPublicCmsPage(slug: string): Promise<CmsPage | null> {
  const normalizedSlug = slug.replace(/^\/+/, '').trim()
  if (!normalizedSlug) return null

  try {
    return await apiJson<CmsPage>(`/api/cms/public/${encodeURIComponent(normalizedSlug)}`)
  } catch {
    return null
  }
}

export type BillingProfileOverviewRow = {
  tenantId: string
  tenantName: string
  chainId: string | null
  plan: TenantBillingPlanSettings | null
  profile: BillingProfileData | null
  latestSepaMandate: {
    id: string
    mandateReference: string
    status: string
    signedAt: string | null
    ibanLast4: string
    bic: string | null
  } | null
}

export async function getBillingProfiles(
  token: string,
  params: { tenantId?: string; chainId?: string } = {}
): Promise<{ rows: BillingProfileOverviewRow[] }> {
  const query = new URLSearchParams()
  if (params.tenantId) query.set('tenantId', params.tenantId)
  if (params.chainId) query.set('chainId', params.chainId)
  const suffix = query.toString() ? `?${query.toString()}` : ''
  return apiJson<{ rows: BillingProfileOverviewRow[] }>(
    buildApiUrl(`/api/billing/profiles${suffix}`),
    { headers: authHeaders(token) },
    'Abrechnungsprofile konnten nicht geladen werden'
  )
}

export type BillingPaymentCollectionRow = {
  id: string
  tenantId: string | null
  chainId: string | null
  invoiceId: string | null
  sepaMandateId: string | null
  status: string
  amountCents: number
  currency: string
  dueAt: string | null
  collectedAt: string | null
  failedAt: string | null
  failureReason: string | null
  metadata: Record<string, unknown> | null
  createdAt: string
  updatedAt: string
  tenant?: { id: string; name: string } | null
  invoice?: { id: string; invoiceNumber: string; dueAt: string | null; totalGrossCents: number } | null
  sepaMandate?: { id: string; mandateReference: string; status: string } | null
}

export async function getBillingPayments(
  token: string,
  params: { tenantId?: string; chainId?: string; status?: string } = {}
): Promise<{ rows: BillingPaymentCollectionRow[] }> {
  const query = new URLSearchParams()
  if (params.tenantId) query.set('tenantId', params.tenantId)
  if (params.chainId) query.set('chainId', params.chainId)
  if (params.status) query.set('status', params.status)
  const suffix = query.toString() ? `?${query.toString()}` : ''
  return apiJson<{ rows: BillingPaymentCollectionRow[] }>(
    buildApiUrl(`/api/billing/payments${suffix}`),
    { headers: authHeaders(token) },
    'Zahlungen konnten nicht geladen werden'
  )
}

export type BillingChargebackRow = {
  id: string
  tenantId: string | null
  tenantName: string | null
  invoiceId: string | null
  invoiceNumber: string | null
  amountCents: number
  dueAt: string | null
  failedAt: string | null
  failureReason: string
  providerReference: unknown
  returnFeeCents: number
  retryEligible: boolean
  reminderRequired: boolean
}

export async function getBillingChargebacks(
  token: string,
  params: { tenantId?: string; chainId?: string } = {}
): Promise<{ rows: BillingChargebackRow[] }> {
  const query = new URLSearchParams()
  if (params.tenantId) query.set('tenantId', params.tenantId)
  if (params.chainId) query.set('chainId', params.chainId)
  const suffix = query.toString() ? `?${query.toString()}` : ''
  return apiJson<{ rows: BillingChargebackRow[] }>(
    buildApiUrl(`/api/billing/chargebacks${suffix}`),
    { headers: authHeaders(token) },
    'Rücklastschriften konnten nicht geladen werden'
  )
}

export async function getPlatformBillingSettings(token: string): Promise<{ profile: PlatformBillingSettings }> {
  return apiJson<{ profile: PlatformBillingSettings }>(
    buildApiUrl('/api/billing/settings/platform'),
    { headers: authHeaders(token) },
    'Zentrale Abrechnungsdaten konnten nicht geladen werden'
  )
}

export async function updatePlatformBillingSettings(
  token: string,
  payload: Partial<PlatformBillingSettings>
): Promise<{ ok: boolean; profile: PlatformBillingSettings }> {
  return apiJson<{ ok: boolean; profile: PlatformBillingSettings }>(
    buildApiUrl('/api/billing/settings/platform'),
    {
      method: 'PUT',
      headers: authHeaders(token),
      body: JSON.stringify(payload),
    },
    'Zentrale Abrechnungsdaten konnten nicht gespeichert werden'
  )
}

export async function deleteDisplayDevice(
  token: string,
  deviceId: string,
  tenantId: string
): Promise<{ ok: boolean; message?: string }> {
  const res = await fetch(`${API_BASE_URL}/api/admin/displays/${encodeURIComponent(deviceId)}`, {
    method: 'DELETE',
    headers: authHeaders(token),
    body: JSON.stringify({ tenantId }),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.message || errorData?.error || 'Display konnte nicht gelöscht werden')
  }

  return res.json()
}

export type AdminDisplayScreen = {
  id: string
  tenantId: string
  name: string
  orientation: 'LANDSCAPE' | 'PORTRAIT'
  resolutionPreset: 'HD' | 'FULL_HD' | 'FOUR_K' | 'CUSTOM'
  backgroundColor: string
  accentColor: string
  layoutType: 'MENU_BOARD' | 'SLIDESHOW' | 'PROMO_SPLIT' | 'ORDER_STATUS'
  isActive: boolean
}

export type AdminDisplayPlaylist = {
  id: string
  tenantId: string
  screenId: string
  name: string
  isActive: boolean
  createdAt?: string
  updatedAt?: string
}

export async function getAdminDisplayScreens(
  token: string,
  tenantId: string
): Promise<AdminDisplayScreen[]> {
  const query = new URLSearchParams({ tenantId })
  const res = await fetch(`${API_BASE_URL}/api/admin/displays/screens?${query.toString()}`, {
    headers: authHeaders(token),
  })
  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.message || errorData?.error || 'Bildschirme konnten nicht geladen werden')
  }
  const data = (await res.json()) as { screens: AdminDisplayScreen[] }
  return data.screens
}

export async function updateAdminDisplayScreen(
  token: string,
  screenId: string,
  data: Partial<
    Pick<
      AdminDisplayScreen,
      'name' | 'orientation' | 'resolutionPreset' | 'backgroundColor' | 'accentColor' | 'layoutType' | 'isActive'
    > & { tenantId: string }
  >
): Promise<AdminDisplayScreen> {
  const res = await fetch(`${API_BASE_URL}/api/admin/displays/screens/${encodeURIComponent(screenId)}`, {
    method: 'PUT',
    headers: authHeaders(token),
    body: JSON.stringify(data),
  })
  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.message || errorData?.error || 'Bildschirm konnte nicht gespeichert werden')
  }
  const payload = (await res.json()) as { screen: AdminDisplayScreen }
  return payload.screen
}

export async function getAdminDisplayPlaylists(
  token: string,
  tenantId: string
): Promise<AdminDisplayPlaylist[]> {
  const query = new URLSearchParams({ tenantId })
  const res = await fetch(`${API_BASE_URL}/api/admin/displays/playlists?${query.toString()}`, {
    headers: authHeaders(token),
  })
  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.message || errorData?.error || 'Playlists konnten nicht geladen werden')
  }
  const payload = (await res.json()) as { playlists: AdminDisplayPlaylist[] }
  return payload.playlists
}

export async function createAdminDisplayPlaylist(
  token: string,
  data: {
    tenantId: string
    screenId: string
    name: string
    isActive?: boolean
  }
): Promise<AdminDisplayPlaylist> {
  const res = await fetch(`${API_BASE_URL}/api/admin/displays/playlists`, {
    method: 'POST',
    headers: authHeaders(token),
    body: JSON.stringify(data),
  })
  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.message || errorData?.error || 'Playlist konnte nicht erstellt werden')
  }
  const payload = (await res.json()) as { playlist: AdminDisplayPlaylist }
  return payload.playlist
}

export async function createAdminDisplayPlaylistItem(
  token: string,
  playlistId: string,
  data: {
    tenantId: string
    type: 'PRODUCT_GRID' | 'CATEGORY_MENU' | 'IMAGE' | 'VIDEO' | 'PROMOTION' | 'URL' | 'CUSTOM_TEXT'
    sortOrder: number
    durationSeconds: number
    config: Record<string, unknown>
  }
): Promise<{ id: string }> {
  const res = await fetch(
    `${API_BASE_URL}/api/admin/displays/playlists/${encodeURIComponent(playlistId)}/items`,
    {
      method: 'POST',
      headers: authHeaders(token),
      body: JSON.stringify(data),
    }
  )
  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.message || errorData?.error || 'Playlist-Element konnte nicht erstellt werden')
  }
  const payload = (await res.json()) as { item: { id: string } }
  return payload.item
}

export async function createAdminDisplayScreen(
  token: string,
  data: {
    tenantId: string
    name: string
    orientation?: 'LANDSCAPE' | 'PORTRAIT'
    resolutionPreset?: 'HD' | 'FULL_HD' | 'FOUR_K' | 'CUSTOM'
    layoutType?: 'MENU_BOARD' | 'SLIDESHOW' | 'PROMO_SPLIT' | 'ORDER_STATUS'
    backgroundColor?: string
    accentColor?: string
  }
): Promise<AdminDisplayScreen> {
  const res = await fetch(`${API_BASE_URL}/api/admin/displays/screens`, {
    method: 'POST',
    headers: authHeaders(token),
    body: JSON.stringify(data),
  })
  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.message || errorData?.error || 'Bildschirm konnte nicht erstellt werden')
  }
  const payload = (await res.json()) as { screen: AdminDisplayScreen }
  return payload.screen
}

export async function deactivateOrderDeskDeviceBinding(
  token: string,
  bindingId: string
): Promise<{ ok: boolean; alreadyInactive?: boolean }> {
  const res = await fetch(`${API_BASE_URL}/api/orderdesk-devices/bindings/${bindingId}/deactivate`, {
    method: 'PATCH',
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'OrderDesk-Gerät konnte nicht deaktiviert werden')
  }
  return res.json()
}

export async function deleteOrderDeskDeviceBinding(
  token: string,
  bindingId: string
): Promise<{ ok: boolean; softDeleted: boolean }> {
  const res = await fetch(`${API_BASE_URL}/api/orderdesk-devices/bindings/${bindingId}`, {
    method: 'DELETE',
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'OrderDesk-Gerät konnte nicht gelöscht werden')
  }
  return res.json()
}

export async function resetOrderDeskDevicePairing(
  token: string,
  bindingId: string
): Promise<{
  ok: boolean
  sessionId: string
  pairingToken: string
  pairingPayload: string
  expiresAt: string
  qrImageUrl: string
}> {
  const res = await fetch(`${API_BASE_URL}/api/orderdesk-devices/bindings/${bindingId}/reset-pairing`, {
    method: 'POST',
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'Pairing-Code konnte nicht neu erstellt werden')
  }
  return res.json()
}

export async function getOrderDeskDeviceBindingsForScope(
  token: string,
  params?: {
    includeInactive?: boolean
    tenantId?: string
  }
): Promise<{
  total: number
  bindings: OrderDeskDeviceBinding[]
  generatedAt: string
}> {
  const query = new URLSearchParams()
  if (params?.tenantId) query.set('tenantId', params.tenantId)
  if (typeof params?.includeInactive === 'boolean') {
    query.set('includeInactive', String(params.includeInactive))
  }
  const suffix = query.toString().length > 0 ? `?${query.toString()}` : ''
  const res = await fetch(`${API_BASE_URL}/api/orderdesk-devices/bindings${suffix}`, {
    headers: authHeaders(token),
  })

  if (!res.ok) {
    const errorData = await res.json().catch(() => null)
    throw new Error(errorData?.error || 'OrderDesk-Bindings konnten nicht geladen werden')
  }

  return res.json()
}

export type MenuImportAnalysisResult = {
  restaurantName: string | null
  sourceLanguage: 'de'
  categories: Array<{
    name: string
    sortOrder: number
    confidence: number
    products: Array<{
      name: string
      productNumber: string | null
      description: string | null
      price: number | null
      variants: Array<{
        name: string
        price: number | null
        confidence: number
      }>
      ingredients: string[]
      allergens: string[]
      additives: string[]
      notes: string | null
      confidence: number
    }>
  }>
  promotions: Array<{
    name: string
    description: string
    price: number | null
    weekday: string | null
    confidence: number
  }>
  warnings: string[]
  debugRawResponsePreview?: string
}

export type SuperadminMenuImportStatus = {
  model: string | null
  modelLabel: string
  apiConnected: boolean
  apiKeyPresent: boolean
}

export async function getSuperadminMenuImportStatus(token: string): Promise<SuperadminMenuImportStatus> {
  const response = await apiFetch('/api/superadmin/menu-import/status', {
    method: 'GET',
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
  })
  if (!response.ok) {
    const errorData = await response.json().catch(() => null)
    throw new Error(errorData?.error || 'Menü-Import-Status konnte nicht geladen werden')
  }
  return (await response.json()) as SuperadminMenuImportStatus
}

export async function analyzeSuperadminMenuImport(
  token: string,
  tenantId: string,
  files: File[]
): Promise<MenuImportAnalysisResult> {
  const formData = new FormData()
  formData.set('tenantId', tenantId)
  for (const file of files) {
    formData.append('files', file)
  }

  const response = await apiFetch('/api/superadmin/menu-import/analyze', {
    method: 'POST',
    headers: token ? { Authorization: `Bearer ${token}` } : undefined,
    body: formData,
    timeoutMs: 0,
  })

  if (!response.ok) {
    const errorData = await response.json().catch(() => null)
    throw new Error(errorData?.error || 'Speisekartenanalyse konnte nicht gestartet werden')
  }

  return (await response.json()) as MenuImportAnalysisResult
}

export async function importSuperadminMenuImport(
  token: string,
  payload: {
    tenantId: string
    analysisResult: MenuImportAnalysisResult
    importOptions?: {
      useMenuNumbersAsSku?: boolean
    }
  }
): Promise<{
  ok: boolean
  importedProducts: number
  importedCategories: number
  importedVariants: number
  createdIngredients: number
  reusedIngredients: number
  ingredientLinksCreated: number
  productsWithoutIngredients: number
  productsWithWarnings: number
  skuConflicts: number
  recognizedSkuCount: number
  finalSkuCount: number
  avgConfidence: number | null
  message: string
}> {
  const response = await apiFetch('/api/superadmin/menu-import/import', {
    method: 'POST',
    headers: token ? { Authorization: `Bearer ${token}`, 'Content-Type': 'application/json' } : undefined,
    body: JSON.stringify(payload),
  })

  if (!response.ok) {
    const errorData = await response.json().catch(() => null)
    throw new Error(errorData?.error || 'Import konnte nicht gestartet werden')
  }

  return (await response.json()) as {
    ok: boolean
    importedProducts: number
    importedCategories: number
    importedVariants: number
    createdIngredients: number
    reusedIngredients: number
    ingredientLinksCreated: number
    productsWithoutIngredients: number
    productsWithWarnings: number
    skuConflicts: number
    recognizedSkuCount: number
    finalSkuCount: number
    avgConfidence: number | null
    message: string
  }
}
