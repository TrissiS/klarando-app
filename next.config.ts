import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  async redirects() {
    return [
      {
        source: '/infos/impressum',
        destination: '/impressum',
        permanent: true,
      },
      {
        source: '/infos/datenschutz',
        destination: '/datenschutz',
        permanent: true,
      },
      {
        source: '/infos/agb',
        destination: '/agb',
        permanent: true,
      },
      {
        source: '/Components/admin',
        destination: '/admin',
        permanent: true,
      },
      {
        source: '/Components/admin/calculation',
        destination: '/admin/calculation',
        permanent: true,
      },
      {
        source: '/Components/admin/screen',
        destination: '/admin/screen-studio',
        permanent: true,
      },
      {
        source: '/admin/speisekarte',
        destination: '/admin/menu',
        permanent: true,
      },
      {
        source: '/admin/geraete',
        destination: '/admin/devices',
        permanent: true,
      },
      {
        source: '/admin/lieferung',
        destination: '/admin/delivery',
        permanent: true,
      },
      {
        source: '/admin/finanzen-uebersicht',
        destination: '/admin/billing',
        permanent: true,
      },
    ]
  },
};

export default nextConfig;
