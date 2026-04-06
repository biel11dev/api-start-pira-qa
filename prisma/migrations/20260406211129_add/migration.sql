-- CreateTable
CREATE TABLE "PdvCaixaMovimento" (
    "id" SERIAL NOT NULL,
    "tipo" TEXT NOT NULL,
    "valor" DOUBLE PRECISION NOT NULL,
    "userId" INTEGER,
    "userName" TEXT,
    "observacao" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PdvCaixaMovimento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PdvCaixaOrigem" (
    "id" SERIAL NOT NULL,
    "movimentoId" INTEGER NOT NULL,
    "nome" TEXT NOT NULL,
    "valor" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PdvCaixaOrigem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PdvOrigemConfig" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PdvOrigemConfig_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PdvPremio" (
    "id" SERIAL NOT NULL,
    "imagem1" TEXT NOT NULL,
    "imagem2" TEXT NOT NULL,
    "valor" DOUBLE PRECISION NOT NULL,
    "observacao" TEXT,
    "userId" INTEGER,
    "userName" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PdvPremio_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PdvPremioOrigem" (
    "id" SERIAL NOT NULL,
    "premioId" INTEGER NOT NULL,
    "nome" TEXT NOT NULL,
    "valor" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PdvPremioOrigem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PdvCupom" (
    "id" SERIAL NOT NULL,
    "codigo" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,
    "valor" DOUBLE PRECISION NOT NULL,
    "descricao" TEXT,
    "validoAte" TIMESTAMP(3),
    "limiteUso" INTEGER,
    "vezesUsado" INTEGER NOT NULL DEFAULT 0,
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PdvCupom_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PdvTaxaMaquina" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,
    "valor" DOUBLE PRECISION NOT NULL,
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PdvTaxaMaquina_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PdvConfigVenda" (
    "id" SERIAL NOT NULL,
    "chave" TEXT NOT NULL,
    "valor" TEXT NOT NULL,
    "descricao" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PdvConfigVenda_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "PdvCaixaMovimento_tipo_idx" ON "PdvCaixaMovimento"("tipo");

-- CreateIndex
CREATE INDEX "PdvCaixaMovimento_createdAt_idx" ON "PdvCaixaMovimento"("createdAt");

-- CreateIndex
CREATE INDEX "PdvCaixaOrigem_movimentoId_idx" ON "PdvCaixaOrigem"("movimentoId");

-- CreateIndex
CREATE UNIQUE INDEX "PdvOrigemConfig_nome_key" ON "PdvOrigemConfig"("nome");

-- CreateIndex
CREATE INDEX "PdvPremio_createdAt_idx" ON "PdvPremio"("createdAt");

-- CreateIndex
CREATE INDEX "PdvPremioOrigem_premioId_idx" ON "PdvPremioOrigem"("premioId");

-- CreateIndex
CREATE UNIQUE INDEX "PdvCupom_codigo_key" ON "PdvCupom"("codigo");

-- CreateIndex
CREATE INDEX "PdvCupom_codigo_idx" ON "PdvCupom"("codigo");

-- CreateIndex
CREATE INDEX "PdvCupom_ativo_idx" ON "PdvCupom"("ativo");

-- CreateIndex
CREATE UNIQUE INDEX "PdvConfigVenda_chave_key" ON "PdvConfigVenda"("chave");

-- AddForeignKey
ALTER TABLE "PdvCaixaOrigem" ADD CONSTRAINT "PdvCaixaOrigem_movimentoId_fkey" FOREIGN KEY ("movimentoId") REFERENCES "PdvCaixaMovimento"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PdvPremioOrigem" ADD CONSTRAINT "PdvPremioOrigem_premioId_fkey" FOREIGN KEY ("premioId") REFERENCES "PdvPremio"("id") ON DELETE CASCADE ON UPDATE CASCADE;
