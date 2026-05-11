'use client'

import { useEffect, useState } from 'react'
import Link from 'next/link'
import { performPasswordReset } from '@/lib/api'

type Props = {
  searchParams: Promise<{ token?: string }>
}

function passwordRulesOk(password: string) {
  return (
    password.trim().length >= 10 &&
    /[A-Z]/.test(password) &&
    /[a-z]/.test(password) &&
    /[0-9]/.test(password)
  )
}

export default function ResetPasswordPage({ searchParams }: Props) {
  const [token, setToken] = useState('')
  const [password, setPassword] = useState('')
  const [message, setMessage] = useState('')
  const [error, setError] = useState('')
  const [loading, setLoading] = useState(false)

  useEffect(() => {
    searchParams.then((params) => setToken(params.token || ''))
  }, [searchParams])

  async function submit() {
    setError('')
    setMessage('')
    setLoading(true)
    try {
      const result = await performPasswordReset(token, password)
      setMessage(result.message)
      setPassword('')
    } catch (submitError) {
      setError(submitError instanceof Error ? submitError.message : 'Passwort-Reset fehlgeschlagen.')
    } finally {
      setLoading(false)
    }
  }

  return (
    <main className="mx-auto flex min-h-screen w-full max-w-lg flex-col justify-center px-4 py-8">
      <div className="rounded-2xl border border-rose-200 bg-white p-6 shadow-sm">
        <h1 className="text-2xl font-bold text-rose-900">Passwort zurücksetzen</h1>
        <p className="mt-2 text-sm text-rose-900/80">
          Vergib ein neues Passwort für dein Klarando-Konto.
        </p>

        <label className="mt-4 block text-sm font-semibold text-rose-900">Neues Passwort</label>
        <input
          value={password}
          onChange={(event) => setPassword(event.target.value)}
          type="password"
          className="mt-2 w-full rounded-xl border border-rose-200 px-3 py-2"
        />

        {!passwordRulesOk(password) && password.length > 0 ? (
          <p className="mt-2 text-xs text-red-700">
            Mindestens 10 Zeichen sowie Groß-/Kleinbuchstaben und eine Zahl verwenden.
          </p>
        ) : null}

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
          disabled={loading || !token || !passwordRulesOk(password)}
          className="mt-4 w-full rounded-xl bg-slate-900 px-4 py-2 font-semibold text-white disabled:opacity-60"
        >
          {loading ? 'Speichere...' : 'Passwort speichern'}
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
