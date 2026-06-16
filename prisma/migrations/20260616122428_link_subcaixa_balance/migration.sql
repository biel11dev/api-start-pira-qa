-- AlterTable
ALTER TABLE "PdvCaixaControle" ADD COLUMN     "balanceId" INTEGER;

-- CreateIndex
CREATE INDEX "PdvCaixaControle_balanceId_idx" ON "PdvCaixaControle"("balanceId");

-- AddForeignKey
ALTER TABLE "PdvCaixaControle" ADD CONSTRAINT "PdvCaixaControle_balanceId_fkey" FOREIGN KEY ("balanceId") REFERENCES "Balance"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
