export type ReceiptKind = 'CUSTOMER' | 'KITCHEN'
export type ReceiptAlign = 'LEFT' | 'CENTER' | 'RIGHT'
export type ReceiptEmphasis = 'NORMAL' | 'BOLD'
export type ReceiptScale = 'S' | 'M' | 'L' | 'XL'
export type ReceiptCodepage = 'UTF8' | 'CP437' | 'CP850' | 'CP858' | 'CP1252'

export type ReceiptTextLine = {
  type: 'TEXT'
  text: string
  align?: ReceiptAlign
  emphasis?: ReceiptEmphasis
  scale?: ReceiptScale
}

export type ReceiptKeyValueLine = {
  type: 'KEY_VALUE'
  key: string
  value: string
  keyWidth?: number
  valueAlign?: Exclude<ReceiptAlign, 'CENTER'>
}

export type ReceiptItemRow = {
  qty: string
  label: string
  price: string
  modifiers?: string[]
}

export type ReceiptItemsBlock = {
  type: 'ITEMS'
  qtyWidth?: number
  priceWidth?: number
  rows: ReceiptItemRow[]
}

export type ReceiptDividerLine = {
  type: 'DIVIDER'
  char?: '-' | '=' | '_'
}

export type ReceiptSpacerLine = {
  type: 'SPACER'
  lines?: number
}

export type ReceiptQrLine = {
  type: 'QR'
  value: string
  size?: 'S' | 'M' | 'L'
  align?: ReceiptAlign
  label?: string
}

export type ReceiptLine =
  | ReceiptTextLine
  | ReceiptKeyValueLine
  | ReceiptItemsBlock
  | ReceiptDividerLine
  | ReceiptSpacerLine
  | ReceiptQrLine

export type ReceiptTemplate80mm = {
  templateId: string
  version: string
  kind: ReceiptKind
  paperWidthMm: 80
  charsPerLine: 48
  codepage: ReceiptCodepage
  autoCut: boolean
  blocks: ReceiptLine[]
}

export const CUSTOMER_RECEIPT_TEMPLATE_80MM: ReceiptTemplate80mm = {
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
}

export const KITCHEN_RECEIPT_TEMPLATE_80MM: ReceiptTemplate80mm = {
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
}
