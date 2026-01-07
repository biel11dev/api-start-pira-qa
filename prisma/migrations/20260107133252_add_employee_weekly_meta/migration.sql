-- CreateTable
CREATE TABLE "EmployeeWeeklyMeta" (
    "id" SERIAL NOT NULL,
    "employeeId" INTEGER NOT NULL,
    "year" INTEGER NOT NULL,
    "month" INTEGER NOT NULL,
    "weekStart" TIMESTAMP(3) NOT NULL,
    "metaHoras" DOUBLE PRECISION NOT NULL,
    "bonificacao" DOUBLE PRECISION NOT NULL,
    "valorHora" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EmployeeWeeklyMeta_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "EmployeeWeeklyMeta_employeeId_year_month_idx" ON "EmployeeWeeklyMeta"("employeeId", "year", "month");

-- CreateIndex
CREATE UNIQUE INDEX "EmployeeWeeklyMeta_employeeId_weekStart_key" ON "EmployeeWeeklyMeta"("employeeId", "weekStart");

-- AddForeignKey
ALTER TABLE "EmployeeWeeklyMeta" ADD CONSTRAINT "EmployeeWeeklyMeta_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;
