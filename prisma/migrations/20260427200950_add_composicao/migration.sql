-- AlterTable
ALTER TABLE "SaleItem" ADD COLUMN     "composicao" TEXT;

-- CreateTable
CREATE TABLE "ComposicaoProduto" (
    "id" SERIAL NOT NULL,
    "estoqueId" INTEGER NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT,
    "obrigatorio" BOOLEAN NOT NULL DEFAULT true,
    "multiplo" BOOLEAN NOT NULL DEFAULT false,
    "minOpcoes" INTEGER NOT NULL DEFAULT 1,
    "maxOpcoes" INTEGER NOT NULL DEFAULT 1,
    "ordem" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ComposicaoProduto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ComposicaoOpcao" (
    "id" SERIAL NOT NULL,
    "composicaoId" INTEGER NOT NULL,
    "nome" TEXT NOT NULL,
    "valorExtra" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "disponivel" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ComposicaoOpcao_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "ComposicaoProduto_estoqueId_idx" ON "ComposicaoProduto"("estoqueId");

-- CreateIndex
CREATE INDEX "ComposicaoOpcao_composicaoId_idx" ON "ComposicaoOpcao"("composicaoId");

-- AddForeignKey
ALTER TABLE "ComposicaoProduto" ADD CONSTRAINT "ComposicaoProduto_estoqueId_fkey" FOREIGN KEY ("estoqueId") REFERENCES "Estoque"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ComposicaoOpcao" ADD CONSTRAINT "ComposicaoOpcao_composicaoId_fkey" FOREIGN KEY ("composicaoId") REFERENCES "ComposicaoProduto"("id") ON DELETE CASCADE ON UPDATE CASCADE;
