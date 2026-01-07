-- CreateTable
CREATE TABLE "EmployeeMetaHistory" (
    "id" SERIAL NOT NULL,
    "employeeId" INTEGER NOT NULL,
    "valorHora" DOUBLE PRECISION NOT NULL,
    "metaHoras" DOUBLE PRECISION NOT NULL,
    "bonificacao" DOUBLE PRECISION NOT NULL,
    "validFrom" TIMESTAMP(3) NOT NULL,
    "validUntil" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "EmployeeMetaHistory_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "EmployeeMetaHistory_employeeId_validFrom_idx" ON "EmployeeMetaHistory"("employeeId", "validFrom");

-- AddForeignKey
ALTER TABLE "EmployeeMetaHistory" ADD CONSTRAINT "EmployeeMetaHistory_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;
