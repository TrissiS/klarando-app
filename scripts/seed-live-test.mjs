const NODE_ENV = String(process.env.NODE_ENV || '').trim().toLowerCase();
if (NODE_ENV === "production") {
  console.error(
    "[SEED BLOCKIERT] seed-live-test darf in NODE_ENV=production nicht ausgefuehrt werden."
  );
  process.exit(1);
}

const API_BASE_URL = process.env.KLARANDO_API_BASE_URL || "http://127.0.0.1:4000";
const LOGIN_EMAIL = process.env.KLARANDO_LOGIN_EMAIL || "admin@plattform.local";
const LOGIN_PASSWORD = process.env.KLARANDO_LOGIN_PASSWORD || "admin123";

const NAMES = {
  category: "ZZ Live Test Kategorie",
  ingredient: "ZZ Live Test Zutat",
  product: "ZZ Live Test Produkt",
  display: "ZZ Live Test Display",
  terminal: "ZZ Live Test Terminal",
};

const PRODUCT_NUMBER = "ZZ-99001";
const INGREDIENT_ARTICLE_NUMBER = "ZZ-LIVE-001";

async function request(path, options = {}) {
  const response = await fetch(`${API_BASE_URL}${path}`, options);
  const text = await response.text();
  let data = null;

  try {
    data = text ? JSON.parse(text) : null;
  } catch {
    data = null;
  }

  if (!response.ok) {
    const message = data?.error || text || `${response.status} ${response.statusText}`;
    throw new Error(`${path}: ${message}`);
  }

  return data;
}

function authHeaders(token) {
  return {
    Authorization: `Bearer ${token}`,
    "Content-Type": "application/json",
  };
}

async function login() {
  const data = await request("/api/auth/login", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      email: LOGIN_EMAIL,
      password: LOGIN_PASSWORD,
    }),
  });

  return data.token;
}

async function resolveTenantId(token) {
  const context = await request("/api/access/context", {
    headers: { Authorization: `Bearer ${token}` },
  });
  const tenantId = context?.tenants?.[0]?.id || null;
  if (!tenantId) {
    throw new Error("Keine Filiale verfuegbar. Bitte zuerst eine Filiale anlegen.");
  }
  return tenantId;
}

async function ensureCategory(token, tenantId) {
  const categories = await request(`/api/categories?tenantId=${encodeURIComponent(tenantId)}`, {
    headers: { Authorization: `Bearer ${token}` },
  });
  const existing = categories.find((entry) => entry.name === NAMES.category);
  if (existing) {
    return existing;
  }

  return request("/api/categories", {
    method: "POST",
    headers: authHeaders(token),
    body: JSON.stringify({
      tenantId,
      name: NAMES.category,
      sortOrder: 990,
    }),
  });
}

async function ensureIngredient(token, tenantId) {
  const ingredients = await request(`/api/ingredients?tenantId=${encodeURIComponent(tenantId)}`, {
    headers: { Authorization: `Bearer ${token}` },
  });
  const existing = ingredients.find((entry) => entry.name === NAMES.ingredient);
  if (existing) {
    return existing;
  }

  return request("/api/ingredients", {
    method: "POST",
    headers: authHeaders(token),
    body: JSON.stringify({
      tenantId,
      name: NAMES.ingredient,
      unit: "g",
      purchasePrice: 1.49,
      deposit: 0,
      supplier: "Klarando Testlieferant",
      articleNumber: INGREDIENT_ARTICLE_NUMBER,
      allergens: "",
    }),
  });
}

async function ensureProduct(token, tenantId, categoryId) {
  const products = await request(`/api/products?tenantId=${encodeURIComponent(tenantId)}`, {
    headers: { Authorization: `Bearer ${token}` },
  });
  const existing =
    products.find((entry) => entry.name === NAMES.product) ||
    products.find((entry) => entry.productNumber === PRODUCT_NUMBER);
  if (existing) {
    return existing;
  }

  return request("/api/products", {
    method: "POST",
    headers: authHeaders(token),
    body: JSON.stringify({
      tenantId,
      categoryId,
      productNumber: PRODUCT_NUMBER,
      name: NAMES.product,
      price: 8.9,
      vatRate: 7,
      available: true,
      imageUrl: "/klarando_logo.png",
    }),
  });
}

async function ensureDisplay(token, tenantId) {
  const displays = await request(`/api/order-displays?tenantId=${encodeURIComponent(tenantId)}`, {
    headers: { Authorization: `Bearer ${token}` },
  });
  const existing = displays.find((entry) => entry.name === NAMES.display);
  if (existing) {
    return existing;
  }

  return request("/api/order-displays", {
    method: "POST",
    headers: authHeaders(token),
    body: JSON.stringify({
      tenantId,
      name: NAMES.display,
      displayRole: "KITCHEN",
      isActive: true,
    }),
  });
}

async function ensureTerminal(token, tenantId, displayId) {
  const terminals = await request(`/api/order-terminals?tenantId=${encodeURIComponent(tenantId)}`, {
    headers: { Authorization: `Bearer ${token}` },
  });
  const existing = terminals.find((entry) => entry.name === NAMES.terminal);
  if (!existing) {
    return request("/api/order-terminals", {
      method: "POST",
      headers: authHeaders(token),
      body: JSON.stringify({
        tenantId,
        name: NAMES.terminal,
        kitchenDisplayId: displayId,
        allowCashPayment: true,
        allowCardPayment: true,
        autoScaleLayout: true,
        isActive: true,
      }),
    });
  }

  if (existing.kitchenDisplayId !== displayId) {
    return request(`/api/order-terminals/${existing.id}`, {
      method: "PATCH",
      headers: authHeaders(token),
      body: JSON.stringify({
        tenantId,
        kitchenDisplayId: displayId,
      }),
    });
  }

  return existing;
}

async function main() {
  const token = await login();
  const tenantId = await resolveTenantId(token);
  const category = await ensureCategory(token, tenantId);
  await ensureIngredient(token, tenantId);
  await ensureProduct(token, tenantId, category.id);
  const display = await ensureDisplay(token, tenantId);
  await ensureTerminal(token, tenantId, display.id);

  console.log("Live-Testdaten bereit:");
  console.log(`- Tenant: ${tenantId}`);
  console.log(`- Kategorie: ${NAMES.category}`);
  console.log(`- Zutat: ${NAMES.ingredient}`);
  console.log(`- Produkt: ${NAMES.product}`);
  console.log(`- Display: ${NAMES.display}`);
  console.log(`- Terminal: ${NAMES.terminal}`);
}

main().catch((error) => {
  console.error("Seed fehlgeschlagen:", error.message || error);
  process.exit(1);
});
