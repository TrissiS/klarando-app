"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.resolveDisplayRouting = resolveDisplayRouting;
const prisma_1 = require("./prisma");
function parseStoredIdList(value) {
    if (!value) {
        return [];
    }
    return Array.from(new Set(value
        .split(',')
        .map((entry) => entry.trim())
        .filter((entry) => entry.length > 0)));
}
function hasDisplayTerminalScope(sourceTerminalIds) {
    return typeof sourceTerminalIds === 'string' && sourceTerminalIds.trim().length > 0;
}
async function resolveDisplayRouting(params) {
    const displays = await prisma_1.prisma.orderDisplay.findMany({
        where: {
            tenantId: params.tenantId,
            isActive: true,
            displayRole: {
                in: ['CASH', 'KITCHEN', 'PICKUP'],
            },
        },
        select: {
            id: true,
            displayRole: true,
            sourceTerminalIds: true,
            updatedAt: true,
            createdAt: true,
        },
        orderBy: [{ updatedAt: 'desc' }, { createdAt: 'desc' }],
    });
    function pickDisplayId(role) {
        const candidates = displays.filter((entry) => entry.displayRole === role);
        if (candidates.length === 0) {
            return null;
        }
        if (params.terminalId) {
            const scopedMatch = candidates.find((entry) => parseStoredIdList(entry.sourceTerminalIds).includes(params.terminalId));
            if (scopedMatch) {
                return scopedMatch.id;
            }
        }
        const unrestricted = candidates.find((entry) => !hasDisplayTerminalScope(entry.sourceTerminalIds));
        return unrestricted?.id ?? candidates[0].id;
    }
    return {
        cashDisplayId: pickDisplayId('CASH'),
        kitchenDisplayId: pickDisplayId('KITCHEN'),
        pickupDisplayId: pickDisplayId('PICKUP'),
    };
}
