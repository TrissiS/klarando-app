import type {
  ReceiptAlign,
  ReceiptEmphasis,
  ReceiptItemRow,
  ReceiptLine,
  ReceiptScale,
  ReceiptTemplate80mm,
} from './receipt-template-80mm'

export type ReceiptPrintCommand =
  | {
      type: 'TEXT'
      text: string
      align: ReceiptAlign
      emphasis: ReceiptEmphasis
      scale: ReceiptScale
    }
  | {
      type: 'QR'
      value: string
      align: ReceiptAlign
      size: 'S' | 'M' | 'L'
      label?: string
    }
  | {
      type: 'FEED'
      lines: number
    }
  | {
      type: 'CUT'
    }

export type ReceiptRenderResult = {
  templateId: string
  paperWidthMm: 80
  charsPerLine: 48
  codepage: string
  commands: ReceiptPrintCommand[]
}

export type ReceiptRenderInput = {
  template: ReceiptTemplate80mm
  data?: Record<string, unknown>
  itemRows?: ReceiptItemRow[]
  includeCut?: boolean
}

function clamp(value: number, min: number, max: number) {
  return Math.max(min, Math.min(max, value))
}

function normalizeWhitespace(value: string) {
  return value.replace(/\s+/g, ' ').trim()
}

function getPathValue(source: unknown, path: string): unknown {
  if (!source || typeof source !== 'object') {
    return undefined
  }

  const segments = path.split('.').filter(Boolean)
  let current: unknown = source
  for (const segment of segments) {
    if (!current || typeof current !== 'object') {
      return undefined
    }
    const next = (current as Record<string, unknown>)[segment]
    current = next
  }
  return current
}

function toPrintableString(value: unknown) {
  if (value === null || value === undefined) {
    return ''
  }
  if (typeof value === 'string') {
    return value
  }
  if (typeof value === 'number' || typeof value === 'boolean') {
    return String(value)
  }
  return ''
}

function applyPlaceholders(input: string, data: Record<string, unknown>) {
  return input.replace(/\{\{\s*([a-zA-Z0-9_.]+)\s*\}\}/g, (_match, path: string) => {
    const value = getPathValue(data, path)
    return toPrintableString(value)
  })
}

function padOrTrimEnd(value: string, width: number) {
  if (value.length >= width) {
    return value.slice(0, width)
  }
  return value.padEnd(width, ' ')
}

function padOrTrimStart(value: string, width: number) {
  if (value.length >= width) {
    return value.slice(value.length - width)
  }
  return value.padStart(width, ' ')
}

function wrapText(input: string, width: number) {
  const safeWidth = Math.max(1, width)
  const source = normalizeWhitespace(input)
  if (!source) {
    return ['']
  }

  const words = source.split(' ')
  const lines: string[] = []
  let current = ''

  for (const word of words) {
    if (word.length > safeWidth) {
      if (current) {
        lines.push(current)
        current = ''
      }
      for (let index = 0; index < word.length; index += safeWidth) {
        lines.push(word.slice(index, index + safeWidth))
      }
      continue
    }

    if (!current) {
      current = word
      continue
    }

    if ((current + ' ' + word).length <= safeWidth) {
      current = `${current} ${word}`
      continue
    }

    lines.push(current)
    current = word
  }

  if (current) {
    lines.push(current)
  }

  return lines.length > 0 ? lines : ['']
}

function renderKeyValueLines(
  line: Extract<ReceiptLine, { type: 'KEY_VALUE' }>,
  data: Record<string, unknown>,
  charsPerLine: number
) {
  const keyRaw = applyPlaceholders(line.key, data)
  const valueRaw = applyPlaceholders(line.value, data)
  const keyWidth = clamp(line.keyWidth ?? 20, 6, charsPerLine - 4)
  const valueWidth = charsPerLine - keyWidth - 1
  const keyLines = wrapText(keyRaw, keyWidth)
  const valueLines = wrapText(valueRaw, valueWidth)
  const rowCount = Math.max(keyLines.length, valueLines.length)
  const rendered: string[] = []

  for (let index = 0; index < rowCount; index += 1) {
    const keyPart = padOrTrimEnd(keyLines[index] ?? '', keyWidth)
    const valueSource = valueLines[index] ?? ''
    const valuePart =
      line.valueAlign === 'LEFT'
        ? padOrTrimEnd(valueSource, valueWidth)
        : padOrTrimStart(valueSource, valueWidth)
    rendered.push(`${keyPart} ${valuePart}`)
  }

  return rendered
}

function resolveItemRows(
  line: Extract<ReceiptLine, { type: 'ITEMS' }>,
  data: Record<string, unknown>,
  overrideRows?: ReceiptItemRow[]
) {
  const rows = overrideRows && overrideRows.length > 0 ? overrideRows : line.rows
  return rows.map((entry) => ({
    qty: applyPlaceholders(entry.qty, data),
    label: applyPlaceholders(entry.label, data),
    price: applyPlaceholders(entry.price, data),
    modifiers: (entry.modifiers ?? []).map((modifier) => applyPlaceholders(modifier, data)),
  }))
}

function renderItemLines(
  line: Extract<ReceiptLine, { type: 'ITEMS' }>,
  data: Record<string, unknown>,
  charsPerLine: number,
  overrideRows?: ReceiptItemRow[]
) {
  const qtyWidth = clamp(line.qtyWidth ?? 5, 3, 10)
  const priceWidth = clamp(line.priceWidth ?? 10, 0, 14)
  const hasPrice = priceWidth > 0
  const labelWidth = Math.max(
    8,
    charsPerLine - qtyWidth - (hasPrice ? priceWidth : 0) - (hasPrice ? 2 : 1)
  )

  const rows = resolveItemRows(line, data, overrideRows)
  const lines: string[] = []

  for (const row of rows) {
    const qty = padOrTrimEnd(normalizeWhitespace(row.qty), qtyWidth)
    const labelParts = wrapText(row.label, labelWidth)
    const price = hasPrice ? padOrTrimStart(normalizeWhitespace(row.price), priceWidth) : ''

    labelParts.forEach((labelPart, labelIndex) => {
      const qtyPart = labelIndex === 0 ? qty : ''.padEnd(qtyWidth, ' ')
      const labelText = padOrTrimEnd(labelPart, labelWidth)
      if (hasPrice) {
        const pricePart = labelIndex === 0 ? price : ''.padStart(priceWidth, ' ')
        lines.push(`${qtyPart} ${labelText} ${pricePart}`)
      } else {
        lines.push(`${qtyPart} ${labelText}`)
      }
    })

    for (const modifier of row.modifiers ?? []) {
      const modifierParts = wrapText(`+ ${modifier}`, labelWidth)
      for (const modifierPart of modifierParts) {
        const qtyPart = ''.padEnd(qtyWidth, ' ')
        const labelText = padOrTrimEnd(modifierPart, labelWidth)
        if (hasPrice) {
          lines.push(`${qtyPart} ${labelText} ${''.padStart(priceWidth, ' ')}`)
        } else {
          lines.push(`${qtyPart} ${labelText}`)
        }
      }
    }
  }

  return lines
}

function toTextCommand(
  text: string,
  align: ReceiptAlign = 'LEFT',
  emphasis: ReceiptEmphasis = 'NORMAL',
  scale: ReceiptScale = 'M'
): ReceiptPrintCommand {
  return {
    type: 'TEXT',
    text,
    align,
    emphasis,
    scale,
  }
}

export function renderReceipt80mm(input: ReceiptRenderInput): ReceiptRenderResult {
  const data = input.data ?? {}
  const commands: ReceiptPrintCommand[] = []
  const charsPerLine = input.template.charsPerLine

  for (const block of input.template.blocks) {
    if (block.type === 'TEXT') {
      const resolved = applyPlaceholders(block.text, data)
      const wrapped = wrapText(resolved, charsPerLine)
      for (const lineText of wrapped) {
        commands.push(
          toTextCommand(
            lineText,
            block.align ?? 'LEFT',
            block.emphasis ?? 'NORMAL',
            block.scale ?? 'M'
          )
        )
      }
      continue
    }

    if (block.type === 'KEY_VALUE') {
      const lines = renderKeyValueLines(block, data, charsPerLine)
      for (const lineText of lines) {
        commands.push(toTextCommand(lineText, 'LEFT', 'NORMAL', 'M'))
      }
      continue
    }

    if (block.type === 'ITEMS') {
      const lines = renderItemLines(block, data, charsPerLine, input.itemRows)
      for (const lineText of lines) {
        commands.push(toTextCommand(lineText, 'LEFT', 'NORMAL', 'M'))
      }
      continue
    }

    if (block.type === 'DIVIDER') {
      const dividerChar = block.char ?? '-'
      commands.push(toTextCommand(dividerChar.repeat(charsPerLine), 'LEFT', 'NORMAL', 'M'))
      continue
    }

    if (block.type === 'SPACER') {
      commands.push({
        type: 'FEED',
        lines: clamp(block.lines ?? 1, 1, 8),
      })
      continue
    }

    if (block.type === 'QR') {
      const qrValue = applyPlaceholders(block.value, data)
      if (qrValue) {
        commands.push({
          type: 'QR',
          value: qrValue,
          align: block.align ?? 'CENTER',
          size: block.size ?? 'M',
          label: block.label ? applyPlaceholders(block.label, data) : undefined,
        })
      }
      continue
    }
  }

  if (input.includeCut ?? input.template.autoCut) {
    commands.push({ type: 'CUT' })
  }

  return {
    templateId: input.template.templateId,
    paperWidthMm: input.template.paperWidthMm,
    charsPerLine: input.template.charsPerLine,
    codepage: input.template.codepage,
    commands,
  }
}

