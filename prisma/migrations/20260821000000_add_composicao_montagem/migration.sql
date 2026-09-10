-- AlterTable
ALTER TABLE "ComposicaoProduto" ADD COLUMN     "porcoesGratis" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "valorAdicional" DOUBLE PRECISION NOT NULL DEFAULT 0;
