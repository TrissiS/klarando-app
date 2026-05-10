"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SERVICE_AREA_STRATEGIES = void 0;
exports.normalizeText = normalizeText;
exports.normalizeZipCode = normalizeZipCode;
exports.defaultDailyHours = defaultDailyHours;
exports.defaultServiceArea = defaultServiceArea;
exports.defaultCustomerAppSettings = defaultCustomerAppSettings;
exports.defaultDriverSettings = defaultDriverSettings;
exports.defaultComplianceSettings = defaultComplianceSettings;
exports.parseSettings = parseSettings;
exports.matchServiceArea = matchServiceArea;
const WEEK_DAYS = [
    'MONDAY',
    'TUESDAY',
    'WEDNESDAY',
    'THURSDAY',
    'FRIDAY',
    'SATURDAY',
    'SUNDAY',
];
exports.SERVICE_AREA_STRATEGIES = [
    'ZIP_LIST',
    'RADIUS',
    'ZIP_OR_RADIUS',
    'ZIP_AND_RADIUS',
    'POLYGON',
];
function normalizeText(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const trimmed = value.trim();
    return trimmed.length > 0 ? trimmed : null;
}
function normalizeZipCode(value) {
    const text = normalizeText(value);
    if (!text) {
        return null;
    }
    const digitsOnly = text.replace(/[^\d]/g, '');
    if (!/^\d{5}$/.test(digitsOnly)) {
        return null;
    }
    return digitsOnly;
}
function normalizeTime(value) {
    const text = normalizeText(value);
    if (!text) {
        return null;
    }
    if (!/^\d{2}:\d{2}$/.test(text)) {
        return null;
    }
    const [hourRaw, minuteRaw] = text.split(':');
    const hour = Number(hourRaw);
    const minute = Number(minuteRaw);
    if (!Number.isInteger(hour) || !Number.isInteger(minute)) {
        return null;
    }
    if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
        return null;
    }
    return `${hourRaw}:${minuteRaw}`;
}
function normalizeNumeric(value) {
    if (typeof value === 'number' && Number.isFinite(value)) {
        return value;
    }
    if (typeof value === 'string') {
        const trimmed = value.trim();
        if (!trimmed) {
            return null;
        }
        const normalized = trimmed.replace(',', '.');
        const parsed = Number(normalized);
        if (Number.isFinite(parsed)) {
            return parsed;
        }
    }
    return null;
}
function normalizeEmail(value) {
    const text = normalizeText(value);
    if (!text) {
        return null;
    }
    return text.toLowerCase();
}
function normalizeIban(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const normalized = value.replace(/\s+/g, '').toUpperCase();
    if (!/^[A-Z]{2}[A-Z0-9]{13,32}$/.test(normalized)) {
        return null;
    }
    return normalized;
}
function normalizeBic(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const normalized = value.replace(/\s+/g, '').toUpperCase();
    if (!/^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/.test(normalized)) {
        return null;
    }
    return normalized;
}
function normalizePublicUrl(value) {
    const text = normalizeText(value);
    if (!text) {
        return null;
    }
    const candidates = text.includes('://') ? [text] : [`https://${text}`];
    try {
        for (const candidate of candidates) {
            const parsed = new URL(candidate);
            if (parsed.protocol === 'http:' || parsed.protocol === 'https:') {
                return parsed.toString();
            }
        }
    }
    catch {
        // ignore
    }
    return null;
}
function normalizeCoordinate(value, min, max) {
    const parsed = normalizeNumeric(value);
    if (parsed === null || parsed < min || parsed > max) {
        return null;
    }
    return Number(parsed.toFixed(6));
}
function normalizeIntegerRange(value, min, max) {
    const parsed = normalizeNumeric(value);
    if (parsed === null) {
        return null;
    }
    const rounded = Math.round(parsed);
    if (rounded < min || rounded > max) {
        return null;
    }
    return rounded;
}
function normalizeRadius(value) {
    const parsed = normalizeNumeric(value);
    if (parsed === null || parsed <= 0 || parsed > 120) {
        return null;
    }
    return Number(parsed.toFixed(2));
}
function normalizePolygonPath(value) {
    if (!Array.isArray(value)) {
        return [];
    }
    const points = [];
    for (const entry of value) {
        if (!entry || typeof entry !== 'object') {
            continue;
        }
        const source = entry;
        const lat = normalizeCoordinate(source.lat, -90, 90);
        const lng = normalizeCoordinate(source.lng, -180, 180);
        if (lat === null || lng === null) {
            continue;
        }
        points.push({ lat, lng });
    }
    return points.slice(0, 200);
}
function normalizeUniqueList(items) {
    return Array.from(new Set(items)).slice(0, 500);
}
function normalizeZipCodeList(value) {
    const rawItems = Array.isArray(value)
        ? value
        : typeof value === 'string'
            ? value.split(/[\n,;]+/)
            : [];
    const cleaned = rawItems
        .map((entry) => normalizeZipCode(entry))
        .filter((entry) => Boolean(entry));
    return normalizeUniqueList(cleaned);
}
function normalizeStreetToken(value) {
    return value.trim().replace(/\s+/g, ' ').toLowerCase();
}
function normalizeStreetList(value) {
    const rawItems = Array.isArray(value)
        ? value
        : typeof value === 'string'
            ? value.split(/[\n,;]+/)
            : [];
    const cleaned = rawItems
        .filter((entry) => typeof entry === 'string')
        .map((entry) => normalizeStreetToken(entry))
        .filter((entry) => entry.length > 1);
    return normalizeUniqueList(cleaned);
}
function sanitizeMenuId(value, fallback) {
    if (typeof value !== 'string') {
        return fallback;
    }
    const normalized = value
        .trim()
        .toLowerCase()
        .replace(/[^a-z0-9_-]/g, '')
        .slice(0, 40);
    return normalized || fallback;
}
function sanitizeMenuRoute(value, fallback) {
    if (typeof value !== 'string') {
        return fallback;
    }
    const trimmed = value.trim();
    if (!trimmed) {
        return fallback;
    }
    return trimmed.startsWith('/') ? trimmed : `/${trimmed}`;
}
function parseStrategy(value, fallback) {
    if (typeof value !== 'string') {
        return fallback;
    }
    const normalized = value.trim().toUpperCase();
    if (exports.SERVICE_AREA_STRATEGIES.includes(normalized)) {
        return normalized;
    }
    return fallback;
}
function defaultDailyHours() {
    return WEEK_DAYS.map((day) => ({
        day,
        isClosed: false,
        open: '10:00',
        close: '22:00',
    }));
}
function defaultServiceArea() {
    return {
        enabled: true,
        strategy: 'ZIP_LIST',
        zipCodes: [],
        excludedZipCodes: [],
        excludedStreets: [],
        radiusKm: null,
        polygonPath: [],
        centerLatitude: null,
        centerLongitude: null,
        centerZipCode: null,
        centerCity: null,
        centerStreet: null,
        notes: null,
    };
}
function defaultCustomerAppSettings() {
    return {
        listingEnabled: false,
        orderingEnabled: false,
        guestRegistrationEnabled: false,
        guestCheckoutEnabled: true,
        orderHeaderImageUrl: null,
        localInfoTitle: null,
        localInfoText: null,
        listingDisplay: {
            showLogo: true,
            showChainName: true,
            showAddress: true,
            showAvailabilityBadges: true,
            showMinOrderValue: true,
            showDeliveryFeeNote: true,
            showDistance: true,
        },
        navigation: {
            bottomTabs: [
                {
                    id: 'start',
                    label: 'Start',
                    route: '/start',
                    enabled: true,
                    sortOrder: 1,
                    children: [],
                },
                {
                    id: 'bestellen',
                    label: 'Bestellen',
                    route: '/bestellen',
                    enabled: true,
                    sortOrder: 2,
                    children: [],
                },
                {
                    id: 'meine-bestellungen',
                    label: 'Meine Bestellungen',
                    route: '/meine-bestellungen',
                    enabled: true,
                    sortOrder: 3,
                    children: [],
                },
                {
                    id: 'profil',
                    label: 'Profil',
                    route: '/profil',
                    enabled: true,
                    sortOrder: 4,
                    children: [],
                },
                {
                    id: 'infos',
                    label: 'Infos',
                    route: '/infos',
                    enabled: true,
                    sortOrder: 5,
                    children: [
                        {
                            id: 'impressum',
                            label: 'Impressum',
                            route: '/infos/impressum',
                            enabled: true,
                            sortOrder: 1,
                        },
                        {
                            id: 'datenschutz',
                            label: 'Datenschutz',
                            route: '/infos/datenschutz',
                            enabled: true,
                            sortOrder: 2,
                        },
                    ],
                },
            ],
        },
    };
}
function defaultDriverSettings() {
    return {
        enabled: true,
        allowOwnDevice: true,
        defaultAccessHours: 12,
        maxActiveOrders: 4,
        locationTrackingEnabled: true,
        locationUpdateSeconds: 15,
        customerLiveTrackingEnabled: true,
    };
}
function defaultComplianceSettings() {
    return {
        cookieConsentRequired: true,
        requirePrivacyConsentAtSignup: true,
        requireTermsConsentAtCheckout: true,
        orderButtonLabel: 'zahlungspflichtig bestellen',
        dpoEmail: null,
        securityContactEmail: null,
        retentionDaysOrders: 365,
        retentionDaysCustomerData: 730,
        retentionDaysLogs: 180,
        enablePseudonymizedAnalytics: true,
    };
}
function sanitizeDailyHours(value, fallback) {
    if (!Array.isArray(value)) {
        return fallback;
    }
    const byDay = new Map();
    for (const entry of value) {
        if (!entry || typeof entry !== 'object') {
            continue;
        }
        const dayRaw = entry.day;
        if (typeof dayRaw !== 'string') {
            continue;
        }
        const dayUpper = dayRaw.toUpperCase();
        if (!WEEK_DAYS.includes(dayUpper)) {
            continue;
        }
        const isClosed = Boolean(entry.isClosed);
        byDay.set(dayUpper, {
            day: dayUpper,
            isClosed,
            open: isClosed ? null : normalizeTime(entry.open),
            close: isClosed ? null : normalizeTime(entry.close),
        });
    }
    return fallback.map((entry) => {
        const next = byDay.get(entry.day);
        if (!next) {
            return entry;
        }
        return {
            day: entry.day,
            isClosed: next.isClosed,
            open: next.isClosed ? null : next.open || entry.open,
            close: next.isClosed ? null : next.close || entry.close,
        };
    });
}
function sanitizeHolidayHours(value) {
    if (!Array.isArray(value)) {
        return [];
    }
    const items = [];
    for (const entry of value) {
        if (!entry || typeof entry !== 'object') {
            continue;
        }
        const dateRaw = normalizeText(entry.date);
        if (!dateRaw || !/^\d{4}-\d{2}-\d{2}$/.test(dateRaw)) {
            continue;
        }
        const isClosed = Boolean(entry.isClosed);
        items.push({
            date: dateRaw,
            label: normalizeText(entry.label),
            isClosed,
            open: isClosed ? null : normalizeTime(entry.open),
            close: isClosed ? null : normalizeTime(entry.close),
        });
    }
    return items.slice(0, 200);
}
function sanitizeServiceArea(value, fallback) {
    const source = value && typeof value === 'object' ? value : {};
    return {
        enabled: typeof source.enabled === 'boolean'
            ? source.enabled
            : fallback.enabled,
        strategy: parseStrategy(source.strategy, fallback.strategy),
        zipCodes: normalizeZipCodeList(source.zipCodes),
        excludedZipCodes: normalizeZipCodeList(source.excludedZipCodes),
        excludedStreets: normalizeStreetList(source.excludedStreets),
        radiusKm: normalizeRadius(source.radiusKm),
        polygonPath: normalizePolygonPath(source.polygonPath),
        centerLatitude: normalizeCoordinate(source.centerLatitude, -90, 90),
        centerLongitude: normalizeCoordinate(source.centerLongitude, -180, 180),
        centerZipCode: normalizeZipCode(source.centerZipCode),
        centerCity: normalizeText(source.centerCity),
        centerStreet: normalizeText(source.centerStreet),
        notes: normalizeText(source.notes),
    };
}
function sanitizeCustomerAppNavigation(value, fallback) {
    const source = value && typeof value === 'object' ? value : {};
    const rawTabs = Array.isArray(source.bottomTabs) ? source.bottomTabs : fallback.bottomTabs;
    const tabs = rawTabs
        .filter((entry) => Boolean(entry && typeof entry === 'object'))
        .map((entry, index) => {
        const fallbackItem = fallback.bottomTabs[index] || fallback.bottomTabs[0];
        const rawChildren = Array.isArray(entry.children) ? entry.children : fallbackItem?.children || [];
        return {
            id: sanitizeMenuId(entry.id, fallbackItem?.id || `tab-${index + 1}`),
            label: normalizeText(entry.label) || fallbackItem?.label || `Tab ${index + 1}`,
            route: sanitizeMenuRoute(entry.route, fallbackItem?.route || '/'),
            enabled: typeof entry.enabled === 'boolean'
                ? entry.enabled
                : fallbackItem?.enabled ?? true,
            sortOrder: typeof entry.sortOrder === 'number' && Number.isFinite(entry.sortOrder)
                ? Math.max(0, Math.round(entry.sortOrder))
                : fallbackItem?.sortOrder ?? index + 1,
            children: rawChildren
                .filter((child) => Boolean(child && typeof child === 'object'))
                .map((child, childIndex) => ({
                id: sanitizeMenuId(child.id, `sub-${index + 1}-${childIndex + 1}`),
                label: normalizeText(child.label) || `Untermenue ${childIndex + 1}`,
                route: sanitizeMenuRoute(child.route, `/tab-${index + 1}/sub-${childIndex + 1}`),
                enabled: typeof child.enabled === 'boolean'
                    ? child.enabled
                    : true,
                sortOrder: typeof child.sortOrder === 'number' && Number.isFinite(child.sortOrder)
                    ? Math.max(0, Math.round(child.sortOrder))
                    : childIndex + 1,
            }))
                .sort((left, right) => left.sortOrder - right.sortOrder)
                .slice(0, 20),
        };
    })
        .sort((left, right) => left.sortOrder - right.sortOrder)
        .slice(0, 7);
    return {
        bottomTabs: tabs.length > 0 ? tabs : fallback.bottomTabs,
    };
}
function sanitizeCustomerApp(value, fallback) {
    const source = value && typeof value === 'object' ? value : {};
    const listingDisplaySource = source.listingDisplay && typeof source.listingDisplay === 'object'
        ? source.listingDisplay
        : {};
    const listingDisplayFallback = fallback.listingDisplay;
    return {
        listingEnabled: typeof source.listingEnabled === 'boolean'
            ? source.listingEnabled
            : fallback.listingEnabled,
        orderingEnabled: typeof source.orderingEnabled === 'boolean'
            ? source.orderingEnabled
            : fallback.orderingEnabled,
        guestRegistrationEnabled: typeof source.guestRegistrationEnabled === 'boolean'
            ? source.guestRegistrationEnabled
            : fallback.guestRegistrationEnabled,
        guestCheckoutEnabled: typeof source.guestCheckoutEnabled === 'boolean'
            ? source.guestCheckoutEnabled
            : fallback.guestCheckoutEnabled,
        orderHeaderImageUrl: normalizeText(source.orderHeaderImageUrl),
        localInfoTitle: normalizeText(source.localInfoTitle),
        localInfoText: normalizeText(source.localInfoText),
        listingDisplay: {
            showLogo: typeof listingDisplaySource.showLogo === 'boolean'
                ? listingDisplaySource.showLogo
                : listingDisplayFallback.showLogo,
            showChainName: typeof listingDisplaySource.showChainName === 'boolean'
                ? listingDisplaySource.showChainName
                : listingDisplayFallback.showChainName,
            showAddress: typeof listingDisplaySource.showAddress === 'boolean'
                ? listingDisplaySource.showAddress
                : listingDisplayFallback.showAddress,
            showAvailabilityBadges: typeof listingDisplaySource.showAvailabilityBadges === 'boolean'
                ? listingDisplaySource.showAvailabilityBadges
                : listingDisplayFallback.showAvailabilityBadges,
            showMinOrderValue: typeof listingDisplaySource.showMinOrderValue === 'boolean'
                ? listingDisplaySource.showMinOrderValue
                : listingDisplayFallback.showMinOrderValue,
            showDeliveryFeeNote: typeof listingDisplaySource.showDeliveryFeeNote === 'boolean'
                ? listingDisplaySource.showDeliveryFeeNote
                : listingDisplayFallback.showDeliveryFeeNote,
            showDistance: typeof listingDisplaySource.showDistance === 'boolean'
                ? listingDisplaySource.showDistance
                : listingDisplayFallback.showDistance,
        },
        navigation: sanitizeCustomerAppNavigation(source.navigation, fallback.navigation),
    };
}
function sanitizeCompliance(value, fallback) {
    const source = value && typeof value === 'object' ? value : {};
    const orderButtonLabel = normalizeText(source.orderButtonLabel) || fallback.orderButtonLabel;
    return {
        cookieConsentRequired: typeof source.cookieConsentRequired === 'boolean'
            ? source.cookieConsentRequired
            : fallback.cookieConsentRequired,
        requirePrivacyConsentAtSignup: typeof source.requirePrivacyConsentAtSignup === 'boolean'
            ? source.requirePrivacyConsentAtSignup
            : fallback.requirePrivacyConsentAtSignup,
        requireTermsConsentAtCheckout: typeof source.requireTermsConsentAtCheckout === 'boolean'
            ? source.requireTermsConsentAtCheckout
            : fallback.requireTermsConsentAtCheckout,
        orderButtonLabel,
        dpoEmail: normalizeEmail(source.dpoEmail),
        securityContactEmail: normalizeEmail(source.securityContactEmail),
        retentionDaysOrders: normalizeIntegerRange(source.retentionDaysOrders, 1, 3650) ??
            fallback.retentionDaysOrders,
        retentionDaysCustomerData: normalizeIntegerRange(source.retentionDaysCustomerData, 1, 3650) ??
            fallback.retentionDaysCustomerData,
        retentionDaysLogs: normalizeIntegerRange(source.retentionDaysLogs, 1, 3650) ??
            fallback.retentionDaysLogs,
        enablePseudonymizedAnalytics: typeof source.enablePseudonymizedAnalytics === 'boolean'
            ? source.enablePseudonymizedAnalytics
            : fallback.enablePseudonymizedAnalytics,
    };
}
function sanitizeDriverSettings(value, fallback) {
    const source = value && typeof value === 'object' ? value : {};
    return {
        enabled: typeof source.enabled === 'boolean'
            ? source.enabled
            : fallback.enabled,
        allowOwnDevice: typeof source.allowOwnDevice === 'boolean'
            ? source.allowOwnDevice
            : fallback.allowOwnDevice,
        defaultAccessHours: normalizeIntegerRange(source.defaultAccessHours, 1, 168) ?? fallback.defaultAccessHours,
        maxActiveOrders: normalizeIntegerRange(source.maxActiveOrders, 1, 50) ?? fallback.maxActiveOrders,
        locationTrackingEnabled: typeof source.locationTrackingEnabled === 'boolean'
            ? source.locationTrackingEnabled
            : fallback.locationTrackingEnabled,
        locationUpdateSeconds: normalizeIntegerRange(source.locationUpdateSeconds, 5, 300) ??
            fallback.locationUpdateSeconds,
        customerLiveTrackingEnabled: typeof source.customerLiveTrackingEnabled === 'boolean'
            ? source.customerLiveTrackingEnabled
            : fallback.customerLiveTrackingEnabled,
    };
}
function parseSettings(raw, tenantDefaults) {
    const source = raw && typeof raw === 'object' ? raw : {};
    const defaultHours = defaultDailyHours();
    const defaultArea = defaultServiceArea();
    const defaultCustomerApp = defaultCustomerAppSettings();
    const defaultDriver = defaultDriverSettings();
    const defaultCompliance = defaultComplianceSettings();
    return {
        businessName: normalizeText(source.businessName) ?? tenantDefaults.name,
        legalName: normalizeText(source.legalName),
        operatorName: normalizeText(source.operatorName),
        street: normalizeText(source.street),
        zipCode: normalizeZipCode(source.zipCode) ?? normalizeText(source.zipCode),
        city: normalizeText(source.city),
        country: normalizeText(source.country) ?? 'Deutschland',
        phone: normalizeText(source.phone),
        email: normalizeEmail(source.email) ?? tenantDefaults.email,
        website: normalizePublicUrl(source.website),
        imprintUrl: normalizePublicUrl(source.imprintUrl),
        privacyPolicyUrl: normalizePublicUrl(source.privacyPolicyUrl),
        termsUrl: normalizePublicUrl(source.termsUrl),
        supportEmail: normalizeEmail(source.supportEmail),
        accountDeletionEmail: normalizeEmail(source.accountDeletionEmail),
        vatId: normalizeText(source.vatId),
        taxNumber: normalizeText(source.taxNumber),
        revenueId: normalizeText(source.revenueId),
        taxOffice: normalizeText(source.taxOffice),
        payoutAccountHolder: normalizeText(source.payoutAccountHolder),
        payoutBankName: normalizeText(source.payoutBankName),
        payoutIban: normalizeIban(source.payoutIban),
        payoutBic: normalizeBic(source.payoutBic),
        payoutEmail: normalizeEmail(source.payoutEmail),
        payoutReference: normalizeText(source.payoutReference),
        deliveryFeeNote: normalizeText(source.deliveryFeeNote),
        minOrderValue: normalizeText(source.minOrderValue),
        logoUrl: normalizeText(source.logoUrl),
        openingHours: sanitizeDailyHours(source.openingHours, defaultHours),
        holidayHours: sanitizeHolidayHours(source.holidayHours),
        deliveryHours: sanitizeDailyHours(source.deliveryHours, defaultHours),
        deliveryArea: sanitizeServiceArea(source.deliveryArea, defaultArea),
        pickupArea: sanitizeServiceArea(source.pickupArea, defaultArea),
        driver: sanitizeDriverSettings(source.driver, defaultDriver),
        customerApp: sanitizeCustomerApp(source.customerApp, defaultCustomerApp),
        compliance: sanitizeCompliance(source.compliance, defaultCompliance),
        notes: normalizeText(source.notes),
    };
}
function toRadians(value) {
    return (value * Math.PI) / 180;
}
function haversineDistanceKm(latitudeA, longitudeA, latitudeB, longitudeB) {
    const earthRadiusKm = 6371;
    const dLat = toRadians(latitudeB - latitudeA);
    const dLng = toRadians(longitudeB - longitudeA);
    const a = Math.sin(dLat / 2) ** 2 +
        Math.cos(toRadians(latitudeA)) *
            Math.cos(toRadians(latitudeB)) *
            Math.sin(dLng / 2) ** 2;
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    return earthRadiusKm * c;
}
function normalizeStreetForMatch(value) {
    if (!value) {
        return null;
    }
    return value
        .trim()
        .toLowerCase()
        .replace(/[.,]/g, ' ')
        .replace(/\s+/g, ' ');
}
function isPointInPolygon(latitude, longitude, polygonPath) {
    let inside = false;
    const pointCount = polygonPath.length;
    if (pointCount < 3) {
        return false;
    }
    for (let i = 0, j = pointCount - 1; i < pointCount; j = i++) {
        const pointI = polygonPath[i];
        const pointJ = polygonPath[j];
        const intersect = pointI.lng > longitude !== pointJ.lng > longitude &&
            latitude <
                ((pointJ.lat - pointI.lat) * (longitude - pointI.lng)) /
                    (pointJ.lng - pointI.lng) +
                    pointI.lat;
        if (intersect) {
            inside = !inside;
        }
    }
    return inside;
}
function matchServiceArea(area, input) {
    if (!area.enabled) {
        return {
            matched: false,
            matchedByZip: false,
            matchedByRadius: false,
            matchedByPolygon: false,
            excludedByZip: false,
            excludedByStreet: false,
            distanceKm: null,
        };
    }
    const inputZip = normalizeZipCode(input.zipCode);
    const inputStreet = normalizeStreetForMatch(input.street);
    const excludedByZip = Boolean(inputZip && area.excludedZipCodes.includes(inputZip));
    const excludedByStreet = Boolean(inputStreet &&
        area.excludedStreets.some((blockedStreetToken) => inputStreet.includes(blockedStreetToken)));
    if (excludedByZip || excludedByStreet) {
        return {
            matched: false,
            matchedByZip: false,
            matchedByRadius: false,
            matchedByPolygon: false,
            excludedByZip,
            excludedByStreet,
            distanceKm: null,
        };
    }
    const zipRuleConfigured = area.zipCodes.length > 0;
    const matchedByZip = zipRuleConfigured
        ? Boolean(inputZip && area.zipCodes.includes(inputZip))
        : true;
    let matchedByRadius = false;
    let matchedByPolygon = false;
    let distanceKm = null;
    const hasRadius = typeof area.radiusKm === 'number' && area.radiusKm > 0;
    const hasCenterCoordinates = typeof area.centerLatitude === 'number' &&
        typeof area.centerLongitude === 'number';
    const hasInputCoordinates = typeof input.latitude === 'number' && typeof input.longitude === 'number';
    const canUseRadiusByCoordinates = hasRadius && hasCenterCoordinates && hasInputCoordinates;
    const canUseRadiusByCenterZip = hasRadius && Boolean(area.centerZipCode && inputZip);
    const radiusConfigured = canUseRadiusByCoordinates || canUseRadiusByCenterZip;
    if (canUseRadiusByCoordinates) {
        const calculatedDistanceKm = haversineDistanceKm(area.centerLatitude, area.centerLongitude, input.latitude, input.longitude);
        distanceKm = Number(calculatedDistanceKm.toFixed(2));
        matchedByRadius = calculatedDistanceKm <= area.radiusKm;
    }
    else if (canUseRadiusByCenterZip && area.centerZipCode === inputZip) {
        matchedByRadius = true;
        distanceKm = 0;
    }
    if (hasInputCoordinates && area.polygonPath.length >= 3) {
        matchedByPolygon = isPointInPolygon(input.latitude, input.longitude, area.polygonPath);
    }
    let matched = false;
    if (area.strategy === 'ZIP_LIST') {
        matched = matchedByZip;
    }
    else if (area.strategy === 'RADIUS') {
        // Fallback: if radius strategy is selected but radius configuration is incomplete,
        // use ZIP matching so a branch is not silently hidden in the app.
        matched = radiusConfigured ? matchedByRadius : matchedByZip;
    }
    else if (area.strategy === 'POLYGON') {
        matched = matchedByPolygon;
    }
    else if (area.strategy === 'ZIP_OR_RADIUS') {
        matched = matchedByZip || matchedByRadius;
    }
    else {
        // ZIP_AND_RADIUS also falls back to ZIP when radius data is missing.
        matched = radiusConfigured ? matchedByZip && matchedByRadius : matchedByZip;
    }
    return {
        matched,
        matchedByZip,
        matchedByRadius,
        matchedByPolygon,
        excludedByZip,
        excludedByStreet,
        distanceKm,
    };
}
