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
const auth_1 = __importStar(require("./routes/auth"));
const access_1 = __importDefault(require("./routes/access"));
const chains_1 = __importDefault(require("./routes/chains"));
const tenant_1 = __importDefault(require("./routes/tenant"));
const products_1 = __importDefault(require("./routes/products"));
const categories_1 = __importDefault(require("./routes/categories"));
const ingredients_1 = __importDefault(require("./routes/ingredients"));
const product_ingredients_1 = __importDefault(require("./routes/product-ingredients"));
const calculation_1 = __importDefault(require("./routes/calculation"));
const orders_1 = __importDefault(require("./routes/orders"));
const suppliers_1 = __importDefault(require("./routes/suppliers"));
const stock_1 = __importDefault(require("./routes/stock"));
const actions_1 = __importDefault(require("./routes/actions"));
const staff_1 = __importDefault(require("./routes/staff"));
const screen_1 = __importDefault(require("./routes/screen"));
const auth_2 = require("./middleware/auth");
dotenv_1.default.config();
const app = (0, express_1.default)();
app.use((0, cors_1.default)());
app.use(express_1.default.json());
app.use(auth_2.optionalAuth);
app.get('/api/health', (_req, res) => {
    res.json({ ok: true, message: 'Backend laeuft' });
});
app.use('/api/auth', auth_1.default);
app.use('/api/access', access_1.default);
app.use('/api/chains', chains_1.default);
app.use('/api/tenants', tenant_1.default);
app.use('/api/products', products_1.default);
app.use('/api/categories', categories_1.default);
app.use('/api/ingredients', ingredients_1.default);
app.use('/api/product-ingredients', product_ingredients_1.default);
app.use('/api/calculation', calculation_1.default);
app.use('/api/orders', orders_1.default);
app.use('/api/suppliers', suppliers_1.default);
app.use('/api/stock', stock_1.default);
app.use('/api/actions', actions_1.default);
app.use('/api/staff', staff_1.default);
app.use('/api/screen', screen_1.default);
const PORT = 4000;
async function startServer() {
    await (0, auth_1.seedRolePermissions)();
    app.listen(PORT, () => {
        console.log(`Server laeuft auf http://localhost:${PORT}`);
    });
}
startServer().catch((error) => {
    console.error('Server start failed:', error);
    process.exit(1);
});
