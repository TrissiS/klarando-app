"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const client_1 = require("@prisma/client");
const prisma_1 = require("../lib/prisma");
const auth_1 = require("../middleware/auth");
const audit_1 = require("../lib/audit");
const tenant_scope_1 = require("../lib/tenant-scope");
const router = (0, express_1.Router)();
const BEVERAGE_CONTAINER_TYPES = new Set(['NONE', 'EINWEG', 'MEHRWEG']);
function normalizeText(value) {
    if (value === undefined) {
        return undefined;
    }
    if (value === null) {
        return null;
    }
    const trimmed = value.trim();
    return trimmed.length > 0 ? trimmed : null;
}
function normalizeEan(value) {
    const normalized = normalizeText(value);
    if (normalized === undefined) {
        return undefined;
    }
    if (normalized === null) {
        return null;
    }
    return normalized.toUpperCase();
}
function normalizeProductNumber(value) {
    const normalized = normalizeText(value);
    if (normalized === undefined || normalized === null) {
        return normalized;
    }
    return normalized.toUpperCase();
}
function normalizeUnitEans(value) {
    if (!Array.isArray(value)) {
        return [];
    }
    const output = [];
    const seen = new Set();
    for (const item of value) {
        if (!item || typeof item !== 'object') {
            continue;
        }
        const record = item;
        const label = normalizeText(String(record.label ?? ''));
        const ean = normalizeEan(String(record.ean ?? ''));
        if (!label || !ean) {
            continue;
        }
        const unitCountRaw = Number(record.unitCount ?? 1);
        const unitCount = Number.isFinite(unitCountRaw) && unitCountRaw > 0
            ? Number(unitCountRaw.toFixed(3))
            : 1;
        const unitLabel = normalizeText(typeof record.unitLabel === 'string' ? record.unitLabel : null);
        const dedupeKey = `${label}::${ean}`;
        if (seen.has(dedupeKey)) {
            continue;
        }
        seen.add(dedupeKey);
        output.push({
            label,
            ean,
            unitCount,
            unitLabel: unitLabel ?? null,
        });
    }
    return output;
}
function normalizeBeverageContainerType(value) {
    if (typeof value !== 'string') {
        return undefined;
    }
    const normalized = value.trim().toUpperCase();
    if (!BEVERAGE_CONTAINER_TYPES.has(normalized)) {
        return undefined;
    }
    return normalized;
}
function normalizeMoney(value, fallback = 0) {
    const parsed = Number(value);
    if (!Number.isFinite(parsed) || parsed < 0) {
        return fallback;
    }
    return Number(parsed.toFixed(2));
}
function collectAllergens(product) {
    const codes = new Set();
    for (const item of product.ingredients) {
        const raw = item.ingredient.allergens;
        if (!raw) {
            continue;
        }
        raw
            .split(',')
            .map((part) => part.trim().toUpperCase())
            .filter(Boolean)
            .forEach((code) => codes.add(code));
    }
    return Array.from(codes).sort();
}
function mapProductOutput(product) {
    return {
        ...product,
        ean: normalizeEan(product.ean) ?? null,
        unitEans: normalizeUnitEans(product.unitEans),
        deposit: normalizeMoney(product.deposit, 0).toFixed(2),
        articleInfo: normalizeText(product.articleInfo) ?? null,
        foodBusinessOperator: normalizeText(product.foodBusinessOperator) ?? null,
        nutritionInfo: normalizeText(product.nutritionInfo) ?? null,
        allergens: collectAllergens(product),
    };
}
function isMissingProductColumnsError(error) {
    if (!(error instanceof Error)) {
        return false;
    }
    return (error.message.includes('Product.beverageContainerType') ||
        error.message.includes('beverageContainerType') ||
        error.message.includes('Product.deposit') ||
        error.message.includes('"deposit"') ||
        error.message.includes('Product.articleInfo') ||
        error.message.includes('"articleInfo"') ||
        error.message.includes('Product.foodBusinessOperator') ||
        error.message.includes('"foodBusinessOperator"') ||
        error.message.includes('Product.nutritionInfo') ||
        error.message.includes('"nutritionInfo"'));
}
async function ensureProductColumns() {
    await prisma_1.prisma.$executeRawUnsafe(`
    DO $$
    BEGIN
      IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'BeverageContainerType') THEN
        CREATE TYPE "BeverageContainerType" AS ENUM ('NONE', 'EINWEG', 'MEHRWEG');
      END IF;
    END
    $$;
  `);
    await prisma_1.prisma.$executeRawUnsafe(`
    ALTER TABLE "Product"
    ADD COLUMN IF NOT EXISTS "beverageContainerType" "BeverageContainerType" NOT NULL DEFAULT 'NONE';
  `);
    await prisma_1.prisma.$executeRawUnsafe(`
    ALTER TABLE "Product"
    ADD COLUMN IF NOT EXISTS "deposit" DECIMAL(10, 2) NOT NULL DEFAULT 0;
  `);
    await prisma_1.prisma.$executeRawUnsafe(`
    ALTER TABLE "Product"
    ADD COLUMN IF NOT EXISTS "articleInfo" TEXT;
  `);
    await prisma_1.prisma.$executeRawUnsafe(`
    ALTER TABLE "Product"
    ADD COLUMN IF NOT EXISTS "foodBusinessOperator" TEXT;
  `);
    await prisma_1.prisma.$executeRawUnsafe(`
    ALTER TABLE "Product"
    ADD COLUMN IF NOT EXISTS "nutritionInfo" TEXT;
  `);
}
async function validateCategoryScope(tenantId, categoryId) {
    if (!categoryId) {
        return true;
    }
    const category = await prisma_1.prisma.category.findFirst({
        where: {
            id: categoryId,
            tenantId,
        },
        select: { id: true },
    });
    return Boolean(category);
}
router.get('/', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_READ), async (req, res) => {
    try {
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, req.query.tenantId);
        const tenantId = scope.tenantId;
        const availableOnly = req.query.availableOnly === 'true';
        const loadProducts = () => prisma_1.prisma.product.findMany({
            where: {
                tenantId,
                ...(availableOnly ? { available: true } : {}),
            },
            orderBy: { createdAt: 'desc' },
            include: {
                category: true,
                ingredients: {
                    include: {
                        ingredient: {
                            select: {
                                allergens: true,
                            },
                        },
                    },
                },
            },
        });
        let products;
        try {
            products = await loadProducts();
        }
        catch (loadError) {
            if (!isMissingProductColumnsError(loadError)) {
                throw loadError;
            }
            await ensureProductColumns();
            products = await loadProducts();
        }
        return res.json(products.map(mapProductOutput));
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error('GET PRODUCTS ERROR:', error);
        return res.status(500).json({ error: 'Fehler beim Laden der Produkte' });
    }
});
router.post('/', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const { tenantId, categoryId, productNumber, name, imageUrl, ean, unitEans, beverageContainerType, deposit, articleInfo, foodBusinessOperator, nutritionInfo, price, vatRate, available, } = req.body;
        const normalizedProductNumber = normalizeProductNumber(productNumber);
        const normalizedName = normalizeText(name);
        if (!normalizedProductNumber || !normalizedName || price === undefined) {
            return res.status(400).json({ error: 'Pflichtfelder fehlen' });
        }
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, tenantId);
        const scopedTenantId = scope.tenantId;
        const resolvedCategoryId = categoryId || null;
        const categoryInScope = await validateCategoryScope(scopedTenantId, resolvedCategoryId);
        if (!categoryInScope) {
            return res.status(400).json({ error: 'Kategorie gehoert nicht zur Filiale' });
        }
        const existingWithProductNumber = await prisma_1.prisma.product.findFirst({
            where: {
                tenantId: scopedTenantId,
                productNumber: normalizedProductNumber,
            },
            select: {
                id: true,
            },
        });
        if (existingWithProductNumber) {
            return res.status(409).json({
                error: 'Produktnummer ist bereits vergeben',
            });
        }
        const normalizedUnitEans = normalizeUnitEans(unitEans);
        const normalizedContainerType = normalizeBeverageContainerType(beverageContainerType);
        const createProductRecord = () => prisma_1.prisma.product.create({
            data: {
                tenantId: scopedTenantId,
                categoryId: resolvedCategoryId,
                productNumber: normalizedProductNumber,
                name: normalizedName,
                imageUrl: normalizeText(imageUrl),
                ean: normalizeEan(ean),
                unitEans: normalizedUnitEans,
                beverageContainerType: normalizedContainerType ?? 'NONE',
                deposit: normalizeMoney(deposit, 0),
                articleInfo: normalizeText(articleInfo),
                foodBusinessOperator: normalizeText(foodBusinessOperator),
                nutritionInfo: normalizeText(nutritionInfo),
                price: Number(price),
                vatRate: vatRate === undefined ? 19.0 : Number(vatRate),
                available: available ?? true,
            },
            include: {
                category: true,
                ingredients: {
                    include: {
                        ingredient: {
                            select: {
                                allergens: true,
                            },
                        },
                    },
                },
            },
        });
        let product;
        try {
            product = await createProductRecord();
        }
        catch (createError) {
            if (!isMissingProductColumnsError(createError)) {
                throw createError;
            }
            await ensureProductColumns();
            product = await createProductRecord();
        }
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'product',
            action: 'product_created',
            targetType: 'product',
            targetId: product.id,
            tenantId: product.tenantId,
            metadata: {
                productNumber: product.productNumber,
                name: product.name,
                available: product.available,
            },
        });
        return res.status(201).json(mapProductOutput(product));
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error('CREATE PRODUCT ERROR:', error);
        return res.status(500).json({ error: 'Fehler beim Erstellen des Produkts' });
    }
});
router.put('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const { name, imageUrl, ean, unitEans, beverageContainerType, deposit, articleInfo, foodBusinessOperator, nutritionInfo, price, vatRate, categoryId, available, } = req.body;
        if (!id) {
            return res.status(400).json({ error: 'Produkt-ID fehlt' });
        }
        const existingProduct = await prisma_1.prisma.product.findUnique({
            where: { id },
            select: {
                id: true,
                tenantId: true,
            },
        });
        if (!existingProduct) {
            return res.status(404).json({ error: 'Produkt nicht gefunden' });
        }
        await (0, tenant_scope_1.resolveTenantScope)(req, existingProduct.tenantId);
        if (categoryId !== undefined) {
            const resolvedCategoryId = categoryId || null;
            const categoryInScope = await validateCategoryScope(existingProduct.tenantId, resolvedCategoryId);
            if (!categoryInScope) {
                return res.status(400).json({ error: 'Kategorie gehoert nicht zur Filiale' });
            }
        }
        const normalizedUnitEans = unitEans === undefined ? undefined : normalizeUnitEans(unitEans);
        const normalizedContainerType = normalizeBeverageContainerType(beverageContainerType);
        const updateProductRecord = () => prisma_1.prisma.product.update({
            where: { id },
            data: {
                name,
                imageUrl: normalizeText(imageUrl),
                ean: normalizeEan(ean),
                beverageContainerType: beverageContainerType === undefined ? undefined : (normalizedContainerType ?? 'NONE'),
                unitEans: normalizedUnitEans === undefined
                    ? undefined
                    : normalizedUnitEans,
                deposit: deposit === undefined ? undefined : normalizeMoney(deposit, 0),
                articleInfo: articleInfo === undefined ? undefined : normalizeText(articleInfo),
                foodBusinessOperator: foodBusinessOperator === undefined ? undefined : normalizeText(foodBusinessOperator),
                nutritionInfo: nutritionInfo === undefined ? undefined : normalizeText(nutritionInfo),
                price: price === undefined ? undefined : Number(price),
                vatRate: vatRate === undefined ? undefined : Number(vatRate),
                categoryId: categoryId === undefined ? undefined : categoryId || null,
                available,
            },
            include: {
                category: true,
                ingredients: {
                    include: {
                        ingredient: {
                            select: {
                                allergens: true,
                            },
                        },
                    },
                },
            },
        });
        let product;
        try {
            product = await updateProductRecord();
        }
        catch (updateError) {
            if (!isMissingProductColumnsError(updateError)) {
                throw updateError;
            }
            await ensureProductColumns();
            product = await updateProductRecord();
        }
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'product',
            action: 'product_updated',
            targetType: 'product',
            targetId: product.id,
            tenantId: product.tenantId,
            metadata: {
                name: product.name,
                available: product.available,
            },
        });
        return res.json(mapProductOutput(product));
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error('UPDATE PRODUCT ERROR:', error);
        return res.status(500).json({ error: 'Produkt konnte nicht aktualisiert werden' });
    }
});
router.delete('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const tenantIdInput = req.query.tenantId;
        if (!id || !tenantIdInput) {
            return res.status(400).json({ error: 'Produkt-ID oder tenantId fehlt' });
        }
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, tenantIdInput);
        const tenantId = scope.tenantId;
        const existing = await prisma_1.prisma.product.findUnique({
            where: { id },
            select: {
                id: true,
                tenantId: true,
                name: true,
                productNumber: true,
            },
        });
        if (!existing || existing.tenantId !== tenantId) {
            return res.status(404).json({ error: 'Produkt nicht gefunden' });
        }
        const orderItemCount = await prisma_1.prisma.orderItem.count({
            where: { productId: id },
        });
        if (orderItemCount > 0) {
            return res.status(409).json({
                error: 'Produkt wird bereits in Bestellungen verwendet und kann nicht geloescht werden',
                orderItemCount,
            });
        }
        await prisma_1.prisma.product.delete({
            where: { id },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'product',
            action: 'product_deleted',
            targetType: 'product',
            targetId: existing.id,
            tenantId: existing.tenantId,
            metadata: {
                productNumber: existing.productNumber,
                name: existing.name,
            },
        });
        return res.json({ ok: true });
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error('DELETE PRODUCT ERROR:', error);
        return res.status(500).json({ error: 'Produkt konnte nicht geloescht werden' });
    }
});
exports.default = router;
