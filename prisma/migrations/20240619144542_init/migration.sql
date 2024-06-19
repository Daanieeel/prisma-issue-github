-- CreateEnum
CREATE TYPE "Day" AS ENUM ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

-- CreateEnum
CREATE TYPE "GradeLevel" AS ENUM ('G5', 'G6', 'G7', 'G8', 'G9', 'G10', 'G11', 'G12');

-- CreateEnum
CREATE TYPE "SubjectType" AS ENUM ('ART', 'BIOLOGY', 'CHEMISTRY', 'COMPUTER_SCIENCE', 'ECONOMICS', 'ENGLISH', 'ETHICS', 'FRENCH', 'GEOGRAPHY', 'GERMAN', 'HISTORY', 'IMP', 'ITALIAN', 'LATIN', 'MATHS', 'MUSIC', 'NWT', 'PHYSICS', 'POLITICS', 'RELIGION', 'SPANISH', 'SPORT');

-- CreateEnum
CREATE TYPE "UserType" AS ENUM ('ADMIN', 'TEACHER', 'STUDENT');

-- CreateEnum
CREATE TYPE "ChatActivityType" AS ENUM ('MESSAGE_SEND', 'MESSAGE_EDIT', 'MESSAGE_DELETE', 'MESSAGE_ANSWER', 'ACTIVITY_STAR', 'ACTIVITY_UNSTAR', 'POLL_SEND', 'POLL_EDIT', 'POLL_DELETE', 'POLL_VOTE', 'POLL_UNVOTE', 'POLL_CLOSE', 'POLL_REOPEN', 'POLL_RESULT', 'CHAT_TARGET_ADD', 'CHAT_TARGET_REMOVE', 'CHAT_COURSE_ADD', 'CHAT_COURSE_REMOVE', 'CHAT_CLUB_ADD', 'CHAT_CLUB_REMOVE', 'CHAT_NAME_CHANGE', 'CHAT_AVATAR_CHANGE');

-- CreateEnum
CREATE TYPE "ChatType" AS ENUM ('GROUP', 'PRIVATE', 'COURSE');

-- CreateTable
CREATE TABLE "badges" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "description" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "badges_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "blackboards" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "coverImage" TEXT,
    "schoolId" UUID NOT NULL,
    "text" TEXT,
    "title" TEXT NOT NULL,

    CONSTRAINT "blackboards_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "blackboard_tags" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "blackboard_tags_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "chats" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "avatar" TEXT,
    "name" TEXT NOT NULL,
    "type" "ChatType" NOT NULL,

    CONSTRAINT "chats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "activities" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "chatId" UUID NOT NULL,
    "executorId" UUID NOT NULL,
    "answerToId" UUID,
    "type" "ChatActivityType" NOT NULL,
    "activityContent" JSONB NOT NULL,
    "starred" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "activities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "classes" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "gradeId" UUID NOT NULL,
    "schoolId" UUID NOT NULL,
    "specifiedGrade" TEXT,

    CONSTRAINT "classes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "clubs" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "avatar" TEXT,
    "chatId" UUID,
    "coverImage" TEXT,
    "description" TEXT,
    "location" TEXT,
    "meetingDay" "Day",
    "meetingTime" TEXT,
    "name" TEXT NOT NULL,
    "requirements" JSONB[],
    "schoolId" UUID NOT NULL,

    CONSTRAINT "clubs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "club_tags" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "club_tags_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "courses" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "chatId" UUID,
    "name" TEXT NOT NULL,
    "subjectId" UUID NOT NULL,
    "teacherId" UUID NOT NULL,

    CONSTRAINT "courses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "events" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "description" TEXT,
    "endDate" TIMESTAMP(3) NOT NULL,
    "host" TEXT NOT NULL,
    "information" JSONB[],
    "location" TEXT,
    "schoolId" UUID NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "title" TEXT NOT NULL,

    CONSTRAINT "events_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "event_tickets" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "buyerId" UUID NOT NULL,
    "eventId" UUID NOT NULL,
    "price" INTEGER NOT NULL,
    "saleDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "event_tickets_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "grades" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "level" "GradeLevel" NOT NULL,
    "schoolId" UUID NOT NULL,

    CONSTRAINT "grades_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "schools" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "setupAccountId" UUID NOT NULL,

    CONSTRAINT "schools_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "setup_accounts" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "schoolId" UUID,
    "schoolName" TEXT NOT NULL,

    CONSTRAINT "setup_accounts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "subjects" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "schoolId" UUID NOT NULL,
    "shortName" TEXT NOT NULL,
    "type" "SubjectType" NOT NULL,

    CONSTRAINT "subjects_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "avatar" TEXT,
    "birthday" TEXT,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "type" "UserType" NOT NULL,
    "userAccountId" UUID NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "refresh_tokens" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "token" TEXT NOT NULL,
    "userAccountId" UUID NOT NULL,

    CONSTRAINT "refresh_tokens_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_accounts" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "email" TEXT,
    "password" TEXT NOT NULL,
    "userId" UUID,
    "username" TEXT NOT NULL,

    CONSTRAINT "user_accounts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_chats" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "chatId" UUID NOT NULL,
    "hidden" BOOLEAN NOT NULL DEFAULT false,
    "pinned" BOOLEAN NOT NULL DEFAULT false,
    "read" BOOLEAN NOT NULL DEFAULT true,
    "userId" UUID NOT NULL,

    CONSTRAINT "user_chats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_UserBadge" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateTable
CREATE TABLE "_BlackboardAuthor" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateTable
CREATE TABLE "_BlackboardBlackboardTag" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateTable
CREATE TABLE "_BlackboardTarget" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateTable
CREATE TABLE "_ReadChatActivity" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateTable
CREATE TABLE "_ClassCourse" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateTable
CREATE TABLE "_ClassMember" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateTable
CREATE TABLE "_ClubEvent" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateTable
CREATE TABLE "_ClubLeader" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateTable
CREATE TABLE "_ClubMember" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateTable
CREATE TABLE "_ClubClubTag" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateTable
CREATE TABLE "_CourseMember" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateTable
CREATE TABLE "_EventSubscriber" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateTable
CREATE TABLE "_SchoolMember" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "blackboard_tags_name_key" ON "blackboard_tags"("name");

-- CreateIndex
CREATE UNIQUE INDEX "schools_name_key" ON "schools"("name");

-- CreateIndex
CREATE UNIQUE INDEX "schools_setupAccountId_key" ON "schools"("setupAccountId");

-- CreateIndex
CREATE UNIQUE INDEX "setup_accounts_schoolName_key" ON "setup_accounts"("schoolName");

-- CreateIndex
CREATE UNIQUE INDEX "subjects_type_key" ON "subjects"("type");

-- CreateIndex
CREATE UNIQUE INDEX "users_userAccountId_key" ON "users"("userAccountId");

-- CreateIndex
CREATE UNIQUE INDEX "refresh_tokens_token_key" ON "refresh_tokens"("token");

-- CreateIndex
CREATE UNIQUE INDEX "user_accounts_email_key" ON "user_accounts"("email");

-- CreateIndex
CREATE UNIQUE INDEX "user_accounts_username_key" ON "user_accounts"("username");

-- CreateIndex
CREATE UNIQUE INDEX "_UserBadge_AB_unique" ON "_UserBadge"("A", "B");

-- CreateIndex
CREATE INDEX "_UserBadge_B_index" ON "_UserBadge"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_BlackboardAuthor_AB_unique" ON "_BlackboardAuthor"("A", "B");

-- CreateIndex
CREATE INDEX "_BlackboardAuthor_B_index" ON "_BlackboardAuthor"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_BlackboardBlackboardTag_AB_unique" ON "_BlackboardBlackboardTag"("A", "B");

-- CreateIndex
CREATE INDEX "_BlackboardBlackboardTag_B_index" ON "_BlackboardBlackboardTag"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_BlackboardTarget_AB_unique" ON "_BlackboardTarget"("A", "B");

-- CreateIndex
CREATE INDEX "_BlackboardTarget_B_index" ON "_BlackboardTarget"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ReadChatActivity_AB_unique" ON "_ReadChatActivity"("A", "B");

-- CreateIndex
CREATE INDEX "_ReadChatActivity_B_index" ON "_ReadChatActivity"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ClassCourse_AB_unique" ON "_ClassCourse"("A", "B");

-- CreateIndex
CREATE INDEX "_ClassCourse_B_index" ON "_ClassCourse"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ClassMember_AB_unique" ON "_ClassMember"("A", "B");

-- CreateIndex
CREATE INDEX "_ClassMember_B_index" ON "_ClassMember"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ClubEvent_AB_unique" ON "_ClubEvent"("A", "B");

-- CreateIndex
CREATE INDEX "_ClubEvent_B_index" ON "_ClubEvent"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ClubLeader_AB_unique" ON "_ClubLeader"("A", "B");

-- CreateIndex
CREATE INDEX "_ClubLeader_B_index" ON "_ClubLeader"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ClubMember_AB_unique" ON "_ClubMember"("A", "B");

-- CreateIndex
CREATE INDEX "_ClubMember_B_index" ON "_ClubMember"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ClubClubTag_AB_unique" ON "_ClubClubTag"("A", "B");

-- CreateIndex
CREATE INDEX "_ClubClubTag_B_index" ON "_ClubClubTag"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CourseMember_AB_unique" ON "_CourseMember"("A", "B");

-- CreateIndex
CREATE INDEX "_CourseMember_B_index" ON "_CourseMember"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EventSubscriber_AB_unique" ON "_EventSubscriber"("A", "B");

-- CreateIndex
CREATE INDEX "_EventSubscriber_B_index" ON "_EventSubscriber"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_SchoolMember_AB_unique" ON "_SchoolMember"("A", "B");

-- CreateIndex
CREATE INDEX "_SchoolMember_B_index" ON "_SchoolMember"("B");

-- AddForeignKey
ALTER TABLE "blackboards" ADD CONSTRAINT "blackboards_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "schools"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "activities" ADD CONSTRAINT "activities_chatId_fkey" FOREIGN KEY ("chatId") REFERENCES "chats"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "activities" ADD CONSTRAINT "activities_executorId_fkey" FOREIGN KEY ("executorId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "activities" ADD CONSTRAINT "activities_answerToId_fkey" FOREIGN KEY ("answerToId") REFERENCES "activities"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classes" ADD CONSTRAINT "classes_gradeId_fkey" FOREIGN KEY ("gradeId") REFERENCES "grades"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classes" ADD CONSTRAINT "classes_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "schools"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "clubs" ADD CONSTRAINT "clubs_chatId_fkey" FOREIGN KEY ("chatId") REFERENCES "chats"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "clubs" ADD CONSTRAINT "clubs_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "schools"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "courses" ADD CONSTRAINT "courses_chatId_fkey" FOREIGN KEY ("chatId") REFERENCES "chats"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "courses" ADD CONSTRAINT "courses_subjectId_fkey" FOREIGN KEY ("subjectId") REFERENCES "subjects"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "courses" ADD CONSTRAINT "courses_teacherId_fkey" FOREIGN KEY ("teacherId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "events" ADD CONSTRAINT "events_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "schools"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "event_tickets" ADD CONSTRAINT "event_tickets_buyerId_fkey" FOREIGN KEY ("buyerId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "event_tickets" ADD CONSTRAINT "event_tickets_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "events"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "grades" ADD CONSTRAINT "grades_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "schools"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "schools" ADD CONSTRAINT "schools_setupAccountId_fkey" FOREIGN KEY ("setupAccountId") REFERENCES "setup_accounts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "subjects" ADD CONSTRAINT "subjects_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "schools"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_userAccountId_fkey" FOREIGN KEY ("userAccountId") REFERENCES "user_accounts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "refresh_tokens" ADD CONSTRAINT "refresh_tokens_userAccountId_fkey" FOREIGN KEY ("userAccountId") REFERENCES "user_accounts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_chats" ADD CONSTRAINT "user_chats_chatId_fkey" FOREIGN KEY ("chatId") REFERENCES "chats"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_chats" ADD CONSTRAINT "user_chats_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UserBadge" ADD CONSTRAINT "_UserBadge_A_fkey" FOREIGN KEY ("A") REFERENCES "badges"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UserBadge" ADD CONSTRAINT "_UserBadge_B_fkey" FOREIGN KEY ("B") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BlackboardAuthor" ADD CONSTRAINT "_BlackboardAuthor_A_fkey" FOREIGN KEY ("A") REFERENCES "blackboards"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BlackboardAuthor" ADD CONSTRAINT "_BlackboardAuthor_B_fkey" FOREIGN KEY ("B") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BlackboardBlackboardTag" ADD CONSTRAINT "_BlackboardBlackboardTag_A_fkey" FOREIGN KEY ("A") REFERENCES "blackboards"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BlackboardBlackboardTag" ADD CONSTRAINT "_BlackboardBlackboardTag_B_fkey" FOREIGN KEY ("B") REFERENCES "blackboard_tags"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BlackboardTarget" ADD CONSTRAINT "_BlackboardTarget_A_fkey" FOREIGN KEY ("A") REFERENCES "blackboards"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BlackboardTarget" ADD CONSTRAINT "_BlackboardTarget_B_fkey" FOREIGN KEY ("B") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ReadChatActivity" ADD CONSTRAINT "_ReadChatActivity_A_fkey" FOREIGN KEY ("A") REFERENCES "activities"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ReadChatActivity" ADD CONSTRAINT "_ReadChatActivity_B_fkey" FOREIGN KEY ("B") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClassCourse" ADD CONSTRAINT "_ClassCourse_A_fkey" FOREIGN KEY ("A") REFERENCES "classes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClassCourse" ADD CONSTRAINT "_ClassCourse_B_fkey" FOREIGN KEY ("B") REFERENCES "courses"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClassMember" ADD CONSTRAINT "_ClassMember_A_fkey" FOREIGN KEY ("A") REFERENCES "classes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClassMember" ADD CONSTRAINT "_ClassMember_B_fkey" FOREIGN KEY ("B") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClubEvent" ADD CONSTRAINT "_ClubEvent_A_fkey" FOREIGN KEY ("A") REFERENCES "clubs"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClubEvent" ADD CONSTRAINT "_ClubEvent_B_fkey" FOREIGN KEY ("B") REFERENCES "events"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClubLeader" ADD CONSTRAINT "_ClubLeader_A_fkey" FOREIGN KEY ("A") REFERENCES "clubs"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClubLeader" ADD CONSTRAINT "_ClubLeader_B_fkey" FOREIGN KEY ("B") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClubMember" ADD CONSTRAINT "_ClubMember_A_fkey" FOREIGN KEY ("A") REFERENCES "clubs"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClubMember" ADD CONSTRAINT "_ClubMember_B_fkey" FOREIGN KEY ("B") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClubClubTag" ADD CONSTRAINT "_ClubClubTag_A_fkey" FOREIGN KEY ("A") REFERENCES "clubs"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClubClubTag" ADD CONSTRAINT "_ClubClubTag_B_fkey" FOREIGN KEY ("B") REFERENCES "club_tags"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CourseMember" ADD CONSTRAINT "_CourseMember_A_fkey" FOREIGN KEY ("A") REFERENCES "courses"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CourseMember" ADD CONSTRAINT "_CourseMember_B_fkey" FOREIGN KEY ("B") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EventSubscriber" ADD CONSTRAINT "_EventSubscriber_A_fkey" FOREIGN KEY ("A") REFERENCES "events"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EventSubscriber" ADD CONSTRAINT "_EventSubscriber_B_fkey" FOREIGN KEY ("B") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SchoolMember" ADD CONSTRAINT "_SchoolMember_A_fkey" FOREIGN KEY ("A") REFERENCES "schools"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SchoolMember" ADD CONSTRAINT "_SchoolMember_B_fkey" FOREIGN KEY ("B") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
