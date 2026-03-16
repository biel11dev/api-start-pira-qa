/*
  Warnings:

  - Added the required column `productId` to the `Estoque` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Estoque" ADD COLUMN     "productId" INTEGER NOT NULL;

-- CreateIndex
CREATE INDEX "Estoque_productId_idx" ON "Estoque"("productId");

-- AddForeignKey
ALTER TABLE "Estoque" ADD CONSTRAINT "Estoque_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
