'use client'

import AdminLayout from '@/app/Components/admin/AdminLayout'

export default function AdminMarketingRatingsPage() {
  return (
    <AdminLayout
      title="Marketing · Bewertungen"
      subtitle="Bewertungen werden hier angezeigt."
    >
      <div className="rounded-2xl border border-rose-200 bg-white p-6 shadow-sm">
        <h2 className="text-lg font-semibold text-rose-950">Bewertungen</h2>
        <p className="mt-2 text-sm text-rose-900/75">
          Bewertungen werden hier angezeigt.
        </p>
      </div>
    </AdminLayout>
  )
}
