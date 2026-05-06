type Props = {
  children: React.ReactNode
  type?: 'button' | 'submit'
  disabled?: boolean
  color?: 'orange' | 'dark' | 'green'
}

export default function PrimaryButton({
  children,
  type = 'button',
  disabled = false,
  color = 'orange',
}: Props) {
  const colorClasses = {
    orange: 'brand-button-primary text-white',
    dark: 'bg-rose-900 hover:bg-rose-800 text-white',
    green: 'bg-emerald-600 hover:bg-emerald-700 text-white',
  }

  return (
    <button
      type={type}
      disabled={disabled}
      className={`w-full rounded-xl px-4 py-2 font-medium transition disabled:cursor-not-allowed disabled:opacity-60 ${colorClasses[color]}`}
    >
      {children}
    </button>
  )
}
