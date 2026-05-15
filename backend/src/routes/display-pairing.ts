import { Router } from 'express'

// Legacy display-pairing endpoints removed in the rebuilt display system.
// New endpoints live in:
// - /api/display/*
// - /api/admin/displays/*

const router = Router()

// Keep explicit 410 only on legacy routes, never on the new
// /api/display/pairing/session endpoint.
router.all('/display/pairing', (_req, res) => {
  return res.status(410).json({
    message: 'Diese Route wurde ersetzt. Bitte /api/display/pairing/session verwenden.',
  })
})

router.all('/displays/pairing', (_req, res) => {
  return res.status(410).json({
    message: 'Diese Route wurde ersetzt. Bitte /api/display/pairing/session verwenden.',
  })
})

router.all('/display/session', (_req, res) => {
  return res.status(410).json({
    message: 'Diese Route wurde ersetzt. Bitte /api/display/pairing/session verwenden.',
  })
})

export default router
