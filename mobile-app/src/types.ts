export type DiscoveryMode = 'all' | 'delivery' | 'pickup'

export type CustomerAppListingDisplaySettings = {
  showLogo: boolean
  showChainName: boolean
  showAddress: boolean
  showAvailabilityBadges: boolean
  showMinOrderValue: boolean
  showDeliveryFeeNote: boolean
  showDistance: boolean
}

export type CustomerAppSubMenuItem = {
  id: string
  label: string
  route: string
  enabled: boolean
  sortOrder: number
}

export type CustomerAppMenuItem = {
  id: string
  label: string
  route: string
  enabled: boolean
  sortOrder: number
  children: CustomerAppSubMenuItem[]
}

export type CustomerAppNavigationSettings = {
  bottomTabs: CustomerAppMenuItem[]
}

export type CustomerAppSettings = {
  listingEnabled: boolean
  orderingEnabled: boolean
  guestRegistrationEnabled: boolean
  guestCheckoutEnabled: boolean
  listingDisplay: CustomerAppListingDisplaySettings
  navigation: CustomerAppNavigationSettings
}

export type DiscoveryTenant = {
  tenantId: string
  tenantName: string
  slug?: string | null
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
  customerApp: CustomerAppSettings
  services: {
    delivery: {
      available: boolean
      strategy: string
      matchedByZip: boolean
      matchedByRadius: boolean
      matchedByPolygon: boolean
      distanceKm: number | null
    }
    pickup: {
      available: boolean
      strategy: string
      matchedByZip: boolean
      matchedByRadius: boolean
      matchedByPolygon: boolean
      distanceKm: number | null
    }
  }
}

export type DiscoveryResponse = {
  query: {
    zipCode: string
    street: string | null
    mode: DiscoveryMode
    latitude: number | null
    longitude: number | null
  }
  total: number
  tenants: DiscoveryTenant[]
}

export type CatalogCategory = {
  id: string
  name: string
  sortOrder: number
  imageUrl: string | null
}

export type ProductBadgeKey =
  | 'VEGAN'
  | 'VEGETARIAN'
  | 'HALAL'
  | 'GLUTEN_FREE'
  | 'LACTOSE_FREE'
  | 'SPICY'
  | 'VERY_SPICY'
  | 'NEW'
  | 'POPULAR'
  | 'BESTSELLER'
  | 'RECOMMENDED'
  | 'LIMITED'
  | 'CAFFEINE'
  | 'ALCOHOL'
  | 'AGE_16'
  | 'AGE_18'
  | 'ORGANIC'
  | 'REGIONAL'

export type CatalogProduct = {
  id: string
  tenantId: string
  categoryId: string | null
  categoryName: string | null
  productNumber: string
  name: string
  imageUrl: string | null
  beverageContainerType?: 'NONE' | 'EINWEG' | 'MEHRWEG' | null
  price: string
  depositAmount?: string | null
  vatRate: string
  available: boolean
  badges: string[]
  allergens: string[]
  ingredients: Array<{
    id: string
    name: string
    allergens: string[]
  }>
  modifiers: Array<{
    id: string
    name: string
    kind?: 'OPTION' | 'SIZE'
    ingredientId: string | null
    ingredientName: string | null
    priceDelta: string
    isDefaultSelected: boolean
    sortOrder: number
  }>
}

export type TenantCatalogResponse = {
  tenant: {
    id: string
    name: string
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
  }
  customerApp: CustomerAppSettings
  orderIntake: {
    enabled: boolean
    paused: boolean
    reason: string | null
    pausedUntil: string | null
    customerMessage: string | null
    services: {
      delivery: boolean
      pickup: boolean
      tableOrdering: boolean
      deliveryEnabledNow: boolean
      pickupEnabledNow: boolean
      tableOrderingEnabledNow: boolean
    }
  }
  availability: {
    isOpenNow: boolean
    delivery: {
      isOpen: boolean
      canOrderNow: boolean
      canPreorder: boolean
      nextAvailableTime: string | null
      message: string
    }
    pickup: {
      isOpen: boolean
      canOrderNow: boolean
      canPreorder: boolean
      nextAvailableTime: string | null
      message: string
    }
  }
  categories: CatalogCategory[]
  products: CatalogProduct[]
  generatedAt: string
}

export type CheckoutPaymentMethod = 'CASH' | 'CARD'

export type CheckoutOrderItemInput = {
  productId: string
  quantity: number
  modifierIds: string[]
}

export type CheckoutCreateOrderRequest = {
  tenantId: string
  items: CheckoutOrderItemInput[]
  paymentMethod: CheckoutPaymentMethod
  sourceChannel?: 'APP'
  markPaid?: boolean
  forwardToKitchen?: boolean
}

export type CheckoutCreateOrderResponse = {
  id: string
  tenantId: string
  pickupNumber: number | null
  total: string
  status: string
  paymentStatus: string
  paymentMethod: string | null
  sourceChannel: string
  createdAt: string
}

export type AppCustomerUser = {
  id: string
  email: string
  fullName: string
  phone: string | null
  street: string | null
  zipCode: string | null
  city: string | null
  marketingOptIn: boolean
  deletionRequestedAt: string | null
}

export type AppAuthResponse = {
  token: string
  user: AppCustomerUser
}

export type AppAuthMeResponse = {
  user: AppCustomerUser
}

export type AppDeletionRequestResponse = {
  ok: boolean
  deletionRequestedAt: string | null
}

export type CatalogRequestDiagnostics = {
  tenantId: string | null
  tenantSlug: string | null
  catalogUrl: string | null
  catalogStatus: number | null
  catalogError: string | null
  responsePreview: string | null
}
