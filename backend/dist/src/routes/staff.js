"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const client_1 = require("@prisma/client");
const express_1 = require("express");
const prisma_1 = require("../lib/prisma");
const auth_1 = require("../middleware/auth");
const audit_1 = require("../lib/audit");
const router = (0, express_1.Router)();
function normalizeText(value) {
    if (!value) {
        return null;
    }
    const trimmed = value.trim();
    return trimmed.length > 0 ? trimmed : null;
}
function normalizeDateOnly(value) {
    if (!value) {
        return null;
    }
    const date = new Date(value);
    if (Number.isNaN(date.getTime())) {
        return null;
    }
    return new Date(Date.UTC(date.getUTCFullYear(), date.getUTCMonth(), date.getUTCDate()));
}
function parseTime(value) {
    if (!value) {
        return null;
    }
    if (!/^\d{2}:\d{2}$/.test(value)) {
        return null;
    }
    const [hourText, minuteText] = value.split(':');
    const hour = Number(hourText);
    const minute = Number(minuteText);
    if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
        return null;
    }
    return `${hourText}:${minuteText}`;
}
function calculateShiftHours(startTime, endTime, breakMinutes) {
    const [startHour, startMinute] = startTime.split(':').map(Number);
    const [endHour, endMinute] = endTime.split(':').map(Number);
    const startTotal = startHour * 60 + startMinute;
    const endTotal = endHour * 60 + endMinute;
    const rawMinutes = endTotal - startTotal;
    if (rawMinutes <= 0) {
        return null;
    }
    const effective = rawMinutes - breakMinutes;
    if (effective < 0) {
        return null;
    }
    return Number((effective / 60).toFixed(2));
}
router.get('/settings', (0, auth_1.requirePermission)(client_1.PermissionKey.SETTINGS_READ), async (req, res) => {
    try {
        const tenantId = req.query.tenantId;
        if (!tenantId) {
            return res.status(400).json({ error: 'tenantId fehlt' });
        }
        const settings = await prisma_1.prisma.staffSetting.upsert({
            where: { tenantId },
            update: {},
            create: {
                tenantId,
            },
        });
        return res.json(settings);
    }
    catch (error) {
        console.error('GET STAFF SETTINGS ERROR:', error);
        return res.status(500).json({ error: 'Mitarbeiter-Einstellungen konnten nicht geladen werden' });
    }
});
router.put('/settings', (0, auth_1.requirePermission)(client_1.PermissionKey.SETTINGS_WRITE), async (req, res) => {
    try {
        const { tenantId, planningDays, defaultShiftStart, defaultShiftEnd, defaultBreakMinutes, overtimeThresholdHours, } = req.body;
        if (!tenantId) {
            return res.status(400).json({ error: 'tenantId fehlt' });
        }
        const normalizedStart = parseTime(defaultShiftStart || null);
        const normalizedEnd = parseTime(defaultShiftEnd || null);
        if (!normalizedStart || !normalizedEnd) {
            return res.status(400).json({ error: 'Ungueltige Start-/Endzeit (HH:mm)' });
        }
        const normalizedPlanningDays = Number(planningDays);
        const normalizedBreak = Number(defaultBreakMinutes);
        if (!Number.isInteger(normalizedPlanningDays) || normalizedPlanningDays < 1 || normalizedPlanningDays > 90) {
            return res.status(400).json({ error: 'planningDays muss zwischen 1 und 90 liegen' });
        }
        if (!Number.isInteger(normalizedBreak) || normalizedBreak < 0 || normalizedBreak > 240) {
            return res.status(400).json({ error: 'defaultBreakMinutes muss zwischen 0 und 240 liegen' });
        }
        const overtime = overtimeThresholdHours === null || overtimeThresholdHours === undefined
            ? null
            : Number(overtimeThresholdHours);
        if (overtime !== null && (!Number.isFinite(overtime) || overtime <= 0)) {
            return res.status(400).json({ error: 'overtimeThresholdHours muss groesser 0 sein' });
        }
        const settings = await prisma_1.prisma.staffSetting.upsert({
            where: { tenantId },
            update: {
                planningDays: normalizedPlanningDays,
                defaultShiftStart: normalizedStart,
                defaultShiftEnd: normalizedEnd,
                defaultBreakMinutes: normalizedBreak,
                overtimeThresholdHours: overtime,
            },
            create: {
                tenantId,
                planningDays: normalizedPlanningDays,
                defaultShiftStart: normalizedStart,
                defaultShiftEnd: normalizedEnd,
                defaultBreakMinutes: normalizedBreak,
                overtimeThresholdHours: overtime,
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'staff',
            action: 'settings_updated',
            targetType: 'staff_setting',
            targetId: settings.id,
            tenantId,
            metadata: {
                planningDays: settings.planningDays,
            },
        });
        return res.json(settings);
    }
    catch (error) {
        console.error('UPDATE STAFF SETTINGS ERROR:', error);
        return res.status(500).json({ error: 'Mitarbeiter-Einstellungen konnten nicht gespeichert werden' });
    }
});
router.get('/employees', (0, auth_1.requirePermission)(client_1.PermissionKey.USERS_READ), async (req, res) => {
    try {
        const tenantId = req.query.tenantId;
        if (!tenantId) {
            return res.status(400).json({ error: 'tenantId fehlt' });
        }
        const employees = await prisma_1.prisma.staffMember.findMany({
            where: { tenantId },
            orderBy: [{ isActive: 'desc' }, { name: 'asc' }],
        });
        return res.json(employees);
    }
    catch (error) {
        console.error('GET STAFF EMPLOYEES ERROR:', error);
        return res.status(500).json({ error: 'Mitarbeiter konnten nicht geladen werden' });
    }
});
router.post('/employees', (0, auth_1.requirePermission)(client_1.PermissionKey.USERS_WRITE), async (req, res) => {
    try {
        const { tenantId, name, position, phone, email, hourlyRate, weeklyTargetHours, isActive, } = req.body;
        if (!tenantId || !name) {
            return res.status(400).json({ error: 'tenantId und name sind erforderlich' });
        }
        const parsedHourlyRate = hourlyRate === undefined || hourlyRate === null ? null : Number(hourlyRate);
        const parsedWeeklyTarget = weeklyTargetHours === undefined || weeklyTargetHours === null
            ? null
            : Number(weeklyTargetHours);
        if (parsedHourlyRate !== null && (!Number.isFinite(parsedHourlyRate) || parsedHourlyRate < 0)) {
            return res.status(400).json({ error: 'hourlyRate ist ungueltig' });
        }
        if (parsedWeeklyTarget !== null && (!Number.isFinite(parsedWeeklyTarget) || parsedWeeklyTarget < 0)) {
            return res.status(400).json({ error: 'weeklyTargetHours ist ungueltig' });
        }
        const employee = await prisma_1.prisma.staffMember.create({
            data: {
                tenantId,
                name: name.trim(),
                position: normalizeText(position),
                phone: normalizeText(phone),
                email: normalizeText(email),
                hourlyRate: parsedHourlyRate,
                weeklyTargetHours: parsedWeeklyTarget,
                isActive: isActive ?? true,
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'staff',
            action: 'employee_created',
            targetType: 'staff_member',
            targetId: employee.id,
            tenantId: employee.tenantId,
            metadata: {
                name: employee.name,
            },
        });
        return res.status(201).json(employee);
    }
    catch (error) {
        console.error('CREATE STAFF EMPLOYEE ERROR:', error);
        return res.status(500).json({ error: 'Mitarbeiter konnte nicht erstellt werden' });
    }
});
router.patch('/employees/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.USERS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const { tenantId, name, position, phone, email, hourlyRate, weeklyTargetHours, isActive, } = req.body;
        if (!id || !tenantId) {
            return res.status(400).json({ error: 'id und tenantId sind erforderlich' });
        }
        const existing = await prisma_1.prisma.staffMember.findUnique({
            where: { id },
            select: { id: true, tenantId: true },
        });
        if (!existing || existing.tenantId !== tenantId) {
            return res.status(404).json({ error: 'Mitarbeiter nicht gefunden' });
        }
        const parsedHourlyRate = hourlyRate === undefined ? undefined : hourlyRate === null ? null : Number(hourlyRate);
        const parsedWeeklyTarget = weeklyTargetHours === undefined
            ? undefined
            : weeklyTargetHours === null
                ? null
                : Number(weeklyTargetHours);
        if (parsedHourlyRate !== undefined &&
            parsedHourlyRate !== null &&
            (!Number.isFinite(parsedHourlyRate) || parsedHourlyRate < 0)) {
            return res.status(400).json({ error: 'hourlyRate ist ungueltig' });
        }
        if (parsedWeeklyTarget !== undefined &&
            parsedWeeklyTarget !== null &&
            (!Number.isFinite(parsedWeeklyTarget) || parsedWeeklyTarget < 0)) {
            return res.status(400).json({ error: 'weeklyTargetHours ist ungueltig' });
        }
        const updated = await prisma_1.prisma.staffMember.update({
            where: { id },
            data: {
                name: name === undefined ? undefined : name.trim(),
                position: position === undefined ? undefined : normalizeText(position),
                phone: phone === undefined ? undefined : normalizeText(phone),
                email: email === undefined ? undefined : normalizeText(email),
                hourlyRate: parsedHourlyRate,
                weeklyTargetHours: parsedWeeklyTarget,
                isActive,
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'staff',
            action: 'employee_updated',
            targetType: 'staff_member',
            targetId: updated.id,
            tenantId: updated.tenantId,
            metadata: {
                name: updated.name,
                isActive: updated.isActive,
            },
        });
        return res.json(updated);
    }
    catch (error) {
        console.error('UPDATE STAFF EMPLOYEE ERROR:', error);
        return res.status(500).json({ error: 'Mitarbeiter konnte nicht aktualisiert werden' });
    }
});
router.get('/shifts', (0, auth_1.requirePermission)(client_1.PermissionKey.USERS_READ), async (req, res) => {
    try {
        const tenantId = req.query.tenantId;
        const employeeId = req.query.employeeId;
        const from = req.query.from;
        const to = req.query.to;
        if (!tenantId) {
            return res.status(400).json({ error: 'tenantId fehlt' });
        }
        const fromDate = from ? normalizeDateOnly(from) : null;
        const toDate = to ? normalizeDateOnly(to) : null;
        if (from && !fromDate) {
            return res.status(400).json({ error: 'from ist ungueltig' });
        }
        if (to && !toDate) {
            return res.status(400).json({ error: 'to ist ungueltig' });
        }
        const shifts = await prisma_1.prisma.staffShift.findMany({
            where: {
                tenantId,
                staffMemberId: employeeId || undefined,
                shiftDate: fromDate || toDate
                    ? {
                        gte: fromDate || undefined,
                        lte: toDate || undefined,
                    }
                    : undefined,
            },
            include: {
                staffMember: {
                    select: {
                        id: true,
                        name: true,
                        position: true,
                        isActive: true,
                        hourlyRate: true,
                    },
                },
            },
            orderBy: [{ shiftDate: 'asc' }, { startTime: 'asc' }],
        });
        return res.json(shifts);
    }
    catch (error) {
        console.error('GET STAFF SHIFTS ERROR:', error);
        return res.status(500).json({ error: 'Schichten konnten nicht geladen werden' });
    }
});
router.post('/shifts', (0, auth_1.requirePermission)(client_1.PermissionKey.USERS_WRITE), async (req, res) => {
    try {
        const { tenantId, staffMemberId, shiftDate, startTime, endTime, breakMinutes, status, note, } = req.body;
        if (!tenantId || !staffMemberId || !shiftDate || !startTime || !endTime) {
            return res.status(400).json({ error: 'Pflichtfelder fehlen' });
        }
        const parsedDate = normalizeDateOnly(shiftDate);
        if (!parsedDate) {
            return res.status(400).json({ error: 'shiftDate ist ungueltig' });
        }
        const parsedStart = parseTime(startTime);
        const parsedEnd = parseTime(endTime);
        if (!parsedStart || !parsedEnd) {
            return res.status(400).json({ error: 'Start- oder Endzeit ist ungueltig' });
        }
        const parsedBreak = Number.isFinite(Number(breakMinutes)) ? Number(breakMinutes) : 0;
        if (parsedBreak < 0 || parsedBreak > 240) {
            return res.status(400).json({ error: 'breakMinutes ist ungueltig' });
        }
        const hours = calculateShiftHours(parsedStart, parsedEnd, parsedBreak);
        if (hours === null) {
            return res.status(400).json({ error: 'Schichtdauer ist ungueltig' });
        }
        const member = await prisma_1.prisma.staffMember.findFirst({
            where: {
                id: staffMemberId,
                tenantId,
            },
            select: { id: true, name: true },
        });
        if (!member) {
            return res.status(404).json({ error: 'Mitarbeiter nicht gefunden' });
        }
        const normalizedStatus = status && Object.values(client_1.StaffShiftStatus).includes(status)
            ? status
            : client_1.StaffShiftStatus.PLANNED;
        const created = await prisma_1.prisma.staffShift.create({
            data: {
                tenantId,
                staffMemberId,
                shiftDate: parsedDate,
                startTime: parsedStart,
                endTime: parsedEnd,
                breakMinutes: parsedBreak,
                status: normalizedStatus,
                note: normalizeText(note),
                createdByUserId: req.authUser?.id || null,
            },
            include: {
                staffMember: {
                    select: {
                        id: true,
                        name: true,
                        position: true,
                        isActive: true,
                        hourlyRate: true,
                    },
                },
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'staff',
            action: 'shift_created',
            targetType: 'staff_shift',
            targetId: created.id,
            tenantId,
            metadata: {
                staffMemberId,
                hours,
            },
        });
        return res.status(201).json(created);
    }
    catch (error) {
        console.error('CREATE STAFF SHIFT ERROR:', error);
        return res.status(500).json({ error: 'Schicht konnte nicht erstellt werden' });
    }
});
router.patch('/shifts/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.USERS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const { tenantId, staffMemberId, shiftDate, startTime, endTime, breakMinutes, status, note, } = req.body;
        if (!id || !tenantId) {
            return res.status(400).json({ error: 'id und tenantId sind erforderlich' });
        }
        const existing = await prisma_1.prisma.staffShift.findUnique({
            where: { id },
            select: { id: true, tenantId: true, startTime: true, endTime: true, breakMinutes: true },
        });
        if (!existing || existing.tenantId !== tenantId) {
            return res.status(404).json({ error: 'Schicht nicht gefunden' });
        }
        if (staffMemberId) {
            const member = await prisma_1.prisma.staffMember.findFirst({
                where: { id: staffMemberId, tenantId },
                select: { id: true },
            });
            if (!member) {
                return res.status(404).json({ error: 'Mitarbeiter nicht gefunden' });
            }
        }
        let parsedDate;
        if (shiftDate !== undefined) {
            const normalizedDate = normalizeDateOnly(shiftDate);
            if (!normalizedDate) {
                return res.status(400).json({ error: 'shiftDate ist ungueltig' });
            }
            parsedDate = normalizedDate;
        }
        let parsedStart;
        if (startTime !== undefined) {
            const normalizedStart = parseTime(startTime);
            if (!normalizedStart) {
                return res.status(400).json({ error: 'startTime ist ungueltig' });
            }
            parsedStart = normalizedStart;
        }
        let parsedEnd;
        if (endTime !== undefined) {
            const normalizedEnd = parseTime(endTime);
            if (!normalizedEnd) {
                return res.status(400).json({ error: 'endTime ist ungueltig' });
            }
            parsedEnd = normalizedEnd;
        }
        const parsedBreak = breakMinutes === undefined ? undefined : Number.isFinite(Number(breakMinutes)) ? Number(breakMinutes) : null;
        if (parsedBreak !== undefined && (parsedBreak === null || parsedBreak < 0 || parsedBreak > 240)) {
            return res.status(400).json({ error: 'breakMinutes ist ungueltig' });
        }
        const checkStart = parsedStart ?? existing.startTime;
        const checkEnd = parsedEnd ?? existing.endTime;
        const checkBreak = parsedBreak ?? existing.breakMinutes;
        const hours = calculateShiftHours(checkStart, checkEnd, checkBreak);
        if (hours === null) {
            return res.status(400).json({ error: 'Schichtdauer ist ungueltig' });
        }
        let normalizedStatus;
        if (status !== undefined) {
            if (!Object.values(client_1.StaffShiftStatus).includes(status)) {
                return res.status(400).json({ error: 'status ist ungueltig' });
            }
            normalizedStatus = status;
        }
        const updated = await prisma_1.prisma.staffShift.update({
            where: { id },
            data: {
                staffMemberId,
                shiftDate: parsedDate,
                startTime: parsedStart,
                endTime: parsedEnd,
                breakMinutes: parsedBreak,
                status: normalizedStatus,
                note: note === undefined ? undefined : normalizeText(note),
            },
            include: {
                staffMember: {
                    select: {
                        id: true,
                        name: true,
                        position: true,
                        isActive: true,
                        hourlyRate: true,
                    },
                },
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'staff',
            action: 'shift_updated',
            targetType: 'staff_shift',
            targetId: updated.id,
            tenantId,
            metadata: {
                hours,
                status: updated.status,
            },
        });
        return res.json(updated);
    }
    catch (error) {
        console.error('UPDATE STAFF SHIFT ERROR:', error);
        return res.status(500).json({ error: 'Schicht konnte nicht aktualisiert werden' });
    }
});
router.delete('/shifts/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.USERS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const tenantId = req.query.tenantId;
        if (!id || !tenantId) {
            return res.status(400).json({ error: 'id und tenantId sind erforderlich' });
        }
        const existing = await prisma_1.prisma.staffShift.findUnique({
            where: { id },
            select: { id: true, tenantId: true },
        });
        if (!existing || existing.tenantId !== tenantId) {
            return res.status(404).json({ error: 'Schicht nicht gefunden' });
        }
        await prisma_1.prisma.staffShift.delete({
            where: { id },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'staff',
            action: 'shift_deleted',
            targetType: 'staff_shift',
            targetId: id,
            tenantId,
        });
        return res.json({ ok: true });
    }
    catch (error) {
        console.error('DELETE STAFF SHIFT ERROR:', error);
        return res.status(500).json({ error: 'Schicht konnte nicht geloescht werden' });
    }
});
router.get('/evaluation', (0, auth_1.requirePermission)(client_1.PermissionKey.USERS_READ), async (req, res) => {
    try {
        const tenantId = req.query.tenantId;
        const from = req.query.from;
        const to = req.query.to;
        if (!tenantId) {
            return res.status(400).json({ error: 'tenantId fehlt' });
        }
        const fromDate = from ? normalizeDateOnly(from) : null;
        const toDate = to ? normalizeDateOnly(to) : null;
        if (from && !fromDate) {
            return res.status(400).json({ error: 'from ist ungueltig' });
        }
        if (to && !toDate) {
            return res.status(400).json({ error: 'to ist ungueltig' });
        }
        const [employees, shifts] = await Promise.all([
            prisma_1.prisma.staffMember.findMany({
                where: { tenantId },
                orderBy: [{ name: 'asc' }],
            }),
            prisma_1.prisma.staffShift.findMany({
                where: {
                    tenantId,
                    shiftDate: fromDate || toDate
                        ? {
                            gte: fromDate || undefined,
                            lte: toDate || undefined,
                        }
                        : undefined,
                },
                orderBy: [{ shiftDate: 'asc' }, { startTime: 'asc' }],
            }),
        ]);
        const byEmployee = new Map(employees.map((employee) => [
            employee.id,
            {
                employeeId: employee.id,
                name: employee.name,
                position: employee.position,
                isActive: employee.isActive,
                plannedHours: 0,
                completedHours: 0,
                canceledHours: 0,
                plannedShifts: 0,
                completedShifts: 0,
                canceledShifts: 0,
                targetHours: employee.weeklyTargetHours ? Number(employee.weeklyTargetHours) : null,
                hourlyRate: employee.hourlyRate ? Number(employee.hourlyRate) : null,
                estimatedLaborCost: 0,
            },
        ]));
        for (const shift of shifts) {
            const row = byEmployee.get(shift.staffMemberId);
            if (!row) {
                continue;
            }
            const hours = calculateShiftHours(shift.startTime, shift.endTime, shift.breakMinutes) || 0;
            if (shift.status === client_1.StaffShiftStatus.CANCELED) {
                row.canceledShifts += 1;
                row.canceledHours += hours;
            }
            else if (shift.status === client_1.StaffShiftStatus.COMPLETED) {
                row.completedShifts += 1;
                row.completedHours += hours;
            }
            else {
                row.plannedShifts += 1;
                row.plannedHours += hours;
            }
        }
        const rows = Array.from(byEmployee.values()).map((row) => {
            const totalWorkedHours = row.completedHours + row.plannedHours;
            const estimatedLaborCost = row.hourlyRate === null ? null : Number((row.hourlyRate * totalWorkedHours).toFixed(2));
            return {
                ...row,
                plannedHours: Number(row.plannedHours.toFixed(2)),
                completedHours: Number(row.completedHours.toFixed(2)),
                canceledHours: Number(row.canceledHours.toFixed(2)),
                estimatedLaborCost,
            };
        });
        const totals = rows.reduce((acc, row) => {
            acc.plannedHours += row.plannedHours;
            acc.completedHours += row.completedHours;
            acc.canceledHours += row.canceledHours;
            acc.plannedShifts += row.plannedShifts;
            acc.completedShifts += row.completedShifts;
            acc.canceledShifts += row.canceledShifts;
            acc.employeeCount += 1;
            if (row.estimatedLaborCost !== null) {
                acc.estimatedLaborCost += row.estimatedLaborCost;
            }
            return acc;
        }, {
            employeeCount: 0,
            plannedHours: 0,
            completedHours: 0,
            canceledHours: 0,
            plannedShifts: 0,
            completedShifts: 0,
            canceledShifts: 0,
            estimatedLaborCost: 0,
        });
        return res.json({
            rows,
            totals: {
                ...totals,
                plannedHours: Number(totals.plannedHours.toFixed(2)),
                completedHours: Number(totals.completedHours.toFixed(2)),
                canceledHours: Number(totals.canceledHours.toFixed(2)),
                estimatedLaborCost: Number(totals.estimatedLaborCost.toFixed(2)),
            },
        });
    }
    catch (error) {
        console.error('GET STAFF EVALUATION ERROR:', error);
        return res.status(500).json({ error: 'Auswertung konnte nicht geladen werden' });
    }
});
exports.default = router;
