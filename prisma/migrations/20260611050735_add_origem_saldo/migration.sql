-- CreateTable
CREATE TABLE "PdvOrigemSaldo" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "saldo" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PdvOrigemSaldo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PdvOrigemSaldoMovimento" (
    "id" SERIAL NOT NULL,
    "origemId" INTEGER NOT NULL,
    "tipo" TEXT NOT NULL,
    "valor" DOUBLE PRECISION NOT NULL,
    "saldoAntes" DOUBLE PRECISION NOT NULL,
    "saldoDepois" DOUBLE PRECISION NOT NULL,
    "descricao" TEXT,
    "userId" INTEGER,
    "userName" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PdvOrigemSaldoMovimento_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "PdvOrigemSaldo_nome_key" ON "PdvOrigemSaldo"("nome");

-- CreateIndex
CREATE INDEX "PdvOrigemSaldo_nome_idx" ON "PdvOrigemSaldo"("nome");

-- CreateIndex
CREATE INDEX "PdvOrigemSaldoMovimento_origemId_idx" ON "PdvOrigemSaldoMovimento"("origemId");

-- CreateIndex
CREATE INDEX "PdvOrigemSaldoMovimento_createdAt_idx" ON "PdvOrigemSaldoMovimento"("createdAt");

-- AddForeignKey
ALTER TABLE "PdvOrigemSaldoMovimento" ADD CONSTRAINT "PdvOrigemSaldoMovimento_origemId_fkey" FOREIGN KEY ("origemId") REFERENCES "PdvOrigemSaldo"("id") ON DELETE CASCADE ON UPDATE CASCADE;
