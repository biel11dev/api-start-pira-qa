-- CreateTable
CREATE TABLE "PdvComanda" (
    "id" SERIAL NOT NULL,
    "clientId" INTEGER NOT NULL,
    "saleId" INTEGER,
    "total" DOUBLE PRECISION NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'ABERTA',
    "paymentMethod" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "paidAt" TIMESTAMP(3),
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PdvComanda_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PdvComandaItem" (
    "id" SERIAL NOT NULL,
    "comandaId" INTEGER NOT NULL,
    "productName" TEXT NOT NULL,
    "quantity" DOUBLE PRECISION NOT NULL,
    "unitPrice" DOUBLE PRECISION NOT NULL,
    "total" DOUBLE PRECISION NOT NULL,
    "estoqueId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PdvComandaItem_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "PdvComanda_clientId_idx" ON "PdvComanda"("clientId");

-- CreateIndex
CREATE INDEX "PdvComanda_status_idx" ON "PdvComanda"("status");

-- CreateIndex
CREATE INDEX "PdvComanda_createdAt_idx" ON "PdvComanda"("createdAt");

-- CreateIndex
CREATE INDEX "PdvComandaItem_comandaId_idx" ON "PdvComandaItem"("comandaId");

-- AddForeignKey
ALTER TABLE "PdvComanda" ADD CONSTRAINT "PdvComanda_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PdvComandaItem" ADD CONSTRAINT "PdvComandaItem_comandaId_fkey" FOREIGN KEY ("comandaId") REFERENCES "PdvComanda"("id") ON DELETE CASCADE ON UPDATE CASCADE;
