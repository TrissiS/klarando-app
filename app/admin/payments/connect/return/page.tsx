import { redirect } from 'next/navigation'

export default function AdminPaymentsConnectReturnPage() {
  redirect('/admin/finanzen?stripe=return#stripe-connect')
}
