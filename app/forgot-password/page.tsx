'use client'

import { useState } from 'react'
import Link from 'next/link'
import { requestPasswordReset } from '@/lib/api'

export default function ForgotPasswordPage() {
  const [email, setEmail] = useState('')
  const [message, setMessage] = useState('')
  const [error, setError] = useState('')
  const [loading, setLoading] = useState(false)

  async function submit() {
    setError('')
    setMessage('')
    setLoading(true)
    try {
      const result = await requestPasswordReset(email)
      setMessage(result.message)
    } catch (submitError) {
      setError(submitError instanceof Error ? submitError.message : 'Anfrage fehlgeschlagen.')
    } finally {
      setLoading(false)
    }
  }

  return (
    <main className="mx-auto flex min-h-screen w-full max-w-lg flex-col justify-center px-4 py-8">
      <div className="rounded-2xl border border-rose-200 bg-white p-6 shadow-sm">
        <h1 className="text-2xl font-bold text-rose-900">Passwort vergessen</h1>
        <p className="mt-2 text-sm text-rose-900/80">
          Gib deine E-Mail-Adresse ein. Wenn ein Konto existiert, senden wir dir einen Reset-Link.
        </p>

        <label className="mt-4 block text-sm font-semibold text-rose-900">E-Mail</label>
        <input
          value={email}
          onChange={(event) => setEmail(event.target.value)}
          type="email"
          className="mt-2 w-full rounded-xl border border-rose-200 px-3 py-2"
        />

        {message ? (
          <p className="mt-3 rounded-xl border border-emerald-200 bg-emerald-50 px-3 py-2 text-sm text-emerald-800">
            {message}
          </p>
        ) : null}
        {error ? (
          <p className="mt-3 rounded-xl border border-red-200 bg-red-50 px-3 py-2 text-sm text-red-700">
            {error}
          </p>
        ) : null}

        <button
          type="button"
          onClick={() => void submit()}
          disabled={loading || !email.trim()}
          className="mt-4 w-full rounded-xl bg-slate-900 px-4 py-2 font-semibold text-white disabled:opacity-60"
        >
          {loading ? 'Sende...' : 'Reset-Link anfordern'}
        </button>

        <div className="mt-4 text-sm">
          <Link href="/" className="font-semibold text-rose-800 underline">
            Zurück zum Login
          </Link>
        </div>
      </div>
    </main>
  )
}
