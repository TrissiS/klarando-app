import type { Metadata } from "next";
import LegalShell from "@/app/Components/legal/LegalShell";

export const metadata: Metadata = {
  title: "Jugendschutz | Klarando",
  description: "Jugendschutz-Hinweise für Bestellungen über Klarando",
};

export default function JugendschutzPage() {
  return (
    <LegalShell
      title="Jugendschutz"
      subtitle="Hinweise für alkoholhaltige Produkte und Altersprüfung."
      updatedAt="14.05.2026"
    >
      <div className="space-y-6 text-sm leading-7 text-rose-900/90">
        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">1. Altersgrenzen</h2>
          <p>
            Alkoholhaltige Produkte dürfen nur im Rahmen der gesetzlichen Bestimmungen verkauft und
            ausgeliefert werden.
          </p>
        </section>
        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">2. Prüfung bei Übergabe</h2>
          <p>
            Fahrer und Händler müssen die Altersberechtigung bei Zweifel prüfen und die Übergabe an
            Minderjährige verweigern.
          </p>
        </section>
        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">3. Checkout-Hinweis</h2>
          <p>
            Bei alkoholischen Produkten wird im Checkout ein zusätzlicher Jugendschutz-Hinweis angezeigt.
          </p>
        </section>
      </div>
    </LegalShell>
  );
}
