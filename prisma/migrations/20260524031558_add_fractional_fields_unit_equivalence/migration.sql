-- AlterTable
ALTER TABLE "UnitEquivalence" ADD COLUMN     "fractionalValue" DOUBLE PRECISION,
ADD COLUMN     "isFractional" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "funcionario" DROP NOT NULL;
