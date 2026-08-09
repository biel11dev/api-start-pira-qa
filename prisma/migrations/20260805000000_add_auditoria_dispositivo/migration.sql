-- AlterTable
ALTER TABLE "Auditoria" ADD COLUMN     "dispositivo" TEXT;
ALTER TABLE "Auditoria" ADD COLUMN     "userAgent" TEXT;

-- CreateIndex
CREATE INDEX "Auditoria_dispositivo_idx" ON "Auditoria"("dispositivo");
