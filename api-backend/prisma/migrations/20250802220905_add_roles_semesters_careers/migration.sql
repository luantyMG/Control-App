-- AlterTable
ALTER TABLE "public"."User" ADD COLUMN     "roleId" INTEGER;

-- CreateTable
CREATE TABLE "public"."Role" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Semester" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Semester_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Career" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "Career_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Student" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "semesterId" INTEGER NOT NULL,
    "careerId" INTEGER NOT NULL,

    CONSTRAINT "Student_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Role_name_key" ON "public"."Role"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Semester_name_key" ON "public"."Semester"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Career_name_key" ON "public"."Career"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Student_userId_key" ON "public"."Student"("userId");

-- AddForeignKey
ALTER TABLE "public"."User" ADD CONSTRAINT "User_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "public"."Role"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Student" ADD CONSTRAINT "Student_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Student" ADD CONSTRAINT "Student_semesterId_fkey" FOREIGN KEY ("semesterId") REFERENCES "public"."Semester"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Student" ADD CONSTRAINT "Student_careerId_fkey" FOREIGN KEY ("careerId") REFERENCES "public"."Career"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
