"use client";

import { useEffect, useState } from "react";
import LoginFormComponent from "../components/LoginForm";
import type { SessionUser } from "../lib/app-data";

export default function Page() {
  const [session, setSession] = useState<SessionUser | null>(null);

  useEffect(() => {
    const saved = localStorage.getItem("sessionUser");
    if (saved) {
      try {
        setSession(JSON.parse(saved));
      } catch {}
    }
  }, []);

  function handleLogin(user: SessionUser) {
    setSession(user);
    localStorage.setItem("sessionUser", JSON.stringify(user));
    if (user.role === "superadmin") {
      window.location.href = "/superadmin";
      return;
    }

    if (user.role === "chainadmin") {
      window.location.href = "/chainadmin";
      return;
    }

    window.location.href = "/admin";
  }

  return <LoginFormComponent onLogin={handleLogin} />;
}
