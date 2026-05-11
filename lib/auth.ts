import type { Role, SessionUser } from './app-data'

export const demoUsers = [
  {
    email: 'admin@plattform.local',
    password: 'admin123',
    role: 'superadmin' as Role,
    name: 'Superadmin',
  },
  {
    email: 'inhaber@demo-klarando.de',
    password: 'imbiss123',
    role: 'mandant' as Role,
    name: 'Klarando Demo Inhaber',
  },
]

export function loginUser(email: string, password: string): SessionUser | null {
  if (process.env.NODE_ENV === 'production') {
    return null
  }

  const found = demoUsers.find(
    (user) => user.email === email && user.password === password
  )

  if (!found) {
    return null
  }

  return {
    email: found.email,
    role: found.role,
    name: found.name,
  }
}
