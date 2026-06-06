import { redirect } from 'next/navigation'

export default function AdminPaymentsConnectRefreshPage() {
  redirect('/admin/finanzen?stripe=refresh#stripe-connect')
}
