/* eslint-disable no-console */
const { PrismaClient, CmsPageStatus } = require('@prisma/client')

const prisma = new PrismaClient()

const seedPages = [
  {
    key: 'homepage',
    slug: 'home',
    title: 'Startseite',
    seoTitle: 'Klarando - Bestellen, liefern, verwalten',
    seoDescription: 'Klarando verbindet Kunden, Betriebe und Lieferprozesse in einer Plattform.',
    contentJson: [
      {
        type: 'Hero',
        data: {
          headline: 'Bestellen, liefern, steuern - mit Klarando',
          subline: 'Die Plattform für Imbiss, Händler und Lieferbetrieb.',
          buttonText: 'Jetzt bestellen',
          buttonUrl: '/main-app',
          imageUrl: '',
        },
      },
      {
        type: 'FeatureGrid',
        data: {
          title: 'Warum Klarando',
          items: [
            { title: 'Schnelle Einführung', text: 'Pilotfähig in kurzer Zeit.', icon: 'rocket' },
            { title: 'Ein System', text: 'Bestellung, Küche, Fahrer und Displays zentral.', icon: 'layers' },
            { title: 'Skalierbar', text: 'Von Einzelbetrieb bis Kette.', icon: 'building' },
          ],
        },
      },
      {
        type: 'CTA',
        data: {
          headline: 'Partner werden',
          text: 'Teste Klarando mit deinem Betrieb im Pilot.',
          buttonText: 'Partner werden',
          buttonUrl: '/partner',
        },
      },
    ],
  },
  {
    key: 'partner',
    slug: 'partner',
    title: 'Partner werden',
    seoTitle: 'Partner werden | Klarando',
    seoDescription: 'Klarando als Plattform für deinen Betrieb.',
    contentJson: [
      {
        type: 'Hero',
        data: {
          headline: 'Partner werden mit Klarando',
          subline: 'Digitalisiere Bestellungen, Küche und Lieferung in einem System.',
          buttonText: 'Kontakt aufnehmen',
          buttonUrl: '/infos',
          imageUrl: '',
        },
      },
      {
        type: 'TextImage',
        data: {
          title: 'Für echte Betriebsabläufe gebaut',
          text: 'Klarando unterstützt den Alltag von Imbiss, Händler und Lieferbetrieb mit klaren Prozessen.',
          imageUrl: '',
          imagePosition: 'left',
        },
      },
    ],
  },
  {
    key: 'faq',
    slug: 'faq',
    title: 'FAQ',
    seoTitle: 'FAQ | Klarando',
    seoDescription: 'Antworten auf häufige Fragen rund um Klarando.',
    contentJson: [
      {
        type: 'FAQ',
        data: {
          title: 'Häufige Fragen',
          items: [
            { question: 'Wie starte ich?', answer: 'Über den Superadmin-Onboarding-Assistenten.' },
            { question: 'Kann ich mehrere Filialen verwalten?', answer: 'Ja, inklusive Rollen- und Rechtekonzept.' },
            { question: 'Brauche ich ein externes CMS?', answer: 'Nein, Inhalte werden direkt im Klarando CMS gepflegt.' },
          ],
        },
      },
    ],
  },
]

async function main() {
  for (const page of seedPages) {
    const upserted = await prisma.cmsPage.upsert({
      where: { key: page.key },
      update: {
        slug: page.slug,
        title: page.title,
        seoTitle: page.seoTitle,
        seoDescription: page.seoDescription,
        contentJson: page.contentJson,
        status: CmsPageStatus.DRAFT,
      },
      create: {
        ...page,
        status: CmsPageStatus.DRAFT,
      },
    })

    const existingRevision = await prisma.cmsRevision.findFirst({
      where: { pageId: upserted.id },
      orderBy: { version: 'desc' },
      select: { version: true },
    })

    if (!existingRevision) {
      await prisma.cmsRevision.create({
        data: {
          pageId: upserted.id,
          version: 1,
          contentJson: page.contentJson,
          seoTitle: page.seoTitle,
          seoDescription: page.seoDescription,
        },
      })
    }
  }
}

main()
  .then(async () => {
    await prisma.$disconnect()
    console.log('CMS-Seed abgeschlossen.')
  })
  .catch(async (error) => {
    console.error('CMS-Seed fehlgeschlagen:', error)
    await prisma.$disconnect()
    process.exit(1)
  })
