import { redirect } from 'next/navigation'

export default function AdminPaymentsConnectRefreshPage() {
  redirect('/admin/payments?stripe=refresh')
}
