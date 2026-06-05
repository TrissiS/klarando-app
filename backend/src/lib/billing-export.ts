export const BILLING_EXPORT_VERSION = '2026-06-datev-prep-v1'

export type DatevExportRow = {
  invoiceId: string
  invoiceNumber: string
  tenantId: string | null
  chainId: string | null
  issueDate: string | null
  dueDate: string | null
  servicePeriodStart: string
  servicePeriodEnd: string
  recipientName: string | null
  recipientVatId: string | null
  issuerName: string | null
  issuerVatId: string | null
  issuerTaxNumber: string | null
  currency: string
  netAmountCents: number
  taxAmountCents: number
  grossAmountCents: number
  taxRatePercent: number | null
  paymentMethod: string | null
  paymentTermsDays: number | null
  bookingText: string
}

export type InvoiceExportRecord = {
  invoiceId: string
  invoiceNumber: string
  status: string
  exportedAt: string | null
  billingVersion: string | null
  issuerSnapshotPresent: boolean
  recipientSnapshotPresent: boolean
  vatSnapshotPresent: boolean
  auditSnapshotPresent: boolean
  rows: DatevExportRow[]
}
