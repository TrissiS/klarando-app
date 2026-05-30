'use client'

import { useEffect, useMemo, useRef, useState } from 'react'
import {
  claimDisplayPairingSession,
  deleteOrderDisplay,
  deleteScreenDevice,
  deleteDisplayDevice,
  getAccessContext,
  getDisplayDeviceOverview,
  getDisplayDevicePreview,
  regenerateDisplayPairingCode,
  updateDisplayDeviceActiveState,
  type DisplayDeviceOverviewRow,
  type DisplayDeviceType,
  type ManagedChain,
  type ManagedTenant,
} from '@/lib/api'
import {
  AdminActionBar,
  AdminButton,
  AdminEmptyState,
  AdminFormGrid,
  AdminPageShell,
  AdminSectionCard,
  AdminSelect,
  AdminStatusBadge,
  AdminTable,
  AdminTextInput,
} from '@/app/Components/admin/ui/AdminUi'

type DisplayDeviceManagementPanelProps = {
  token: string
  roleScope: 'admin' | 'chainadmin' | 'superadmin'
  fixedTenantId?: string | null
  fixedChainId?: string | null
  studioMode?: boolean
}

type UiDisplayStatus = 'online' | 'unstable' | 'offline' | 'inactive'

const UI_STATUS_LABEL: Record<UiDisplayStatus, string> = {
  online: 'Online',
  unstable: 'Instabil',
  offline: 'Offline',
  inactive: 'Inaktiv',
}

const DISPLAY_TYPE_OPTIONS: Array<{ value: DisplayDeviceType | 'all'; label: string }> = [
  { value: 'all', label: 'Alle Typen' },
  { value: 'MENU', label: 'Menü' },
  { value: 'OFFERS', label: 'Angebote' },
  { value: 'PICKUP_NUMBERS', label: 'Abholnummern' },
  { value: 'KITCHEN', label: 'Küche' },
  { value: 'ADVERTISING', label: 'Werbung' },
  { value: 'MIXED', label: 'Gemischt' },
]

const STATUS_OPTIONS: Array<{ value: UiDisplayStatus | 'all'; label: string }> = [
  { value: 'all', label: 'Alle Status' },
  { value: 'online', label: 'Online' },
  { value: 'unstable', label: 'Instabil' },
  { value: 'offline', label: 'Offline' },
  { value: 'inactive', label: 'Inaktiv' },
]

function computeUiStatus(row: DisplayDeviceOverviewRow): UiDisplayStatus {
  if (!row.isActive) return 'inactive'
  if (!row.lastSeenAt) return 'offline'
  const heartbeatAt = new Date(row.lastSeenAt)
  if (Number.isNaN(heartbeatAt.getTime())) return 'offline'
  const ageMs = Date.now() - heartbeatAt.getTime()
  if (ageMs < 2 * 60 * 1000) return 'online'
  if (ageMs <= 10 * 60 * 1000) return 'unstable'
  return 'offline'
}

function formatDateTime(value: string | null) {
  if (!value) return '-'
  const parsed = new Date(value)
  if (Number.isNaN(parsed.getTime())) return '-'
  return parsed.toLocaleString('de-DE')
}

export default function DisplayDeviceManagementPanel({
  token,
  roleScope,
  fixedTenantId,
  fixedChainId,
  studioMode = false,
}: DisplayDeviceManagementPanelProps) {
  const [rows, setRows] = useState<DisplayDeviceOverviewRow[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [searchText, setSearchText] = useState('')
  const [statusFilter, setStatusFilter] = useState<UiDisplayStatus | 'all'>('all')
  const [displayTypeFilter, setDisplayTypeFilter] = useState<DisplayDeviceType | 'all'>('all')
  const [selectedTenantId, setSelectedTenantId] = useState(fixedTenantId || '')
  const [selectedChainId, setSelectedChainId] = useState(fixedChainId || '')
  const [chains, setChains] = useState<ManagedChain[]>([])
  const [tenants, setTenants] = useState<ManagedTenant[]>([])
  const [pairingByDisplayRef, setPairingByDisplayRef] = useState<Record<string, { qrImageUrl: string; expiresAt: string; pairingPayload: string }>>({})
  const [busyDisplayRef, setBusyDisplayRef] = useState<string | null>(null)
  const [claimPayload, setClaimPayload] = useState('')
  const [claimPairingCode, setClaimPairingCode] = useState('')
  const [claimTenantId, setClaimTenantId] = useState(fixedTenantId || '')
  const [selectedDisplayRowId, setSelectedDisplayRowId] = useState('')
  const [createNewDisplayOnClaim, setCreateNewDisplayOnClaim] = useState(false)
  const [claimDisplayName, setClaimDisplayName] = useState('')
  const [claiming, setClaiming] = useState(false)
  const [lastClaimDiagnostic, setLastClaimDiagnostic] = useState<{
    sessionId: string
    state: string
    claimedAt: string
    displayId: string
    tenantId: string
    hasPairingToken: boolean
    hasPairingCode: boolean
  } | null>(null)
  const [scannerOpen, setScannerOpen] = useState(false)
  const [scannerError, setScannerError] = useState('')
  const [scannerStatus, setScannerStatus] = useState('')
  const [scannerBusy, setScannerBusy] = useState(false)
  const scannerInstanceRef = useRef<{
    stop: () => Promise<void>
    clear: () => Promise<void> | void
    isRunning: boolean
  } | null>(null)

  const isTenantLocked = Boolean(fixedTenantId)
  const isChainLocked = Boolean(fixedChainId)
  const isAdminScope = roleScope === 'admin'
  const selectedDisplayRow = useMemo(
    () => rows.find((entry) => entry.id === selectedDisplayRowId) || null,
    [rows, selectedDisplayRowId]
  )
  const visibleRows = useMemo(() => {
    return rows.filter((row) => {
      const uiStatus = computeUiStatus(row)
      const statusMatches = statusFilter === 'all' || uiStatus === statusFilter
      const typeMatches = displayTypeFilter === 'all' || row.displayType === displayTypeFilter
      const search = searchText.trim().toLowerCase()
      if (!search) {
        return statusMatches && typeMatches
      }
      const searchable = [
        row.name,
        row.code,
        row.tenantName,
        row.tenantId,
        row.id,
        row.entityId,
      ]
        .filter(Boolean)
        .join(' ')
        .toLowerCase()
      return statusMatches && typeMatches && searchable.includes(search)
    })
  }, [rows, statusFilter, displayTypeFilter, searchText])
  const detectedResolutionFromPayload = useMemo(() => {
    const raw = claimPayload.trim()
    if (!raw.startsWith('{')) return null
    try {
      const parsed = JSON.parse(raw) as {
        deviceResolution?: {
          width?: unknown
          height?: unknown
          dpr?: unknown
          orientation?: unknown
        }
      }
      const resolution = parsed.deviceResolution
      if (!resolution || typeof resolution !== 'object') return null
      const width = Number(resolution.width)
      const height = Number(resolution.height)
      const dpr = Number(resolution.dpr)
      const orientation = typeof resolution.orientation === 'string' ? resolution.orientation : null
      if (!Number.isFinite(width) || !Number.isFinite(height)) return null
      return {
        width: Math.round(width),
        height: Math.round(height),
        dpr: Number.isFinite(dpr) ? Number(dpr.toFixed(2)) : null,
        orientation,
      }
    } catch {
      return null
    }
  }, [claimPayload])

  const filteredTenants = useMemo(() => {
    if (!selectedChainId) {
      return tenants
    }
    return tenants.filter((entry) => entry.chainId === selectedChainId)
  }, [tenants, selectedChainId])

  useEffect(() => {
    if (!selectedTenantId) return
    if (filteredTenants.some((entry) => entry.id === selectedTenantId)) return
    setSelectedTenantId('')
  }, [filteredTenants, selectedTenantId])

  async function loadContext() {
    try {
      const context = await getAccessContext(token)
      setChains(context.chains)
      setTenants(context.tenants)
    } catch {
      // ignore; overview call will provide error details if auth/scope fails
    }
  }

  async function loadOverview() {
    try {
      setLoading(true)
      setError('')
      const response = await getDisplayDeviceOverview(token, {
        tenantId: isTenantLocked ? fixedTenantId || undefined : selectedTenantId || undefined,
        chainId: isChainLocked ? fixedChainId || undefined : selectedChainId || undefined,
        status: statusFilter,
        displayType: displayTypeFilter,
        q: searchText.trim() || undefined,
      })
      setRows(response.rows)
    } catch (loadError) {
      setError(loadError instanceof Error ? loadError.message : 'Displays konnten nicht geladen werden')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    if (!token) return
    void loadContext()
    void loadOverview()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [token])

  useEffect(() => {
    if (!token) return
    void loadOverview()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [statusFilter, displayTypeFilter, selectedTenantId, selectedChainId])

  useEffect(() => {
    return () => {
      void stopScanner()
    }
  }, [])

  async function handlePreview(row: DisplayDeviceOverviewRow) {
    try {
      setBusyDisplayRef(row.id)
      const preview = await getDisplayDevicePreview(token, row.id)
      const origin = typeof window !== 'undefined' ? window.location.origin : ''
      window.open(`${origin}${preview.previewUrl}`, '_blank', 'noopener,noreferrer')
    } catch (previewError) {
      setError(previewError instanceof Error ? previewError.message : 'Vorschau konnte nicht geöffnet werden')
    } finally {
      setBusyDisplayRef(null)
    }
  }

  async function handleToggleActive(row: DisplayDeviceOverviewRow) {
    try {
      setBusyDisplayRef(row.id)
      setError('')
      setSuccess('')
      const next = await updateDisplayDeviceActiveState(token, row.id, !row.isActive)
      setRows((current) =>
        current.map((entry) =>
          entry.id === row.id
            ? {
                ...entry,
                isActive: next.isActive,
                status: next.status,
              }
            : entry
        )
      )
      setSuccess(next.isActive ? 'Display wurde aktiviert.' : 'Display wurde deaktiviert.')
    } catch (toggleError) {
      setError(toggleError instanceof Error ? toggleError.message : 'Display konnte nicht geändert werden')
    } finally {
      setBusyDisplayRef(null)
    }
  }

  async function handleRegeneratePairing(row: DisplayDeviceOverviewRow) {
    try {
      setBusyDisplayRef(row.id)
      setError('')
      const response = await regenerateDisplayPairingCode(token, row.id)
      setPairingByDisplayRef((current) => ({
        ...current,
        [row.id]: {
          qrImageUrl: response.qrImageUrl,
          expiresAt: response.expiresAt,
          pairingPayload: response.pairingPayload,
        },
      }))
      setSuccess(`Neuer Pairing-Code für ${row.name} wurde erzeugt.`)
    } catch (pairingError) {
      setError(pairingError instanceof Error ? pairingError.message : 'Pairing-Code konnte nicht erzeugt werden')
    } finally {
      setBusyDisplayRef(null)
    }
  }

  async function handleDeleteDisplay(row: DisplayDeviceOverviewRow) {
    const tenantId = row.tenantId || (isTenantLocked ? fixedTenantId || '' : claimTenantId || selectedTenantId || '')
    if (!tenantId) {
      setError('Filiale konnte für das Löschen nicht ermittelt werden.')
      return
    }
    const firstConfirm = window.confirm('Möchtest du dieses Display wirklich löschen?')
    if (!firstConfirm) return
    const secondConfirm = window.confirm(
      'Bitte bestätige endgültig: Dieses Display wird dauerhaft gelöscht.\n\nWenn du dieses Display löschst:\n- wird die Verbindung zu diesem Bildschirm getrennt\n- das Display verschwindet aus der Display-Liste\n- zugewiesene Produkte/Designs werden entfernt oder entkoppelt\n- das Gerät muss später neu verbunden werden\n- diese Aktion kann nicht rückgängig gemacht werden'
    )
    if (!secondConfirm) return

    try {
      setBusyDisplayRef(row.id)
      setError('')
      setSuccess('')
      if (row.sourceKind === 'ORDER_DISPLAY') {
        await deleteOrderDisplay(row.entityId)
      } else if (row.sourceKind === 'SCREEN_DEVICE') {
        await deleteScreenDevice(row.entityId)
      } else {
        const result = await deleteDisplayDevice(token, row.entityId, tenantId)
        if (result.message) {
          setSuccess(result.message)
        }
      }
      setSuccess('Display wurde gelöscht.')
      await loadOverview()
    } catch (deleteError) {
      setError(deleteError instanceof Error ? deleteError.message : 'Display konnte nicht gelöscht werden')
    } finally {
      setBusyDisplayRef(null)
    }
  }

  async function handleArchiveDisplay(row: DisplayDeviceOverviewRow) {
    const firstConfirm = window.confirm('Möchtest du dieses Display archivieren (deaktivieren)?')
    if (!firstConfirm) return
    const secondConfirm = window.confirm(
      'Bitte bestätigen: Das Display wird archiviert und ist anschließend inaktiv.'
    )
    if (!secondConfirm) return
    try {
      setBusyDisplayRef(row.id)
      setError('')
      setSuccess('')
      await updateDisplayDeviceActiveState(token, row.id, false)
      await loadOverview()
      setSuccess('Display wurde archiviert und deaktiviert.')
    } catch (archiveError) {
      setError(archiveError instanceof Error ? archiveError.message : 'Display konnte nicht archiviert werden')
    } finally {
      setBusyDisplayRef(null)
    }
  }

  async function handleResetDisplay(row: DisplayDeviceOverviewRow) {
    const firstConfirm = window.confirm(
      'Gerät zurücksetzen? Dabei wird das Display deaktiviert und ein neuer Pairing-Code erzeugt.'
    )
    if (!firstConfirm) return
    const secondConfirm = window.confirm(
      'Bitte endgültig bestätigen: Das Gerät muss danach neu gekoppelt werden.'
    )
    if (!secondConfirm) return
    try {
      setBusyDisplayRef(row.id)
      setError('')
      setSuccess('')
      await updateDisplayDeviceActiveState(token, row.id, false)
      if (row.pairingSupported) {
        await handleRegeneratePairing(row)
      } else {
        setSuccess('Gerät wurde zurückgesetzt und deaktiviert.')
      }
      await loadOverview()
    } catch (resetError) {
      setError(resetError instanceof Error ? resetError.message : 'Gerät konnte nicht zurückgesetzt werden')
    } finally {
      setBusyDisplayRef(null)
    }
  }

  async function copyValue(value: string, label: string) {
    try {
      await navigator.clipboard.writeText(value)
      setSuccess(`${label} kopiert.`)
    } catch {
      setError(`${label} konnte nicht kopiert werden.`)
    }
  }

  function resolvePairingTokenFromPayload(raw: string) {
    const trimmed = raw.trim()
    if (!trimmed) return null
    if (trimmed.startsWith('{')) {
      try {
        const parsed = JSON.parse(trimmed) as { pairingToken?: unknown; type?: unknown; pairingCode?: unknown }
        const type = typeof parsed.type === 'string' ? parsed.type.toUpperCase() : null
        if (type && type !== 'DISPLAY_PAIRING') {
          throw new Error('Dieser QR-Code ist nicht für Displays geeignet.')
        }
        if (claimPairingCode && parsed.pairingCode && `${parsed.pairingCode}` !== claimPairingCode.trim()) {
          throw new Error('Pairing-Code stimmt nicht mit dem QR-Inhalt überein.')
        }
        return typeof parsed.pairingToken === 'string' ? parsed.pairingToken.trim() : null
      } catch (error) {
        if (error instanceof Error) throw error
        throw new Error('QR-Payload konnte nicht gelesen werden.')
      }
    }
    return trimmed
  }

  async function stopScanner() {
    const scanner = scannerInstanceRef.current
    if (!scanner) return
    scannerInstanceRef.current = null
    try {
      if (scanner.isRunning) {
        await scanner.stop()
      }
    } catch {
      // ignore shutdown errors
    }
    try {
      await scanner.clear()
    } catch {
      // ignore clear errors
    }
  }

  function parseScannedQrContent(raw: string): { payloadText?: string; pairingCode?: string } {
    const trimmed = raw.trim()
    if (!trimmed) {
      throw new Error('QR-Code ist leer.')
    }

    if (trimmed.startsWith('{')) {
      const parsed = JSON.parse(trimmed) as {
        type?: unknown
        pairingToken?: unknown
        pairingCode?: unknown
        code?: unknown
      }
      const type = typeof parsed.type === 'string' ? parsed.type.toUpperCase() : null
      if (type && type !== 'DISPLAY_PAIRING') {
        throw new Error('Dieser QR-Code ist nicht für Display-Verbindung geeignet.')
      }
      const pairingCode =
        typeof parsed.pairingCode === 'string'
          ? parsed.pairingCode.trim()
          : typeof parsed.code === 'string'
            ? parsed.code.trim()
            : ''
      return {
        payloadText: JSON.stringify(parsed),
        pairingCode: pairingCode || undefined,
      }
    }

    if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
      const url = new URL(trimmed)
      const pairingToken = url.searchParams.get('pairingToken') || url.searchParams.get('token')
      const pairingCode = url.searchParams.get('pairingCode') || url.searchParams.get('code')
      if (!pairingToken && !pairingCode) {
        throw new Error('Dieser QR-Code ist nicht für Display-Verbindung geeignet.')
      }
      if (pairingToken) {
        const payload = {
          type: 'DISPLAY_PAIRING',
          pairingToken,
          ...(pairingCode ? { pairingCode } : {}),
        }
        return { payloadText: JSON.stringify(payload), pairingCode: pairingCode || undefined }
      }
      return { pairingCode: pairingCode || undefined }
    }

    if (/^\d{6}$/.test(trimmed)) {
      return { pairingCode: trimmed }
    }

    return { payloadText: trimmed }
  }

  async function handleStartWebcamScanner() {
    try {
      setScannerBusy(true)
      setScannerError('')
      setScannerStatus('Kamera wird gestartet …')
      await stopScanner()
      const { Html5Qrcode } = await import('html5-qrcode')
      const cameras = await Html5Qrcode.getCameras()
      if (!Array.isArray(cameras) || cameras.length === 0) {
        throw new Error('Keine Kamera gefunden.')
      }

      const scanner = new Html5Qrcode('display-qr-reader')
      scannerInstanceRef.current = {
        stop: () => scanner.stop(),
        clear: () => scanner.clear(),
        isRunning: false,
      }

      await scanner.start(
        { facingMode: 'environment' },
        { fps: 10, qrbox: { width: 280, height: 280 } },
        async (decodedText: string) => {
          try {
            const parsed = parseScannedQrContent(decodedText)
            if (parsed.payloadText) {
              setClaimPayload(parsed.payloadText)
            }
            if (parsed.pairingCode) {
              setClaimPairingCode(parsed.pairingCode)
            }
            await stopScanner()
            setScannerStatus('')
            setScannerError('')
            setScannerOpen(false)
            setSuccess('QR-Code erkannt.')
          } catch (parseError) {
            setScannerError(
              parseError instanceof Error
                ? parseError.message
                : 'Dieser QR-Code ist nicht für Display-Verbindung geeignet.'
            )
          }
        },
        () => {
          // ignore frame decode misses
        }
      )

      if (scannerInstanceRef.current) {
        scannerInstanceRef.current.isRunning = true
      }
      setScannerStatus('QR-Code ausrichten und scannen …')
    } catch (startError) {
      const message = startError instanceof Error ? startError.message : 'Kamera konnte nicht gestartet werden.'
      if (message.toLowerCase().includes('notallowederror') || message.toLowerCase().includes('permission')) {
        setScannerError('Kamera-Zugriff wurde nicht erlaubt.')
      } else {
        setScannerError(message)
      }
      setScannerStatus('')
    } finally {
      setScannerBusy(false)
    }
  }

  async function closeScannerModal() {
    await stopScanner()
    setScannerOpen(false)
    setScannerBusy(false)
    setScannerStatus('')
  }

  async function handleClaimPairing() {
    try {
      setClaiming(true)
      setError('')
      setSuccess('')
      const pairingToken = resolvePairingTokenFromPayload(claimPayload)
      let resolutionFromPayload:
        | {
            width?: number
            height?: number
            orientation?: string
          }
        | null = null
      if (claimPayload.trim().startsWith('{')) {
        try {
          const parsed = JSON.parse(claimPayload) as {
            deviceResolution?: {
              width?: unknown
              height?: unknown
              orientation?: unknown
            }
          }
          const candidate = parsed.deviceResolution
          if (candidate && typeof candidate === 'object') {
            const width = Number(candidate.width)
            const height = Number(candidate.height)
            const orientation = typeof candidate.orientation === 'string' ? candidate.orientation : undefined
            resolutionFromPayload = {
              width: Number.isFinite(width) ? width : undefined,
              height: Number.isFinite(height) ? height : undefined,
              orientation,
            }
          }
        } catch {
          // ignore non-JSON payload metadata extraction
        }
      }
      const manualPairingCode = claimPairingCode.trim() || null
      if (!pairingToken && !manualPairingCode) {
        throw new Error('Bitte QR-Payload/Pairing-Token oder einen Pairing-Code eingeben.')
      }
      const tenantId = (isTenantLocked ? fixedTenantId : claimTenantId)?.trim()
      if (!tenantId) {
        throw new Error('Bitte Filiale auswählen.')
      }
      if (!claimDisplayName.trim()) {
        throw new Error('Bitte gib einen Anzeigenamen ein.')
      }
      if (!createNewDisplayOnClaim && !selectedDisplayRow) {
        throw new Error('Bitte wähle unten einen Bildschirm aus.')
      }
      if (process.env.NODE_ENV !== 'production') {
        console.log('DISPLAY CLAIM CLICK', {
          selectedDisplayId: createNewDisplayOnClaim ? null : selectedDisplayRow?.id ?? null,
          selectedDisplayName: selectedDisplayRow?.name ?? null,
          hasPairingToken: Boolean(pairingToken),
          hasPairingCode: Boolean(manualPairingCode),
          tenantId,
        })
      }
      const response = await claimDisplayPairingSession(token, {
        pairingToken,
        pairingCode: manualPairingCode,
        tenantId,
        displayId: createNewDisplayOnClaim ? null : selectedDisplayRow?.id || null,
        screenId: null,
        displayName: claimDisplayName.trim() || null,
        resolutionWidth: resolutionFromPayload?.width,
        resolutionHeight: resolutionFromPayload?.height,
        orientation: resolutionFromPayload?.orientation,
      })
      if (process.env.NODE_ENV !== 'production') {
        console.log('DISPLAY CLAIM RESPONSE', {
          status: 200,
          body: response,
        })
      }
      setLastClaimDiagnostic({
        sessionId: response.pairing?.sessionId || '-',
        state: response.pairing?.state || 'UNKNOWN',
        claimedAt: response.pairing?.claimedAt || new Date().toISOString(),
        displayId: response.display.id,
        tenantId: response.display.tenantId,
        hasPairingToken: response.pairing?.hasPairingToken ?? Boolean(pairingToken),
        hasPairingCode: response.pairing?.hasPairingCode ?? Boolean(manualPairingCode),
      })
      setSuccess(response.message || 'Display erfolgreich verbunden.')
      setClaimPayload('')
      setClaimPairingCode('')
      setClaimDisplayName('')
      setSelectedDisplayRowId('')
      setCreateNewDisplayOnClaim(false)
      await loadOverview()
    } catch (claimError) {
      if (process.env.NODE_ENV !== 'production') {
        console.log('DISPLAY CLAIM RESPONSE', {
          status: 'error',
          error: claimError instanceof Error ? claimError.message : claimError,
        })
      }
      setError(claimError instanceof Error ? claimError.message : 'Display konnte nicht verbunden werden')
    } finally {
      setClaiming(false)
    }
  }

  return (
    <AdminPageShell>
      {error ? (
        <div className="mb-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">{error}</div>
      ) : null}
      {success ? (
        <div className="mb-4 rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">{success}</div>
      ) : null}

      <AdminSectionCard title="Display verbinden" description="Scanne den TV-QR-Code oder füge den Pairing-Code manuell ein.">
        <AdminFormGrid>
          {!isTenantLocked ? (
            <AdminSelect
              label="Filiale"
              value={claimTenantId}
              onChange={(event) => setClaimTenantId(event.target.value)}
            >
              <option value="">Bitte wählen</option>
              {filteredTenants.map((tenant) => (
                <option key={tenant.id} value={tenant.id}>
                  {tenant.name}
                </option>
              ))}
            </AdminSelect>
          ) : null}
          <AdminTextInput
            label="Anzeigename"
            value={claimDisplayName}
            onChange={(event) => setClaimDisplayName(event.target.value)}
            placeholder="z. B. Gastraum TV"
          />
          <AdminTextInput
            label="Pairing-Code (optional)"
            value={claimPairingCode}
            onChange={(event) => setClaimPairingCode(event.target.value)}
            placeholder="123456"
          />
          <div className="md:col-span-2">
            <label className="mb-1 block text-xs font-semibold uppercase tracking-wide text-[var(--brand-ink-soft)]">
              QR-Payload oder Pairing-Token
            </label>
            <textarea
              value={claimPayload}
              onChange={(event) => setClaimPayload(event.target.value)}
              className="min-h-24 w-full rounded-2xl border border-[var(--brand-border)] bg-white/85 px-3 py-2 text-sm text-[var(--brand-ink)]"
              placeholder='{"type":"DISPLAY_PAIRING","pairingToken":"..."}'
            />
          </div>
        </AdminFormGrid>
        {!createNewDisplayOnClaim && selectedDisplayRow ? (
          <p className="mt-3 text-sm font-medium text-emerald-700">
            Ausgewählt: {selectedDisplayRow.name}
          </p>
        ) : null}
        {!createNewDisplayOnClaim && !selectedDisplayRow ? (
          <p className="mt-3 text-sm text-amber-700">Bitte wähle unten einen Bildschirm aus.</p>
        ) : null}
        {createNewDisplayOnClaim ? (
          <p className="mt-3 text-sm text-slate-700">
            Neuer Bildschirm wird beim Verbinden automatisch erstellt.
          </p>
        ) : null}
        {process.env.NODE_ENV !== 'production' ? (
          <div className="mt-3 rounded-xl border border-slate-200 bg-slate-50 px-3 py-2 text-xs text-slate-700">
            <p>Debug selectedDisplayId: {selectedDisplayRow?.id || '-'}</p>
            <p>Debug selectedDisplayName: {selectedDisplayRow?.name || '-'}</p>
            <p>Debug pairingCode vorhanden: {claimPairingCode.trim() ? 'ja' : 'nein'}</p>
          </div>
        ) : null}
        {detectedResolutionFromPayload ? (
          <div className="mt-3 rounded-xl border border-blue-200 bg-blue-50 px-3 py-2 text-xs text-blue-900">
            <p className="font-semibold">Erkannte Display-Auflösung aus QR</p>
            <p>
              {detectedResolutionFromPayload.width} × {detectedResolutionFromPayload.height}
              {detectedResolutionFromPayload.orientation ? ` · ${detectedResolutionFromPayload.orientation}` : ''}
              {detectedResolutionFromPayload.dpr ? ` · DPR ${detectedResolutionFromPayload.dpr}` : ''}
            </p>
          </div>
        ) : null}
        {lastClaimDiagnostic ? (
          <div className="mt-3 rounded-xl border border-emerald-200 bg-emerald-50 px-3 py-2 text-xs text-emerald-900">
            <p className="font-semibold">Letzter Pairing-Claim</p>
            <p>Session: {lastClaimDiagnostic.sessionId}</p>
            <p>Status: {lastClaimDiagnostic.state}</p>
            <p>Display: {lastClaimDiagnostic.displayId}</p>
            <p>Tenant: {lastClaimDiagnostic.tenantId}</p>
            <p>Token genutzt: {lastClaimDiagnostic.hasPairingToken ? 'ja' : 'nein'} | Code genutzt: {lastClaimDiagnostic.hasPairingCode ? 'ja' : 'nein'}</p>
            <p>Zeitpunkt: {new Date(lastClaimDiagnostic.claimedAt).toLocaleString('de-DE')}</p>
          </div>
        ) : null}
        <AdminActionBar>
          <AdminButton
            type="button"
            variant="secondary"
            onClick={() => {
              setScannerOpen(true)
              setScannerError('')
              setScannerStatus('')
              void handleStartWebcamScanner()
            }}
          >
            QR-Code mit Webcam scannen
          </AdminButton>
          <AdminButton
            type="button"
            variant="secondary"
            onClick={() => {
              setCreateNewDisplayOnClaim(true)
              setSelectedDisplayRowId('')
            }}
          >
            Neuen Bildschirm erstellen und verbinden
          </AdminButton>
          <AdminButton
            type="button"
            onClick={() => void handleClaimPairing()}
            disabled={
              claiming ||
              !(isTenantLocked ? fixedTenantId : claimTenantId)?.trim() ||
              !claimDisplayName.trim() ||
              (!claimPairingCode.trim() && !claimPayload.trim()) ||
              (!createNewDisplayOnClaim && !selectedDisplayRow)
            }
          >
            {claiming ? 'Verbinde…' : 'Display verbinden'}
          </AdminButton>
        </AdminActionBar>
      </AdminSectionCard>

      {scannerOpen ? (
        <div
          className="fixed inset-0 z-[160] bg-slate-950/55 px-3 py-6"
          onClick={() => {
            void closeScannerModal()
          }}
        >
          <div
            className="mx-auto w-full max-w-xl rounded-3xl border border-[var(--brand-border)] bg-white p-4 shadow-2xl"
            onClick={(event) => event.stopPropagation()}
          >
            <h3 className="text-lg font-semibold text-[var(--brand-ink)]">QR-Code scannen</h3>
            <p className="mt-1 text-sm text-rose-900/75">
              Richte die TV-Anzeige in die Kamera. Nach dem Scan werden die Felder automatisch gefüllt.
            </p>
            <div className="mt-3 overflow-hidden rounded-2xl border border-[var(--brand-border)] bg-slate-900">
              <div id="display-qr-reader" className="min-h-[300px] w-full" />
            </div>
            {scannerStatus ? <p className="mt-3 text-xs text-rose-900/70">{scannerStatus}</p> : null}
            {scannerError ? (
              <p className="mt-3 rounded-xl border border-red-200 bg-red-50 px-3 py-2 text-sm text-red-700">
                {scannerError}
              </p>
            ) : null}
            <div className="mt-4 flex justify-end gap-2">
              <AdminButton type="button" variant="secondary" onClick={() => void closeScannerModal()}>
                Abbrechen
              </AdminButton>
              <AdminButton type="button" onClick={() => void handleStartWebcamScanner()} disabled={scannerBusy}>
                {scannerBusy ? 'Starte…' : 'Kamera neu starten'}
              </AdminButton>
            </div>
          </div>
        </div>
      ) : null}

      {!isAdminScope ? (
      <AdminSectionCard title="Display-Verwaltung" description="Filtere Displays nach Status, Typ, Kette und Filiale.">
        <AdminFormGrid>
          <div className="md:col-span-2">
            <AdminTextInput
              label="Suche"
              value={searchText}
              onChange={(event) => setSearchText(event.target.value)}
              placeholder="Name, Code, Filiale..."
            />
          </div>

          <AdminSelect
            label="Status"
            value={statusFilter}
            onChange={(event) => setStatusFilter(event.target.value as UiDisplayStatus | 'all')}
          >
            {STATUS_OPTIONS.map((entry) => (
              <option key={entry.value} value={entry.value}>{entry.label}</option>
            ))}
          </AdminSelect>

          <AdminSelect
            label="Typ"
            value={displayTypeFilter}
            onChange={(event) => setDisplayTypeFilter(event.target.value as DisplayDeviceType | 'all')}
          >
            {DISPLAY_TYPE_OPTIONS.map((entry) => (
              <option key={entry.value} value={entry.value}>{entry.label}</option>
            ))}
          </AdminSelect>

          <AdminSelect
            label="Kette"
            value={selectedChainId}
            onChange={(event) => setSelectedChainId(event.target.value)}
            disabled={isChainLocked}
          >
            <option value="">Alle Ketten</option>
            {chains.map((entry) => (
              <option key={entry.id} value={entry.id}>{entry.name}</option>
            ))}
          </AdminSelect>

          <AdminSelect
            label="Filiale"
            value={selectedTenantId}
            onChange={(event) => setSelectedTenantId(event.target.value)}
            disabled={isTenantLocked}
          >
            <option value="">Alle Filialen</option>
            {filteredTenants.map((entry) => (
              <option key={entry.id} value={entry.id}>{entry.name}</option>
            ))}
          </AdminSelect>
        </AdminFormGrid>
        <AdminActionBar>
          <div />
          <AdminButton
            type="button"
            variant="secondary"
            onClick={() => void loadOverview()}
          >
            Aktualisieren
          </AdminButton>
        </AdminActionBar>
      </AdminSectionCard>
      ) : null}

      <AdminSectionCard title={isAdminScope ? 'Verbundene Displays' : 'Geräteübersicht'}>
        {loading ? (
          <p className="text-sm text-rose-900/75">Lade Display-Geräte...</p>
        ) : visibleRows.length === 0 ? (
          <AdminEmptyState title="Noch keine Displays gekoppelt." description="Kopple zuerst ein Display-Gerät über Pairing-Code." />
        ) : (
          <AdminTable>
            <thead>
              <tr>
                <th className="th-ui">Display</th>
                <th className="th-ui">Status</th>
                <th className="th-ui">Filiale</th>
                <th className="th-ui">Zuletzt gesehen</th>
                <th className="th-ui">Letzter Sync</th>
                <th className="th-ui">Geräteinfo</th>
                <th className="th-ui">Aktionen</th>
              </tr>
            </thead>
            <tbody>
              {visibleRows.map((row) => {
                const uiStatus = computeUiStatus(row)
                const pairingData = pairingByDisplayRef[row.id]
                return (
                  <tr key={row.id}>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      <p className="font-semibold text-[var(--brand-ink)]">{row.name}</p>
                      {!studioMode ? (
                        <p className="text-xs text-rose-900/70">
                          {row.code} | {row.sourceKind === 'ORDER_DISPLAY' ? 'Bestell-Display' : row.sourceKind === 'DISPLAY_DEVICE' ? 'Klarando-Display' : 'Screen-Device'}
                        </p>
                      ) : (
                        <p className="text-xs text-rose-900/70">
                          {row.sourceKind === 'ORDER_DISPLAY' ? 'Bestell-Display' : row.sourceKind === 'DISPLAY_DEVICE' ? 'Klarando-Display' : 'Screen-Device'}
                        </p>
                      )}
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      <AdminStatusBadge
                        status={uiStatus === 'unstable' ? 'offline' : uiStatus}
                        label={UI_STATUS_LABEL[uiStatus]}
                      />
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">{row.tenantName || row.tenantId}</td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">{formatDateTime(row.lastSeenAt)}</td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">{formatDateTime(row.lastSyncAt)}</td>
                    <td className="border-t border-slate-100 px-3 py-2 text-xs text-rose-900/80">
                      <p>Alias: {row.deviceInfo?.alias || '-'}</p>
                      <p>Modell: {row.deviceInfo?.model || '-'}</p>
                      <p>Plattform: {row.deviceInfo?.platform || '-'}</p>
                      <p>App: {row.deviceInfo?.appVersion || '-'}</p>
                      <p>Auflösung: {row.resolution || '-'}</p>
                      <div className="mt-2 grid gap-1">
                        <p>Geräte-ID: {row.id}</p>
                        <p>Tenant-ID: {row.tenantId || '-'}</p>
                        <p>Display-Code: {row.code || '-'}</p>
                        <p>Letzter Heartbeat: {formatDateTime(row.lastSeenAt)}</p>
                      </div>
                      <div className="mt-2 flex flex-wrap gap-1">
                        {row.id ? (
                          <AdminButton type="button" variant="secondary" onClick={() => void copyValue(row.id, 'Geräte-ID')}>
                            Geräte-ID kopieren
                          </AdminButton>
                        ) : null}
                        {row.tenantId ? (
                          <AdminButton type="button" variant="secondary" onClick={() => void copyValue(row.tenantId, 'Tenant-ID')}>
                            Tenant-ID kopieren
                          </AdminButton>
                        ) : null}
                        {row.code ? (
                          <AdminButton type="button" variant="secondary" onClick={() => void copyValue(row.code, 'Display-Code')}>
                            Display-Code kopieren
                          </AdminButton>
                        ) : null}
                      </div>
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      <div className="flex flex-wrap gap-2">
                        <AdminButton
                          type="button"
                          variant={selectedDisplayRowId === row.id && !createNewDisplayOnClaim ? 'primary' : 'secondary'}
                          onClick={() => {
                            setCreateNewDisplayOnClaim(false)
                            setSelectedDisplayRowId(row.id)
                            if (!claimDisplayName.trim() || claimDisplayName === selectedDisplayRow?.name) {
                              setClaimDisplayName(row.name)
                            }
                            setSuccess('')
                          }}
                        >
                          Dieses Display verbinden
                        </AdminButton>
                        <AdminButton
                          type="button"
                          variant="secondary"
                          onClick={() => window.open(row.editablePath || '/admin/screen-studio?tab=devices', '_self')}
                        >
                          Einstellungen
                        </AdminButton>
                        {!isAdminScope ? <AdminButton
                          type="button"
                          onClick={() => void handlePreview(row)}
                          disabled={busyDisplayRef === row.id}
                        >
                          Vorschau öffnen
                        </AdminButton> : null}
                        {!isAdminScope ? <AdminButton
                          type="button"
                          variant="secondary"
                          onClick={() => window.open(row.editablePath, '_blank', 'noopener,noreferrer')}
                        >
                          Bearbeiten
                        </AdminButton> : null}
                        <AdminButton
                          type="button"
                          variant="secondary"
                          onClick={() => void handleToggleActive(row)}
                          disabled={busyDisplayRef === row.id}
                        >
                          {row.isActive ? 'Deaktivieren' : 'Aktivieren'}
                        </AdminButton>
                        {row.sourceKind === 'DISPLAY_DEVICE' ? (
                          <AdminButton
                            type="button"
                            variant="secondary"
                            onClick={() => void handleArchiveDisplay(row)}
                            disabled={busyDisplayRef === row.id}
                          >
                            Archivieren
                          </AdminButton>
                        ) : null}
                        <AdminButton
                          type="button"
                          variant="secondary"
                          onClick={() => void handleResetDisplay(row)}
                          disabled={busyDisplayRef === row.id}
                        >
                          Gerät zurücksetzen
                        </AdminButton>
                        <AdminButton
                          type="button"
                          variant="secondary"
                          onClick={() => void handleDeleteDisplay(row)}
                          disabled={busyDisplayRef === row.id}
                        >
                          Gerät löschen
                        </AdminButton>
                        {row.pairingSupported && !isAdminScope ? (
                          <AdminButton
                            type="button"
                            variant="secondary"
                            onClick={() => void handleRegeneratePairing(row)}
                            disabled={busyDisplayRef === row.id}
                          >
                            QR-Code neu erzeugen
                          </AdminButton>
                        ) : (
                          <AdminButton
                            type="button"
                            variant="secondary"
                            disabled
                          >
                            QR-Code neu erzeugen
                          </AdminButton>
                        )}
                      </div>
                      {pairingData ? (
                        <div className="mt-3 rounded-xl border border-[var(--brand-border)] bg-rose-50/70 p-2 text-xs text-rose-900/80">
                          <p className="font-semibold">Neuer Pairing-Code bis {formatDateTime(pairingData.expiresAt)}</p>
                          <p className="mt-1 break-all">{pairingData.pairingPayload}</p>
                          <a
                            href={pairingData.qrImageUrl}
                            target="_blank"
                            rel="noreferrer"
                            className="mt-1 inline-block text-orange-700 underline"
                          >
                            QR-Code öffnen
                          </a>
                        </div>
                      ) : null}
                    </td>
                  </tr>
                )
              })}
            </tbody>
          </AdminTable>
        )}
      </AdminSectionCard>

      <AdminSectionCard title="Hinweis">
        <p className="text-sm text-rose-900/75">
          Vorschau-Links werden nur nach Rollen-/Tenant-Prüfung erzeugt. Device-Tokens werden in dieser Oberfläche nicht angezeigt.
        </p>
      </AdminSectionCard>
    </AdminPageShell>
  )
}
