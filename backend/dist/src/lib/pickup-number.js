"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.generateNextPickupNumberForTenant = generateNextPickupNumberForTenant;
const prisma_1 = require("./prisma");
function resolvePickupWindowStart(now) {
    const start = new Date(now);
    if (now.getHours() >= 12) {
        start.setHours(12, 0, 0, 0);
    }
    else {
        start.setHours(0, 0, 0, 0);
    }
    return start;
}
async function generateNextPickupNumberForTenant(tenantId, now = new Date()) {
    const windowStart = resolvePickupWindowStart(now);
    const lastOrder = await prisma_1.prisma.order.findFirst({
        where: {
            tenantId,
            pickupNumber: {
                not: null,
            },
            createdAt: {
                gte: windowStart,
            },
        },
        select: {
            pickupNumber: true,
            createdAt: true,
        },
        orderBy: [{ createdAt: 'desc' }],
    });
    const last = lastOrder?.pickupNumber ?? 0;
    return (last % 999) + 1;
}
