import nodemailer from 'nodemailer'

type SendMailInput = {
  to: string
  subject: string
  text: string
  html: string
}

let cachedTransporter: nodemailer.Transporter | null = null

function parseBoolean(value: string | undefined, fallback: boolean) {
  if (typeof value !== 'string') {
    return fallback
  }
  const normalized = value.trim().toLowerCase()
  if (normalized === 'true') {
    return true
  }
  if (normalized === 'false') {
    return false
  }
  return fallback
}

function getMailConfig() {
  const host = process.env.SMTP_HOST?.trim() || ''
  const port = Number.parseInt(process.env.SMTP_PORT || '587', 10)
  const user = process.env.SMTP_USER?.trim() || ''
  const pass = process.env.SMTP_PASS || ''
  const from = process.env.SMTP_FROM?.trim() || ''
  const secure = parseBoolean(process.env.SMTP_SECURE, false)

  return { host, port, user, pass, from, secure }
}

export function isMailConfigured() {
  const cfg = getMailConfig()
  return Boolean(cfg.host && cfg.port > 0 && cfg.from)
}

function getTransporter() {
  if (cachedTransporter) {
    return cachedTransporter
  }

  const cfg = getMailConfig()
  if (!cfg.host || !cfg.from || !cfg.port) {
    throw new Error('SMTP ist nicht vollständig konfiguriert.')
  }

  cachedTransporter = nodemailer.createTransport({
    host: cfg.host,
    port: cfg.port,
    secure: cfg.secure,
    auth: cfg.user && cfg.pass ? { user: cfg.user, pass: cfg.pass } : undefined,
  })

  return cachedTransporter
}

export async function sendMail(input: SendMailInput) {
  const cfg = getMailConfig()
  const transporter = getTransporter()
  await transporter.sendMail({
    from: cfg.from,
    to: input.to,
    subject: input.subject,
    text: input.text,
    html: input.html,
  })
}
