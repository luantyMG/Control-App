/*
  Warnings:

  - You are about to drop the column `dayOfWeek` on the `ClassSchedule` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[cveempleado]` on the table `Staff` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[matricula]` on the table `Student` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[cveempleado]` on the table `Teacher` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `weekDayId` to the `ClassSchedule` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cveempleado` to the `Staff` table without a default value. This is not possible if the table is not empty.
  - Added the required column `puesto` to the `Staff` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cveempleado` to the `Teacher` table without a default value. This is not possible if the table is not empty.
  - Added the required column `puesto` to the `Teacher` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "public"."ClassSchedule" DROP COLUMN "dayOfWeek",
ADD COLUMN     "weekDayId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "public"."Staff" ADD COLUMN     "calle" TEXT,
ADD COLUMN     "codigopostal" TEXT,
ADD COLUMN     "colonia" TEXT,
ADD COLUMN     "cveempleado" TEXT NOT NULL,
ADD COLUMN     "departamentoId" INTEGER,
ADD COLUMN     "email" TEXT,
ADD COLUMN     "estado" TEXT,
ADD COLUMN     "estatusId" INTEGER,
ADD COLUMN     "fechaNacimiento" TIMESTAMP(3),
ADD COLUMN     "generoId" INTEGER,
ADD COLUMN     "municipio" TEXT,
ADD COLUMN     "nivelAcademicoId" INTEGER,
ADD COLUMN     "noexterior" TEXT,
ADD COLUMN     "nointerior" TEXT,
ADD COLUMN     "puesto" TEXT NOT NULL,
ADD COLUMN     "telefono" TEXT;

-- AlterTable
ALTER TABLE "public"."Student" ADD COLUMN     "calle" TEXT,
ADD COLUMN     "codigopostal" TEXT,
ADD COLUMN     "colonia" TEXT,
ADD COLUMN     "email" TEXT,
ADD COLUMN     "estado" TEXT,
ADD COLUMN     "estatusId" INTEGER,
ADD COLUMN     "fechaNacimiento" TIMESTAMP(3),
ADD COLUMN     "generoId" INTEGER,
ADD COLUMN     "matricula" TEXT,
ADD COLUMN     "municipio" TEXT,
ADD COLUMN     "noexterior" TEXT,
ADD COLUMN     "nointerior" TEXT,
ADD COLUMN     "telefono" TEXT;

-- AlterTable
ALTER TABLE "public"."StudentTutor" ADD COLUMN     "calle" TEXT,
ADD COLUMN     "codigopostal" TEXT,
ADD COLUMN     "colonia" TEXT,
ADD COLUMN     "email" TEXT,
ADD COLUMN     "estado" TEXT,
ADD COLUMN     "estatusId" INTEGER,
ADD COLUMN     "fechaNacimiento" TIMESTAMP(3),
ADD COLUMN     "generoId" INTEGER,
ADD COLUMN     "municipio" TEXT,
ADD COLUMN     "noexterior" TEXT,
ADD COLUMN     "nointerior" TEXT,
ADD COLUMN     "parentescoId" INTEGER,
ADD COLUMN     "telefono" TEXT;

-- AlterTable
ALTER TABLE "public"."Teacher" ADD COLUMN     "calle" TEXT,
ADD COLUMN     "codigopostal" TEXT,
ADD COLUMN     "colonia" TEXT,
ADD COLUMN     "cveempleado" TEXT NOT NULL,
ADD COLUMN     "email" TEXT,
ADD COLUMN     "estado" TEXT,
ADD COLUMN     "estatusId" INTEGER,
ADD COLUMN     "fechaContratacion" TIMESTAMP(3),
ADD COLUMN     "fechaNacimiento" TIMESTAMP(3),
ADD COLUMN     "generoId" INTEGER,
ADD COLUMN     "municipio" TEXT,
ADD COLUMN     "nivelAcademicoId" INTEGER,
ADD COLUMN     "noexterior" TEXT,
ADD COLUMN     "nointerior" TEXT,
ADD COLUMN     "puesto" TEXT NOT NULL,
ADD COLUMN     "telefono" TEXT;

-- DropEnum
DROP TYPE "public"."WeekDay";

-- CreateTable
CREATE TABLE "public"."WeekDay" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "WeekDay_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Estatus" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "Estatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Genero" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "Genero_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."NivelAcademico" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "NivelAcademico_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Departamento" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "Departamento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Parentesco" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "Parentesco_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "WeekDay_name_key" ON "public"."WeekDay"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Estatus_name_key" ON "public"."Estatus"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Genero_name_key" ON "public"."Genero"("name");

-- CreateIndex
CREATE UNIQUE INDEX "NivelAcademico_name_key" ON "public"."NivelAcademico"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Departamento_name_key" ON "public"."Departamento"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Parentesco_name_key" ON "public"."Parentesco"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Staff_cveempleado_key" ON "public"."Staff"("cveempleado");

-- CreateIndex
CREATE UNIQUE INDEX "Student_matricula_key" ON "public"."Student"("matricula");

-- CreateIndex
CREATE UNIQUE INDEX "Teacher_cveempleado_key" ON "public"."Teacher"("cveempleado");

-- AddForeignKey
ALTER TABLE "public"."Student" ADD CONSTRAINT "Student_estatusId_fkey" FOREIGN KEY ("estatusId") REFERENCES "public"."Estatus"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Student" ADD CONSTRAINT "Student_generoId_fkey" FOREIGN KEY ("generoId") REFERENCES "public"."Genero"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."StudentTutor" ADD CONSTRAINT "StudentTutor_generoId_fkey" FOREIGN KEY ("generoId") REFERENCES "public"."Genero"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."StudentTutor" ADD CONSTRAINT "StudentTutor_estatusId_fkey" FOREIGN KEY ("estatusId") REFERENCES "public"."Estatus"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."StudentTutor" ADD CONSTRAINT "StudentTutor_parentescoId_fkey" FOREIGN KEY ("parentescoId") REFERENCES "public"."Parentesco"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Teacher" ADD CONSTRAINT "Teacher_estatusId_fkey" FOREIGN KEY ("estatusId") REFERENCES "public"."Estatus"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Teacher" ADD CONSTRAINT "Teacher_nivelAcademicoId_fkey" FOREIGN KEY ("nivelAcademicoId") REFERENCES "public"."NivelAcademico"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Teacher" ADD CONSTRAINT "Teacher_generoId_fkey" FOREIGN KEY ("generoId") REFERENCES "public"."Genero"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Staff" ADD CONSTRAINT "Staff_nivelAcademicoId_fkey" FOREIGN KEY ("nivelAcademicoId") REFERENCES "public"."NivelAcademico"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Staff" ADD CONSTRAINT "Staff_estatusId_fkey" FOREIGN KEY ("estatusId") REFERENCES "public"."Estatus"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Staff" ADD CONSTRAINT "Staff_generoId_fkey" FOREIGN KEY ("generoId") REFERENCES "public"."Genero"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Staff" ADD CONSTRAINT "Staff_departamentoId_fkey" FOREIGN KEY ("departamentoId") REFERENCES "public"."Departamento"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."ClassSchedule" ADD CONSTRAINT "ClassSchedule_weekDayId_fkey" FOREIGN KEY ("weekDayId") REFERENCES "public"."WeekDay"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
