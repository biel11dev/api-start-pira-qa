-- AlterTable
ALTER TABLE "ComposicaoOpcao" ADD COLUMN     "estoqueId" INTEGER;

-- CreateIndex
CREATE INDEX "ComposicaoOpcao_estoqueId_idx" ON "ComposicaoOpcao"("estoqueId");

-- AddForeignKey
ALTER TABLE "ComposicaoOpcao" ADD CONSTRAINT "ComposicaoOpcao_estoqueId_fkey" FOREIGN KEY ("estoqueId") REFERENCES "Estoque"("id") ON DELETE SET NULL ON UPDATE CASCADE;
