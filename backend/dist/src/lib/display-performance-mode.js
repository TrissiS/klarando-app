"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.parseDisplayMetaFromNotes = parseDisplayMetaFromNotes;
exports.applyPerformanceModeToNotes = applyPerformanceModeToNotes;
const META_PREFIX = '@@klarando-display-meta:';
function parseDisplayMetaFromNotes(notes) {
    if (!notes) {
        return {};
    }
    const firstLine = notes.split('\n')[0]?.trim() || '';
    if (!firstLine.startsWith(META_PREFIX)) {
        return {};
    }
    const encoded = firstLine.slice(META_PREFIX.length).trim();
    try {
        const parsed = JSON.parse(encoded);
        if (parsed.performanceMode === 'AUTO' ||
            parsed.performanceMode === 'NORMAL' ||
            parsed.performanceMode === 'LOW') {
            return parsed;
        }
        return {};
    }
    catch {
        return {};
    }
}
function applyPerformanceModeToNotes(notes, performanceMode) {
    const nextMeta = { performanceMode };
    const metaLine = `${META_PREFIX}${JSON.stringify(nextMeta)}`;
    const raw = notes || '';
    const lines = raw.split('\n');
    const firstLine = lines[0]?.trim() || '';
    if (firstLine.startsWith(META_PREFIX)) {
        lines[0] = metaLine;
        return lines.join('\n');
    }
    if (!raw.trim()) {
        return metaLine;
    }
    return `${metaLine}\n${raw}`;
}
