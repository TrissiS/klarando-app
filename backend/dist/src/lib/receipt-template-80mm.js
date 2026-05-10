"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.KITCHEN_RECEIPT_TEMPLATE_80MM = exports.CUSTOMER_RECEIPT_TEMPLATE_80MM = void 0;
exports.CUSTOMER_RECEIPT_TEMPLATE_80MM = {
    templateId: 'klarando.customer.80mm.v1',
    version: '1.0.0',
    kind: 'CUSTOMER',
    paperWidthMm: 80,
    charsPerLine: 48,
    codepage: 'UTF8',
    autoCut: true,
    blocks: [
        {
            type: 'TEXT',
            text: '{{tenant.name}}',
            align: 'CENTER',
            emphasis: 'BOLD',
            scale: 'L',
        },
        {
            type: 'TEXT',
            text: '{{tenant.street}} | {{tenant.zipCode}} {{tenant.city}}',
            align: 'CENTER',
        },
        {
            type: 'TEXT',
            text: 'Tel: {{tenant.phone}}',
            align: 'CENTER',
        },
        {
            type: 'DIVIDER',
            char: '=',
        },
        {
            type: 'KEY_VALUE',
            key: 'Bestellung',
            value: '#{{order.shortId}}',
            keyWidth: 18,
        },
        {
            type: 'KEY_VALUE',
            key: 'Zeit',
            value: '{{order.createdAtLocal}}',
            keyWidth: 18,
        },
        {
            type: 'KEY_VALUE',
            key: 'Kanal',
            value: '{{order.sourceChannel}}',
            keyWidth: 18,
        },
        {
            type: 'KEY_VALUE',
            key: 'Service',
            value: '{{order.serviceType}}',
            keyWidth: 18,
        },
        {
            type: 'DIVIDER',
        },
        {
            type: 'ITEMS',
            qtyWidth: 5,
            priceWidth: 10,
            rows: [],
        },
        {
            type: 'DIVIDER',
        },
        {
            type: 'KEY_VALUE',
            key: 'Zwischensumme',
            value: '{{order.subtotalEur}}',
            keyWidth: 20,
            valueAlign: 'RIGHT',
        },
        {
            type: 'KEY_VALUE',
            key: 'Liefergebuehr',
            value: '{{order.deliveryFeeEur}}',
            keyWidth: 20,
            valueAlign: 'RIGHT',
        },
        {
            type: 'KEY_VALUE',
            key: 'Gesamt',
            value: '{{order.totalEur}}',
            keyWidth: 20,
            valueAlign: 'RIGHT',
        },
        {
            type: 'SPACER',
            lines: 1,
        },
        {
            type: 'TEXT',
            text: 'Vielen Dank fuer Ihre Bestellung',
            align: 'CENTER',
        },
        {
            type: 'QR',
            value: '{{order.trackingUrl}}',
            size: 'M',
            align: 'CENTER',
            label: 'Bestellstatus',
        },
        {
            type: 'SPACER',
            lines: 2,
        },
    ],
};
exports.KITCHEN_RECEIPT_TEMPLATE_80MM = {
    templateId: 'klarando.kitchen.80mm.v1',
    version: '1.0.0',
    kind: 'KITCHEN',
    paperWidthMm: 80,
    charsPerLine: 48,
    codepage: 'UTF8',
    autoCut: true,
    blocks: [
        {
            type: 'TEXT',
            text: 'KUECHE',
            align: 'CENTER',
            emphasis: 'BOLD',
            scale: 'XL',
        },
        {
            type: 'DIVIDER',
            char: '=',
        },
        {
            type: 'KEY_VALUE',
            key: 'Bestellung',
            value: '#{{order.shortId}}',
            keyWidth: 18,
        },
        {
            type: 'KEY_VALUE',
            key: 'Zeit',
            value: '{{order.createdAtLocal}}',
            keyWidth: 18,
        },
        {
            type: 'KEY_VALUE',
            key: 'Service',
            value: '{{order.serviceType}}',
            keyWidth: 18,
        },
        {
            type: 'KEY_VALUE',
            key: 'ETA',
            value: '{{order.etaMinutes}} min',
            keyWidth: 18,
        },
        {
            type: 'KEY_VALUE',
            key: 'Fahrer',
            value: '{{order.driverName}}',
            keyWidth: 18,
        },
        {
            type: 'DIVIDER',
        },
        {
            type: 'ITEMS',
            qtyWidth: 6,
            priceWidth: 0,
            rows: [],
        },
        {
            type: 'DIVIDER',
            char: '=',
        },
        {
            type: 'TEXT',
            text: '{{order.customerName}}',
            emphasis: 'BOLD',
            scale: 'L',
        },
        {
            type: 'TEXT',
            text: '{{order.customerPhone}}',
        },
        {
            type: 'TEXT',
            text: '{{order.customerAddressLine}}',
        },
        {
            type: 'SPACER',
            lines: 2,
        },
    ],
};
