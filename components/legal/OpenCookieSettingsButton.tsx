"use client";

import { openCookieSettings } from "@/lib/cookie-consent";

export default function OpenCookieSettingsButton() {
  return (
    <button
      type="button"
      onClick={openCookieSettings}
      className="rounded-lg border border-[var(--brand-border)] bg-white px-3 py-2 text-sm font-semibold text-rose-800 transition hover:bg-rose-50"
    >
      Cookie-Einstellungen öffnen
    </button>
  );
}
