/*
  Warnings:

  - Added the required column `campusId` to the `Staff` table without a default value. This is not possible if the table is not empty.
  - Added the required column `campusId` to the `Student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `semesterId` to the `Subject` table without a default value. This is not possible if the table is not empty.
  - Added the required column `campusId` to the `Teacher` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "public"."Staff" ADD COLUMN     "campusId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "public"."Student" ADD COLUMN     "campusId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "public"."Subject" ADD COLUMN     "semesterId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "public"."Teacher" ADD COLUMN     "campusId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "public"."Student" ADD CONSTRAINT "Student_campusId_fkey" FOREIGN KEY ("campusId") REFERENCES "public"."Campus"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Teacher" ADD CONSTRAINT "Teacher_campusId_fkey" FOREIGN KEY ("campusId") REFERENCES "public"."Campus"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Staff" ADD CONSTRAINT "Staff_campusId_fkey" FOREIGN KEY ("campusId") REFERENCES "public"."Campus"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Subject" ADD CONSTRAINT "Subject_semesterId_fkey" FOREIGN KEY ("semesterId") REFERENCES "public"."Semester"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
