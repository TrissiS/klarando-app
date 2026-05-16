export type WallTimelineParams = {
  startsAtIso: string
  timelineDurationSec: number
  serverNowMs?: number
}

export type WallTimelinePhase = {
  phaseSec: number
  normalized: number
}

export function computeWallTimelinePhase(params: WallTimelineParams): WallTimelinePhase {
  const startsAt = new Date(params.startsAtIso).getTime()
  const now = params.serverNowMs ?? Date.now()
  const durationMs = Math.max(1000, Math.trunc(params.timelineDurationSec * 1000))
  const elapsed = Math.max(0, now - startsAt)
  const phaseMs = elapsed % durationMs
  const phaseSec = phaseMs / 1000
  return {
    phaseSec,
    normalized: phaseMs / durationMs,
  }
}

export type WallViewportParams = {
  totalColumns: number
  totalRows: number
  memberColumn: number
  memberRow: number
  canvasWidth: number
  canvasHeight: number
}

export type WallViewport = {
  x: number
  y: number
  width: number
  height: number
}

export function computeWallViewport(params: WallViewportParams): WallViewport {
  const columns = Math.max(1, Math.trunc(params.totalColumns))
  const rows = Math.max(1, Math.trunc(params.totalRows))
  const tileWidth = Math.max(1, Math.floor(params.canvasWidth / columns))
  const tileHeight = Math.max(1, Math.floor(params.canvasHeight / rows))
  const column = Math.max(0, Math.min(columns - 1, Math.trunc(params.memberColumn)))
  const row = Math.max(0, Math.min(rows - 1, Math.trunc(params.memberRow)))
  return {
    x: column * tileWidth,
    y: row * tileHeight,
    width: tileWidth,
    height: tileHeight,
  }
}
