import fs from 'node:fs/promises'
import path from 'node:path'
import sharp from 'sharp'

export type TenantImageType = 'logo' | 'cover' | 'list' | 'thumbnail'

type TenantImagePreset = {
  width: number
  height: number
  fit: 'cover' | 'inside'
}

const IMAGE_PRESETS: Record<TenantImageType, TenantImagePreset> = {
  logo: { width: 512, height: 512, fit: 'inside' },
  cover: { width: 1600, height: 600, fit: 'cover' },
  list: { width: 800, height: 450, fit: 'cover' },
  thumbnail: { width: 300, height: 300, fit: 'cover' },
}

const MIME_TYPES = new Set(['image/jpeg', 'image/png', 'image/webp'])

const UPLOAD_ROOT = path.resolve(process.cwd(), 'data', 'uploads', 'tenants')

export function isAllowedImageMimeType(mimeType: string) {
  return MIME_TYPES.has(mimeType.toLowerCase())
}

export function sanitizeFileName(fileName: string) {
  return fileName
    .replace(/[^a-zA-Z0-9._-]/g, '-')
    .replace(/-+/g, '-')
    .slice(0, 120)
}

function sanitizeTenantId(tenantId: string) {
  return tenantId.replace(/[^a-zA-Z0-9_-]/g, '')
}

export async function processAndStoreTenantImage(input: {
  tenantId: string
  imageType: TenantImageType
  originalFileName: string
  buffer: Buffer
}) {
  const preset = IMAGE_PRESETS[input.imageType]
  const safeTenantId = sanitizeTenantId(input.tenantId)
  const safeOriginalName = sanitizeFileName(input.originalFileName)
  const tenantDir = path.join(UPLOAD_ROOT, safeTenantId)
  await fs.mkdir(tenantDir, { recursive: true })

  const fileStem = `${input.imageType}-${Date.now()}`
  const fileName = `${fileStem}.webp`
  const absolutePath = path.join(tenantDir, fileName)

  const image = sharp(input.buffer, { failOn: 'error' }).rotate()
  await image
    .resize({
      width: preset.width,
      height: preset.height,
      fit: preset.fit,
      position: 'attention',
      withoutEnlargement: true,
      background: { r: 255, g: 255, b: 255, alpha: 1 },
    })
    .webp({ quality: 84, effort: 5 })
    .toFile(absolutePath)

  const publicUrl = `/uploads/tenants/${safeTenantId}/${fileName}`

  return {
    imageType: input.imageType,
    url: publicUrl,
    originalFileName: safeOriginalName,
    width: preset.width,
    height: preset.height,
  }
}

