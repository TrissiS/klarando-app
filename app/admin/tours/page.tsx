'use client'

import AdminLayout from '@/app/Components/admin/AdminLayout'

export default function AdminToursPage() {
  return (
    <AdminLayout title="Tourenplanung" subtitle="Lieferbestellungen zu Touren bündeln und Fahrern zuweisen.">
      <div className="space-y-4">
        <div className="rounded-2xl border border-rose-200 bg-rose-50 px-4 py-3 text-sm text-rose-900">
          <p className="font-semibold">Tourenplanung</p>
          <p className="mt-1">
            Hier werden später offene Lieferbestellungen zu Touren gebündelt und Fahrern zugewiesen.
          </p>
        </div>
        <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          <TourCard title="Offene Lieferungen" value="-" />
          <TourCard title="Geplante Touren" value="-" />
          <TourCard title="Fahrer verfügbar" value="-" />
          <TourCard title="Tourstatus" value="Vorbereitung" />
        </div>
        <div className="rounded-2xl border border-dashed border-rose-300 bg-white px-4 py-4 text-sm text-rose-900/80">
          <p className="font-medium">Tourenmodul vorbereiten</p>
          <p className="mt-1 text-xs">
            Nächster Schritt: DeliveryTour, DeliveryTourStop, Reihenfolge der Stopps, Fahrerzuweisung und Statusfluss.
          </p>
        </div>
      </div>
    </AdminLayout>
  )
}

function TourCard({ title, value }: { title: string; value: string }) {
  return (
    <div className="rounded-2xl border border-[var(--brand-border)] bg-white px-4 py-3">
      <p className="text-xs uppercase tracking-wide text-rose-900/70">{title}</p>
      <p className="mt-2 text-lg font-semibold text-[var(--brand-ink)]">{value}</p>
    </div>
  )
}
