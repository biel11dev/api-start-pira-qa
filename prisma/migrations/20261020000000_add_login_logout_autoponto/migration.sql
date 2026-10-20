-- AlterTable
ALTER TABLE "User" ADD COLUMN     "loginAt" TIMESTAMP(3),
ADD COLUMN     "logoutAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "Employee" ADD COLUMN     "autoPonto" BOOLEAN NOT NULL DEFAULT false;
