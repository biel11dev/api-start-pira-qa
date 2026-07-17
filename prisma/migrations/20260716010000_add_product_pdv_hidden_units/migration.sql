-- AlterTable
ALTER TABLE "Product" ADD COLUMN     "pdvHiddenUnits" TEXT[] NOT NULL DEFAULT ARRAY[]::TEXT[];

-- Preserva o estado atual: unidades marcadas como mostrarPdv=false no estoque
-- passam a compor as unidades ocultas por produto no PDV.
UPDATE "Product" p
SET "pdvHiddenUnits" = sub.units
FROM (
  SELECT "productId", array_agg(DISTINCT "unit") AS units
  FROM "Estoque"
  WHERE "mostrarPdv" = false AND "productId" IS NOT NULL
  GROUP BY "productId"
) sub
WHERE p.id = sub."productId";
