import type { Metadata } from "next";
import LegalShell from "@/app/Components/legal/LegalShell";

export const metadata: Metadata = {
  title: "Datenschutz | Klarando",
  description: "Datenschutzerklärung der Klarando Plattform",
};

export default function DatenschutzPage() {
  return (
    <LegalShell
      title="Datenschutzerklärung"
      subtitle="Informationen zur Datenverarbeitung nach DSGVO für Webplattform und Apps."
      updatedAt="14.05.2026"
    >
      <div className="space-y-6 text-sm leading-7 text-rose-900/90">
        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">1. Verantwortlicher</h2>
          <p>Klarando, Einzelunternehmen</p>
          <p>Inhaber: Tristan Stenger</p>
          <p>Untere Wiesenstr. 6, 57271 Hilchenbach, Deutschland</p>
          <p>E-Mail: info@klarando.com</p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">2. Hosting und Infrastruktur</h2>
          <p>
            Das System wird auf einem IONOS VPS in Deutschland/EU betrieben. Domains:
            klarando.com, app.klarando.com, api.klarando.com.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">3. Verarbeitete Daten</h2>
          <p>
            Verarbeitet werden insbesondere Konto-, Kontakt- und Bestelldaten, Lieferadressen,
            Standortdaten (bei Freigabe), Fahrerstandort während aktiver Lieferung, Händlerdaten,
            Zahlungsstatus, technische Protokolle sowie App-/Spracheinstellungen.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">4. Zwecke und Rechtsgrundlagen</h2>
          <p>
            Verarbeitung erfolgt zur Vertragsabwicklung (Art. 6 Abs. 1 lit. b DSGVO), zur Erfüllung
            gesetzlicher Pflichten (lit. c), auf Basis berechtigter Interessen (lit. f) sowie, wo
            erforderlich, mit Einwilligung (lit. a), z. B. für optionale Cookies/Analyse.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">5. Empfänger</h2>
          <p>
            Daten werden zur Bestellabwicklung an den jeweiligen Händler/Restaurantbetrieb sowie
            erforderliche Fahrer übermittelt. Bei Zahlungen werden Daten an Zahlungsdienstleister
            (z. B. PayPal) übergeben. Für Kartenfunktionen werden Google-Maps-Dienste verwendet.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">6. Social Login und Apps</h2>
          <p>
            Bei Google-/Apple-/Social-Login werden notwendige Kontoinformationen zur Authentifizierung
            verarbeitet. Android ist aktiv, iOS folgt. Push-Nachrichten und Standortabfragen erfolgen
            nur mit entsprechender Nutzerfreigabe.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">7. Speicherdauer</h2>
          <p>
            Daten werden nur so lange gespeichert, wie es für den jeweiligen Zweck, gesetzliche
            Aufbewahrungsfristen oder die Verteidigung von Rechtsansprüchen erforderlich ist.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">8. Betroffenenrechte</h2>
          <p>
            Sie haben das Recht auf Auskunft, Berichtigung, Löschung, Einschränkung, Widerspruch,
            Datenübertragbarkeit sowie auf Widerruf erteilter Einwilligungen für die Zukunft.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">9. Cookies und Consent</h2>
          <p>
            Einwilligungen werden mit Kategorien, Zeitstempel und Consent-Version gespeichert.
            Notwendige Cookies sind aktiv, optionale Kategorien (Analyse/Marketing/Maps-Funktionen)
            bleiben standardmäßig deaktiviert.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">10. Hinweis</h2>
          <p>
            Diese Fassung ist ein MVP-Entwurf und muss vor Go-Live juristisch final geprüft werden
            (insbesondere Zahlungsfluss, Auftragsverarbeitung und internationale Dienstleister).
          </p>
        </section>
      </div>
    </LegalShell>
  );
}
