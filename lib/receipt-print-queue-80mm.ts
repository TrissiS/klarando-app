import type { EscPosByteTransport } from './escpos-printer-80mm'
import { encodeReceiptToEscPosBytes } from './escpos-printer-80mm'
import type { ReceiptRenderResult } from './receipt-renderer-80mm'

export type ReceiptQueueJobKind = 'CUSTOMER' | 'KITCHEN'

export type ReceiptQueueJob = {
  id: string
  orderId: string
  kind: ReceiptQueueJobKind
  renderResult: ReceiptRenderResult
  createdAt: string
  lastError: string | null
  attemptCount: number
}

export type ReceiptQueueOptions = {
  maxAttempts?: number
}

function wait(ms: number) {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, ms)
  })
}

function createQueueJobId() {
  return `rj_${Date.now().toString(36)}_${Math.random().toString(36).slice(2, 9)}`
}

export class ReceiptPrintQueue80mm {
  private readonly transport: EscPosByteTransport
  private readonly maxAttempts: number
  private readonly queue: ReceiptQueueJob[] = []
  private active = false

  constructor(transport: EscPosByteTransport, options?: ReceiptQueueOptions) {
    this.transport = transport
    this.maxAttempts = Math.max(1, options?.maxAttempts ?? 3)
  }

  enqueue(input: { orderId: string; kind: ReceiptQueueJobKind; renderResult: ReceiptRenderResult }) {
    const job: ReceiptQueueJob = {
      id: createQueueJobId(),
      orderId: input.orderId,
      kind: input.kind,
      renderResult: input.renderResult,
      createdAt: new Date().toISOString(),
      lastError: null,
      attemptCount: 0,
    }
    this.queue.push(job)
    return job
  }

  getSnapshot() {
    return {
      active: this.active,
      pending: this.queue.map((job) => ({ ...job })),
    }
  }

  stop() {
    this.active = false
  }

  async run() {
    if (this.active) {
      return
    }
    this.active = true

    while (this.active && this.queue.length > 0) {
      const current = this.queue[0]
      try {
        current.attemptCount += 1
        const payload = encodeReceiptToEscPosBytes(current.renderResult)
        await this.transport.write(payload.bytes)
        this.queue.shift()
      } catch (error) {
        current.lastError = error instanceof Error ? error.message : 'Unbekannter Druckfehler'
        if (current.attemptCount >= this.maxAttempts) {
          this.queue.shift()
        } else {
          await wait(1200 * current.attemptCount)
        }
      }
    }

    this.active = false
  }
}
