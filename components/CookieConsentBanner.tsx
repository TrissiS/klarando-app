"use client";

import { useEffect, useMemo, useState } from "react";

const CONSENT_KEY = "klarando.cookieConsent.v1";
const CONSENT_VERSION = "2026-05-14";

type ConsentState = {
  version: string;
  savedAt: string;
  necessary: true;
  functional: boolean;
  maps: boolean;
  marketing: boolean;
  analytics: boolean;
};

function buildState(overrides?: Partial<ConsentState>): ConsentState {
  return {
    version: CONSENT_VERSION,
    savedAt: new Date().toISOString(),
    necessary: true,
    functional: false,
    maps: false,
    marketing: false,
    analytics: false,
    ...overrides,
  };
}

export default function CookieConsentBanner() {
  const [hydrated, setHydrated] = useState(false);
  const [visible, setVisible] = useState(false);
  const [openSettings, setOpenSettings] = useState(false);
  const [state, setState] = useState<ConsentState>(buildState());

  useEffect(() => {
    setHydrated(true);
    const raw = localStorage.getItem(CONSENT_KEY);
    if (!raw) {
      setVisible(true);
      return;
    }
    try {
      const parsed = JSON.parse(raw) as ConsentState;
      if (parsed.version !== CONSENT_VERSION) {
        setVisible(true);
      } else {
        setState(parsed);
      }
    } catch {
      setVisible(true);
    }
  }, []);

  const summary = useMemo(() => {
    if (!visible) return "";
    return "Wir verwenden Cookies für Betrieb, Komfort und optionale Funktionen. Du kannst jederzeit anpassen.";
  }, [visible]);

  function saveConsent(next: ConsentState) {
    const payload = { ...next, savedAt: new Date().toISOString(), version: CONSENT_VERSION };
    localStorage.setItem(CONSENT_KEY, JSON.stringify(payload));
    localStorage.setItem("klarando.maps.enabled", payload.maps ? "true" : "false");
    setState(payload);
    setVisible(false);
    setOpenSettings(false);
  }

  if (!hydrated) return null;
  if (!visible) {
    return (
      <button
        type="button"
        onClick={() => {
          setVisible(true);
          setOpenSettings(true);
        }}
        className="fixed bottom-4 left-4 z-[65] rounded-full border border-[var(--brand-border)] bg-white px-3 py-2 text-xs font-semibold text-rose-800 shadow"
      >
        Cookie-Einstellungen
      </button>
    );
  }

  return (
    <div className="fixed inset-x-0 bottom-0 z-[70] px-3 pb-3">
      <div className="mx-auto max-w-4xl rounded-2xl border border-[var(--brand-border)] bg-white p-4 shadow-2xl">
        <p className="text-sm font-semibold text-[var(--brand-ink)]">Cookie-Einstellungen</p>
        <p className="mt-1 text-sm text-rose-900/80">{summary}</p>

        {openSettings ? (
          <div className="mt-3 grid gap-2 text-sm text-rose-900/90">
            <label className="flex items-center justify-between gap-3">
              <span>Notwendig</span>
              <span className="rounded-full bg-emerald-100 px-2 py-0.5 text-xs font-semibold text-emerald-800">
                Immer aktiv
              </span>
            </label>
            <ToggleRow
              label="Funktional"
              checked={state.functional}
              onChange={(checked) => setState((prev) => ({ ...prev, functional: checked }))}
            />
            <ToggleRow
              label="Standort/Maps"
              checked={state.maps}
              onChange={(checked) => setState((prev) => ({ ...prev, maps: checked }))}
            />
            <ToggleRow
              label="Marketing"
              checked={state.marketing}
              onChange={(checked) => setState((prev) => ({ ...prev, marketing: checked }))}
            />
            <ToggleRow
              label="Analyse/Statistik"
              checked={state.analytics}
              onChange={(checked) => setState((prev) => ({ ...prev, analytics: checked }))}
            />
          </div>
        ) : null}

        <div className="mt-4 flex flex-wrap gap-2">
          <button
            type="button"
            className="rounded-lg border border-[var(--brand-border)] px-3 py-2 text-sm font-semibold"
            onClick={() => saveConsent(buildState())}
          >
            Ablehnen
          </button>
          <button
            type="button"
            className="rounded-lg border border-[var(--brand-border)] bg-rose-50 px-3 py-2 text-sm font-semibold"
            onClick={() => setOpenSettings((prev) => !prev)}
          >
            Einstellungen
          </button>
          <button
            type="button"
            className="rounded-lg bg-rose-700 px-3 py-2 text-sm font-semibold text-white"
            onClick={() => saveConsent(buildState({ functional: true, maps: true, marketing: false, analytics: false }))}
          >
            Alle akzeptieren
          </button>
          <button
            type="button"
            className="rounded-lg bg-[var(--brand-primary)] px-3 py-2 text-sm font-semibold text-white"
            onClick={() => saveConsent(state)}
          >
            Auswahl speichern
          </button>
        </div>
      </div>
    </div>
  );
}

function ToggleRow({
  label,
  checked,
  onChange,
}: {
  label: string;
  checked: boolean;
  onChange: (checked: boolean) => void;
}) {
  return (
    <label className="flex items-center justify-between gap-3">
      <span>{label}</span>
      <input type="checkbox" checked={checked} onChange={(event) => onChange(event.target.checked)} />
    </label>
  );
}
