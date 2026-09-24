-- AlterTable
ALTER TABLE "Estoque" ADD COLUMN     "isCombo" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "comboNome" TEXT;

-- AlterTable
ALTER TABLE "ComposicaoProduto" ADD COLUMN     "permiteQuantidade" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "exigeTotalExato" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "ComposicaoOpcao" ADD COLUMN     "exclusivo" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "consomeQtd" INTEGER NOT NULL DEFAULT 1;
