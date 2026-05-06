type Props = {
  children: React.ReactNode
  className?: string
}

export default function Card({ children, className = '' }: Props) {
  return (
    <section className={`brand-panel rounded-3xl p-6 ${className}`}>
      {children}
    </section>
  )
}
