-- AlterTable
ALTER TABLE "PdvFormaPagamento" ADD COLUMN     "pointEnabled" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "pointType" TEXT;

-- CreateTable
CREATE TABLE "PointOrder" (
    "id" SERIAL NOT NULL,
    "mpOrderId" TEXT,
    "externalReference" TEXT NOT NULL,
    "terminalId" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "paymentType" TEXT,
    "installments" INTEGER NOT NULL DEFAULT 1,
    "description" TEXT,
    "status" TEXT NOT NULL DEFAULT 'created',
    "statusDetail" TEXT,
    "mpPaymentId" TEXT,
    "saleId" INTEGER,
    "operator" TEXT,
    "rawPayload" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PointOrder_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "PointOrder_mpOrderId_key" ON "PointOrder"("mpOrderId");

-- CreateIndex
CREATE UNIQUE INDEX "PointOrder_externalReference_key" ON "PointOrder"("externalReference");

-- CreateIndex
CREATE INDEX "PointOrder_status_idx" ON "PointOrder"("status");

-- CreateIndex
CREATE INDEX "PointOrder_mpOrderId_idx" ON "PointOrder"("mpOrderId");

-- CreateIndex
CREATE INDEX "PointOrder_createdAt_idx" ON "PointOrder"("createdAt");
