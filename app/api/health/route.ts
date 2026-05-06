import { NextResponse } from 'next/server'

export function GET() {
  return NextResponse.json({
    ok: true,
    service: 'web',
    message: 'Web-Frontend läuft',
    timestamp: new Date().toISOString(),
  })
}
