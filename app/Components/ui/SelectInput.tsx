type Option = {
  label: string
  value: string
}

type Props = {
  value: string
  onChange: (value: string) => void
  options: Option[]
}

export default function SelectInput({ value, onChange, options }: Props) {
  return (
    <select
      value={value}
      onChange={(e) => onChange(e.target.value)}
      className="brand-input w-full rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 transition"
    >
      {options.map((option) => (
        <option key={option.value} value={option.value}>
          {option.label}
        </option>
      ))}
    </select>
  )
}
