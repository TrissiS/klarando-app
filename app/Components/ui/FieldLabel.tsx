type Props = {
  children: React.ReactNode
}

export default function FieldLabel({ children }: Props) {
  return (
    <label className="mb-1.5 block text-sm font-medium text-rose-900">
      {children}
    </label>
  )
}
