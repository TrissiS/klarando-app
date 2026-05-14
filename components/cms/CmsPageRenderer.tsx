'use client'

import type { CmsBlock } from '@/lib/api'
import CmsBlockRenderer from './CmsBlockRenderer'

export default function CmsPageRenderer({ blocks }: { blocks: CmsBlock[] }) {
  return (
    <div className="space-y-5">
      {blocks.map((block, index) => (
        <CmsBlockRenderer key={`${index}-${block.type}`} block={block} />
      ))}
    </div>
  )
}
