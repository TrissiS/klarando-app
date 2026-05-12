import type { Metadata } from 'next'
import LegalShell from '@/app/Components/legal/LegalShell'

export const metadata: Metadata = {
  title: 'AGB | Klarando',
  description: 'Allgemeine Geschaeftsbedingungen von Klarando',
}

export default function AgbPage() {
  return (
    <LegalShell
      title="Allgemeine Geschaeftsbedingungen (AGB)"
      subtitle="Vorlage fuer Plattform- und Bestellbedingungen."
      updatedAt="15.04.2026"
    >
      <div className="space-y-6 text-sm leading-7 text-rose-900/90">
        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">1. Geltungsbereich</h2>
          <p>
            Diese Bedingungen gelten fuer die Nutzung der Klarando Plattform und fuer
            Bestellvorgaenge zwischen Endkunden und angeschlossenen Betrieben.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">2. Vertragspartner</h2>
          <p>
            Bei Bestellungen kommt der Vertrag ueber Speisen und Getränke zwischen Endkunde und
            jeweiliger Filiale zustande. Klarando stellt die technische Plattform bereit.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">3. Bestellung und Zahlung</h2>
          <p>
            Preise, Liefergebuehren und Mindestbestellwerte werden vor Abschluss angezeigt.
            Bestellungen koennen je nach Filiale per angebotenen Zahlungsarten bezahlt werden.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">4. Lieferung und Abholung</h2>
          <p>
            Lieferzeiten sind unverbindliche Richtwerte, sofern nicht anders vereinbart. Bei
            Abholung ist die Bestellung zum mitgeteilten Zeitpunkt bereitzustellen.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">5. Haftung</h2>
          <p>
            Klarando haftet im Rahmen der gesetzlichen Vorschriften. Fuer Inhalte und Erfuellung
            konkreter Bestellungen ist die jeweilige Filiale verantwortlich.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">6. Schlussbestimmungen</h2>
          <p>
            Es gilt deutsches Recht. Zwingende Verbraucherschutzvorschriften bleiben unberuehrt.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">Wichtiger Hinweis</h2>
          <p>
            Diese AGB sind als praxisnahe Vorlage angelegt. Vor finalem Launch bitte rechtlich
            pruefen und mit eurem konkreten Geschaeftsmodell abstimmen.
          </p>
        </section>
      </div>
    </LegalShell>
  )
}

