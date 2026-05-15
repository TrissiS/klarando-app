import { Router } from 'express'

// Legacy display-pairing endpoints removed in the rebuilt display system.
// New endpoints live in:
// - /api/display/*
// - /api/admin/displays/*

const router = Router()

router.all('/display/pairing/session', (_req, res) => {
  return res.status(410).json({
    message: 'Diese Route wurde ersetzt. Bitte /api/display/pairing/session verwenden.',
  })
})

export default router
