"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FEATURE_PACKAGES = exports.FEATURE_MODULE_REGISTRY = void 0;
exports.resolveEffectiveFeatureSetForTenant = resolveEffectiveFeatureSetForTenant;
exports.moduleKeyFromString = moduleKeyFromString;
exports.normalizeModuleKeyList = normalizeModuleKeyList;
exports.calculateBillingUsageSnapshot = calculateBillingUsageSnapshot;
const client_1 = require("@prisma/client");
const prisma_1 = require("./prisma");
exports.FEATURE_MODULE_REGISTRY = [
    { key: client_1.FeatureModuleKey.ORDERS, name: 'Bestellungen', description: 'Bestellfluss, Annahme und Statuspflege', category: 'BESTELLUNG', defaultEnabled: true, adminNavPath: '/admin/orders', requiredPermissions: [client_1.PermissionKey.ORDERS_READ] },
    { key: client_1.FeatureModuleKey.PRODUCTS, name: 'Produkte', description: 'Produktverwaltung mit Preisen und Verfuegbarkeit', category: 'KATALOG', defaultEnabled: true, adminNavPath: '/admin/products', requiredPermissions: [client_1.PermissionKey.PRODUCTS_READ] },
    { key: client_1.FeatureModuleKey.CATEGORIES, name: 'Kategorien', description: 'Produktkategorien und Sortierung', category: 'KATALOG', defaultEnabled: true, adminNavPath: '/admin/categories', requiredPermissions: [client_1.PermissionKey.PRODUCTS_READ], dependencies: [client_1.FeatureModuleKey.PRODUCTS] },
    { key: client_1.FeatureModuleKey.INGREDIENTS, name: 'Zutaten', description: 'Zutatenverwaltung und Grunddaten', category: 'KATALOG', defaultEnabled: true, adminNavPath: '/admin/ingredients', requiredPermissions: [client_1.PermissionKey.PRODUCTS_READ], dependencies: [client_1.FeatureModuleKey.PRODUCTS] },
    { key: client_1.FeatureModuleKey.ALLERGENS, name: 'Allergene', description: 'Allergen- und Kennzeichnungsdaten', category: 'KATALOG', defaultEnabled: true, adminNavPath: '/admin/ingredients', requiredPermissions: [client_1.PermissionKey.PRODUCTS_READ], dependencies: [client_1.FeatureModuleKey.INGREDIENTS] },
    { key: client_1.FeatureModuleKey.STOCK, name: 'Lager', description: 'Bestandsbewegungen und Inventur', category: 'BETRIEB', defaultEnabled: true, adminNavPath: '/admin/stock', requiredPermissions: [client_1.PermissionKey.INVENTORY_READ] },
    { key: client_1.FeatureModuleKey.SUPPLIERS, name: 'Lieferanten', description: 'Lieferantenstamm und Bestellungen', category: 'BETRIEB', defaultEnabled: true, adminNavPath: '/admin/suppliers', requiredPermissions: [client_1.PermissionKey.PRODUCTS_READ], dependencies: [client_1.FeatureModuleKey.STOCK] },
    { key: client_1.FeatureModuleKey.STAFF, name: 'Mitarbeiter', description: 'Benutzer und Teamverwaltung', category: 'BETRIEB', defaultEnabled: true, adminNavPath: '/admin/staff', requiredPermissions: [client_1.PermissionKey.USERS_READ] },
    { key: client_1.FeatureModuleKey.DRIVERS, name: 'Fahrer', description: 'Fahrerstatus und Liefergeraete', category: 'BESTELLUNG', defaultEnabled: true, adminNavPath: '/admin/drivers', requiredPermissions: [client_1.PermissionKey.SETTINGS_READ], dependencies: [client_1.FeatureModuleKey.ORDERS] },
    { key: client_1.FeatureModuleKey.DISPLAYS, name: 'Displays', description: 'Order- und Screen-Displays', category: 'GERAETE', defaultEnabled: true, adminNavPath: '/admin/displays', requiredPermissions: [client_1.PermissionKey.ORDERS_READ] },
    { key: client_1.FeatureModuleKey.DISPLAY_DESIGN, name: 'Display-Design', description: 'Darstellung, Farben und Layout fuer Displays', category: 'GERAETE', defaultEnabled: true, adminNavPath: '/admin/screen', requiredPermissions: [client_1.PermissionKey.ORDERS_READ], dependencies: [client_1.FeatureModuleKey.DISPLAYS] },
    { key: client_1.FeatureModuleKey.ORDERDESK, name: 'OrderDesk', description: 'OrderDesk-Geraetelogik und Pairing', category: 'GERAETE', defaultEnabled: true, adminNavPath: '/admin/terminals', requiredPermissions: [client_1.PermissionKey.ORDERS_READ], dependencies: [client_1.FeatureModuleKey.ORDERS] },
    { key: client_1.FeatureModuleKey.TERMINALS, name: 'Terminals', description: 'Kassen- und Bestellterminals', category: 'GERAETE', defaultEnabled: true, adminNavPath: '/admin/terminals', requiredPermissions: [client_1.PermissionKey.ORDERS_READ], dependencies: [client_1.FeatureModuleKey.ORDERS] },
    { key: client_1.FeatureModuleKey.POS, name: 'POS', description: 'Point of Sale Prozesse und Kassenfluss', category: 'BESTELLUNG', defaultEnabled: true, adminNavPath: '/admin/orders', requiredPermissions: [client_1.PermissionKey.ORDERS_READ], dependencies: [client_1.FeatureModuleKey.ORDERS] },
    { key: client_1.FeatureModuleKey.DELIVERY_ZONES, name: 'Lieferzonen', description: 'Liefergebiete und Lieferlogik', category: 'BESTELLUNG', defaultEnabled: true, adminNavPath: '/admin/settings', requiredPermissions: [client_1.PermissionKey.SETTINGS_READ], dependencies: [client_1.FeatureModuleKey.ORDERS] },
    { key: client_1.FeatureModuleKey.RATINGS, name: 'Bewertungen', description: 'Kundenbewertungen und Feedback', category: 'BESTELLUNG', defaultEnabled: true, adminNavPath: '/admin/orders', requiredPermissions: [client_1.PermissionKey.ORDERS_READ], dependencies: [client_1.FeatureModuleKey.ORDERS] },
    { key: client_1.FeatureModuleKey.TIPS, name: 'Trinkgeld', description: 'Trinkgeldfunktionen fuer Kunden', category: 'FINANZEN', defaultEnabled: false, dependencies: [client_1.FeatureModuleKey.PAYMENT] },
    { key: client_1.FeatureModuleKey.LOYALTY, name: 'Loyalty', description: 'Sammelkarten und Treuepunkte', category: 'BESTELLUNG', defaultEnabled: false, dependencies: [client_1.FeatureModuleKey.ORDERS] },
    { key: client_1.FeatureModuleKey.PAYMENT, name: 'Payment', description: 'Zentrale Zahlungsarten und Abwicklung', category: 'FINANZEN', defaultEnabled: false, requiredPermissions: [client_1.PermissionKey.SETTINGS_READ] },
    { key: client_1.FeatureModuleKey.ANALYTICS, name: 'Analytics', description: 'Auswertungen und Kennzahlen', category: 'FINANZEN', defaultEnabled: true, adminNavPath: '/admin', requiredPermissions: [client_1.PermissionKey.ORDERS_READ] },
    { key: client_1.FeatureModuleKey.CASH_CLOSING, name: 'Kassenabschluss', description: 'Tages- und Monatsabschluesse', category: 'FINANZEN', defaultEnabled: true, adminNavPath: '/admin/closings', requiredPermissions: [client_1.PermissionKey.ORDERS_READ], dependencies: [client_1.FeatureModuleKey.ORDERS] },
    { key: client_1.FeatureModuleKey.PLATFORM_BRANDING, name: 'Plattform Branding', description: 'Logos, Farben und Markenvorgaben', category: 'PLATTFORM', defaultEnabled: true, adminNavPath: '/admin/app-settings', requiredPermissions: [client_1.PermissionKey.SETTINGS_READ] },
];
const registryByKey = new Map(exports.FEATURE_MODULE_REGISTRY.map((entry) => [entry.key, entry]));
exports.FEATURE_PACKAGES = [
    { key: 'STARTER', name: 'Starter', description: 'Basisbetrieb fuer Produkte und Bestellungen', features: [client_1.FeatureModuleKey.ORDERS, client_1.FeatureModuleKey.PRODUCTS, client_1.FeatureModuleKey.CATEGORIES, client_1.FeatureModuleKey.INGREDIENTS, client_1.FeatureModuleKey.DISPLAYS] },
    { key: 'DELIVERY', name: 'Delivery', description: 'Erweitert um Fahrer, Lieferzonen und Dispatch', features: [client_1.FeatureModuleKey.ORDERS, client_1.FeatureModuleKey.DRIVERS, client_1.FeatureModuleKey.DELIVERY_ZONES, client_1.FeatureModuleKey.DISPLAYS, client_1.FeatureModuleKey.ORDERDESK] },
    { key: 'PRO', name: 'Pro', description: 'Mit Lager, Lieferanten und erweiterten Auswertungen', features: [client_1.FeatureModuleKey.ORDERS, client_1.FeatureModuleKey.PRODUCTS, client_1.FeatureModuleKey.CATEGORIES, client_1.FeatureModuleKey.INGREDIENTS, client_1.FeatureModuleKey.STOCK, client_1.FeatureModuleKey.SUPPLIERS, client_1.FeatureModuleKey.DISPLAYS, client_1.FeatureModuleKey.DISPLAY_DESIGN, client_1.FeatureModuleKey.ANALYTICS, client_1.FeatureModuleKey.CASH_CLOSING] },
    { key: 'CHAIN', name: 'Chain', description: 'Fuer Kettenbetrieb mit mehreren Standorten', features: [client_1.FeatureModuleKey.ORDERS, client_1.FeatureModuleKey.PRODUCTS, client_1.FeatureModuleKey.CATEGORIES, client_1.FeatureModuleKey.INGREDIENTS, client_1.FeatureModuleKey.STOCK, client_1.FeatureModuleKey.SUPPLIERS, client_1.FeatureModuleKey.STAFF, client_1.FeatureModuleKey.DRIVERS, client_1.FeatureModuleKey.DISPLAYS, client_1.FeatureModuleKey.DISPLAY_DESIGN, client_1.FeatureModuleKey.ORDERDESK, client_1.FeatureModuleKey.TERMINALS, client_1.FeatureModuleKey.ANALYTICS, client_1.FeatureModuleKey.CASH_CLOSING] },
    { key: 'ENTERPRISE', name: 'Enterprise', description: 'Voller Funktionsumfang inklusive Payment/Tips/Loyalty', features: exports.FEATURE_MODULE_REGISTRY.map((entry) => entry.key) },
];
function withDependencyHealth(entries) {
    const enabledByKey = new Map(entries.map((entry) => [entry.key, entry.enabled]));
    return entries.map((entry) => ({
        ...entry,
        dependencyIssues: entry.dependencies.filter((dependency) => !enabledByKey.get(dependency)),
    }));
}
async function resolveEffectiveFeatureSetForTenant(tenantId) {
    const tenant = await prisma_1.prisma.tenant.findUnique({
        where: { id: tenantId },
        select: { id: true, chainId: true },
    });
    if (!tenant) {
        return null;
    }
    const [chainSettings, tenantSettings] = await Promise.all([
        tenant.chainId
            ? prisma_1.prisma.chainFeatureModuleSetting.findMany({
                where: { chainId: tenant.chainId },
                select: { featureKey: true, enabled: true },
            })
            : Promise.resolve([]),
        prisma_1.prisma.tenantFeatureModuleSetting.findMany({
            where: { tenantId: tenant.id },
            select: { featureKey: true, enabled: true },
        }),
    ]);
    const chainOverrides = new Map(chainSettings.map((entry) => [entry.featureKey, entry.enabled]));
    const tenantOverrides = new Map(tenantSettings.map((entry) => [entry.featureKey, entry.enabled]));
    const modules = exports.FEATURE_MODULE_REGISTRY.map((definition) => {
        if (tenantOverrides.has(definition.key)) {
            return {
                ...definition,
                enabled: tenantOverrides.get(definition.key) === true,
                source: 'tenant',
            };
        }
        if (chainOverrides.has(definition.key)) {
            return {
                ...definition,
                enabled: chainOverrides.get(definition.key) === true,
                source: 'chain',
            };
        }
        return {
            ...definition,
            enabled: definition.defaultEnabled,
            source: 'default',
        };
    }).map((entry) => ({
        key: entry.key,
        enabled: entry.enabled,
        source: entry.source,
        name: entry.name,
        description: entry.description,
        category: entry.category,
        adminNavPath: entry.adminNavPath ?? null,
        requiredPermissions: entry.requiredPermissions ? [...entry.requiredPermissions] : [],
        dependencies: entry.dependencies ? [...entry.dependencies] : [],
        dependencyIssues: [],
    }));
    return {
        tenantId: tenant.id,
        chainId: tenant.chainId,
        modules: withDependencyHealth(modules),
    };
}
function moduleKeyFromString(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const normalized = value.trim().toUpperCase();
    const candidate = normalized;
    return registryByKey.has(candidate) ? candidate : null;
}
function normalizeModuleKeyList(values) {
    if (!Array.isArray(values)) {
        return null;
    }
    const parsed = [];
    for (const value of values) {
        const key = moduleKeyFromString(value);
        if (!key) {
            return null;
        }
        parsed.push(key);
    }
    return Array.from(new Set(parsed));
}
async function calculateBillingUsageSnapshot(params) {
    const baseWhere = {
        tenantId: params.tenantId,
        createdAt: {
            gte: params.periodStart,
            lt: params.periodEnd,
        },
    };
    const allOrders = await prisma_1.prisma.order.findMany({
        where: baseWhere,
        select: {
            id: true,
            status: true,
            paymentStatus: true,
            total: true,
        },
    });
    const canceledStatus = new Set(['CANCELED', 'CANCELLED', 'STORNO']);
    const completedStatus = new Set(['DONE', 'DELIVERED', 'COMPLETED', 'FINISHED']);
    let ordersCounted = 0;
    let revenueCountedCents = 0;
    let ordersCanceled = 0;
    let revenueGrossCents = 0;
    for (const order of allOrders) {
        const totalCents = Math.round(Number(order.total) * 100);
        revenueGrossCents += Number.isFinite(totalCents) ? totalCents : 0;
        const statusUpper = String(order.status || '').toUpperCase();
        const paymentStatusUpper = String(order.paymentStatus || '').toUpperCase();
        if (canceledStatus.has(statusUpper)) {
            ordersCanceled += 1;
        }
        let include = true;
        if (params.excludeCanceledOrders && canceledStatus.has(statusUpper)) {
            include = false;
        }
        if (include && params.countOnlyCompletedOrders && !completedStatus.has(statusUpper)) {
            include = false;
        }
        if (include &&
            params.countOnlyPaidOrders &&
            paymentStatusUpper !== 'PAID' &&
            paymentStatusUpper !== 'PAYED') {
            include = false;
        }
        if (include) {
            ordersCounted += 1;
            revenueCountedCents += Number.isFinite(totalCents) ? totalCents : 0;
        }
    }
    return {
        periodStart: params.periodStart.toISOString(),
        periodEnd: params.periodEnd.toISOString(),
        ordersTotal: allOrders.length,
        ordersCounted,
        ordersCanceled,
        revenueGrossCents,
        revenueCountedCents,
    };
}
