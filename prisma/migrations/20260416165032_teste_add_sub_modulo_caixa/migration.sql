-- CreateTable
CREATE TABLE "PdvCaixaControle" (
    "id" SERIAL NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'ABERTO',
    "saldoInicial" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "saldoFinal" DOUBLE PRECISION,
    "totalEntradas" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "totalSaidas" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "observacao" TEXT,
    "abertoPorId" INTEGER,
    "abertoPorNome" TEXT,
    "fechadoPorId" INTEGER,
    "fechadoPorNome" TEXT,
    "abertoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "fechadoEm" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PdvCaixaControle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PdvCaixaTransacao" (
    "id" SERIAL NOT NULL,
    "caixaId" INTEGER NOT NULL,
    "tipo" TEXT NOT NULL,
    "categoria" TEXT NOT NULL,
    "valor" DOUBLE PRECISION NOT NULL,
    "descricao" TEXT,
    "userId" INTEGER,
    "userName" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PdvCaixaTransacao_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "PdvCaixaControle_status_idx" ON "PdvCaixaControle"("status");

-- CreateIndex
CREATE INDEX "PdvCaixaControle_abertoEm_idx" ON "PdvCaixaControle"("abertoEm");

-- CreateIndex
CREATE INDEX "PdvCaixaTransacao_caixaId_idx" ON "PdvCaixaTransacao"("caixaId");

-- CreateIndex
CREATE INDEX "PdvCaixaTransacao_tipo_idx" ON "PdvCaixaTransacao"("tipo");

-- CreateIndex
CREATE INDEX "PdvCaixaTransacao_createdAt_idx" ON "PdvCaixaTransacao"("createdAt");

-- AddForeignKey
ALTER TABLE "PdvCaixaTransacao" ADD CONSTRAINT "PdvCaixaTransacao_caixaId_fkey" FOREIGN KEY ("caixaId") REFERENCES "PdvCaixaControle"("id") ON DELETE CASCADE ON UPDATE CASCADE;
