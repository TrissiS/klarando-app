type Props = {
  type?: string
  value: string
  onChange: (value: string) => void
  placeholder?: string
  required?: boolean
  step?: string
}

export default function TextInput({
  type = 'text',
  value,
  onChange,
  placeholder,
  required,
  step,
}: Props) {
  return (
    <input
      type={type}
      value={value}
      onChange={(e) => onChange(e.target.value)}
      placeholder={placeholder}
      required={required}
      step={step}
      className="brand-input w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 transition"
    />
  )
}
