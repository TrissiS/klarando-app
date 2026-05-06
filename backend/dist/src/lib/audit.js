"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.writeAuditLog = writeAuditLog;
exports.parseUserRole = parseUserRole;
const client_1 = require("@prisma/client");
const prisma_1 = require("./prisma");
async function writeAuditLog(params) {
    const actor = params.req.authUser;
    const headerEmail = params.req.header('x-user-email') || null;
    try {
        await prisma_1.prisma.auditLog.create({
            data: {
                actorUserId: actor?.id || null,
                actorEmail: actor?.email || headerEmail,
                actorRole: actor?.role || null,
                chainId: params.chainId ?? actor?.chainId ?? null,
                tenantId: params.tenantId ?? actor?.tenantId ?? null,
                module: params.module,
                action: params.action,
                targetType: params.targetType || null,
                targetId: params.targetId || null,
                metadata: params.metadata,
            },
        });
    }
    catch (error) {
        console.error('AUDIT LOG ERROR:', error);
    }
}
function parseUserRole(value) {
    if (Object.values(client_1.UserRole).includes(value)) {
        return value;
    }
    return null;
}
