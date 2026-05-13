#!/usr/bin/env node
/* eslint-disable no-console */
const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()
const VALID_INGREDIENT_CATEGORIES = new Set(['FOOD', 'PACKAGING'])
const warnedUnknownIngredientCategories = new Set()
const INGREDIENT_CATEGORY_ALIAS = new Map([
  ['BEVERAGE', 'FOOD'],
  ['DRINK', 'FOOD'],
  ['GETRAENK', 'FOOD'],
  ['GETRÄNK', 'FOOD'],
  ['SAUCE', 'FOOD'],
  ['MEAT', 'FOOD'],
  ['VEGETABLE', 'FOOD'],
  ['DAIRY', 'FOOD'],
  ['SPICE', 'FOOD'],
  ['PACK', 'PACKAGING'],
  ['PACKAGING', 'PACKAGING'],
  ['VERPACKUNG', 'PACKAGING'],
  ['FOOD', 'FOOD'],
  ['LEBENSMITTEL', 'FOOD'],
])

const TEMPLATE_TYPES = [
  { type: 'DONER_KEBAP', key: 'doner-kebap', name: 'Döner / Kebap', icon: '🥙' },
  { type: 'PIZZERIA', key: 'pizzeria', name: 'Pizzeria', icon: '🍕' },
  { type: 'BURGER_SMASHBURGER', key: 'burger-smashburger', name: 'Burger / Smashburger', icon: '🍔' },
  { type: 'GRILL_IMBISS', key: 'grill-imbiss', name: 'Grill / Imbiss', icon: '🍟' },
  { type: 'ASIAN', key: 'asiatisch', name: 'Asiatisch', icon: '🍜' },
  { type: 'CAFE_BAKERY', key: 'cafe-bäckerei', name: 'Café / Bäckerei', icon: '☕' },
  { type: 'BEVERAGE_DELIVERY', key: 'getränkelieferdienst', name: 'Getränkelieferdienst', icon: '🥤' },
  { type: 'KIOSK_SPATI', key: 'kiosk-späti', name: 'Kiosk / Späti', icon: '🏪' },
  { type: 'RESTAURANT_GENERAL', key: 'restaurant-allgemein', name: 'Restaurant allgemein', icon: '🍽️' },
  { type: 'STEAKHOUSE_GRILLHOUSE', key: 'steakhouse-grillhaus', name: 'Steakhouse / Grillhaus', icon: '🥩' },
  { type: 'SUSHI', key: 'sushi', name: 'Sushi', icon: '🍣' },
  { type: 'VEGAN_HEALTHY', key: 'vegan-healthy-food', name: 'Vegan / Healthy Food', icon: '🥗' },
  { type: 'FOODTRUCK', key: 'foodtruck', name: 'Foodtruck', icon: '🚚' },
  { type: 'ICECREAM_DESSERT', key: 'eisdiele-dessert', name: 'Eisdiele / Dessert', icon: '🍨' },
  { type: 'BAR_LOUNGE', key: 'bar-lounge', name: 'Bar / Lounge', icon: '🍸' },
]

const i = (name, unit, purchasePrice, allergens = [], category = 'FOOD') => ({ name, unit, purchasePrice, allergens, category })
const pi = (name, quantity) => ({ name, quantity })
const p = (name, category, price, ingredients) => ({ productNumber: null, name, category, price, ingredients })

function baseTemplate(prefix, categories, ingredients, productDefs, modifiers) {
  return {
    categories,
    ingredients,
    products: productDefs.map((row, idx) =>
      p(row.name, row.category, row.price, row.ingredients)
    ),
    modifiers,
  }
}

function deriveTemplate(base, nextPrefix, categoryMap = {}, rename = () => null, extraModifiers = []) {
  const categories = base.categories.map((value) => categoryMap[value] || value)
  const products = base.products.map((product, index) => {
    const nextName = rename(product.name) || product.name
    return {
      ...product,
      productNumber: null,
      name: nextName,
      category: categoryMap[product.category] || product.category,
    }
  })
  return {
    categories,
    ingredients: base.ingredients,
    products,
    modifiers: Array.from(new Set([...(base.modifiers || []), ...extraModifiers])),
  }
}

const DATA = {
  'doner-kebap': baseTemplate(
    'DO',
    ['Döner Klassiker', 'Dürüm', 'Teller', 'Vegetarisch', 'Beilagen', 'Saucen', 'Getränke'],
    [
      i('Fladenbrot', 'Stück', '0.58', ['A']), i('Yufkateig', 'Stück', '0.64', ['A']), i('Kalbfleisch', 'kg', '12.40'),
      i('Hähnchenfleisch', 'kg', '11.80'), i('Falafel', 'kg', '8.20', ['A']), i('Pommes', 'kg', '1.95'),
      i('Eisbergsalat', 'kg', '2.20'), i('Tomate', 'kg', '2.90'), i('Zwiebel', 'kg', '1.90'), i('Rotkohl', 'kg', '2.10'),
      i('Knoblauchsauce', 'kg', '4.80', ['C', 'G']), i('Kräutersauce', 'kg', '4.70', ['C', 'G']), i('Scharfe Sauce', 'kg', '4.10'),
      i('Schafskäse', 'kg', '7.10', ['G']), i('Reis', 'kg', '2.10'), i('Ayran 0,25', 'Stück', '0.85', ['G'], 'Beverage'),
      i('Cola 0,33', 'Stück', '0.78', [], 'Beverage'), i('Fanta 0,33', 'Stück', '0.75', [], 'Beverage'),
      i('Wasser 0,5', 'Stück', '0.35', [], 'Beverage'), i('Extra Fleisch', 'kg', '12.40'),
    ],
    [
      { name: 'Döner Kalb', category: 'Döner Klassiker', price: '8.90', ingredients: [pi('Fladenbrot', '1.000'), pi('Kalbfleisch', '0.180'), pi('Eisbergsalat', '0.050'), pi('Knoblauchsauce', '0.040')] },
      { name: 'Döner Hähnchen', category: 'Döner Klassiker', price: '8.70', ingredients: [pi('Fladenbrot', '1.000'), pi('Hähnchenfleisch', '0.180'), pi('Eisbergsalat', '0.050'), pi('Kräutersauce', '0.040')] },
      { name: 'Döner Spezial', category: 'Döner Klassiker', price: '9.80', ingredients: [pi('Fladenbrot', '1.000'), pi('Kalbfleisch', '0.180'), pi('Schafskäse', '0.040')] },
      { name: 'Döner XL', category: 'Döner Klassiker', price: '10.90', ingredients: [pi('Fladenbrot', '1.000'), pi('Kalbfleisch', '0.240')] },
      { name: 'Dürüm Kalb', category: 'Dürüm', price: '9.90', ingredients: [pi('Yufkateig', '1.000'), pi('Kalbfleisch', '0.190'), pi('Knoblauchsauce', '0.040')] },
      { name: 'Dürüm Hähnchen', category: 'Dürüm', price: '9.70', ingredients: [pi('Yufkateig', '1.000'), pi('Hähnchenfleisch', '0.190'), pi('Kräutersauce', '0.040')] },
      { name: 'Dürüm Veggie', category: 'Dürüm', price: '8.90', ingredients: [pi('Yufkateig', '1.000'), pi('Falafel', '0.130')] },
      { name: 'Dönerteller Kalb', category: 'Teller', price: '12.90', ingredients: [pi('Kalbfleisch', '0.230'), pi('Pommes', '0.220'), pi('Knoblauchsauce', '0.040')] },
      { name: 'Dönerteller Hähnchen', category: 'Teller', price: '12.70', ingredients: [pi('Hähnchenfleisch', '0.230'), pi('Pommes', '0.220'), pi('Kräutersauce', '0.040')] },
      { name: 'Döner Box Kalb', category: 'Teller', price: '9.90', ingredients: [pi('Kalbfleisch', '0.170'), pi('Pommes', '0.170')] },
      { name: 'Döner Box Hähnchen', category: 'Teller', price: '9.70', ingredients: [pi('Hähnchenfleisch', '0.170'), pi('Pommes', '0.170')] },
      { name: 'Falafel im Brot', category: 'Vegetarisch', price: '7.90', ingredients: [pi('Fladenbrot', '1.000'), pi('Falafel', '0.140')] },
      { name: 'Falafel Teller', category: 'Vegetarisch', price: '10.90', ingredients: [pi('Falafel', '0.220'), pi('Pommes', '0.200')] },
      { name: 'Pommes', category: 'Beilagen', price: '3.80', ingredients: [pi('Pommes', '0.220')] },
      { name: 'Reis', category: 'Beilagen', price: '3.50', ingredients: [pi('Reis', '0.220')] },
      { name: 'Extra Fleisch', category: 'Saucen', price: '2.50', ingredients: [pi('Extra Fleisch', '0.050')] },
      { name: 'Extra Schafskäse', category: 'Saucen', price: '1.50', ingredients: [pi('Schafskäse', '0.030')] },
      { name: 'Extra Sauce', category: 'Saucen', price: '1.00', ingredients: [pi('Knoblauchsauce', '0.030')] },
      { name: 'Ayran 0,25', category: 'Getränke', price: '2.20', ingredients: [pi('Ayran 0,25', '1.000')] },
      { name: 'Cola 0,33', category: 'Getränke', price: '2.80', ingredients: [pi('Cola 0,33', '1.000')] },
      { name: 'Fanta 0,33', category: 'Getränke', price: '2.80', ingredients: [pi('Fanta 0,33', '1.000')] },
      { name: 'Wasser 0,5', category: 'Getränke', price: '2.10', ingredients: [pi('Wasser 0,5', '1.000')] },
    ],
    ['Extra Fleisch', 'Extra Schafskäse', 'Extra Sauce', 'Scharf', 'Ohne Zwiebeln', 'Mit Rotkohl']
  ),
}

// Re-usable strong catalogs
DATA.pizzeria = baseTemplate(
  'PI',
  ['Pizza Klassiker', 'Pizza Spezial', 'Vegetarisch', 'Pasta', 'Salate', 'Fingerfood', 'Dessert', 'Getränke'],
  [
    i('Pizzateig', 'Stück', '0.86', ['A']), i('Tomatensauce', 'kg', '2.30'), i('Mozzarella', 'kg', '6.20', ['G']),
    i('Salami', 'kg', '8.60'), i('Schinken', 'kg', '8.20'), i('Thunfisch', 'kg', '9.10', ['D']), i('Champignons', 'kg', '4.10'),
    i('Paprika', 'kg', '3.50'), i('Rucola', 'kg', '8.40'), i('Parmesan', 'kg', '11.90', ['G']), i('Penne', 'kg', '2.30', ['A']),
    i('Spaghetti', 'kg', '2.20', ['A']), i('Sahnesauce', 'kg', '4.70', ['G']), i('Pesto', 'kg', '5.30', ['H']),
    i('Hähnchenstreifen', 'kg', '10.80'), i('Eisbergsalat', 'kg', '2.20'), i('Balsamico Dressing', 'kg', '3.80', ['J']),
    i('Pizzabrötchen', 'Stück', '0.35', ['A', 'G']), i('Tiramisu', 'Stück', '1.50', ['A', 'C', 'G']), i('Cola 0,33', 'Stück', '0.78', [], 'Beverage'),
    i('Wasser 0,5', 'Stück', '0.35', [], 'Beverage'),
  ],
  [
    { name: 'Pizza Margherita', category: 'Pizza Klassiker', price: '8.90', ingredients: [pi('Pizzateig', '1.000'), pi('Tomatensauce', '0.120'), pi('Mozzarella', '0.130')] },
    { name: 'Pizza Salami', category: 'Pizza Klassiker', price: '10.90', ingredients: [pi('Pizzateig', '1.000'), pi('Tomatensauce', '0.120'), pi('Mozzarella', '0.130'), pi('Salami', '0.085')] },
    { name: 'Pizza Prosciutto', category: 'Pizza Klassiker', price: '10.90', ingredients: [pi('Pizzateig', '1.000'), pi('Tomatensauce', '0.120'), pi('Mozzarella', '0.130'), pi('Schinken', '0.090')] },
    { name: 'Pizza Funghi', category: 'Pizza Klassiker', price: '10.50', ingredients: [pi('Pizzateig', '1.000'), pi('Tomatensauce', '0.120'), pi('Mozzarella', '0.130'), pi('Champignons', '0.080')] },
    { name: 'Pizza Tonno', category: 'Pizza Spezial', price: '11.50', ingredients: [pi('Pizzateig', '1.000'), pi('Tomatensauce', '0.120'), pi('Mozzarella', '0.130'), pi('Thunfisch', '0.090')] },
    { name: 'Pizza Diavolo', category: 'Pizza Spezial', price: '11.90', ingredients: [pi('Pizzateig', '1.000'), pi('Tomatensauce', '0.120'), pi('Mozzarella', '0.130'), pi('Salami', '0.090'), pi('Paprika', '0.030')] },
    { name: 'Pizza Rucola', category: 'Pizza Spezial', price: '12.90', ingredients: [pi('Pizzateig', '1.000'), pi('Tomatensauce', '0.120'), pi('Mozzarella', '0.120'), pi('Rucola', '0.035'), pi('Parmesan', '0.030')] },
    { name: 'Pizza Vegetaria', category: 'Vegetarisch', price: '11.20', ingredients: [pi('Pizzateig', '1.000'), pi('Tomatensauce', '0.120'), pi('Mozzarella', '0.130'), pi('Champignons', '0.040'), pi('Paprika', '0.030')] },
    { name: 'Pizza Pesto', category: 'Vegetarisch', price: '11.40', ingredients: [pi('Pizzateig', '1.000'), pi('Tomatensauce', '0.100'), pi('Mozzarella', '0.130'), pi('Pesto', '0.030')] },
    { name: 'Penne Arrabbiata', category: 'Pasta', price: '9.90', ingredients: [pi('Penne', '0.170'), pi('Tomatensauce', '0.130')] },
    { name: 'Penne al Forno', category: 'Pasta', price: '11.50', ingredients: [pi('Penne', '0.170'), pi('Tomatensauce', '0.120'), pi('Mozzarella', '0.080'), pi('Schinken', '0.060')] },
    { name: 'Spaghetti Napoli', category: 'Pasta', price: '9.40', ingredients: [pi('Spaghetti', '0.170'), pi('Tomatensauce', '0.130')] },
    { name: 'Spaghetti Pesto', category: 'Pasta', price: '10.90', ingredients: [pi('Spaghetti', '0.170'), pi('Pesto', '0.040'), pi('Parmesan', '0.020')] },
    { name: 'Pasta Hähnchen', category: 'Pasta', price: '12.40', ingredients: [pi('Penne', '0.170'), pi('Sahnesauce', '0.130'), pi('Hähnchenstreifen', '0.090')] },
    { name: 'Gemischter Salat', category: 'Salate', price: '7.90', ingredients: [pi('Eisbergsalat', '0.150'), pi('Balsamico Dressing', '0.030')] },
    { name: 'Salat Hähnchen', category: 'Salate', price: '10.20', ingredients: [pi('Eisbergsalat', '0.150'), pi('Hähnchenstreifen', '0.080'), pi('Balsamico Dressing', '0.030')] },
    { name: 'Pizzabrötchen Käse', category: 'Fingerfood', price: '5.90', ingredients: [pi('Pizzabrötchen', '6.000'), pi('Mozzarella', '0.060')] },
    { name: 'Pizzabrot', category: 'Fingerfood', price: '5.50', ingredients: [pi('Pizzateig', '1.000')] },
    { name: 'Tiramisu', category: 'Dessert', price: '4.90', ingredients: [pi('Tiramisu', '1.000')] },
    { name: 'Cola 0,33', category: 'Getränke', price: '2.80', ingredients: [pi('Cola 0,33', '1.000')] },
    { name: 'Wasser 0,5', category: 'Getränke', price: '2.20', ingredients: [pi('Wasser 0,5', '1.000')] },
  ],
  ['Extra Käse', 'Extra Salami', 'Scharf', 'Knoblauchöl', 'Ohne Zwiebeln', 'Glutenfrei-Hinweis']
)

DATA['burger-smashburger'] = baseTemplate(
  'BU',
  ['Smash Burger', 'Classic Burger', 'Chicken Burger', 'Veggie Burger', 'Loaded Fries', 'Sides', 'Dips', 'Getränke'],
  [
    i('Brioche Bun', 'Stück', '0.72', ['A', 'C', 'G']), i('Sesam Bun', 'Stück', '0.65', ['A']), i('Rind Patty', 'kg', '11.90'),
    i('Chicken Patty', 'kg', '10.20', ['A']), i('Veggie Patty', 'kg', '8.90', ['A']), i('Cheddar', 'kg', '7.20', ['G']),
    i('Bacon', 'kg', '10.90'), i('Tomate', 'kg', '2.80'), i('Eisbergsalat', 'kg', '2.20'), i('Essiggurke', 'kg', '3.10'),
    i('Jalapeños', 'kg', '4.30'), i('BBQ Sauce', 'kg', '4.80'), i('Burger Sauce', 'kg', '4.50', ['C', 'J']),
    i('Mayo', 'kg', '4.20', ['C']), i('Ketchup', 'kg', '3.90'), i('Pommes', 'kg', '1.95'), i('Süßkartoffel Pommes', 'kg', '3.20'),
    i('Onion Rings', 'kg', '4.60', ['A']), i('Cola 0,33', 'Stück', '0.78', [], 'Beverage'), i('Wasser 0,5', 'Stück', '0.35', [], 'Beverage'),
  ],
  [
    { name: 'Smash Single', category: 'Smash Burger', price: '10.90', ingredients: [pi('Brioche Bun', '1.000'), pi('Rind Patty', '0.140'), pi('Cheddar', '0.030'), pi('Burger Sauce', '0.030')] },
    { name: 'Smash Double', category: 'Smash Burger', price: '13.90', ingredients: [pi('Brioche Bun', '1.000'), pi('Rind Patty', '0.260'), pi('Cheddar', '0.050')] },
    { name: 'Smash Bacon', category: 'Smash Burger', price: '14.20', ingredients: [pi('Brioche Bun', '1.000'), pi('Rind Patty', '0.260'), pi('Cheddar', '0.050'), pi('Bacon', '0.050')] },
    { name: 'Cheeseburger', category: 'Classic Burger', price: '11.40', ingredients: [pi('Sesam Bun', '1.000'), pi('Rind Patty', '0.180'), pi('Cheddar', '0.040')] },
    { name: 'BBQ Burger', category: 'Classic Burger', price: '12.40', ingredients: [pi('Sesam Bun', '1.000'), pi('Rind Patty', '0.180'), pi('Bacon', '0.040'), pi('BBQ Sauce', '0.030')] },
    { name: 'Jalapeño Burger', category: 'Classic Burger', price: '12.20', ingredients: [pi('Sesam Bun', '1.000'), pi('Rind Patty', '0.180'), pi('Jalapeños', '0.020')] },
    { name: 'Chicken Crispy', category: 'Chicken Burger', price: '11.90', ingredients: [pi('Brioche Bun', '1.000'), pi('Chicken Patty', '0.170'), pi('Mayo', '0.030')] },
    { name: 'Chicken BBQ', category: 'Chicken Burger', price: '12.40', ingredients: [pi('Brioche Bun', '1.000'), pi('Chicken Patty', '0.170'), pi('BBQ Sauce', '0.030')] },
    { name: 'Veggie Burger', category: 'Veggie Burger', price: '11.20', ingredients: [pi('Sesam Bun', '1.000'), pi('Veggie Patty', '0.160'), pi('Burger Sauce', '0.030')] },
    { name: 'Veggie Jalapeño', category: 'Veggie Burger', price: '11.80', ingredients: [pi('Sesam Bun', '1.000'), pi('Veggie Patty', '0.160'), pi('Jalapeños', '0.020')] },
    { name: 'Loaded Fries Cheddar', category: 'Loaded Fries', price: '7.90', ingredients: [pi('Pommes', '0.220'), pi('Cheddar', '0.040')] },
    { name: 'Loaded Fries Bacon', category: 'Loaded Fries', price: '8.90', ingredients: [pi('Pommes', '0.220'), pi('Bacon', '0.050')] },
    { name: 'Pommes', category: 'Sides', price: '3.90', ingredients: [pi('Pommes', '0.220')] },
    { name: 'Süßkartoffel Pommes', category: 'Sides', price: '4.90', ingredients: [pi('Süßkartoffel Pommes', '0.220')] },
    { name: 'Onion Rings', category: 'Sides', price: '4.50', ingredients: [pi('Onion Rings', '0.180')] },
    { name: 'Dip Mayo', category: 'Dips', price: '0.80', ingredients: [pi('Mayo', '0.030')] },
    { name: 'Dip BBQ', category: 'Dips', price: '0.80', ingredients: [pi('BBQ Sauce', '0.030')] },
    { name: 'Dip Ketchup', category: 'Dips', price: '0.70', ingredients: [pi('Ketchup', '0.030')] },
    { name: 'Cola 0,33', category: 'Getränke', price: '2.80', ingredients: [pi('Cola 0,33', '1.000')] },
    { name: 'Wasser 0,5', category: 'Getränke', price: '2.20', ingredients: [pi('Wasser 0,5', '1.000')] },
  ],
  ['Extra Patty', 'Extra Käse', 'Bacon', 'Jalapeños', 'Ohne Zwiebeln', 'Glutenarmes Bun']
)

DATA.getränkelieferdienst = baseTemplate(
  'GL',
  ['Wasser', 'Softdrinks', 'Säfte', 'Eistee', 'Energy', 'Bier', 'Wein', 'Spirituosen', 'Snacks'],
  [
    i('Mineralwasser 0,5', 'Stück', '0.30', [], 'Beverage'), i('Mineralwasser 1,5', 'Stück', '0.52', [], 'Beverage'),
    i('Cola 0,33', 'Stück', '0.78', [], 'Beverage'), i('Cola 1,0', 'Stück', '1.30', [], 'Beverage'),
    i('Fanta 0,33', 'Stück', '0.75', [], 'Beverage'), i('Sprite 0,33', 'Stück', '0.75', [], 'Beverage'),
    i('Apfelsaft 1,0', 'Stück', '1.40', [], 'Beverage'), i('Orangensaft 1,0', 'Stück', '1.50', [], 'Beverage'),
    i('Eistee Pfirsich 1,5', 'Stück', '1.20', [], 'Beverage'), i('Eistee Zitrone 1,5', 'Stück', '1.20', [], 'Beverage'),
    i('Energy 0,25', 'Stück', '1.10', [], 'Beverage'), i('Pils 0,5', 'Stück', '0.95', [], 'Beverage'),
    i('Helles 0,5', 'Stück', '0.98', [], 'Beverage'), i('Weißwein 0,75', 'Stück', '4.20', [], 'Beverage'),
    i('Rotwein 0,75', 'Stück', '4.50', [], 'Beverage'), i('Wodka 0,7', 'Stück', '8.50', [], 'Beverage'),
    i('Gin 0,7', 'Stück', '9.20', [], 'Beverage'), i('Whisky 0,7', 'Stück', '10.50', [], 'Beverage'),
    i('Chips', 'Stück', '0.90'), i('Erdnüsse', 'Stück', '0.75', ['H']),
  ],
  [
    { name: 'Mineralwasser 0,5', category: 'Wasser', price: '1.80', ingredients: [pi('Mineralwasser 0,5', '1.000')] },
    { name: 'Mineralwasser 1,5', category: 'Wasser', price: '2.40', ingredients: [pi('Mineralwasser 1,5', '1.000')] },
    { name: 'Cola 0,33', category: 'Softdrinks', price: '2.80', ingredients: [pi('Cola 0,33', '1.000')] },
    { name: 'Cola 1,0', category: 'Softdrinks', price: '3.90', ingredients: [pi('Cola 1,0', '1.000')] },
    { name: 'Fanta 0,33', category: 'Softdrinks', price: '2.80', ingredients: [pi('Fanta 0,33', '1.000')] },
    { name: 'Sprite 0,33', category: 'Softdrinks', price: '2.80', ingredients: [pi('Sprite 0,33', '1.000')] },
    { name: 'Apfelsaft 1,0', category: 'Säfte', price: '4.20', ingredients: [pi('Apfelsaft 1,0', '1.000')] },
    { name: 'Orangensaft 1,0', category: 'Säfte', price: '4.40', ingredients: [pi('Orangensaft 1,0', '1.000')] },
    { name: 'Eistee Pfirsich 1,5', category: 'Eistee', price: '3.60', ingredients: [pi('Eistee Pfirsich 1,5', '1.000')] },
    { name: 'Eistee Zitrone 1,5', category: 'Eistee', price: '3.60', ingredients: [pi('Eistee Zitrone 1,5', '1.000')] },
    { name: 'Energy 0,25', category: 'Energy', price: '3.20', ingredients: [pi('Energy 0,25', '1.000')] },
    { name: 'Pils 0,5', category: 'Bier', price: '2.80', ingredients: [pi('Pils 0,5', '1.000')] },
    { name: 'Helles 0,5', category: 'Bier', price: '2.90', ingredients: [pi('Helles 0,5', '1.000')] },
    { name: 'Weißwein 0,75', category: 'Wein', price: '9.90', ingredients: [pi('Weißwein 0,75', '1.000')] },
    { name: 'Rotwein 0,75', category: 'Wein', price: '10.40', ingredients: [pi('Rotwein 0,75', '1.000')] },
    { name: 'Wodka 0,7', category: 'Spirituosen', price: '17.90', ingredients: [pi('Wodka 0,7', '1.000')] },
    { name: 'Gin 0,7', category: 'Spirituosen', price: '19.90', ingredients: [pi('Gin 0,7', '1.000')] },
    { name: 'Whisky 0,7', category: 'Spirituosen', price: '22.90', ingredients: [pi('Whisky 0,7', '1.000')] },
    { name: 'Chips Paprika', category: 'Snacks', price: '2.80', ingredients: [pi('Chips', '1.000')] },
    { name: 'Erdnüsse gesalzen', category: 'Snacks', price: '2.40', ingredients: [pi('Erdnüsse', '1.000')] },
  ],
  ['Gekühlt liefern', 'Pfandhinweis', 'Stattdessen Zero', 'Mischkiste', 'Party-Paket']
)

DATA['kiosk-späti'] = baseTemplate(
  'KS',
  ['Softdrinks', 'Wasser', 'Eistee', 'Energy', 'Snacks', 'Süßwaren', 'Tabakbedarf', 'Bier', 'Spirituosen', 'Haushalt'],
  [
    i('Cola 0,5', 'Stück', '0.95', [], 'Beverage'), i('Fanta 0,5', 'Stück', '0.92', [], 'Beverage'),
    i('Wasser 0,5', 'Stück', '0.35', [], 'Beverage'), i('Wasser 1,5', 'Stück', '0.52', [], 'Beverage'),
    i('Eistee 0,5', 'Stück', '0.90', [], 'Beverage'), i('Energy 0,25', 'Stück', '1.10', [], 'Beverage'),
    i('Chips', 'Stück', '0.92'), i('Nachos', 'Stück', '1.05', ['A']), i('Schokolade', 'Stück', '0.78', ['G']),
    i('Gummibärchen', 'Stück', '0.70'), i('Kaugummi', 'Stück', '0.38'), i('Feuerzeug', 'Stück', '0.45'),
    i('Filter Tips', 'Stück', '0.55'), i('Bier 0,5', 'Stück', '0.98', [], 'Beverage'),
    i('Radler 0,5', 'Stück', '0.96', [], 'Beverage'), i('Wodka 0,2', 'Stück', '3.80', [], 'Beverage'),
    i('Gin Tonic Dose', 'Stück', '2.90', [], 'Beverage'), i('Batterien AA', 'Stück', '1.20'),
    i('Küchenrolle', 'Stück', '1.10'), i('Taschentücher', 'Stück', '0.65'),
  ],
  [
    { name: 'Cola 0,5', category: 'Softdrinks', price: '2.60', ingredients: [pi('Cola 0,5', '1.000')] },
    { name: 'Fanta 0,5', category: 'Softdrinks', price: '2.60', ingredients: [pi('Fanta 0,5', '1.000')] },
    { name: 'Wasser 0,5', category: 'Wasser', price: '1.90', ingredients: [pi('Wasser 0,5', '1.000')] },
    { name: 'Wasser 1,5', category: 'Wasser', price: '2.50', ingredients: [pi('Wasser 1,5', '1.000')] },
    { name: 'Eistee 0,5', category: 'Eistee', price: '2.50', ingredients: [pi('Eistee 0,5', '1.000')] },
    { name: 'Energy 0,25', category: 'Energy', price: '3.20', ingredients: [pi('Energy 0,25', '1.000')] },
    { name: 'Chips Paprika', category: 'Snacks', price: '2.80', ingredients: [pi('Chips', '1.000')] },
    { name: 'Nachos Cheese', category: 'Snacks', price: '3.20', ingredients: [pi('Nachos', '1.000')] },
    { name: 'Schokolade Vollmilch', category: 'Süßwaren', price: '1.80', ingredients: [pi('Schokolade', '1.000')] },
    { name: 'Gummibärchen', category: 'Süßwaren', price: '1.60', ingredients: [pi('Gummibärchen', '1.000')] },
    { name: 'Kaugummi Mint', category: 'Süßwaren', price: '1.00', ingredients: [pi('Kaugummi', '1.000')] },
    { name: 'Feuerzeug', category: 'Tabakbedarf', price: '1.50', ingredients: [pi('Feuerzeug', '1.000')] },
    { name: 'Filter Tips', category: 'Tabakbedarf', price: '2.20', ingredients: [pi('Filter Tips', '1.000')] },
    { name: 'Pils 0,5', category: 'Bier', price: '2.80', ingredients: [pi('Bier 0,5', '1.000')] },
    { name: 'Radler 0,5', category: 'Bier', price: '2.80', ingredients: [pi('Radler 0,5', '1.000')] },
    { name: 'Wodka 0,2', category: 'Spirituosen', price: '7.90', ingredients: [pi('Wodka 0,2', '1.000')] },
    { name: 'Gin Tonic Dose', category: 'Spirituosen', price: '5.50', ingredients: [pi('Gin Tonic Dose', '1.000')] },
    { name: 'Batterien AA 4er', category: 'Haushalt', price: '4.90', ingredients: [pi('Batterien AA', '4.000')] },
    { name: 'Küchenrolle', category: 'Haushalt', price: '2.40', ingredients: [pi('Küchenrolle', '1.000')] },
    { name: 'Taschentücher', category: 'Haushalt', price: '1.90', ingredients: [pi('Taschentücher', '1.000')] },
  ],
  ['Kalt ausliefern', 'Partybox', 'Pfandhinweis', 'Alternative Marke', 'Expresslieferung']
)

DATA['grill-imbiss'] = deriveTemplate(
  DATA['burger-smashburger'],
  'GI',
  { 'Smash Burger': 'Grillteller', 'Classic Burger': 'Wurst & Fleisch', 'Loaded Fries': 'Beilagen', Sides: 'Beilagen', Dips: 'Saucen' },
  (name) => (name.includes('Burger') ? name.replace('Burger', 'Grill') : null),
  ['Extra Zwiebeln', 'Knoblauchsoße']
)
DATA.asiatisch = deriveTemplate(
  DATA.pizzeria,
  'AS',
  { 'Pizza Klassiker': 'Wok & Reis', 'Pizza Spezial': 'Nudelgerichte', Vegetarisch: 'Vegetarisch', Pasta: 'Nudelgerichte', Salate: 'Suppen', Fingerfood: 'Vorspeisen', Dessert: 'Dessert' },
  (name) => name.replace('Pizza', 'Wok').replace('Pasta', 'Nudel').replace('Penne', 'Gebratene Nudeln').replace('Spaghetti', 'Udon').replace('Salat', 'Suppe'),
  ['Extra Schärfe', 'Sojasoße', 'Erdnusssauce']
)
DATA['cafe-bäckerei'] = deriveTemplate(
  DATA.pizzeria,
  'CB',
  { 'Pizza Klassiker': 'Frühstück', 'Pizza Spezial': 'Belegte Brote', Vegetarisch: 'Süßes', Pasta: 'Backwaren', Salate: 'Kaffee', Fingerfood: 'Snacks', Dessert: 'Kuchen', Getränke: 'Kaltgetränke' },
  (name) => name.replace('Pizza', 'Panini').replace('Pasta', 'Croissant').replace('Penne', 'Laugenstange').replace('Spaghetti', 'Bagel'),
  ['Hafermilch', 'Laktosefrei', 'Extra Espresso']
)
DATA['restaurant-allgemein'] = deriveTemplate(
  DATA.pizzeria,
  'RA',
  { 'Pizza Klassiker': 'Hauptgerichte', 'Pizza Spezial': 'Spezialitäten', Vegetarisch: 'Vegetarisch', Pasta: 'Nudelgerichte', Salate: 'Salate', Fingerfood: 'Vorspeisen', Dessert: 'Dessert', Getränke: 'Getränke' },
  (name) => name.replace('Pizza', 'Hausgericht'),
  ['Ohne Salz', 'Saisonale Empfehlung']
)
DATA['steakhouse-grillhaus'] = deriveTemplate(
  DATA['burger-smashburger'],
  'SG',
  { 'Smash Burger': 'Steaks', 'Classic Burger': 'Grillklassiker', 'Chicken Burger': 'Geflügel', 'Veggie Burger': 'Vegetarisch', 'Loaded Fries': 'Beilagen', Sides: 'Beilagen', Dips: 'Steak-Saucen' },
  (name) => name.replace('Smash', 'Rumpsteak').replace('Cheeseburger', 'Steakburger').replace('Chicken', 'Hähnchensteak'),
  ['Pfeffersoße', 'Kräuterbutter']
)
DATA.sushi = deriveTemplate(
  DATA.asiatisch,
  'SU',
  { 'Wok & Reis': 'Maki', Nudelgerichte: 'Nigiri', Vorspeisen: 'Inside-Out', Suppen: 'Bowls' },
  (name) => name.replace('Wok', 'Maki').replace('Nudel', 'Nigiri').replace('Suppe', 'Miso Suppe'),
  ['Wasabi', 'Sojasoße', 'Ingwer']
)
DATA['vegan-healthy-food'] = deriveTemplate(
  DATA.asiatisch,
  'VH',
  { 'Wok & Reis': 'Bowls', Nudelgerichte: 'Wraps', Vegetarisch: 'Vegan', Suppen: 'Salate', Vorspeisen: 'Snacks', Dessert: 'Dessert' },
  (name) => name.replace('Hähnchen', 'Tofu').replace('Kalb', 'Seitan').replace('Wok', 'Protein Bowl'),
  ['Extra Avocado', 'Protein-Topping']
)
DATA.foodtruck = deriveTemplate(
  DATA['burger-smashburger'],
  'FT',
  { 'Smash Burger': 'Streetfood Burger', 'Classic Burger': 'Streetfood Klassiker', 'Chicken Burger': 'Streetfood Chicken', 'Veggie Burger': 'Streetfood Veggie', 'Loaded Fries': 'Loaded Fries', Sides: 'Snacks', Dips: 'Saucen' },
  (name) => `Truck ${name}`,
  ['Mehr Servietten', 'To-Go Besteck']
)
DATA['eisdiele-dessert'] = deriveTemplate(
  DATA['cafe-bäckerei'],
  'ED',
  { Frühstück: 'Eisbecher', 'Belegte Brote': 'Waffeln', Süßes: 'Crepes', Backwaren: 'Kuchen', Kaffee: 'Kaffee', Snacks: 'Snacks', Kuchen: 'Dessert', Kaltgetränke: 'Getränke' },
  (name) => name.replace('Panini', 'Eisbecher').replace('Croissant', 'Waffel').replace('Bagel', 'Crêpe'),
  ['Extra Kugel', 'Sahne', 'Schokosoße']
)
DATA['bar-lounge'] = deriveTemplate(
  DATA.getränkelieferdienst,
  'BL',
  { Wasser: 'Signature Drinks', Softdrinks: 'Cocktails', Säfte: 'Mocktails', Eistee: 'Longdrinks', Energy: 'Highballs', Bier: 'Bier', Wein: 'Wein', Spirituosen: 'Spirituosen', Snacks: 'Barfood' },
  (name) => name.replace('Cola', 'Cuba Libre').replace('Wasser', 'Gin Basil').replace('Whisky', 'Whisky Sour'),
  ['Extra Eis', 'Ohne Alkohol', 'Doppelter Shot']
)

function isProduction() {
  return (process.env.NODE_ENV || '').toLowerCase() === 'production'
}

function normalizeIngredientCategory(rawCategory) {
  const normalizedInput =
    typeof rawCategory === 'string' && rawCategory.trim().length > 0
      ? rawCategory.trim().toUpperCase()
      : 'FOOD'
  const mapped = INGREDIENT_CATEGORY_ALIAS.get(normalizedInput) || normalizedInput
  if (!VALID_INGREDIENT_CATEGORIES.has(mapped)) {
    if (!warnedUnknownIngredientCategories.has(normalizedInput)) {
      warnedUnknownIngredientCategories.add(normalizedInput)
      console.warn(
        `[seed-business-templates] Unbekannte IngredientCategory "${normalizedInput}" erkannt, nutze automatisch "FOOD".`
      )
    }
    return {
      input: normalizedInput,
      mapped: 'FOOD',
      valid: true,
    }
  }
  return {
    input: normalizedInput,
    mapped,
    valid: true,
  }
}

function validateTemplateIngredientCategories(templatesData) {
  const normalizedSummary = new Map()
  for (const [templateKey, templateData] of Object.entries(templatesData)) {
    for (const ingredient of templateData.ingredients || []) {
      const categoryInfo = normalizeIngredientCategory(ingredient.category)
      const key = `${categoryInfo.input}->${categoryInfo.mapped}`
      normalizedSummary.set(key, (normalizedSummary.get(key) || 0) + 1)
      if (categoryInfo.input !== categoryInfo.mapped) {
        console.warn(
          `[seed-business-templates] Kategorie normalisiert: Template="${templateKey}", Zutat="${ingredient.name}", "${categoryInfo.input}" -> "${categoryInfo.mapped}".`
        )
      }
    }
  }
  return normalizedSummary
}

function isTemplateProductNumberNullConstraintError(error) {
  const message = error instanceof Error ? error.message : String(error || '')
  return (
    message.includes('Null constraint violation') &&
    message.includes('productNumber')
  )
}

function isTemplateProductNumberUniqueConstraintError(error) {
  const message = error instanceof Error ? error.message : String(error || '')
  return message.includes('Unique constraint failed')
}

function buildLegacyTemplateProductNumber(templateKey, productName, categoryName) {
  const raw = `${templateKey}__${categoryName || 'CAT'}__${productName}`
    .toUpperCase()
    .replace(/[^A-Z0-9]+/g, '_')
    .replace(/^_+|_+$/g, '')
  return `TPL_${raw}`.slice(0, 120)
}

function assertSafetyGuards() {
  if (isProduction() && process.env.ALLOW_PRODUCTION_TEMPLATE_SEED !== 'true') {
    throw new Error('Produktionsschutz aktiv. Für Prod-Seeding setze ALLOW_PRODUCTION_TEMPLATE_SEED=true explizit.')
  }
  if (process.env.ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS === 'true') {
    throw new Error('Unsichere ENV erkannt (ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS=true). Abbruch.')
  }
}

async function upsertTemplateBase(entry, sortOrder) {
  return prisma.businessTemplate.upsert({
    where: { key: entry.key },
    update: {
      name: `${entry.icon} ${entry.name}`,
      type: entry.type,
      sortOrder,
      isActive: true,
      description: `${entry.icon} ${entry.name} - Demo-Vorlage mit realistischen Artikeln`,
    },
    create: {
      key: entry.key,
      type: entry.type,
      name: `${entry.icon} ${entry.name}`,
      description: `${entry.icon} ${entry.name} - Demo-Vorlage mit realistischen Artikeln`,
      isActive: true,
      sortOrder,
    },
  })
}

async function upsertTemplateData(template, data) {
  const categoryByName = new Map()
  for (let index = 0; index < data.categories.length; index += 1) {
    const categoryName = data.categories[index]
    const category = await prisma.businessTemplateCategory.upsert({
      where: { templateId_name: { templateId: template.id, name: categoryName } },
      update: { sortOrder: index + 1 },
      create: { templateId: template.id, name: categoryName, sortOrder: index + 1 },
    })
    categoryByName.set(categoryName, category.id)
  }

  const ingredientByName = new Map()
  for (const ing of data.ingredients) {
    const categoryInfo = normalizeIngredientCategory(ing.category)
    const row = await prisma.businessTemplateIngredient.upsert({
      where: { templateId_name: { templateId: template.id, name: ing.name } },
      update: { category: categoryInfo.mapped, unit: ing.unit, purchasePrice: ing.purchasePrice, allergens: ing.allergens },
      create: { templateId: template.id, name: ing.name, category: categoryInfo.mapped, unit: ing.unit, purchasePrice: ing.purchasePrice, allergens: ing.allergens },
    })
    ingredientByName.set(ing.name, row.id)
  }

  for (const prod of data.products) {
    const existingProduct = await prisma.businessTemplateProduct.findFirst({
      where: {
        templateId: template.id,
        name: prod.name,
        categoryId: categoryByName.get(prod.category) || null,
      },
      select: { id: true },
    })
    let productRow
    const legacyProductNumber = buildLegacyTemplateProductNumber(
      template.key,
      prod.name,
      prod.category
    )
    if (existingProduct) {
      productRow = await prisma.businessTemplateProduct.update({
        where: { id: existingProduct.id },
        data: {
          name: prod.name,
          categoryId: categoryByName.get(prod.category) || null,
          price: prod.price,
          vatRate: '7.00',
          available: true,
        },
      })
    } else {
      try {
        productRow = await prisma.businessTemplateProduct.create({
          data: {
            templateId: template.id,
            categoryId: categoryByName.get(prod.category) || null,
            productNumber: null,
            name: prod.name,
            price: prod.price,
            vatRate: '7.00',
            available: true,
          },
        })
      } catch (error) {
        if (!isTemplateProductNumberNullConstraintError(error)) {
          throw error
        }
        try {
          productRow = await prisma.businessTemplateProduct.create({
            data: {
              templateId: template.id,
              categoryId: categoryByName.get(prod.category) || null,
              productNumber: '',
              name: prod.name,
              price: prod.price,
              vatRate: '7.00',
              available: true,
            },
          })
        } catch (nestedError) {
          if (!isTemplateProductNumberUniqueConstraintError(nestedError)) {
            throw nestedError
          }
          console.warn(
            `[seed-business-templates] Legacy-DB erkannt (productNumber mit Unique/Not-Null). Nutze technische Fallback-ID für Template="${template.key}" Produkt="${prod.name}".`
          )
          productRow = await prisma.businessTemplateProduct.create({
            data: {
              templateId: template.id,
              categoryId: categoryByName.get(prod.category) || null,
              productNumber: legacyProductNumber,
              name: prod.name,
              price: prod.price,
              vatRate: '7.00',
              available: true,
            },
          })
        }
      }
    }

    for (const link of prod.ingredients) {
      const ingredientId = ingredientByName.get(link.name)
      if (!ingredientId) continue
      await prisma.businessTemplateProductIngredient.upsert({
        where: { templateProductId_templateIngredientId: { templateProductId: productRow.id, templateIngredientId: ingredientId } },
        update: { quantity: link.quantity },
        create: { templateProductId: productRow.id, templateIngredientId: ingredientId, quantity: link.quantity },
      })
    }
  }

  return { categories: data.categories.length, products: data.products.length, ingredients: data.ingredients.length, modifiers: data.modifiers?.length || 0 }
}

async function run() {
  assertSafetyGuards()
  validateTemplateIngredientCategories(DATA)
  const summary = []
  let sortOrder = 1
  for (const templateEntry of TEMPLATE_TYPES) {
    const template = await upsertTemplateBase(templateEntry, sortOrder)
    const data = DATA[templateEntry.key] || DATA['restaurant-allgemein']
    const counts = await upsertTemplateData(template, data)
    summary.push({ name: templateEntry.name, ...counts })
    sortOrder += 1
  }

  console.log('Business-Templates aktualisiert:')
  for (const row of summary) {
    console.log(`- ${row.name}: ${row.categories} Kategorien, ${row.products} Produkte, ${row.ingredients} Zutaten, ${row.modifiers} Modifier-Vorschläge`)
  }
}

run()
  .catch((error) => {
    console.error('TEMPLATE SEED FEHLER:', error instanceof Error ? error.message : error)
    process.exitCode = 1
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
