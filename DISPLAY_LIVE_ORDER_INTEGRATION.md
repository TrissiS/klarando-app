# Display Live Order Integration

## Ziel
Display-Manifest kann optional Live-Bestellstatistiken liefern, damit Inhalte dynamisch auf echte Orderdaten reagieren.

## Manifest-Erweiterung
`displayManifest.liveStats` enthält:
- `topProductsToday`
- `topProductsWeek`
- `currentKitchenLoad`
- `averageWaitTimeMinutes`
- `soldOutProductIds`
- `lowStockProductIds`
- `activeOrderCount`
- `completedOrdersToday`
- `statsUpdatedAt`

## Produktfelder im Manifest
Zusätzlich pro Produkt:
- `soldToday`
- `isTopSeller`
- `isLowStock`
- `isSoldOut`
- `estimatedPrepTime`
- `popularityRank`

## Backend-Ansatz
- Aggregation tenant-sicher über `Order` + `OrderItem`
- Cache pro Tenant (`30s TTL`) zur Entlastung bei häufigem Polling
- Sold-out über `Product.available = false`
- Durchschnittliche Wartezeit über `Order.estimatedMinutes`

## Renderer-Verhalten
- Optionales Bestseller-/Beliebt-Badge
- Optionales Low-Stock-Badge
- Ausverkaufte Produkte markiert oder ausblendbar (`hideSoldOutProducts`)
- Optionale Infozeile: aktuelle Küchenwartezeit

## Screen-Studio (vorbereitet)
Runtime-Flags vorgesehen:
- `autoHighlightTopSellers`
- `hideSoldOutProducts`
- `markLowStockProducts`
- `showKitchenWaitTime`

## Debug
Overlay zeigt u. a.:
- `liveStatsLoaded`
- `topProductsCount`
- `soldOutCount`
- `averageWaitTime`
- `statsUpdatedAt`

## Offene Punkte
- Branch-spezifische Statistiken, sobald branch-fähige Order-Zuordnung überall konsistent ist
- SSE/WebSocket für nahezu Echtzeit
- dedizierte KPI-Infoslides (Umsatz/Load) im Screen Studio
