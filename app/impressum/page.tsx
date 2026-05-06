import type { Metadata } from 'next'
import LegalShell from '@/app/Components/legal/LegalShell'

export const metadata: Metadata = {
  title: 'Impressum | Klarando',
  description: 'Impressum der Klarando Plattform',
}

export default function ImpressumPage() {
  return (
    <LegalShell
      title="Impressum"
      subtitle="Angaben gemäß DDG § 5. Diese Seite wurde als produktionsnahe Vorlage vorbereitet."
      updatedAt="15.04.2026"
    >
      <div className="space-y-6 text-sm leading-7 text-rose-900/90">
        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">Anbieter</h2>
          <p>Klarando GmbH (Platzhalter bis Handelsregistereintrag final vorliegt)</p>
          <p>Am Wald 17, 57223 Kreuztal, Deutschland</p>
          <p>Vertreten durch die Geschäftsführung (Platzhalter)</p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">Kontakt</h2>
          <p>E-Mail: support@klarando.com</p>
          <p>Telefon: +49 (0)2732 123456 (Platzhalter)</p>
          <p>Web: https://www.klarando.com</p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">Registerangaben</h2>
          <p>Handelsregister: HRB XXXXX (Platzhalter)</p>
          <p>Registergericht: Amtsgericht Siegen (Platzhalter)</p>
          <p>USt-IdNr.: DE XXXXXXXX (Platzhalter)</p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">Verantwortlich für den Inhalt</h2>
          <p>Klarando GmbH, Anschrift wie oben.</p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">Hinweis</h2>
          <p>
            Diese Angaben sind als Vorlage gesetzt. Vor Livegang bitte Gesellschaftsform,
            Handelsregister, Vertretung und Steuerdaten final prüfen und ersetzen.
          </p>
        </section>
      </div>
    </LegalShell>
  )
}
