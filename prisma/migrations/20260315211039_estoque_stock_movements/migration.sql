/*
  Warnings:

  - You are about to drop the column `productId` on the `SaleItem` table. All the data in the column will be lost.
  - You are about to drop the column `productId` on the `StockMovement` table. All the data in the column will be lost.
  - Added the required column `estoqueId` to the `SaleItem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `estoqueId` to the `StockMovement` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "SaleItem" DROP CONSTRAINT "SaleItem_productId_fkey";

-- DropForeignKey
ALTER TABLE "StockMovement" DROP CONSTRAINT "StockMovement_productId_fkey";

-- DropIndex
DROP INDEX "StockMovement_productId_idx";

-- AlterTable
ALTER TABLE "SaleItem" DROP COLUMN "productId",
ADD COLUMN     "estoqueId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "StockMovement" DROP COLUMN "productId",
ADD COLUMN     "estoqueId" INTEGER NOT NULL;

-- CreateIndex
CREATE INDEX "StockMovement_estoqueId_idx" ON "StockMovement"("estoqueId");

-- AddForeignKey
ALTER TABLE "SaleItem" ADD CONSTRAINT "SaleItem_estoqueId_fkey" FOREIGN KEY ("estoqueId") REFERENCES "Estoque"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockMovement" ADD CONSTRAINT "StockMovement_estoqueId_fkey" FOREIGN KEY ("estoqueId") REFERENCES "Estoque"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
