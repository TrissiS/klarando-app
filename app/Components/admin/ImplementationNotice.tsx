'use client'

type NoticeTone = 'info' | 'warn' | 'preparation'

const toneClass: Record<NoticeTone, string> = {
  info: 'border-sky-200 bg-sky-50 text-sky-900',
  warn: 'border-amber-200 bg-amber-50 text-amber-900',
  preparation: 'border-slate-300 bg-slate-100 text-slate-700',
}

type ImplementationNoticeProps = {
  title: string
  message: string
  tone?: NoticeTone
}

export default function ImplementationNotice({
  title,
  message,
  tone = 'info',
}: ImplementationNoticeProps) {
  return (
    <div className={`rounded-2xl border px-4 py-3 ${toneClass[tone]}`}>
      <div className="text-sm font-semibold">{title}</div>
      <div className="mt-1 text-sm">{message}</div>
    </div>
  )
}
