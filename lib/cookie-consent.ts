export const COOKIE_CONSENT_KEY = "klarando.cookieConsent.v1";
export const COOKIE_CONSENT_VERSION = "2026-05-14";
export const COOKIE_CONSENT_OPEN_EVENT = "klarando:open-cookie-settings";

export type CookieConsentState = {
  version: string;
  savedAt: string;
  necessary: true;
  functional: boolean;
  maps: boolean;
  marketing: boolean;
  analytics: boolean;
};

export function buildDefaultCookieConsent(
  overrides?: Partial<CookieConsentState>
): CookieConsentState {
  return {
    version: COOKIE_CONSENT_VERSION,
    savedAt: new Date().toISOString(),
    necessary: true,
    functional: false,
    maps: false,
    marketing: false,
    analytics: false,
    ...overrides,
  };
}

export function readCookieConsent(): CookieConsentState | null {
  if (typeof window === "undefined") return null;
  try {
    const raw = window.localStorage.getItem(COOKIE_CONSENT_KEY);
    if (!raw) return null;
    const parsed = JSON.parse(raw) as CookieConsentState;
    if (!parsed || typeof parsed !== "object") return null;
    return parsed;
  } catch {
    return null;
  }
}

export function hasMapsConsent(): boolean {
  const consent = readCookieConsent();
  return consent?.maps === true;
}

export function openCookieSettings(): void {
  if (typeof window === "undefined") return;
  window.dispatchEvent(new CustomEvent(COOKIE_CONSENT_OPEN_EVENT));
}
