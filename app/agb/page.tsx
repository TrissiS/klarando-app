import type { Metadata } from "next";
import LegalShell from "@/app/Components/legal/LegalShell";

export const metadata: Metadata = {
  title: "AGB | Klarando",
  description: "Allgemeine Geschäftsbedingungen der Klarando Plattform",
};

export default function AgbPage() {
  return (
    <LegalShell
      title="Allgemeine Geschäftsbedingungen (AGB)"
      subtitle="MVP-Entwurf für Kundenbestellungen über die Klarando Plattform."
      updatedAt="14.05.2026"
    >
      <div className="space-y-6 text-sm leading-7 text-rose-900/90">
        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">1. Geltungsbereich</h2>
          <p>
            Diese AGB regeln die Nutzung der Klarando Webplattform und Apps für Kundenbestellungen.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">2. Rollenmodell von Klarando</h2>
          <p>
            Klarando stellt die technische Plattform (SaaS/Marketplace) bereit. Anbieter der Waren
            ist jeweils der ausgewählte Händler bzw. Betrieb.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">3. Bestellung, Preise und Lieferung</h2>
          <p>
            Produkte, Preise, Liefergebiete, Lieferkosten und Öffnungszeiten werden vom Händler
            gepflegt. Lieferung erfolgt aktuell durch den Händler selbst.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">4. Zahlung</h2>
          <p>
            Für den MVP ist PayPal vorgesehen. Die Zahlungsabwicklung wird technisch über Klarando
            gesteuert, eine spätere Abrechnung an Händler erfolgt gemäß Partnervereinbarung.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">5. Storno und Rückerstattung</h2>
          <p>
            Storno- und Erstattungsanfragen werden fallbezogen geprüft. Maßgeblich sind Status der
            Bestellung, Händlerleistung und Zahlungsstatus.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">6. Jugendschutz</h2>
          <p>
            Bei alkoholhaltigen Produkten ist die Abgabe an Minderjährige ausgeschlossen. Händler und
            Fahrer sind verpflichtet, die Übergabe bei fehlender Altersberechtigung zu verweigern.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">7. Nutzerkonto und Verfügbarkeit</h2>
          <p>
            Kunden sind für die Richtigkeit ihrer Angaben verantwortlich. Klarando bemüht sich um
            hohe Verfügbarkeit, ein unterbrechungsfreier Betrieb kann jedoch nicht garantiert werden.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">8. Haftung</h2>
          <p>
            Klarando haftet nach den gesetzlichen Vorschriften. Für Produktqualität, Allergenangaben,
            Lieferausführung und Preisangaben ist der jeweilige Händler verantwortlich.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">9. Änderungen</h2>
          <p>
            Klarando kann diese AGB aus sachlichen Gründen anpassen. Wesentliche Änderungen werden
            transparent kommuniziert.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">10. Juristischer Hinweis</h2>
          <p>
            Dieser Text ist ein produktionsnaher MVP-Entwurf und muss vor endgültigem Go-Live
            juristisch geprüft werden.
          </p>
        </section>
      </div>
    </LegalShell>
  );
}
