import type { Metadata } from "next";
import LegalShell from "@/app/Components/legal/LegalShell";
import OpenCookieSettingsButton from "@/components/legal/OpenCookieSettingsButton";

export const metadata: Metadata = {
  title: "Cookies | Klarando",
  description: "Cookie- und Consent-Informationen von Klarando",
};

export default function CookiesPage() {
  return (
    <LegalShell
      title="Cookie- und Consent-Richtlinie"
      subtitle="Informationen zu eingesetzten Kategorien und Einwilligungen."
      updatedAt="14.05.2026"
    >
      <div className="space-y-6 text-sm leading-7 text-rose-900/90">
        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">1. Kategorien</h2>
          <ul className="list-disc space-y-1 pl-5">
            <li>Notwendig (immer aktiv)</li>
            <li>Funktional</li>
            <li>Standort/Maps</li>
            <li>Marketing</li>
            <li>Analyse/Statistik</li>
          </ul>
        </section>
        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">2. Grundsatz</h2>
          <p>
            Optionalen Kategorien wird nur nach aktiver Zustimmung zugestimmt. Ablehnung ist möglich,
            ohne dass notwendige Funktionen eingeschränkt werden.
          </p>
        </section>
        <section>
          <h2 className="text-lg font-bold text-[var(--brand-ink)]">3. Speicherung</h2>
          <p>
            Die Einwilligung wird mit Zeitstempel und Consent-Version gespeichert. Einstellungen können
            jederzeit geändert werden.
          </p>
          <div className="mt-3">
            <OpenCookieSettingsButton />
          </div>
        </section>
      </div>
    </LegalShell>
  );
}
