"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const client_1 = require("@prisma/client");
const express_1 = require("express");
const prisma_1 = require("../lib/prisma");
const auth_1 = require("../middleware/auth");
const tenant_scope_1 = require("../lib/tenant-scope");
const business_template_import_1 = require("../lib/business-template-import");
const audit_1 = require("../lib/audit");
const router = (0, express_1.Router)();
function isTemplateImportRole(role) {
    return role === client_1.UserRole.SUPERADMIN || role === client_1.UserRole.CHAINADMIN || role === client_1.UserRole.ADMIN;
}
function ensureSuperadmin(req, res) {
    if (!req.authUser) {
        return { ok: false, response: res.status(401).json({ error: 'Nicht eingeloggt' }) };
    }
    if (req.authUser.role !== client_1.UserRole.SUPERADMIN) {
        return { ok: false, response: res.status(403).json({ error: 'Nur SUPERADMIN erlaubt' }) };
    }
    return { ok: true };
}
function toTemplateAllergenCodes(input) {
    if (!Array.isArray(input)) {
        return [];
    }
    const allowed = new Set(Object.values(client_1.TemplateAllergenCode));
    return input
        .map((entry) => String(entry).trim())
        .filter((entry) => allowed.has(entry));
}
router.get('/', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_READ), async (req, res) => {
    try {
        const templates = await prisma_1.prisma.businessTemplate.findMany({
            where: {
                isActive: true,
            },
            select: {
                id: true,
                key: true,
                type: true,
                name: true,
                description: true,
                sortOrder: true,
                updatedAt: true,
                _count: {
                    select: {
                        categories: true,
                        ingredients: true,
                        products: true,
                    },
                },
            },
            orderBy: [{ sortOrder: 'asc' }, { name: 'asc' }],
        });
        return res.json(templates);
    }
    catch (error) {
        console.error('GET BUSINESS TEMPLATES ERROR:', error);
        return res.status(500).json({ error: 'Vorlagen konnten nicht geladen werden' });
    }
});
router.get('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_READ), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        if (!id) {
            return res.status(400).json({ error: 'Template-ID fehlt' });
        }
        const template = await prisma_1.prisma.businessTemplate.findUnique({
            where: { id },
            include: {
                categories: {
                    orderBy: [{ sortOrder: 'asc' }, { name: 'asc' }],
                },
                ingredients: {
                    orderBy: [{ name: 'asc' }],
                },
                products: {
                    include: {
                        category: true,
                        ingredientLinks: {
                            include: {
                                ingredient: true,
                            },
                        },
                    },
                    orderBy: [{ name: 'asc' }],
                },
            },
        });
        if (!template || !template.isActive) {
            return res.status(404).json({ error: 'Vorlage nicht gefunden' });
        }
        return res.json(template);
    }
    catch (error) {
        console.error('GET BUSINESS TEMPLATE DETAIL ERROR:', error);
        return res.status(500).json({ error: 'Vorlage konnte nicht geladen werden' });
    }
});
router.get('/:id/full', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_READ), async (req, res) => {
    try {
        const auth = ensureSuperadmin(req, res);
        if (!auth.ok)
            return auth.response;
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        if (!id) {
            return res.status(400).json({ error: 'Template-ID fehlt' });
        }
        const template = await prisma_1.prisma.businessTemplate.findUnique({
            where: { id },
            include: {
                categories: {
                    orderBy: [{ sortOrder: 'asc' }, { name: 'asc' }],
                },
                ingredients: {
                    orderBy: [{ name: 'asc' }],
                },
                products: {
                    include: {
                        category: true,
                        ingredientLinks: {
                            include: {
                                ingredient: true,
                            },
                        },
                    },
                    orderBy: [{ name: 'asc' }],
                },
            },
        });
        if (!template) {
            return res.status(404).json({ error: 'Vorlage nicht gefunden' });
        }
        return res.json(template);
    }
    catch (error) {
        console.error('GET BUSINESS TEMPLATE FULL ERROR:', error);
        return res.status(500).json({ error: 'Vollansicht konnte nicht geladen werden' });
    }
});
router.post('/:id/category', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const auth = ensureSuperadmin(req, res);
        if (!auth.ok)
            return auth.response;
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const payload = req.body;
        if (!id || !payload.name?.trim()) {
            return res.status(400).json({ error: 'Template-ID und Kategoriename sind erforderlich' });
        }
        const template = await prisma_1.prisma.businessTemplate.findUnique({ where: { id }, select: { id: true } });
        if (!template) {
            return res.status(404).json({ error: 'Vorlage nicht gefunden' });
        }
        const category = await prisma_1.prisma.businessTemplateCategory.upsert({
            where: {
                templateId_name: {
                    templateId: id,
                    name: payload.name.trim(),
                },
            },
            update: {
                sortOrder: Number.isFinite(payload.sortOrder) ? Number(payload.sortOrder) : 0,
            },
            create: {
                templateId: id,
                name: payload.name.trim(),
                sortOrder: Number.isFinite(payload.sortOrder) ? Number(payload.sortOrder) : 0,
            },
        });
        return res.status(201).json(category);
    }
    catch (error) {
        console.error('CREATE TEMPLATE CATEGORY ERROR:', error);
        return res.status(500).json({ error: 'Kategorie konnte nicht erstellt werden' });
    }
});
router.post('/:id/ingredient', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const auth = ensureSuperadmin(req, res);
        if (!auth.ok)
            return auth.response;
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const payload = req.body;
        if (!id || !payload.name?.trim() || !payload.unit?.trim()) {
            return res.status(400).json({ error: 'Template-ID, Zutatenname und Einheit sind erforderlich' });
        }
        const ingredient = await prisma_1.prisma.businessTemplateIngredient.upsert({
            where: {
                templateId_name: {
                    templateId: id,
                    name: payload.name.trim(),
                },
            },
            update: {
                unit: payload.unit.trim(),
                category: payload.category === 'PACKAGING' ? 'PACKAGING' : 'FOOD',
                allergens: toTemplateAllergenCodes(payload.allergens),
            },
            create: {
                templateId: id,
                name: payload.name.trim(),
                unit: payload.unit.trim(),
                category: payload.category === 'PACKAGING' ? 'PACKAGING' : 'FOOD',
                purchasePrice: 0,
                minimumStock: 0,
                allergens: toTemplateAllergenCodes(payload.allergens),
            },
        });
        return res.status(201).json(ingredient);
    }
    catch (error) {
        console.error('CREATE TEMPLATE INGREDIENT ERROR:', error);
        return res.status(500).json({ error: 'Zutat konnte nicht erstellt werden' });
    }
});
router.post('/:id/product', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const auth = ensureSuperadmin(req, res);
        if (!auth.ok)
            return auth.response;
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const payload = req.body;
        if (!id || !payload.name?.trim()) {
            return res.status(400).json({ error: 'Template-ID und Produktname sind erforderlich' });
        }
        const normalizedName = payload.name.trim();
        const categoryId = payload.categoryId || null;
        const existingProduct = await prisma_1.prisma.businessTemplateProduct.findFirst({
            where: {
                templateId: id,
                name: normalizedName,
                categoryId,
            },
            select: { id: true },
        });
        const product = await prisma_1.prisma.businessTemplateProduct.upsert({
            where: {
                id: existingProduct?.id || '__no-match__',
            },
            update: {
                name: normalizedName,
                categoryId,
                price: Number.isFinite(payload.price) ? Number(payload.price) : 0,
            },
            create: {
                templateId: id,
                productNumber: null,
                name: normalizedName,
                categoryId,
                price: Number.isFinite(payload.price) ? Number(payload.price) : 0,
                vatRate: 7,
                available: true,
            },
        });
        return res.status(201).json(product);
    }
    catch (error) {
        console.error('CREATE TEMPLATE PRODUCT ERROR:', error);
        return res.status(500).json({ error: 'Produkt konnte nicht erstellt werden' });
    }
});
router.post('/:id/product-ingredient', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const auth = ensureSuperadmin(req, res);
        if (!auth.ok)
            return auth.response;
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const payload = req.body;
        if (!id || !payload.templateProductId || !payload.templateIngredientId) {
            return res.status(400).json({ error: 'Template-ID, Produkt und Zutat sind erforderlich' });
        }
        const link = await prisma_1.prisma.businessTemplateProductIngredient.upsert({
            where: {
                templateProductId_templateIngredientId: {
                    templateProductId: payload.templateProductId,
                    templateIngredientId: payload.templateIngredientId,
                },
            },
            update: {
                quantity: Number.isFinite(payload.quantity) ? Number(payload.quantity) : 1,
            },
            create: {
                templateProductId: payload.templateProductId,
                templateIngredientId: payload.templateIngredientId,
                quantity: Number.isFinite(payload.quantity) ? Number(payload.quantity) : 1,
            },
        });
        return res.status(201).json(link);
    }
    catch (error) {
        console.error('CREATE TEMPLATE PRODUCT-INGREDIENT ERROR:', error);
        return res.status(500).json({ error: 'Verknüpfung konnte nicht erstellt werden' });
    }
});
router.post('/:id/import', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const actor = req.authUser;
        if (!actor) {
            return res.status(401).json({ error: 'Nicht eingeloggt' });
        }
        if (!isTemplateImportRole(actor.role)) {
            return res.status(403).json({ error: 'Rolle darf keine Vorlagen importieren' });
        }
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const payload = req.body;
        const tenantIdInput = payload.tenantId;
        if (!id) {
            return res.status(400).json({ error: 'Template-ID fehlt' });
        }
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, tenantIdInput);
        const tenantId = scope.tenantId;
        const tenant = await prisma_1.prisma.tenant.findUnique({
            where: { id: tenantId },
            select: { id: true, chainId: true, name: true },
        });
        if (!tenant) {
            return res.status(404).json({ error: 'Filiale nicht gefunden' });
        }
        if (actor.role === client_1.UserRole.CHAINADMIN && actor.chainId && tenant.chainId !== actor.chainId) {
            return res.status(403).json({ error: 'Keine Berechtigung fuer diese Filiale' });
        }
        const result = await (0, business_template_import_1.importBusinessTemplateToTenant)({
            templateId: id,
            tenantId,
            options: {
                importCategories: typeof payload.importOptions?.importCategories === 'boolean'
                    ? payload.importOptions.importCategories
                    : typeof payload.importCategories === 'boolean'
                        ? payload.importCategories
                        : undefined,
                importProducts: typeof payload.importOptions?.importProducts === 'boolean'
                    ? payload.importOptions.importProducts
                    : typeof payload.importProducts === 'boolean'
                        ? payload.importProducts
                        : undefined,
                importIngredients: typeof payload.importOptions?.importIngredients === 'boolean'
                    ? payload.importOptions.importIngredients
                    : typeof payload.importIngredients === 'boolean'
                        ? payload.importIngredients
                        : undefined,
                importProductIngredients: typeof payload.importOptions?.importProductIngredients === 'boolean'
                    ? payload.importOptions.importProductIngredients
                    : typeof payload.importProductIngredients === 'boolean'
                        ? payload.importProductIngredients
                        : undefined,
                importAllergens: typeof payload.importOptions?.importAllergens === 'boolean'
                    ? payload.importOptions.importAllergens
                    : typeof payload.importAllergens === 'boolean'
                        ? payload.importAllergens
                        : undefined,
                importPriceSuggestions: typeof payload.importOptions?.importPriceSuggestions === 'boolean'
                    ? payload.importOptions.importPriceSuggestions
                    : typeof payload.importPriceSuggestions === 'boolean'
                        ? payload.importPriceSuggestions
                        : undefined,
                overwriteExisting: typeof payload.importOptions?.overwriteExisting === 'boolean'
                    ? payload.importOptions.overwriteExisting
                    : typeof payload.overwriteExisting === 'boolean'
                        ? payload.overwriteExisting
                        : undefined,
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'business_template',
            action: 'business_template_imported',
            targetType: 'tenant',
            targetId: tenant.id,
            tenantId: tenant.id,
            chainId: tenant.chainId,
            metadata: result,
        });
        return res.status(201).json(result);
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        if (error instanceof business_template_import_1.TenantImportError && error.code === 'TEMPLATE_ALREADY_IMPORTED') {
            return res.status(409).json({
                error: error.message,
                warning: true,
                code: error.code,
            });
        }
        if (error instanceof Error && error.message.includes('Vorlage nicht gefunden')) {
            return res.status(404).json({ error: error.message });
        }
        console.error('IMPORT BUSINESS TEMPLATE ERROR:', error);
        return res.status(500).json({ error: 'Vorlage konnte nicht importiert werden' });
    }
});
exports.default = router;
