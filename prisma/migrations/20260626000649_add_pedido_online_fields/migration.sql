-- AlterTable
ALTER TABLE "Sale" ADD COLUMN     "customerAddress" TEXT,
ADD COLUMN     "customerPhone" TEXT,
ADD COLUMN     "observacoes" TEXT,
ADD COLUMN     "origem" TEXT NOT NULL DEFAULT 'PDV',
ADD COLUMN     "statusPedido" TEXT DEFAULT 'pending';

-- CreateIndex
CREATE INDEX "Sale_origem_idx" ON "Sale"("origem");

-- CreateIndex
CREATE INDEX "Sale_statusPedido_idx" ON "Sale"("statusPedido");
