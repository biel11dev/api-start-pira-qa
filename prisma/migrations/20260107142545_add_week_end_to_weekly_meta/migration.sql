/*
  Warnings:

  - Made the column `weekEnd` on table `EmployeeWeeklyMeta` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "EmployeeWeeklyMeta" ALTER COLUMN "weekEnd" SET NOT NULL;
