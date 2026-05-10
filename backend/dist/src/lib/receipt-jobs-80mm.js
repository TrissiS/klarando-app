"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.createReceiptJobContextFromOrder = createReceiptJobContextFromOrder;
exports.buildCustomerReceiptJob80mm = buildCustomerReceiptJob80mm;
exports.buildKitchenReceiptJob80mm = buildKitchenReceiptJob80mm;
const receipt_renderer_80mm_1 = require("./receipt-renderer-80mm");
const receipt_template_80mm_1 = require("./receipt-template-80mm");
function toSafeString(value) {
    return (value ?? '').trim();
}
function formatMoneyEur(value) {
    const parsed = typeof value === 'number' ? value : Number.parseFloat(String(value ?? '0').replace(',', '.'));
    const safe = Number.isFinite(parsed) ? parsed : 0;
    return `${safe.toFixed(2)} EUR`;
}
function formatDateTimeLocal(value, locale = 'de-DE', timeZone) {
    if (!(value instanceof Date) || Number.isNaN(value.getTime())) {
        return '-';
    }
    return value.toLocaleString(locale, timeZone ? { timeZone } : undefined);
}
function labelServiceType(value) {
    if (value === 'DELIVERY') {
        return 'Lieferung';
    }
    if (value === 'PICKUP') {
        return 'Abholung';
    }
    return value || '-';
}
function labelSourceChannel(value) {
    if (!value) {
        return '-';
    }
    if (value === 'TERMINAL') {
        return 'Bestellterminal';
    }
    if (value === 'APP') {
        return 'App';
    }
    if (value === 'DELIVERY') {
        return 'Lieferung';
    }
    return value;
}
function resolveOrderShortId(orderId) {
    return orderId.replace(/-/g, '').slice(0, 8).toUpperCase();
}
function resolveCustomerAddressLine(order) {
    const line = [order.customerAddress, order.customerZipCode, order.customerCity]
        .map((entry) => toSafeString(entry))
        .filter(Boolean)
        .join(', ');
    return line || '-';
}
function resolveTenantProfile(order, overrides) {
    const tenantName = toSafeString(overrides?.name) || 'Klarando';
    return {
        name: tenantName,
        street: toSafeString(overrides?.street),
        zipCode: toSafeString(overrides?.zipCode),
        city: toSafeString(overrides?.city),
        phone: toSafeString(overrides?.phone),
    };
}
function mapItemModifiers(item) {
    const modifiers = item.modifierSnapshot ?? [];
    return modifiers.map((entry) => {
        const delta = Number(entry.priceDelta ?? 0);
        if (!Number.isFinite(delta) || delta === 0) {
            return entry.name;
        }
        return `${entry.name} (${delta >= 0 ? '+' : ''}${delta.toFixed(2)} EUR)`;
    });
}
function mapCustomerItemRows(order) {
    return order.items.map((item) => ({
        qty: `${item.quantity}x`,
        label: item.product.name,
        price: formatMoneyEur(item.price),
        modifiers: mapItemModifiers(item),
    }));
}
function mapKitchenItemRows(order) {
    return order.items.map((item) => ({
        qty: `${item.quantity}x`,
        label: item.product.name,
        price: '',
        modifiers: mapItemModifiers(item),
    }));
}
function createReceiptJobContextFromOrder(order, options) {
    const tenant = resolveTenantProfile(order, options?.tenantProfile);
    return {
        tenant: {
            name: tenant.name,
            street: tenant.street,
            zipCode: tenant.zipCode,
            city: tenant.city,
            phone: tenant.phone,
        },
        order: {
            shortId: resolveOrderShortId(order.id),
            createdAtLocal: formatDateTimeLocal(order.createdAt, options?.locale, options?.timeZone),
            sourceChannel: labelSourceChannel(order.sourceChannel),
            serviceType: labelServiceType(order.serviceType),
            subtotalEur: formatMoneyEur(order.subtotal),
            deliveryFeeEur: formatMoneyEur(order.deliveryFee),
            totalEur: formatMoneyEur(order.total),
            trackingUrl: toSafeString(options?.trackingUrl) || '-',
            etaMinutes: order.estimatedMinutes ? String(order.estimatedMinutes) : '-',
            driverName: toSafeString(order.assignedDriverName) || toSafeString(order.assignedDriver?.name) || '-',
            customerName: toSafeString(order.customerName) || toSafeString(order.appCustomerAccount?.fullName) || '-',
            customerPhone: toSafeString(order.customerPhone) || '-',
            customerAddressLine: resolveCustomerAddressLine(order),
        },
    };
}
function buildCustomerReceiptJob80mm(order, options) {
    const context = createReceiptJobContextFromOrder(order, options);
    return (0, receipt_renderer_80mm_1.renderReceipt80mm)({
        template: receipt_template_80mm_1.CUSTOMER_RECEIPT_TEMPLATE_80MM,
        data: context,
        itemRows: mapCustomerItemRows(order),
    });
}
function buildKitchenReceiptJob80mm(order, options) {
    const context = createReceiptJobContextFromOrder(order, options);
    return (0, receipt_renderer_80mm_1.renderReceipt80mm)({
        template: receipt_template_80mm_1.KITCHEN_RECEIPT_TEMPLATE_80MM,
        data: context,
        itemRows: mapKitchenItemRows(order),
    });
}
