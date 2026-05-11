"use client";

import { useState } from "react";
import { loginUser } from "../lib/auth";
import { getAccessContext, loginAccess } from "../lib/api";
import type { SessionUser } from "../lib/app-data";

type Props = {
  onLogin: (user: SessionUser) => void;
};

export default function LoginFormComponent({ onLogin }: Props) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [isLoading, setIsLoading] = useState(false);

  async function handleLogin() {
    setError("");
    setIsLoading(true);

    try {
      const response = await loginAccess(email, password);
      const backendRole = response.user.role;
      let effectiveTenantId = response.user.tenantId ?? null;

      if (!effectiveTenantId) {
        try {
          const context = await getAccessContext(response.token);
          effectiveTenantId = context.tenants[0]?.id ?? null;
        } catch {
          // If context loading fails, we keep the backend tenantId as-is.
        }
      }

      const role: SessionUser["role"] =
        backendRole === "SUPERADMIN"
          ? "superadmin"
          : backendRole === "CHAINADMIN"
          ? "chainadmin"
          : backendRole === "ADMIN"
          ? "admin"
          : "staff";

      const sessionUser: SessionUser = {
        role,
        email: response.user.email,
        name: response.user.name,
        userId: response.user.id,
        backendRole,
        chainId: response.user.chainId,
        tenantId: effectiveTenantId,
        accessToken: response.token,
        permissions: response.permissions,
      };

      localStorage.setItem("accessToken", response.token);
      if (effectiveTenantId) {
        localStorage.setItem("tenantId", effectiveTenantId);
        localStorage.setItem("klarando.defaultTenantId", effectiveTenantId);
      } else {
        localStorage.removeItem("tenantId");
        localStorage.removeItem("klarando.defaultTenantId");
      }
      onLogin(sessionUser);
      return;
    } catch (error) {
      const backendMessage =
        error instanceof Error ? error.message : "Login fehlgeschlagen. Bitte später erneut versuchen."
      const demoUser = loginUser(email, password);
      const allowDemoFallback =
        process.env.NODE_ENV !== "production" &&
        process.env.NEXT_PUBLIC_ALLOW_DEMO_LOGIN === "true";

      if (!demoUser || !allowDemoFallback) {
        setError(backendMessage);
        return;
      }

      onLogin(demoUser);
    } finally {
      setIsLoading(false);
    }
  }

  return (
    <div style={styles.page}>
      <div style={styles.card}>
        <div style={styles.logoWrap}>
          <img src="/klarando_logo_wordmark.png" alt="Klarando" style={styles.logo} />
        </div>
        <div style={styles.smallLabel}>Klarando</div>
        <h1 style={styles.title}>Login</h1>
        <p style={styles.text}>Melde dich im Klarando System an.</p>

        <div style={{ display: "grid", gap: 14 }}>
          <div>
            <label style={styles.label}>E-Mail</label>
            <input
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              style={styles.input}
            />
          </div>

          <div>
            <label style={styles.label}>Passwort</label>
            <input
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              style={styles.input}
            />
          </div>

          {error && <div style={styles.error}>{error}</div>}

          <button style={styles.button} onClick={handleLogin} disabled={isLoading}>
            {isLoading ? "Prüfe Login..." : "Einloggen"}
          </button>

          <a href="/main-app" style={styles.linkButton}>
            Zur Haupt-App (Filialsuche)
          </a>

          <div style={styles.legalLinks}>
            <a href="/impressum" style={styles.legalLink}>
              Impressum
            </a>
            <a href="/datenschutz" style={styles.legalLink}>
              Datenschutz
            </a>
            <a href="/agb" style={styles.legalLink}>
              AGB
            </a>
          </div>
        </div>
      </div>
    </div>
  );
}

const styles: Record<string, React.CSSProperties> = {
  page: {
    minHeight: "100vh",
    background:
      "radial-gradient(circle at 15% 10%, #ffd9c2 0%, #fff0e7 35%, #fff8f3 65%, #fffdfb 100%)",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    padding: 24,
    fontFamily: "Arial, sans-serif",
  },
  card: {
    width: "100%",
    maxWidth: 460,
    background: "#ffffff",
    borderRadius: 24,
    padding: 28,
    border: "1px solid #ffd4be",
    boxShadow: "0 16px 36px rgba(234, 25, 116, 0.18)",
  },
  smallLabel: {
    fontSize: 12,
    color: "#b04037",
    marginBottom: 6,
    textTransform: "uppercase",
    letterSpacing: "0.12em",
    fontWeight: 700,
  },
  title: {
    margin: "0 0 10px 0",
    fontSize: 32,
    color: "#2d1122",
  },
  text: {
    marginTop: 0,
    marginBottom: 18,
    color: "#7d2d2a",
  },
  label: {
    display: "block",
    marginBottom: 8,
    fontSize: 14,
    fontWeight: 700,
    color: "#6d2322",
  },
  input: {
    width: "100%",
    padding: 12,
    borderRadius: 10,
    border: "1px solid #f5b98e",
    background: "#ffffff",
    color: "#000000",
    fontSize: 15,
    fontWeight: 500,
    colorScheme: "light",
    boxSizing: "border-box",
  },
  button: {
    background: "linear-gradient(120deg, #ea1974 0%, #ff4260 45%, #ff8f1f 100%)",
    color: "#ffffff",
    border: "none",
    borderRadius: 12,
    padding: "12px 16px",
    fontWeight: 700,
    cursor: "pointer",
    opacity: 1,
  },
  linkButton: {
    display: "block",
    textAlign: "center",
    background: "#fff3ea",
    color: "#702622",
    border: "1px solid #ffd4be",
    borderRadius: 12,
    padding: "12px 16px",
    fontWeight: 700,
    textDecoration: "none",
  },
  error: {
    background: "#fee2e2",
    color: "#991b1b",
    borderRadius: 12,
    padding: 12,
    fontSize: 14,
  },
  legalLinks: {
    display: "flex",
    justifyContent: "center",
    gap: 12,
    fontSize: 13,
    marginTop: 4,
    flexWrap: "wrap",
  },
  legalLink: {
    color: "#8b2a56",
    textDecoration: "none",
    fontWeight: 700,
  },
  logoWrap: {
    display: "flex",
    justifyContent: "center",
    marginBottom: 14,
  },
  logo: {
    width: "100%",
    maxWidth: 320,
    height: "auto",
    objectFit: "contain",
  },
};
