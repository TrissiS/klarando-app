"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.renderReceipt80mm = renderReceipt80mm;
function clamp(value, min, max) {
    return Math.max(min, Math.min(max, value));
}
function normalizeWhitespace(value) {
    return value.replace(/\s+/g, ' ').trim();
}
function getPathValue(source, path) {
    if (!source || typeof source !== 'object') {
        return undefined;
    }
    const segments = path.split('.').filter(Boolean);
    let current = source;
    for (const segment of segments) {
        if (!current || typeof current !== 'object') {
            return undefined;
        }
        const next = current[segment];
        current = next;
    }
    return current;
}
function toPrintableString(value) {
    if (value === null || value === undefined) {
        return '';
    }
    if (typeof value === 'string') {
        return value;
    }
    if (typeof value === 'number' || typeof value === 'boolean') {
        return String(value);
    }
    return '';
}
function applyPlaceholders(input, data) {
    return input.replace(/\{\{\s*([a-zA-Z0-9_.]+)\s*\}\}/g, (_match, path) => {
        const value = getPathValue(data, path);
        return toPrintableString(value);
    });
}
function padOrTrimEnd(value, width) {
    if (value.length >= width) {
        return value.slice(0, width);
    }
    return value.padEnd(width, ' ');
}
function padOrTrimStart(value, width) {
    if (value.length >= width) {
        return value.slice(value.length - width);
    }
    return value.padStart(width, ' ');
}
function wrapText(input, width) {
    const safeWidth = Math.max(1, width);
    const source = normalizeWhitespace(input);
    if (!source) {
        return [''];
    }
    const words = source.split(' ');
    const lines = [];
    let current = '';
    for (const word of words) {
        if (word.length > safeWidth) {
            if (current) {
                lines.push(current);
                current = '';
            }
            for (let index = 0; index < word.length; index += safeWidth) {
                lines.push(word.slice(index, index + safeWidth));
            }
            continue;
        }
        if (!current) {
            current = word;
            continue;
        }
        if ((current + ' ' + word).length <= safeWidth) {
            current = `${current} ${word}`;
            continue;
        }
        lines.push(current);
        current = word;
    }
    if (current) {
        lines.push(current);
    }
    return lines.length > 0 ? lines : [''];
}
function renderKeyValueLines(line, data, charsPerLine) {
    const keyRaw = applyPlaceholders(line.key, data);
    const valueRaw = applyPlaceholders(line.value, data);
    const keyWidth = clamp(line.keyWidth ?? 20, 6, charsPerLine - 4);
    const valueWidth = charsPerLine - keyWidth - 1;
    const keyLines = wrapText(keyRaw, keyWidth);
    const valueLines = wrapText(valueRaw, valueWidth);
    const rowCount = Math.max(keyLines.length, valueLines.length);
    const rendered = [];
    for (let index = 0; index < rowCount; index += 1) {
        const keyPart = padOrTrimEnd(keyLines[index] ?? '', keyWidth);
        const valueSource = valueLines[index] ?? '';
        const valuePart = line.valueAlign === 'LEFT'
            ? padOrTrimEnd(valueSource, valueWidth)
            : padOrTrimStart(valueSource, valueWidth);
        rendered.push(`${keyPart} ${valuePart}`);
    }
    return rendered;
}
function resolveItemRows(line, data, overrideRows) {
    const rows = overrideRows && overrideRows.length > 0 ? overrideRows : line.rows;
    return rows.map((entry) => ({
        qty: applyPlaceholders(entry.qty, data),
        label: applyPlaceholders(entry.label, data),
        price: applyPlaceholders(entry.price, data),
        modifiers: (entry.modifiers ?? []).map((modifier) => applyPlaceholders(modifier, data)),
    }));
}
function renderItemLines(line, data, charsPerLine, overrideRows) {
    const qtyWidth = clamp(line.qtyWidth ?? 5, 3, 10);
    const priceWidth = clamp(line.priceWidth ?? 10, 0, 14);
    const hasPrice = priceWidth > 0;
    const labelWidth = Math.max(8, charsPerLine - qtyWidth - (hasPrice ? priceWidth : 0) - (hasPrice ? 2 : 1));
    const rows = resolveItemRows(line, data, overrideRows);
    const lines = [];
    for (const row of rows) {
        const qty = padOrTrimEnd(normalizeWhitespace(row.qty), qtyWidth);
        const labelParts = wrapText(row.label, labelWidth);
        const price = hasPrice ? padOrTrimStart(normalizeWhitespace(row.price), priceWidth) : '';
        labelParts.forEach((labelPart, labelIndex) => {
            const qtyPart = labelIndex === 0 ? qty : ''.padEnd(qtyWidth, ' ');
            const labelText = padOrTrimEnd(labelPart, labelWidth);
            if (hasPrice) {
                const pricePart = labelIndex === 0 ? price : ''.padStart(priceWidth, ' ');
                lines.push(`${qtyPart} ${labelText} ${pricePart}`);
            }
            else {
                lines.push(`${qtyPart} ${labelText}`);
            }
        });
        for (const modifier of row.modifiers ?? []) {
            const modifierParts = wrapText(`+ ${modifier}`, labelWidth);
            for (const modifierPart of modifierParts) {
                const qtyPart = ''.padEnd(qtyWidth, ' ');
                const labelText = padOrTrimEnd(modifierPart, labelWidth);
                if (hasPrice) {
                    lines.push(`${qtyPart} ${labelText} ${''.padStart(priceWidth, ' ')}`);
                }
                else {
                    lines.push(`${qtyPart} ${labelText}`);
                }
            }
        }
    }
    return lines;
}
function toTextCommand(text, align = 'LEFT', emphasis = 'NORMAL', scale = 'M') {
    return {
        type: 'TEXT',
        text,
        align,
        emphasis,
        scale,
    };
}
function renderReceipt80mm(input) {
    const data = input.data ?? {};
    const commands = [];
    const charsPerLine = input.template.charsPerLine;
    for (const block of input.template.blocks) {
        if (block.type === 'TEXT') {
            const resolved = applyPlaceholders(block.text, data);
            const wrapped = wrapText(resolved, charsPerLine);
            for (const lineText of wrapped) {
                commands.push(toTextCommand(lineText, block.align ?? 'LEFT', block.emphasis ?? 'NORMAL', block.scale ?? 'M'));
            }
            continue;
        }
        if (block.type === 'KEY_VALUE') {
            const lines = renderKeyValueLines(block, data, charsPerLine);
            for (const lineText of lines) {
                commands.push(toTextCommand(lineText, 'LEFT', 'NORMAL', 'M'));
            }
            continue;
        }
        if (block.type === 'ITEMS') {
            const lines = renderItemLines(block, data, charsPerLine, input.itemRows);
            for (const lineText of lines) {
                commands.push(toTextCommand(lineText, 'LEFT', 'NORMAL', 'M'));
            }
            continue;
        }
        if (block.type === 'DIVIDER') {
            const dividerChar = block.char ?? '-';
            commands.push(toTextCommand(dividerChar.repeat(charsPerLine), 'LEFT', 'NORMAL', 'M'));
            continue;
        }
        if (block.type === 'SPACER') {
            commands.push({
                type: 'FEED',
                lines: clamp(block.lines ?? 1, 1, 8),
            });
            continue;
        }
        if (block.type === 'QR') {
            const qrValue = applyPlaceholders(block.value, data);
            if (qrValue) {
                commands.push({
                    type: 'QR',
                    value: qrValue,
                    align: block.align ?? 'CENTER',
                    size: block.size ?? 'M',
                    label: block.label ? applyPlaceholders(block.label, data) : undefined,
                });
            }
            continue;
        }
    }
    if (input.includeCut ?? input.template.autoCut) {
        commands.push({ type: 'CUT' });
    }
    return {
        templateId: input.template.templateId,
        paperWidthMm: input.template.paperWidthMm,
        charsPerLine: input.template.charsPerLine,
        codepage: input.template.codepage,
        commands,
    };
}
