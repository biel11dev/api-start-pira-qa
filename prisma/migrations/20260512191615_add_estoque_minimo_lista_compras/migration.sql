-- CreateTable
CREATE TABLE "EstoqueMinimo" (
    "id" SERIAL NOT NULL,
    "estoqueId" INTEGER NOT NULL,
    "quantidadeMinima" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EstoqueMinimo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ListaCompras" (
    "id" SERIAL NOT NULL,
    "estoqueId" INTEGER NOT NULL,
    "nomeProduto" TEXT NOT NULL,
    "quantidadeAtual" DOUBLE PRECISION NOT NULL,
    "quantidadeMinima" DOUBLE PRECISION NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'PENDENTE',
    "concluidoEm" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ListaCompras_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "EstoqueMinimo_estoqueId_key" ON "EstoqueMinimo"("estoqueId");

-- CreateIndex
CREATE INDEX "ListaCompras_estoqueId_idx" ON "ListaCompras"("estoqueId");

-- CreateIndex
CREATE INDEX "ListaCompras_status_idx" ON "ListaCompras"("status");

-- AddForeignKey
ALTER TABLE "EstoqueMinimo" ADD CONSTRAINT "EstoqueMinimo_estoqueId_fkey" FOREIGN KEY ("estoqueId") REFERENCES "Estoque"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ListaCompras" ADD CONSTRAINT "ListaCompras_estoqueId_fkey" FOREIGN KEY ("estoqueId") REFERENCES "Estoque"("id") ON DELETE CASCADE ON UPDATE CASCADE;
