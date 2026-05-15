import { Router } from 'express'

// Legacy display-pairing endpoints removed in the rebuilt display system.
// New endpoints live in:
// - /api/display/*
// - /api/admin/displays/*

const router = Router()

// Mounted only on explicit legacy prefixes in server.ts.
router.all(/.*/, (_req, res) => {
  return res.status(410).json({
    message: 'Diese Route wurde ersetzt. Bitte /api/display/pairing/session verwenden.',
  })
})

export default router
