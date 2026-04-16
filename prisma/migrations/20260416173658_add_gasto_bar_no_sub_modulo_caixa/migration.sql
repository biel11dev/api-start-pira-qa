-- CreateTable
CREATE TABLE "PdvGastoBar" (
    "id" SERIAL NOT NULL,
    "tipo" TEXT NOT NULL,
    "funcionarioId" INTEGER,
    "funcionario" TEXT NOT NULL,
    "descricao" TEXT,
    "quantidade" DOUBLE PRECISION,
    "valorUnitario" DOUBLE PRECISION,
    "valorTotal" DOUBLE PRECISION NOT NULL,
    "saleId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PdvGastoBar_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "PdvGastoBar_tipo_idx" ON "PdvGastoBar"("tipo");

-- CreateIndex
CREATE INDEX "PdvGastoBar_funcionarioId_idx" ON "PdvGastoBar"("funcionarioId");

-- CreateIndex
CREATE INDEX "PdvGastoBar_createdAt_idx" ON "PdvGastoBar"("createdAt");
