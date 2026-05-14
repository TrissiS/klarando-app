'use client'

import { useEffect, useMemo, useState } from 'react'
import {
  claimDisplayPairingSession,
  getAccessContext,
  getDisplayDeviceOverview,
  getDisplayDevicePreview,
  regenerateDisplayPairingCode,
  updateDisplayDeviceActiveState,
  type DisplayDeviceOverviewRow,
  type DisplayDeviceStatus,
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
}

const STATUS_LABEL: Record<DisplayDeviceStatus, string> = {
  online: 'Online',
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

const STATUS_OPTIONS: Array<{ value: DisplayDeviceStatus | 'all'; label: string }> = [
  { value: 'all', label: 'Alle Status' },
  { value: 'online', label: 'Online' },
  { value: 'offline', label: 'Offline' },
  { value: 'inactive', label: 'Inaktiv' },
]

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
}: DisplayDeviceManagementPanelProps) {
  const [rows, setRows] = useState<DisplayDeviceOverviewRow[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [searchText, setSearchText] = useState('')
  const [statusFilter, setStatusFilter] = useState<DisplayDeviceStatus | 'all'>('all')
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
  const [claimScreenId, setClaimScreenId] = useState('')
  const [claimDisplayName, setClaimDisplayName] = useState('')
  const [claiming, setClaiming] = useState(false)

  const isTenantLocked = Boolean(fixedTenantId)
  const isChainLocked = Boolean(fixedChainId)

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

  async function handleClaimPairing() {
    try {
      setClaiming(true)
      setError('')
      setSuccess('')
      const pairingToken = resolvePairingTokenFromPayload(claimPayload)
      if (!pairingToken) {
        throw new Error('Bitte QR-Payload oder Pairing-Token einfügen.')
      }
      const tenantId = (isTenantLocked ? fixedTenantId : claimTenantId)?.trim()
      if (!tenantId) {
        throw new Error('Bitte Filiale auswählen.')
      }
      await claimDisplayPairingSession(token, {
        pairingToken,
        tenantId,
        screenId: claimScreenId.trim() || null,
        displayName: claimDisplayName.trim() || null,
      })
      setSuccess('Display erfolgreich verbunden.')
      setClaimPayload('')
      setClaimPairingCode('')
      setClaimScreenId('')
      setClaimDisplayName('')
      await loadOverview()
    } catch (claimError) {
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
            label="Bildschirm-ID (optional)"
            value={claimScreenId}
            onChange={(event) => setClaimScreenId(event.target.value)}
            placeholder="Automatisch, wenn leer"
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
        <AdminActionBar>
          <AdminButton type="button" onClick={() => void handleClaimPairing()} disabled={claiming}>
            {claiming ? 'Verbinde…' : 'Display verbinden'}
          </AdminButton>
        </AdminActionBar>
      </AdminSectionCard>

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
            onChange={(event) => setStatusFilter(event.target.value as DisplayDeviceStatus | 'all')}
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

      <AdminSectionCard title="Geräteübersicht">
        {loading ? (
          <p className="text-sm text-rose-900/75">Lade Display-Geräte...</p>
        ) : rows.length === 0 ? (
          <AdminEmptyState title="Noch keine Displays gekoppelt." description="Kopple zuerst ein Display-Gerät über Pairing-Code." />
        ) : (
          <AdminTable>
            <thead>
              <tr>
                <th className="th-ui">Display</th>
                <th className="th-ui">Typ</th>
                <th className="th-ui">Status</th>
                <th className="th-ui">Filiale</th>
                <th className="th-ui">Kette</th>
                <th className="th-ui">Zuletzt gesehen</th>
                <th className="th-ui">Letzter Sync</th>
                <th className="th-ui">Geräteinfo</th>
                <th className="th-ui">Aktionen</th>
              </tr>
            </thead>
            <tbody>
              {rows.map((row) => {
                const pairingData = pairingByDisplayRef[row.id]
                return (
                  <tr key={row.id}>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      <p className="font-semibold text-[var(--brand-ink)]">{row.name}</p>
                      <p className="text-xs text-rose-900/70">{row.code} | {row.sourceKind === 'ORDER_DISPLAY' ? 'Bestell-Display' : 'Screen-Device'}</p>
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">{row.displayType}</td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      <AdminStatusBadge
                        status={row.status === 'online' ? 'online' : row.status === 'offline' ? 'offline' : 'inactive'}
                        label={STATUS_LABEL[row.status]}
                      />
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">{row.tenantName || row.tenantId}</td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">{row.chainName || '-'}</td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">{formatDateTime(row.lastSeenAt)}</td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">{formatDateTime(row.lastSyncAt)}</td>
                    <td className="border-t border-slate-100 px-3 py-2 text-xs text-rose-900/80">
                      <p>Alias: {row.deviceInfo?.alias || '-'}</p>
                      <p>Modell: {row.deviceInfo?.model || '-'}</p>
                      <p>Plattform: {row.deviceInfo?.platform || '-'}</p>
                      <p>App: {row.deviceInfo?.appVersion || '-'}</p>
                      <p>Auflösung: {row.resolution || '-'}</p>
                    </td>
                    <td className="border-t border-slate-100 px-3 py-2 text-sm">
                      <div className="flex flex-wrap gap-2">
                        <AdminButton
                          type="button"
                          onClick={() => void handlePreview(row)}
                          disabled={busyDisplayRef === row.id}
                        >
                          Vorschau öffnen
                        </AdminButton>
                        <AdminButton
                          type="button"
                          variant="secondary"
                          onClick={() => window.open(row.editablePath, '_blank', 'noopener,noreferrer')}
                        >
                          Bearbeiten
                        </AdminButton>
                        <AdminButton
                          type="button"
                          variant="secondary"
                          onClick={() => void handleToggleActive(row)}
                          disabled={busyDisplayRef === row.id}
                        >
                          {row.isActive ? 'Deaktivieren' : 'Aktivieren'}
                        </AdminButton>
                        {row.pairingSupported ? (
                          <AdminButton
                            type="button"
                            variant="secondary"
                            onClick={() => void handleRegeneratePairing(row)}
                            disabled={busyDisplayRef === row.id}
                          >
                            Pairing-Code neu erzeugen
                          </AdminButton>
                        ) : null}
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
        {roleScope === 'admin' ? (
          <p className="mt-1 text-sm text-rose-900/75">
            Für detaillierte Layout-Anpassungen nutze „Bearbeiten“ und öffne die jeweiligen Detailbereiche.
          </p>
        ) : null}
      </AdminSectionCard>
    </AdminPageShell>
  )
}
