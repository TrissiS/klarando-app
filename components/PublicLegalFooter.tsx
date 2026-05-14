import Link from "next/link";

export default function PublicLegalFooter() {
  return (
    <footer className="mt-6 rounded-2xl border border-[var(--brand-border)] bg-white/90 p-4 text-sm text-rose-900/80">
      <div className="flex flex-wrap items-center gap-4">
        <Link href="/impressum" className="font-semibold text-rose-700 hover:text-rose-900">
          Impressum
        </Link>
        <Link href="/datenschutz" className="font-semibold text-rose-700 hover:text-rose-900">
          Datenschutz
        </Link>
        <Link href="/agb" className="font-semibold text-rose-700 hover:text-rose-900">
          AGB
        </Link>
        <Link href="/cookies" className="font-semibold text-rose-700 hover:text-rose-900">
          Cookies
        </Link>
        <Link href="/jugendschutz" className="font-semibold text-rose-700 hover:text-rose-900">
          Jugendschutz
        </Link>
        <Link href="/partner-agb" className="font-semibold text-rose-700 hover:text-rose-900">
          Partner-AGB
        </Link>
      </div>
    </footer>
  );
}
