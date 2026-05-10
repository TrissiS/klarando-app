"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const client_1 = require("@prisma/client");
const prisma_1 = require("../lib/prisma");
const auth_1 = require("../middleware/auth");
const audit_1 = require("../lib/audit");
const database_provisioning_1 = require("../lib/database-provisioning");
const payout_profile_1 = require("../lib/payout-profile");
const router = (0, express_1.Router)();
router.get('/', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_READ), async (req, res) => {
    try {
        const actor = req.authUser;
        if (actor?.role === client_1.UserRole.ADMIN || actor?.role === client_1.UserRole.STAFF) {
            return res.json([]);
        }
        const where = actor?.role === client_1.UserRole.CHAINADMIN && actor.chainId
            ? { id: actor.chainId }
            : undefined;
        const chains = await prisma_1.prisma.chain.findMany({
            where,
            orderBy: { createdAt: 'desc' },
        });
        return res.json(chains);
    }
    catch (error) {
        console.error('GET CHAINS ERROR:', error);
        return res.status(500).json({ error: 'Ketten konnten nicht geladen werden' });
    }
});
router.post('/', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_WRITE), async (req, res) => {
    try {
        const actor = req.authUser;
        if (actor && actor.role !== client_1.UserRole.SUPERADMIN) {
            return res.status(403).json({ error: 'Nur SUPERADMIN darf Ketten erstellen' });
        }
        const { name, code, payoutAccountHolder, payoutBankName, payoutIban, payoutBic, payoutEmail, payoutReference, } = req.body;
        if (!name || !code) {
            return res.status(400).json({ error: 'name und code sind erforderlich' });
        }
        const defaults = (0, payout_profile_1.readDefaultPayoutProfile)();
        const parsedPayoutPatch = (0, payout_profile_1.normalizePayoutFieldPatch)({
            payoutAccountHolder,
            payoutBankName,
            payoutIban,
            payoutBic,
            payoutEmail,
            payoutReference,
        });
        if (parsedPayoutPatch.errors.length > 0) {
            return res.status(400).json({ error: parsedPayoutPatch.errors.join(', ') });
        }
        const payoutProfile = (0, payout_profile_1.mergePayoutProfile)(parsedPayoutPatch.next, defaults);
        const created = await prisma_1.prisma.chain.create({
            data: {
                name: name.trim(),
                code: code.trim().toUpperCase(),
                payoutAccountHolder: payoutProfile.payoutAccountHolder,
                payoutBankName: payoutProfile.payoutBankName,
                payoutIban: payoutProfile.payoutIban,
                payoutBic: payoutProfile.payoutBic,
                payoutEmail: payoutProfile.payoutEmail,
                payoutReference: payoutProfile.payoutReference,
            },
        });
        let provisioningResult = null;
        let provisioningWarning = null;
        try {
            provisioningResult = await (0, database_provisioning_1.provisionChainDatabase)(created.id, created.code);
        }
        catch (provisionError) {
            console.error('CHAIN DATABASE PROVISION ERROR:', provisionError);
            provisioningWarning =
                'Kette wurde erstellt, aber die automatische Datenbankanlage ist fehlgeschlagen.';
        }
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'chain',
            action: 'chain_created',
            targetType: 'chain',
            targetId: created.id,
            chainId: created.id,
            metadata: {
                name: created.name,
                code: created.code,
                payoutAssigned: true,
                separateDatabaseEnabled: provisioningResult?.enabled ?? false,
                separateDatabaseName: provisioningResult?.databaseName,
                separateDatabaseCreated: provisioningResult?.created ?? false,
                provisioningWarning,
            },
        });
        return res.status(201).json({
            ...created,
            separateDatabase: provisioningResult
                ? {
                    enabled: provisioningResult.enabled,
                    created: provisioningResult.created,
                    databaseName: provisioningResult.databaseName,
                }
                : {
                    enabled: false,
                    created: false,
                    databaseName: null,
                },
            provisioningWarning,
        });
    }
    catch (error) {
        console.error('CREATE CHAIN ERROR:', error);
        return res.status(500).json({ error: 'Kette konnte nicht erstellt werden' });
    }
});
router.patch('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_WRITE), async (req, res) => {
    try {
        const actor = req.authUser;
        if (actor?.role !== client_1.UserRole.SUPERADMIN) {
            return res.status(403).json({ error: 'Nur SUPERADMIN darf Ketten bearbeiten' });
        }
        const chainId = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        if (!chainId) {
            return res.status(400).json({ error: 'chainId fehlt' });
        }
        const { name, code, payoutAccountHolder, payoutBankName, payoutIban, payoutBic, payoutEmail, payoutReference, } = req.body;
        const nextName = typeof name === 'string' ? name.trim() : undefined;
        const nextCode = typeof code === 'string' ? code.trim().toUpperCase() : undefined;
        const parsedPayoutPatch = (0, payout_profile_1.normalizePayoutFieldPatch)({
            payoutAccountHolder,
            payoutBankName,
            payoutIban,
            payoutBic,
            payoutEmail,
            payoutReference,
        });
        if (parsedPayoutPatch.errors.length > 0) {
            return res.status(400).json({ error: parsedPayoutPatch.errors.join(', ') });
        }
        const hasPayoutPatch = Object.keys(parsedPayoutPatch.next).length > 0;
        if (nextName === undefined && nextCode === undefined && !hasPayoutPatch) {
            return res.status(400).json({
                error: 'Mindestens name, code oder Auszahlungsdaten muessen uebergeben werden',
            });
        }
        if (nextName !== undefined && nextName.length === 0) {
            return res.status(400).json({ error: 'name darf nicht leer sein' });
        }
        if (nextCode !== undefined && nextCode.length === 0) {
            return res.status(400).json({ error: 'code darf nicht leer sein' });
        }
        const existing = await prisma_1.prisma.chain.findUnique({
            where: { id: chainId },
            select: {
                id: true,
                name: true,
                code: true,
                payoutAccountHolder: true,
                payoutBankName: true,
                payoutIban: true,
                payoutBic: true,
                payoutEmail: true,
                payoutReference: true,
            },
        });
        if (!existing) {
            return res.status(404).json({ error: 'Kette nicht gefunden' });
        }
        const updated = await prisma_1.prisma.chain.update({
            where: { id: chainId },
            data: {
                ...(nextName !== undefined ? { name: nextName } : {}),
                ...(nextCode !== undefined ? { code: nextCode } : {}),
                ...parsedPayoutPatch.next,
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'chain',
            action: 'chain_updated',
            targetType: 'chain',
            targetId: updated.id,
            chainId: updated.id,
            metadata: {
                before: {
                    name: existing.name,
                    code: existing.code,
                    payoutAccountHolder: existing.payoutAccountHolder,
                    payoutBankName: existing.payoutBankName,
                    payoutIban: existing.payoutIban,
                    payoutBic: existing.payoutBic,
                    payoutEmail: existing.payoutEmail,
                    payoutReference: existing.payoutReference,
                },
                after: {
                    name: updated.name,
                    code: updated.code,
                    payoutAccountHolder: updated.payoutAccountHolder,
                    payoutBankName: updated.payoutBankName,
                    payoutIban: updated.payoutIban,
                    payoutBic: updated.payoutBic,
                    payoutEmail: updated.payoutEmail,
                    payoutReference: updated.payoutReference,
                },
            },
        });
        return res.json(updated);
    }
    catch (error) {
        console.error('UPDATE CHAIN ERROR:', error);
        return res.status(500).json({ error: 'Kette konnte nicht aktualisiert werden' });
    }
});
router.delete('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_WRITE), async (req, res) => {
    try {
        const actor = req.authUser;
        if (actor?.role !== client_1.UserRole.SUPERADMIN) {
            return res.status(403).json({ error: 'Nur SUPERADMIN darf Ketten loeschen' });
        }
        const chainId = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        if (!chainId) {
            return res.status(400).json({ error: 'chainId fehlt' });
        }
        const chain = await prisma_1.prisma.chain.findUnique({
            where: {
                id: chainId,
            },
            select: {
                id: true,
                name: true,
                code: true,
                _count: {
                    select: {
                        tenants: true,
                    },
                },
            },
        });
        if (!chain) {
            return res.status(404).json({ error: 'Kette nicht gefunden' });
        }
        if (chain._count.tenants > 0) {
            return res.status(409).json({
                error: 'Kette kann nicht geloescht werden, solange noch Filialen zugeordnet sind',
            });
        }
        const releasedDatabase = await (0, database_provisioning_1.releaseChainDatabaseToUnassigned)(chain.id, `freigegeben_von_kette_${chain.code.toLowerCase()}`);
        await prisma_1.prisma.chain.delete({
            where: {
                id: chain.id,
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'chain',
            action: 'chain_deleted',
            targetType: 'chain',
            targetId: chain.id,
            metadata: {
                name: chain.name,
                code: chain.code,
                releasedDatabaseName: releasedDatabase?.databaseName || null,
            },
        });
        return res.json({
            ok: true,
            chainId: chain.id,
            chainName: chain.name,
            releasedDatabaseName: releasedDatabase?.databaseName || null,
        });
    }
    catch (error) {
        console.error('DELETE CHAIN ERROR:', error);
        return res.status(500).json({ error: 'Kette konnte nicht geloescht werden' });
    }
});
exports.default = router;
