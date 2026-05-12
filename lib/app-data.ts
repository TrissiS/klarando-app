export type Role = "superadmin" | "mandant" | "chainadmin" | "admin" | "staff";

export type SessionUser = {
  role: Role;
  email: string;
  name: string;
  userId?: string;
  backendRole?: "SUPERADMIN" | "CHAINADMIN" | "ADMIN" | "STAFF" | "DRIVER";
  chainId?: string | null;
  tenantId?: string | null;
  activeTenantId?: string | null;
  activeTenantName?: string | null;
  accessToken?: string;
  permissions?: string[];
};

export type Category = {
  id: number;
  name: string;
};

export type IngredientUnit =
  | "kg"
  | "g"
  | "l"
  | "ml"
  | "Stück"
  | "Dose"
  | "Flasche"
  | "Becher";

export type Ingredient = {
  id: number;
  name: string;
  purchaseUnit: IngredientUnit;
  purchasePrice: number;
  deposit: number;
  allergens: string;
  supplierName: string;
  supplierArticleNumber: string;
};

export type ProductIngredient = {
  ingredientId: number;
  amount: number;
  unit: IngredientUnit;
};

export type Product = {
  id: number;
  productNumber: string;
  name: string;
  price: number;
  categoryId: number;
  vat: number;
  active: boolean;
  ingredients: ProductIngredient[];
};

export type EndCustomer = {
  id: number;
  name: string;
  phone: string;
  email: string;
};

export type AllergenDefinition = {
  code: string;
  label: string;
};

export type Screen = {
  id: number;
  name: string;
  logoUrl: string;
  backgroundImageUrl: string;
  backgroundVideoUrl: string;
  backgroundMode: "image" | "video";
  categoryIds: number[];
  orientation: "landscape" | "portrait";
  width: number;
  height: number;
  resolution: string;
  textColor: string;
  fontFamily: string;
  fontSize: number;
  columnCount: number;
  showProductNumber: boolean;
  showProductName: boolean;
  showPrice: boolean;
  showAllergens: boolean;
  showIngredients: boolean;
  showCategoryTitle: boolean;
  allergenLegendPosition:
    | "hidden"
    | "bottom-right"
    | "bottom-center"
    | "bottom-left"
    | "top-right"
    | "top-center"
    | "top-left";
};

export type PackagePlan = {
  id: number;
  name: string;
  monthlyPrice: number;
  maxScreens: number;
  hasOrdering: boolean;
  hasCalculation: boolean;
  hasSuppliers: boolean;
  hasTabletMode: boolean;
};

export type Tenant = {
  id: number;
  customerNumber: string;
  companyName: string;
  contactName: string;
  email: string;
  loginEmail: string;
  platformEmail: string;
  phone: string;
  city: string;
  packageId: number;
  monthlyPrice: number;
  setupFee: number;
  status: "aktiv" | "testphase" | "pausiert" | "gekündigt";
  sepaAccountHolder: string;
  sepaIban: string;
  sepaFileName: string;
  notes: string;
};

export const defaultAllergenDefinitions: AllergenDefinition[] = [
  { code: "A", label: "Glutenhaltiges Getreide" },
  { code: "B", label: "Krebstiere" },
  { code: "C", label: "Ei" },
  { code: "D", label: "Fisch" },
  { code: "E", label: "Erdnüsse" },
  { code: "F", label: "Soja" },
  { code: "G", label: "Milch" },
  { code: "H", label: "Schalenfrüchte" },
  { code: "I", label: "Sellerie" },
  { code: "J", label: "Senf" },
  { code: "K", label: "Sesam" },
  { code: "L", label: "Schwefeldioxid / Sulfite" },
  { code: "M", label: "Lupinen" },
  { code: "N", label: "Weichtiere" },
  { code: "1", label: "Konservierungsstoff" },
  { code: "2", label: "Farbstoff" },
  { code: "3", label: "Antioxidationsmittel" },
  { code: "4", label: "Geschmacksverstärker" },
  { code: "5", label: "geschwefelt" },
  { code: "6", label: "geschwärzt" },
  { code: "7", label: "gewachst" },
  { code: "8", label: "mit Phosphat" },
];

export const defaultCategories: Category[] = [
  { id: 1, name: "Döner" },
  { id: 2, name: "Dürüm" },
  { id: 3, name: "Tellergerichte" },
  { id: 4, name: "Beilagen" },
  { id: 5, name: "Getränke" },
  { id: 6, name: "Menüs" },
];

export const defaultIngredients: Ingredient[] = [
  {
    id: 101,
    name: "Dönerbrot",
    purchaseUnit: "Stück",
    purchasePrice: 0.45,
    deposit: 0,
    allergens: "A",
    supplierName: "Standard Großhandel",
    supplierArticleNumber: "BR-1001",
  },
  {
    id: 102,
    name: "Dürüm-Fladen",
    purchaseUnit: "Stück",
    purchasePrice: 0.55,
    deposit: 0,
    allergens: "A",
    supplierName: "Standard Großhandel",
    supplierArticleNumber: "DF-1002",
  },
  {
    id: 103,
    name: "Kalbfleisch",
    purchaseUnit: "kg",
    purchasePrice: 12.0,
    deposit: 0,
    allergens: "",
    supplierName: "Fleischhandel Nord",
    supplierArticleNumber: "FL-2001",
  },
  {
    id: 104,
    name: "Hähnchenfleisch",
    purchaseUnit: "kg",
    purchasePrice: 9.8,
    deposit: 0,
    allergens: "",
    supplierName: "Fleischhandel Nord",
    supplierArticleNumber: "FL-2002",
  },
  {
    id: 105,
    name: "Salat",
    purchaseUnit: "kg",
    purchasePrice: 2.0,
    deposit: 0,
    allergens: "",
    supplierName: "Gemüse Fresh",
    supplierArticleNumber: "GM-3001",
  },
  {
    id: 106,
    name: "Rotkohl",
    purchaseUnit: "kg",
    purchasePrice: 2.2,
    deposit: 0,
    allergens: "",
    supplierName: "Gemüse Fresh",
    supplierArticleNumber: "GM-3002",
  },
  {
    id: 107,
    name: "Tomaten",
    purchaseUnit: "kg",
    purchasePrice: 2.7,
    deposit: 0,
    allergens: "",
    supplierName: "Gemüse Fresh",
    supplierArticleNumber: "GM-3003",
  },
  {
    id: 108,
    name: "Zwiebeln",
    purchaseUnit: "kg",
    purchasePrice: 1.6,
    deposit: 0,
    allergens: "",
    supplierName: "Gemüse Fresh",
    supplierArticleNumber: "GM-3004",
  },
  {
    id: 109,
    name: "Joghurtsoße",
    purchaseUnit: "kg",
    purchasePrice: 3.8,
    deposit: 0,
    allergens: "G",
    supplierName: "Saucen Partner",
    supplierArticleNumber: "SC-4001",
  },
  {
    id: 110,
    name: "Knoblauchsoße",
    purchaseUnit: "kg",
    purchasePrice: 4.0,
    deposit: 0,
    allergens: "C,G,J",
    supplierName: "Saucen Partner",
    supplierArticleNumber: "SC-4002",
  },
  {
    id: 111,
    name: "Scharfe Soße",
    purchaseUnit: "kg",
    purchasePrice: 3.4,
    deposit: 0,
    allergens: "J",
    supplierName: "Saucen Partner",
    supplierArticleNumber: "SC-4003",
  },
  {
    id: 112,
    name: "Pommes",
    purchaseUnit: "kg",
    purchasePrice: 2.5,
    deposit: 0,
    allergens: "",
    supplierName: "TK Food",
    supplierArticleNumber: "TK-5001",
  },
  {
    id: 113,
    name: "Cola Dose 0,33",
    purchaseUnit: "Dose",
    purchasePrice: 0.55,
    deposit: 0.25,
    allergens: "1,2",
    supplierName: "Getränke Express",
    supplierArticleNumber: "GE-6001",
  },
  {
    id: 114,
    name: "Ayran",
    purchaseUnit: "Becher",
    purchasePrice: 0.42,
    deposit: 0,
    allergens: "G",
    supplierName: "Molkerei Partner",
    supplierArticleNumber: "ML-7001",
  },
];

export const defaultProducts: Product[] = [
  {
    id: 1001,
    productNumber: "1001",
    name: "Döner",
    price: 7.0,
    categoryId: 1,
    vat: 19,
    active: true,
    ingredients: [
      { ingredientId: 101, amount: 1, unit: "Stück" },
      { ingredientId: 103, amount: 180, unit: "g" },
      { ingredientId: 105, amount: 50, unit: "g" },
      { ingredientId: 106, amount: 30, unit: "g" },
      { ingredientId: 108, amount: 20, unit: "g" },
      { ingredientId: 109, amount: 30, unit: "g" },
    ],
  },
  {
    id: 1002,
    productNumber: "1002",
    name: "Dürüm",
    price: 8.5,
    categoryId: 2,
    vat: 19,
    active: true,
    ingredients: [
      { ingredientId: 102, amount: 1, unit: "Stück" },
      { ingredientId: 103, amount: 180, unit: "g" },
      { ingredientId: 105, amount: 50, unit: "g" },
      { ingredientId: 106, amount: 30, unit: "g" },
      { ingredientId: 110, amount: 30, unit: "g" },
    ],
  },
  {
    id: 1003,
    productNumber: "1003",
    name: "Döner Teller",
    price: 11.5,
    categoryId: 3,
    vat: 19,
    active: true,
    ingredients: [
      { ingredientId: 103, amount: 220, unit: "g" },
      { ingredientId: 105, amount: 70, unit: "g" },
      { ingredientId: 106, amount: 40, unit: "g" },
      { ingredientId: 109, amount: 40, unit: "g" },
      { ingredientId: 112, amount: 180, unit: "g" },
    ],
  },
  {
    id: 1004,
    productNumber: "1004",
    name: "Pommes",
    price: 3.5,
    categoryId: 4,
    vat: 19,
    active: true,
    ingredients: [{ ingredientId: 112, amount: 200, unit: "g" }],
  },
  {
    id: 1005,
    productNumber: "1005",
    name: "Cola 0,33",
    price: 2.5,
    categoryId: 5,
    vat: 19,
    active: true,
    ingredients: [{ ingredientId: 113, amount: 1, unit: "Dose" }],
  },
  {
    id: 1006,
    productNumber: "1006",
    name: "Ayran",
    price: 2.0,
    categoryId: 5,
    vat: 19,
    active: true,
    ingredients: [{ ingredientId: 114, amount: 1, unit: "Becher" }],
  },
];

export const defaultScreens: Screen[] = [
  {
    id: 1,
    name: "Hauptbildschirm",
    logoUrl: "",
    backgroundImageUrl: "",
    backgroundVideoUrl: "",
    backgroundMode: "image",
    categoryIds: [1, 2, 3, 4, 5],
    orientation: "landscape",
    width: 1920,
    height: 1080,
    resolution: "1920x1080",
    textColor: "#ffffff",
    fontFamily: "Arial",
    fontSize: 18,
    columnCount: 2,
    showProductNumber: false,
    showProductName: true,
    showPrice: true,
    showAllergens: true,
    showIngredients: false,
    showCategoryTitle: true,
    allergenLegendPosition: "bottom-right",
  },
];

export const defaultPlans: any[] = [
  {
    id: 1,
    name: "Basic",
    monthlyPrice: 49,
    maxScreens: 1,
    hasOrdering: false,
    hasCalculation: false,
    hasSuppliers: false,
    hasTabletMode: false,
  },
  {
    id: 2,
    name: "Business",
    monthlyPrice: 99,
    maxScreens: 3,
    hasOrdering: true,
    hasCalculation: true,
    hasSuppliers: false,
    hasTabletMode: true,
  },
  {
    id: 3,
    name: "Premium",
    monthlyPrice: 149,
    maxScreens: 10,
    hasOrdering: true,
    hasCalculation: true,
    hasSuppliers: true,
    hasTabletMode: true,
  },
];

export const defaultTenants: Tenant[] = [
  {
    id: 1,
    customerNumber: "K1001",
    companyName: "Demo Döner",
    contactName: "Max Mustermann",
    email: "info@demo-doener.de",
    loginEmail: "inhaber@demo-doener.de",
    platformEmail: "demo-doener@plattform.local",
    phone: "01701234567",
    city: "Berlin",
    packageId: 2,
    monthlyPrice: 99,
    setupFee: 199,
    status: "aktiv",
    sepaAccountHolder: "Demo Döner GmbH",
    sepaIban: "DE00123456781234567890",
    sepaFileName: "",
    notes: "Demo-Mandant",
  },
];
