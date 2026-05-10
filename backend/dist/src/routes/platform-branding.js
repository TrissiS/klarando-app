"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const client_1 = require("@prisma/client");
const express_1 = require("express");
const audit_1 = require("../lib/audit");
const platform_branding_1 = require("../lib/platform-branding");
const auth_1 = require("../middleware/auth");
const router = (0, express_1.Router)();
router.get('/', (0, auth_1.requirePermission)(client_1.PermissionKey.SETTINGS_READ), async (_req, res) => {
    try {
        const settings = await (0, platform_branding_1.readPlatformBrandingSettings)();
        return res.json(settings);
    }
    catch (error) {
        console.error('GET PLATFORM BRANDING ERROR:', error);
        return res.status(500).json({ error: 'Branding-Einstellungen konnten nicht geladen werden' });
    }
});
router.put('/', (0, auth_1.requirePermission)(client_1.PermissionKey.SETTINGS_WRITE), async (req, res) => {
    try {
        if (req.authUser?.role !== client_1.UserRole.SUPERADMIN) {
            return res
                .status(403)
                .json({ error: 'Nur Superadmin darf zentrale Branding-Einstellungen ändern' });
        }
        const payload = req.body && typeof req.body === 'object' && 'settings' in req.body
            ? req.body.settings
            : req.body;
        const saved = await (0, platform_branding_1.savePlatformBrandingSettings)(payload);
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'settings',
            action: 'platform_branding_updated',
            targetType: 'platform_branding',
            targetId: 'global',
            tenantId: null,
            metadata: {
                sidebarMode: saved.sidebarMode,
                headerMode: saved.headerMode,
            },
        });
        return res.json(saved);
    }
    catch (error) {
        console.error('UPDATE PLATFORM BRANDING ERROR:', error);
        return res
            .status(500)
            .json({ error: 'Branding-Einstellungen konnten nicht gespeichert werden' });
    }
});
exports.default = router;
