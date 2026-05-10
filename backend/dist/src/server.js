"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const dotenv_1 = __importDefault(require("dotenv"));
const node_fs_1 = __importDefault(require("node:fs"));
const node_path_1 = __importDefault(require("node:path"));
const auth_1 = __importStar(require("./routes/auth"));
const app_auth_1 = __importDefault(require("./routes/app-auth"));
const access_1 = __importDefault(require("./routes/access"));
const chains_1 = __importDefault(require("./routes/chains"));
const chainadmin_1 = __importDefault(require("./routes/chainadmin"));
const tenant_1 = __importDefault(require("./routes/tenant"));
const customers_1 = __importDefault(require("./routes/customers"));
const products_1 = __importDefault(require("./routes/products"));
const categories_1 = __importDefault(require("./routes/categories"));
const ingredients_1 = __importDefault(require("./routes/ingredients"));
const product_ingredients_1 = __importDefault(require("./routes/product-ingredients"));
const product_modifiers_1 = __importDefault(require("./routes/product-modifiers"));
const calculation_1 = __importDefault(require("./routes/calculation"));
const orders_1 = __importDefault(require("./routes/orders"));
const order_terminals_1 = __importDefault(require("./routes/order-terminals"));
const order_displays_1 = __importDefault(require("./routes/order-displays"));
const orderdesk_devices_1 = __importDefault(require("./routes/orderdesk-devices"));
const business_settings_1 = __importDefault(require("./routes/business-settings"));
const suppliers_1 = __importDefault(require("./routes/suppliers"));
const stock_1 = __importDefault(require("./routes/stock"));
const actions_1 = __importDefault(require("./routes/actions"));
const staff_1 = __importDefault(require("./routes/staff"));
const screen_1 = __importDefault(require("./routes/screen"));
const database_management_1 = __importDefault(require("./routes/database-management"));
const cash_closings_1 = __importDefault(require("./routes/cash-closings"));
const platform_branding_1 = __importDefault(require("./routes/platform-branding"));
const mobile_updates_1 = __importDefault(require("./routes/mobile-updates"));
const auth_2 = require("./middleware/auth");
const rate_limit_1 = require("./middleware/rate-limit");
const prisma_1 = require("./lib/prisma");
dotenv_1.default.config();
const app = (0, express_1.default)();
const processStartedAt = new Date();
function readBackendBuildMetadata() {
    const packageJsonPath = node_path_1.default.resolve(process.cwd(), 'package.json');
    try {
        const packageJsonRaw = node_fs_1.default.readFileSync(packageJsonPath, 'utf8');
        const packageJson = JSON.parse(packageJsonRaw);
        return {
            backendVersion: packageJson.klarandoVersion || packageJson.version || null,
            buildDateUtc: packageJson.klarandoBuildDateUtc || null,
        };
    }
    catch {
        return {
            backendVersion: null,
            buildDateUtc: null,
        };
    }
}
const backendBuildMetadata = readBackendBuildMetadata();
const DEFAULT_PRODUCTION_ORIGINS = [
    'https://klarando.com',
    'https://www.klarando.com',
    'https://app.klarando.com',
    'https://admin.klarando.com',
    'https://orderdesk.klarando.com',
    'https://driver.klarando.com',
];
function parseCorsOriginsFromEnv() {
    const configured = (process.env.CORS_ORIGINS || '')
        .split(',')
        .map((entry) => entry.trim())
        .filter(Boolean);
    if (configured.includes('*') && process.env.NODE_ENV === 'production') {
        throw new Error('CORS_ORIGINS darf in Produktion kein "*" enthalten');
    }
    if (configured.length > 0) {
        return configured;
    }
    if (process.env.NODE_ENV === 'production') {
        return DEFAULT_PRODUCTION_ORIGINS;
    }
    return [...DEFAULT_PRODUCTION_ORIGINS, 'http://localhost:3000', 'http://localhost:5173'];
}
const allowedCorsOrigins = new Set(parseCorsOriginsFromEnv());
app.use((0, cors_1.default)({
    origin: (origin, callback) => {
        if (!origin) {
            return callback(null, true);
        }
        if (allowedCorsOrigins.has(origin)) {
            return callback(null, true);
        }
        return callback(new Error(`CORS blockiert fuer Origin: ${origin}`));
    },
    credentials: true,
}));
app.use(express_1.default.json({ limit: '8mb' }));
app.use(express_1.default.urlencoded({ extended: true, limit: '8mb' }));
app.use(auth_2.optionalAuth);
app.use('/api/auth/reset-password', rate_limit_1.rateLimitPasswordReset);
app.use('/api/auth/refresh', rate_limit_1.rateLimitTokenRefresh);
app.use('/api/app-auth/refresh', rate_limit_1.rateLimitTokenRefresh);
app.get('/api/health', (_req, res) => {
    res.json({
        ok: true,
        message: 'Backend laeuft',
        backendVersion: backendBuildMetadata.backendVersion,
        buildDateUtc: backendBuildMetadata.buildDateUtc,
        uptimeSeconds: Math.floor(process.uptime()),
        startedAt: processStartedAt.toISOString(),
        serverTime: new Date().toISOString(),
    });
});
app.get('/api/health/ready', async (_req, res) => {
    try {
        await prisma_1.prisma.$queryRaw `SELECT 1`;
        return res.json({
            ok: true,
            backendVersion: backendBuildMetadata.backendVersion,
            buildDateUtc: backendBuildMetadata.buildDateUtc,
            checks: {
                database: 'ok',
            },
            uptimeSeconds: Math.floor(process.uptime()),
            startedAt: processStartedAt.toISOString(),
            serverTime: new Date().toISOString(),
        });
    }
    catch (error) {
        console.error('READINESS CHECK ERROR:', error);
        return res.status(503).json({
            ok: false,
            backendVersion: backendBuildMetadata.backendVersion,
            buildDateUtc: backendBuildMetadata.buildDateUtc,
            checks: {
                database: 'down',
            },
            uptimeSeconds: Math.floor(process.uptime()),
            startedAt: processStartedAt.toISOString(),
            serverTime: new Date().toISOString(),
        });
    }
});
app.use('/api/auth', auth_1.default);
app.use('/api/app-auth', app_auth_1.default);
app.use('/api/access', access_1.default);
app.use('/api/chains', chains_1.default);
app.use('/api/chainadmin', chainadmin_1.default);
app.use('/api/tenants', tenant_1.default);
app.use('/api/customers', customers_1.default);
app.use('/api/products', products_1.default);
app.use('/api/categories', categories_1.default);
app.use('/api/ingredients', ingredients_1.default);
app.use('/api/product-ingredients', product_ingredients_1.default);
app.use('/api/product-modifiers', product_modifiers_1.default);
app.use('/api/calculation', calculation_1.default);
app.use('/api/orders', orders_1.default);
app.use('/api/order-terminals', order_terminals_1.default);
app.use('/api/order-displays', order_displays_1.default);
app.use('/api/orderdesk-devices', orderdesk_devices_1.default);
app.use('/api/business-settings', business_settings_1.default);
app.use('/api/suppliers', suppliers_1.default);
app.use('/api/stock', stock_1.default);
app.use('/api/actions', actions_1.default);
app.use('/api/staff', staff_1.default);
app.use('/api/screen', screen_1.default);
app.use('/api/database-management', database_management_1.default);
app.use('/api/cash-closings', cash_closings_1.default);
app.use('/api/platform-branding', platform_branding_1.default);
app.use('/api/mobile-updates', mobile_updates_1.default);
app.use((req, res) => {
    res.status(404).json({
        error: `Route nicht gefunden: ${req.method} ${req.originalUrl}`,
    });
});
app.use((error, _req, res, _next) => {
    if (error instanceof Error && error.message.startsWith('CORS blockiert')) {
        return res.status(403).json({
            error: 'Origin ist nicht fuer CORS freigegeben',
        });
    }
    console.error('UNHANDLED SERVER ERROR:', error);
    res.status(500).json({
        error: 'Interner Serverfehler',
    });
});
const PORT = Number.parseInt(process.env.PORT ?? '4000', 10);
if (!Number.isFinite(PORT) || PORT <= 0) {
    throw new Error(`Ungueltiger PORT Wert: ${process.env.PORT}`);
}
async function startServer() {
    await (0, auth_1.seedRolePermissions)();
    const server = app.listen(PORT, () => {
        console.log(`Server laeuft auf http://localhost:${PORT}`);
    });
    server.on('error', (error) => {
        if (typeof error === 'object' &&
            error !== null &&
            'code' in error &&
            error.code === 'EADDRINUSE') {
            console.error(`Port ${PORT} ist bereits belegt. Bitte alten Backend-Prozess beenden.`);
            process.exit(1);
        }
        console.error('Server listen error:', error);
        process.exit(1);
    });
}
process.on('unhandledRejection', (reason) => {
    console.error('UNHANDLED REJECTION:', reason);
});
process.on('uncaughtException', (error) => {
    console.error('UNCAUGHT EXCEPTION:', error);
});
startServer().catch((error) => {
    console.error('Server start failed:', error);
    process.exit(1);
});
