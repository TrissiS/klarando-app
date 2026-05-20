import type { PublicScreenFeed } from './api'
import type { DisplayRuntimeConfig } from './display-runtime'

export type OfflineDisplaySnapshot = {
  deviceCode: string
  savedAt: string
  publishedVersion: string | null
  cachedVersion: string | null
  feed: PublicScreenFeed
  runtimeConfig: DisplayRuntimeConfig | null
}

export type OfflineQueuedOrder = {
  id: string
  deviceCode: string
  tenantId: string
  clientOrderId: string
  idempotencyKey: string
  payload: Record<string, unknown>
  createdAt: string
}

const OFFLINE_SNAPSHOT_PREFIX = 'klarando:display-offline-snapshot:'
const DB_NAME = 'klarando-display-offline'
const DB_VERSION = 1
const ORDER_STORE = 'easy_order_queue'

function snapshotKey(deviceCode: string) {
  return `${OFFLINE_SNAPSHOT_PREFIX}${deviceCode.toUpperCase()}`
}

export function readOfflineDisplaySnapshot(deviceCode: string): OfflineDisplaySnapshot | null {
  if (typeof window === 'undefined') return null
  const raw = window.localStorage.getItem(snapshotKey(deviceCode))
  if (!raw) return null
  try {
    return JSON.parse(raw) as OfflineDisplaySnapshot
  } catch {
    return null
  }
}

export function writeOfflineDisplaySnapshot(input: OfflineDisplaySnapshot) {
  if (typeof window === 'undefined') return
  window.localStorage.setItem(snapshotKey(input.deviceCode), JSON.stringify(input))
}

function openDb(): Promise<IDBDatabase> {
  return new Promise((resolve, reject) => {
    if (typeof window === 'undefined' || !window.indexedDB) {
      reject(new Error('IndexedDB ist nicht verfügbar'))
      return
    }
    const request = window.indexedDB.open(DB_NAME, DB_VERSION)
    request.onupgradeneeded = () => {
      const db = request.result
      if (!db.objectStoreNames.contains(ORDER_STORE)) {
        const store = db.createObjectStore(ORDER_STORE, { keyPath: 'id' })
        store.createIndex('deviceCode', 'deviceCode', { unique: false })
        store.createIndex('createdAt', 'createdAt', { unique: false })
      }
    }
    request.onsuccess = () => resolve(request.result)
    request.onerror = () => reject(request.error || new Error('Offline DB konnte nicht geöffnet werden'))
  })
}

export async function enqueueOfflineOrder(order: Omit<OfflineQueuedOrder, 'id' | 'createdAt'>) {
  const db = await openDb()
  const record: OfflineQueuedOrder = {
    id: `${order.deviceCode}-${order.clientOrderId}-${Date.now()}`,
    createdAt: new Date().toISOString(),
    ...order,
  }

  await new Promise<void>((resolve, reject) => {
    const tx = db.transaction(ORDER_STORE, 'readwrite')
    tx.oncomplete = () => resolve()
    tx.onerror = () => reject(tx.error || new Error('Offline Order konnte nicht gespeichert werden'))
    tx.objectStore(ORDER_STORE).put(record)
  })
}

export async function listOfflineOrders(deviceCode?: string): Promise<OfflineQueuedOrder[]> {
  const db = await openDb()
  return await new Promise<OfflineQueuedOrder[]>((resolve, reject) => {
    const tx = db.transaction(ORDER_STORE, 'readonly')
    const store = tx.objectStore(ORDER_STORE)
    const request = deviceCode
      ? store.index('deviceCode').getAll(IDBKeyRange.only(deviceCode.toUpperCase()))
      : store.getAll()
    request.onsuccess = () => resolve((request.result as OfflineQueuedOrder[]).sort((a, b) => a.createdAt.localeCompare(b.createdAt)))
    request.onerror = () => reject(request.error || new Error('Offline Orders konnten nicht gelesen werden'))
  })
}

export async function removeOfflineOrder(orderId: string) {
  const db = await openDb()
  await new Promise<void>((resolve, reject) => {
    const tx = db.transaction(ORDER_STORE, 'readwrite')
    tx.oncomplete = () => resolve()
    tx.onerror = () => reject(tx.error || new Error('Offline Order konnte nicht gelöscht werden'))
    tx.objectStore(ORDER_STORE).delete(orderId)
  })
}
