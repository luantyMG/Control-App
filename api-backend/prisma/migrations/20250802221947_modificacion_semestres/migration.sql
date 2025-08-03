/*
  Warnings:

  - You are about to drop the column `endDate` on the `Semester` table. All the data in the column will be lost.
  - You are about to drop the column `startDate` on the `Semester` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "public"."Semester" DROP COLUMN "endDate",
DROP COLUMN "startDate";
