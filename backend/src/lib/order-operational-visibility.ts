import { Prisma } from '@prisma/client'

export function excludeOperationallyHiddenStripeOrders(
  where: Prisma.OrderWhereInput
): Prisma.OrderWhereInput {
  return {
    AND: [
      where,
      {
        NOT: {
          AND: [
            { status: 'pending_payment' },
            { paymentMethod: 'STRIPE' },
            {
              paymentStatus: {
                not: 'PAID',
              },
            },
          ],
        },
      },
    ],
  }
}
