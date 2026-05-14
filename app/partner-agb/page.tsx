import type { Metadata } from "next";
import LegalShell from "@/app/Components/legal/LegalShell";

export const metadata: Metadata = {
  title: "Partner-AGB | Klarando",
  description: "Entwurf der Händler- und Partnerbedingungen für Klarando",
};

export default function PartnerAgbPage() {
  return (
    <LegalShell
      title="Partner-AGB (Entwurf)"
      subtitle="MVP-Bedingungen für Händler, Filialen und Lieferpartner."
      updatedAt="14.05.2026"
    >
      <div className="space-y-6 text-sm leading-7 text-rose-900/90">
        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">1. Leistungsgegenstand</h2>
          <p>
            Klarando stellt eine SaaS-/Marketplace-Plattform bereit. Händler verwalten Produkte,
            Preise, Bilder, Öffnungszeiten und Liefergebiete eigenverantwortlich.
          </p>
        </section>
        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">2. Händlerpflichten</h2>
          <p>
            Händler sind für korrekte Angaben zu Produkten, Allergenen, Preisen, Verfügbarkeit sowie
            lebensmittelrechtliche Vorgaben verantwortlich.
          </p>
        </section>
        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">3. Lieferung</h2>
          <p>
            Die Lieferung erfolgt derzeit durch den Händler selbst. Bei Alkohol gilt eine verpflichtende
            Altersprüfung.
          </p>
        </section>
        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">4. Gebühren und Auszahlung</h2>
          <p>
            Provisions-/Gebührenmodelle sowie Zahlungsflüsse (z. B. PayPal) werden in individuellen
            Vereinbarungen festgelegt. Platzhalter bis finaler Vertragsstand.
          </p>
        </section>
        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">5. Juristischer Hinweis</h2>
          <p>
            Dieser Text ist ein Entwurf und muss vor produktivem Rollout rechtlich finalisiert werden.
          </p>
        </section>
      </div>
    </LegalShell>
  );
}
