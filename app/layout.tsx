import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Klarando",
  description: "Klarando Bestell- und Verwaltungsplattform",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="de" className="h-full antialiased">
      <body className="min-h-full flex flex-col">{children}</body>
    </html>
  );
}
