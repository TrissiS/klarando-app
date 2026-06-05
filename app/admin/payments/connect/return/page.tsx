import { redirect } from 'next/navigation'

export default function AdminPaymentsConnectReturnPage() {
  redirect('/admin/payments?stripe=return')
}
