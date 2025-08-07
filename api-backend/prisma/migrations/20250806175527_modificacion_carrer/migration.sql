/*
  Warnings:

  - A unique constraint covering the columns `[clave]` on the table `Career` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "public"."Career" ADD COLUMN     "clave" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "Career_clave_key" ON "public"."Career"("clave");
