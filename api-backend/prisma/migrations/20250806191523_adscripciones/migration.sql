/*
  Warnings:

  - Added the required column `campusId` to the `Group` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "public"."Group" ADD COLUMN     "campusId" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "public"."Campus" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "estado" TEXT,
    "municipio" TEXT,
    "calle" TEXT,
    "numero" TEXT,
    "codigoPostal" TEXT,
    "telefono" TEXT,

    CONSTRAINT "Campus_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Campus_name_key" ON "public"."Campus"("name");

-- AddForeignKey
ALTER TABLE "public"."Group" ADD CONSTRAINT "Group_campusId_fkey" FOREIGN KEY ("campusId") REFERENCES "public"."Campus"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
