import type { ReceiptPrintCommand, ReceiptRenderResult } from './receipt-renderer-80mm'

export type EscPosEncodedPayload = {
  bytes: Uint8Array
  base64: string
  hex: string
}

const ESC = 0x1b
const GS = 0x1d

const CODEPAGE_TO_ESC_T: Record<string, number> = {
  CP437: 0,
  CP850: 2,
  CP1252: 16,
  CP858: 19,
}

function clamp(value: number, min: number, max: number) {
  return Math.max(min, Math.min(max, value))
}

function normalizePrintableText(value: string) {
  return value
    .replace(/[\r\n]+/g, ' ')
    .replace(/[^\x20-\x7e\u00a0-\u00ff]/g, '')
    .replace(/Ä/g, 'Ae')
    .replace(/Ö/g, 'Oe')
    .replace(/Ü/g, 'Ue')
    .replace(/ä/g, 'ae')
    .replace(/ö/g, 'oe')
    .replace(/ü/g, 'ue')
    .replace(/ß/g, 'ss')
}

function alignByte(value: 'LEFT' | 'CENTER' | 'RIGHT') {
  if (value === 'CENTER') return 1
  if (value === 'RIGHT') return 2
  return 0
}

function fontByte(scale: 'S' | 'M' | 'L' | 'XL') {
  return scale === 'S' ? 1 : 0
}

function sizeByte(scale: 'S' | 'M' | 'L' | 'XL') {
  if (scale === 'L') {
    return 0x11
  }
  if (scale === 'XL') {
    return 0x22
  }
  return 0x00
}

function qrModuleSize(size: 'S' | 'M' | 'L') {
  if (size === 'S') return 4
  if (size === 'L') return 8
  return 6
}

function pushArray(target: number[], values: number[]) {
  target.push(...values)
}

function encodeTextBytes(text: string) {
  const encoder = new TextEncoder()
  return Array.from(encoder.encode(normalizePrintableText(text)))
}

function encodeLine(target: number[], text: string) {
  pushArray(target, encodeTextBytes(text))
  target.push(0x0a)
}

function encodeQr(target: number[], value: string, size: 'S' | 'M' | 'L') {
  const data = encodeTextBytes(value)
  const moduleSize = qrModuleSize(size)
  const contentLength = data.length + 3
  const pL = contentLength & 0xff
  const pH = (contentLength >> 8) & 0xff

  pushArray(target, [GS, 0x28, 0x6b, 0x04, 0x00, 0x31, 0x41, 0x32, 0x00])
  pushArray(target, [GS, 0x28, 0x6b, 0x03, 0x00, 0x31, 0x43, moduleSize])
  pushArray(target, [GS, 0x28, 0x6b, 0x03, 0x00, 0x31, 0x45, 0x30])
  pushArray(target, [GS, 0x28, 0x6b, pL, pH, 0x31, 0x50, 0x30, ...data])
  pushArray(target, [GS, 0x28, 0x6b, 0x03, 0x00, 0x31, 0x51, 0x30])
  target.push(0x0a)
}

function encodeCommand(target: number[], command: ReceiptPrintCommand) {
  if (command.type === 'TEXT') {
    pushArray(target, [ESC, 0x61, alignByte(command.align)])
    pushArray(target, [ESC, 0x45, command.emphasis === 'BOLD' ? 1 : 0])
    pushArray(target, [ESC, 0x4d, fontByte(command.scale)])
    pushArray(target, [GS, 0x21, sizeByte(command.scale)])
    encodeLine(target, command.text)
    return
  }

  if (command.type === 'FEED') {
    pushArray(target, [ESC, 0x64, clamp(command.lines, 0, 255)])
    return
  }

  if (command.type === 'QR') {
    pushArray(target, [ESC, 0x61, alignByte(command.align)])
    if (command.label) {
      encodeLine(target, command.label)
    }
    encodeQr(target, command.value, command.size)
  }
}

function toHex(bytes: Uint8Array) {
  return Array.from(bytes)
    .map((value) => value.toString(16).padStart(2, '0'))
    .join('')
}

export function encodeReceiptToEscPosBytes(renderResult: ReceiptRenderResult): EscPosEncodedPayload {
  const bytes: number[] = []

  // Initialize printer.
  pushArray(bytes, [ESC, 0x40])
  const codepage = renderResult.codepage.toUpperCase()
  const escPage = CODEPAGE_TO_ESC_T[codepage]
  if (typeof escPage === 'number') {
    pushArray(bytes, [ESC, 0x74, escPage])
  }

  for (const command of renderResult.commands) {
    if (command.type === 'CUT') {
      pushArray(bytes, [ESC, 0x64, 3, GS, 0x56, 0x01])
      continue
    }
    encodeCommand(bytes, command)
  }

  const payload = new Uint8Array(bytes)
  return {
    bytes: payload,
    base64: Buffer.from(payload).toString('base64'),
    hex: toHex(payload),
  }
}
