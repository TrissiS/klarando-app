import type { Metadata } from 'next'
import LegalShell from '@/app/Components/legal/LegalShell'

export const metadata: Metadata = {
  title: 'Datenschutz | Klarando',
  description: 'Datenschutzerklärung der Klarando Plattform',
}

export default function DatenschutzPage() {
  return (
    <LegalShell
      title="Datenschutzerklärung"
      subtitle="Vorlage für die Datenschutzinformationen nach DSGVO."
      updatedAt="15.04.2026"
    >
      <div className="space-y-6 text-sm leading-7 text-rose-900/90">
        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">1. Verantwortlicher</h2>
          <p>Klarando GmbH, Am Wald 17, 57223 Kreuztal, Deutschland (Platzhalter)</p>
          <p>E-Mail: datenschutz@klarando.com</p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">2. Zwecke der Verarbeitung</h2>
          <p>
            Wir verarbeiten Daten zur Bereitstellung der Plattform, zur Abwicklung von
            Bestellungen, zur Kundenkommunikation, zur Erfüllung gesetzlicher Pflichten sowie
            zur IT-Sicherheit und Missbrauchsprävention.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">3. Rechtsgrundlagen</h2>
          <p>
            Je nach Vorgang basiert die Verarbeitung auf Art. 6 Abs. 1 lit. b DSGVO
            (Vertragserfüllung), lit. c DSGVO (gesetzliche Pflichten), lit. f DSGVO
            (berechtigte Interessen) oder lit. a DSGVO (Einwilligung).
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">4. Empfänger</h2>
          <p>
            Daten können an technische Dienstleister, Hosting-Anbieter, Zahlungsdienstleister
            und Kommunikationsdienste übermittelt werden, soweit dies zur Leistungserbringung
            erforderlich ist.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">5. Speicherdauer</h2>
          <p>
            Daten werden nur so lange gespeichert, wie es für den jeweiligen Zweck oder für
            gesetzliche Aufbewahrungsfristen erforderlich ist.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">6. Betroffenenrechte</h2>
          <p>
            Sie haben das Recht auf Auskunft, Berichtigung, Löschung, Einschränkung,
            Datenübertragbarkeit und Widerspruch sowie das Recht, eine Einwilligung jederzeit zu
            widerrufen.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">7. Kontakt für Datenschutz</h2>
          <p>E-Mail: datenschutz@klarando.com</p>
          <p>Support: support@klarando.com</p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">Wichtiger Hinweis</h2>
          <p>
            Diese Seite ist eine strukturierte Vorlage. Vor finalem Launch bitte Inhalte mit
            eurer Rechtsberatung und den real eingesetzten Dienstleistern finalisieren.
          </p>
        </section>
      </div>
    </LegalShell>
  )
}
