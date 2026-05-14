import type { Metadata } from "next";
import LegalShell from "@/app/Components/legal/LegalShell";

export const metadata: Metadata = {
  title: "Impressum | Klarando",
  description: "Impressum der Klarando Plattform",
};

export default function ImpressumPage() {
  return (
    <LegalShell
      title="Impressum"
      subtitle="Angaben gemäß § 5 DDG und § 18 MStV."
      updatedAt="14.05.2026"
    >
      <div className="space-y-6 text-sm leading-7 text-rose-900/90">
        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">Anbieter</h2>
          <p>Klarando, Einzelunternehmen</p>
          <p>Inhaber: Tristan Stenger</p>
          <p>Untere Wiesenstr. 6, 57271 Hilchenbach, Deutschland</p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">Kontakt</h2>
          <p>E-Mail: info@klarando.com</p>
          <p>Telefon: derzeit keine öffentliche Telefonnummer</p>
          <p>Domain: klarando.com</p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">Umsatzsteuer</h2>
          <p>USt-IdNr.: DE314972366</p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">Verantwortlich für Inhalte</h2>
          <p>Tristan Stenger, Anschrift wie oben.</p>
        </section>
      </div>
    </LegalShell>
  );
}
