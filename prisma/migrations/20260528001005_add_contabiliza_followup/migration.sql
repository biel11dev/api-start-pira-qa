-- AlterTable
ALTER TABLE "Estoque" ADD COLUMN     "contabiliza" BOOLEAN NOT NULL DEFAULT true;

-- CreateTable
CREATE TABLE "FollowUp" (
    "id" SERIAL NOT NULL,
    "estoqueId" INTEGER NOT NULL,
    "semana" TEXT NOT NULL,
    "temEstoque" BOOLEAN,
    "quantidade" DOUBLE PRECISION,
    "observacao" TEXT,
    "respondidoEm" TIMESTAMP(3),
    "respondidoPor" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FollowUp_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "FollowUp_estoqueId_idx" ON "FollowUp"("estoqueId");

-- CreateIndex
CREATE INDEX "FollowUp_semana_idx" ON "FollowUp"("semana");

-- CreateIndex
CREATE INDEX "FollowUp_temEstoque_idx" ON "FollowUp"("temEstoque");

-- CreateIndex
CREATE UNIQUE INDEX "FollowUp_estoqueId_semana_key" ON "FollowUp"("estoqueId", "semana");

-- AddForeignKey
ALTER TABLE "FollowUp" ADD CONSTRAINT "FollowUp_estoqueId_fkey" FOREIGN KEY ("estoqueId") REFERENCES "Estoque"("id") ON DELETE CASCADE ON UPDATE CASCADE;
