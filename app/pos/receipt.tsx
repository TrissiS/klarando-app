export function Receipt({ order }: { order: any }) {
  return (
    <div className="p-4 text-black">
      <h1 className="text-lg font-bold text-center">KLARANDO</h1>

      <div className="mt-2 text-sm text-center">
        {new Date(order.createdAt).toLocaleString()}
      </div>

      <hr className="my-3" />

      {order.items.map((item: any) => (
        <div key={item.id} className="flex justify-between text-sm">
          <span>
            {item.quantity}x {item.product.name}
          </span>
          <span>{item.price} EUR</span>
        </div>
      ))}

      <hr className="my-3" />

      <div className="flex justify-between font-bold">
        <span>Gesamt</span>
        <span>{order.total} EUR</span>
      </div>

      <p className="mt-4 text-center text-xs">Danke fuer deine Bestellung.</p>
    </div>
  )
}
