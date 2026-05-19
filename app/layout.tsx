import type { Metadata } from "next";
import "./globals.css";
import CookieConsentBanner from "@/components/CookieConsentBanner";

export const metadata: Metadata = {
  title: "Klarando",
  description: "Klarando Bestell- und Verwaltungsplattform",
  icons: {
    icon: [{ url: "/klarando_icon.png", type: "image/png" }],
    shortcut: [{ url: "/klarando_icon.png", type: "image/png" }],
    apple: [{ url: "/klarando_icon.png", type: "image/png" }],
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="de" className="h-full antialiased">
      <body className="min-h-full flex flex-col">
        {children}
        <CookieConsentBanner />
      </body>
    </html>
  );
}
