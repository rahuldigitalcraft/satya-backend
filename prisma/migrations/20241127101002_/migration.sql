/*
  Warnings:

  - You are about to drop the column `created_at` on the `block` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `block` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `school` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `school` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[user_name]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[unique_code]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Made the column `password` on table `user` required. This step will fail if there are existing NULL values in that column.
  - Made the column `fullName` on table `user` required. This step will fail if there are existing NULL values in that column.
  - Made the column `fatherName` on table `user` required. This step will fail if there are existing NULL values in that column.

*/
-- DropIndex
DROP INDEX `Blog_authorId_fkey` ON `blog`;

-- DropIndex
DROP INDEX `Blog_blogCategoryId_fkey` ON `blog`;

-- DropIndex
DROP INDEX `BlogComment_blog_id_fkey` ON `blogcomment`;

-- DropIndex
DROP INDEX `BlogComment_userId_fkey` ON `blogcomment`;

-- DropIndex
DROP INDEX `CartEnrollment_user_id_fkey` ON `cartenrollment`;

-- DropIndex
DROP INDEX `Course_category_id_fkey` ON `course`;

-- DropIndex
DROP INDEX `Course_instructorId_fkey` ON `course`;

-- DropIndex
DROP INDEX `Course_sub_category_id_fkey` ON `course`;

-- DropIndex
DROP INDEX `CourseEnrollment_cartEnrollmentId_fkey` ON `courseenrollment`;

-- DropIndex
DROP INDEX `CourseEnrollment_course_id_fkey` ON `courseenrollment`;

-- DropIndex
DROP INDEX `CourseEnrollment_user_id_fkey` ON `courseenrollment`;

-- DropIndex
DROP INDEX `InstructorFollower_instructorId_fkey` ON `instructorfollower`;

-- DropIndex
DROP INDEX `InstructorFollower_userId_fkey` ON `instructorfollower`;

-- DropIndex
DROP INDEX `InstructorSettings_userId_fkey` ON `instructorsettings`;

-- DropIndex
DROP INDEX `Lesson_course_id_fkey` ON `lesson`;

-- DropIndex
DROP INDEX `Lesson_section_id_fkey` ON `lesson`;

-- DropIndex
DROP INDEX `LiveClass_courseId_fkey` ON `liveclass`;

-- DropIndex
DROP INDEX `LiveClass_instructor_id_fkey` ON `liveclass`;

-- DropIndex
DROP INDEX `MyImages_user_id_fkey` ON `myimages`;

-- DropIndex
DROP INDEX `MyUploads_user_id_fkey` ON `myuploads`;

-- DropIndex
DROP INDEX `Notification_userId_fkey` ON `notification`;

-- DropIndex
DROP INDEX `Quiz_courseId_fkey` ON `quiz`;

-- DropIndex
DROP INDEX `Quiz_sectionId_fkey` ON `quiz`;

-- DropIndex
DROP INDEX `Quiz_userId_fkey` ON `quiz`;

-- DropIndex
DROP INDEX `QuizQuestion_courseId_fkey` ON `quizquestion`;

-- DropIndex
DROP INDEX `QuizQuestion_quizId_fkey` ON `quizquestion`;

-- DropIndex
DROP INDEX `QuizQuestion_userId_fkey` ON `quizquestion`;

-- DropIndex
DROP INDEX `QuizQuestionAnswer_quizId_fkey` ON `quizquestionanswer`;

-- DropIndex
DROP INDEX `QuizQuestionAnswer_quizQuestionId_fkey` ON `quizquestionanswer`;

-- DropIndex
DROP INDEX `QuizQuestionAnswer_userId_fkey` ON `quizquestionanswer`;

-- DropIndex
DROP INDEX `Review_course_id_fkey` ON `review`;

-- DropIndex
DROP INDEX `Review_userId_fkey` ON `review`;

-- DropIndex
DROP INDEX `Section_course_id_fkey` ON `section`;

-- DropIndex
DROP INDEX `SubCategory_category_id_fkey` ON `subcategory`;

-- DropIndex
DROP INDEX `UserKycVerificationList_kycVerificationListId_fkey` ON `userkycverificationlist`;

-- DropIndex
DROP INDEX `UserKycVerificationList_userId_fkey` ON `userkycverificationlist`;

-- DropIndex
DROP INDEX `UserLession_courseEnrollmentId_fkey` ON `userlession`;

-- DropIndex
DROP INDEX `UserLession_courseId_fkey` ON `userlession`;

-- DropIndex
DROP INDEX `UserLession_lessonId_fkey` ON `userlession`;

-- DropIndex
DROP INDEX `UserLession_sectionId_fkey` ON `userlession`;

-- DropIndex
DROP INDEX `UserLession_userId_fkey` ON `userlession`;

-- DropIndex
DROP INDEX `UserQuiz_courseId_fkey` ON `userquiz`;

-- DropIndex
DROP INDEX `UserQuiz_instructorId_fkey` ON `userquiz`;

-- DropIndex
DROP INDEX `UserQuiz_quizId_fkey` ON `userquiz`;

-- DropIndex
DROP INDEX `UserQuiz_studentId_fkey` ON `userquiz`;

-- DropIndex
DROP INDEX `UserQuizAnswer_quizId_fkey` ON `userquizanswer`;

-- DropIndex
DROP INDEX `UserQuizAnswer_quizQuestionId_fkey` ON `userquizanswer`;

-- DropIndex
DROP INDEX `UserQuizAnswer_studentId_fkey` ON `userquizanswer`;

-- DropIndex
DROP INDEX `UserQuizAnswer_userQuizId_fkey` ON `userquizanswer`;

-- DropIndex
DROP INDEX `UserTokens_userId_fkey` ON `usertokens`;

-- DropIndex
DROP INDEX `UserVerificationCodes_user_id_fkey` ON `userverificationcodes`;

-- DropIndex
DROP INDEX `Wallet_userId_fkey` ON `wallet`;

-- DropIndex
DROP INDEX `WishList_courseId_fkey` ON `wishlist`;

-- DropIndex
DROP INDEX `WishList_studentId_fkey` ON `wishlist`;

-- DropIndex
DROP INDEX `WithdrawTransaction_userId_fkey` ON `withdrawtransaction`;

-- DropIndex
DROP INDEX `WithdrawTransaction_walletId_fkey` ON `withdrawtransaction`;

-- AlterTable
ALTER TABLE `block` DROP COLUMN `created_at`,
    DROP COLUMN `updated_at`;

-- AlterTable
ALTER TABLE `school` DROP COLUMN `created_at`,
    DROP COLUMN `updated_at`;

-- AlterTable
ALTER TABLE `user` MODIFY `password` VARCHAR(255) NOT NULL,
    MODIFY `fullName` VARCHAR(255) NOT NULL,
    MODIFY `fatherName` VARCHAR(255) NOT NULL,
    MODIFY `otp` VARCHAR(191) NULL;

-- CreateIndex
CREATE UNIQUE INDEX `User_user_name_key` ON `User`(`user_name`);

-- CreateIndex
CREATE UNIQUE INDEX `User_unique_code_key` ON `User`(`unique_code`);

-- AddForeignKey
ALTER TABLE `InstructorApplication` ADD CONSTRAINT `InstructorApplication_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MyImages` ADD CONSTRAINT `MyImages_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MyUploads` ADD CONSTRAINT `MyUploads_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SubCategory` ADD CONSTRAINT `SubCategory_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `Category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Course` ADD CONSTRAINT `Course_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `Category`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Course` ADD CONSTRAINT `Course_sub_category_id_fkey` FOREIGN KEY (`sub_category_id`) REFERENCES `SubCategory`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Course` ADD CONSTRAINT `Course_instructorId_fkey` FOREIGN KEY (`instructorId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CourseEnrollment` ADD CONSTRAINT `CourseEnrollment_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CourseEnrollment` ADD CONSTRAINT `CourseEnrollment_course_id_fkey` FOREIGN KEY (`course_id`) REFERENCES `Course`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CourseEnrollment` ADD CONSTRAINT `CourseEnrollment_cartEnrollmentId_fkey` FOREIGN KEY (`cartEnrollmentId`) REFERENCES `CartEnrollment`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CartItem` ADD CONSTRAINT `CartItem_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CartItem` ADD CONSTRAINT `CartItem_courseId_fkey` FOREIGN KEY (`courseId`) REFERENCES `Course`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CartEnrollment` ADD CONSTRAINT `CartEnrollment_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Lesson` ADD CONSTRAINT `Lesson_course_id_fkey` FOREIGN KEY (`course_id`) REFERENCES `Course`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Lesson` ADD CONSTRAINT `Lesson_section_id_fkey` FOREIGN KEY (`section_id`) REFERENCES `Section`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Section` ADD CONSTRAINT `Section_course_id_fkey` FOREIGN KEY (`course_id`) REFERENCES `Course`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Review` ADD CONSTRAINT `Review_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Review` ADD CONSTRAINT `Review_course_id_fkey` FOREIGN KEY (`course_id`) REFERENCES `Course`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserTokens` ADD CONSTRAINT `UserTokens_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserVerificationCodes` ADD CONSTRAINT `UserVerificationCodes_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserKycVerificationList` ADD CONSTRAINT `UserKycVerificationList_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserKycVerificationList` ADD CONSTRAINT `UserKycVerificationList_kycVerificationListId_fkey` FOREIGN KEY (`kycVerificationListId`) REFERENCES `KycVerificationList`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InstructorFollower` ADD CONSTRAINT `InstructorFollower_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InstructorFollower` ADD CONSTRAINT `InstructorFollower_instructorId_fkey` FOREIGN KEY (`instructorId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Notification` ADD CONSTRAINT `Notification_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Quiz` ADD CONSTRAINT `Quiz_courseId_fkey` FOREIGN KEY (`courseId`) REFERENCES `Course`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Quiz` ADD CONSTRAINT `Quiz_sectionId_fkey` FOREIGN KEY (`sectionId`) REFERENCES `Section`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Quiz` ADD CONSTRAINT `Quiz_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QuizQuestion` ADD CONSTRAINT `QuizQuestion_courseId_fkey` FOREIGN KEY (`courseId`) REFERENCES `Course`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QuizQuestion` ADD CONSTRAINT `QuizQuestion_quizId_fkey` FOREIGN KEY (`quizId`) REFERENCES `Quiz`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QuizQuestion` ADD CONSTRAINT `QuizQuestion_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QuizQuestionAnswer` ADD CONSTRAINT `QuizQuestionAnswer_quizId_fkey` FOREIGN KEY (`quizId`) REFERENCES `Quiz`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QuizQuestionAnswer` ADD CONSTRAINT `QuizQuestionAnswer_quizQuestionId_fkey` FOREIGN KEY (`quizQuestionId`) REFERENCES `QuizQuestion`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QuizQuestionAnswer` ADD CONSTRAINT `QuizQuestionAnswer_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserQuiz` ADD CONSTRAINT `UserQuiz_studentId_fkey` FOREIGN KEY (`studentId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserQuiz` ADD CONSTRAINT `UserQuiz_instructorId_fkey` FOREIGN KEY (`instructorId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserQuiz` ADD CONSTRAINT `UserQuiz_quizId_fkey` FOREIGN KEY (`quizId`) REFERENCES `Quiz`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserQuiz` ADD CONSTRAINT `UserQuiz_courseId_fkey` FOREIGN KEY (`courseId`) REFERENCES `Course`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserQuizAnswer` ADD CONSTRAINT `UserQuizAnswer_studentId_fkey` FOREIGN KEY (`studentId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserQuizAnswer` ADD CONSTRAINT `UserQuizAnswer_quizId_fkey` FOREIGN KEY (`quizId`) REFERENCES `Quiz`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserQuizAnswer` ADD CONSTRAINT `UserQuizAnswer_quizQuestionId_fkey` FOREIGN KEY (`quizQuestionId`) REFERENCES `QuizQuestion`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserQuizAnswer` ADD CONSTRAINT `UserQuizAnswer_userQuizId_fkey` FOREIGN KEY (`userQuizId`) REFERENCES `UserQuiz`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InstructorSettings` ADD CONSTRAINT `InstructorSettings_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserLession` ADD CONSTRAINT `UserLession_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserLession` ADD CONSTRAINT `UserLession_courseId_fkey` FOREIGN KEY (`courseId`) REFERENCES `Course`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserLession` ADD CONSTRAINT `UserLession_courseEnrollmentId_fkey` FOREIGN KEY (`courseEnrollmentId`) REFERENCES `CourseEnrollment`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserLession` ADD CONSTRAINT `UserLession_lessonId_fkey` FOREIGN KEY (`lessonId`) REFERENCES `Lesson`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserLession` ADD CONSTRAINT `UserLession_sectionId_fkey` FOREIGN KEY (`sectionId`) REFERENCES `Section`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Wallet` ADD CONSTRAINT `Wallet_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `WithdrawTransaction` ADD CONSTRAINT `WithdrawTransaction_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `WithdrawTransaction` ADD CONSTRAINT `WithdrawTransaction_walletId_fkey` FOREIGN KEY (`walletId`) REFERENCES `Wallet`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Blog` ADD CONSTRAINT `Blog_blogCategoryId_fkey` FOREIGN KEY (`blogCategoryId`) REFERENCES `BlogCategory`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Blog` ADD CONSTRAINT `Blog_authorId_fkey` FOREIGN KEY (`authorId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BlogComment` ADD CONSTRAINT `BlogComment_blog_id_fkey` FOREIGN KEY (`blog_id`) REFERENCES `Blog`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BlogComment` ADD CONSTRAINT `BlogComment_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `LiveClass` ADD CONSTRAINT `LiveClass_instructor_id_fkey` FOREIGN KEY (`instructor_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `LiveClass` ADD CONSTRAINT `LiveClass_courseId_fkey` FOREIGN KEY (`courseId`) REFERENCES `Course`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `WishList` ADD CONSTRAINT `WishList_studentId_fkey` FOREIGN KEY (`studentId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `WishList` ADD CONSTRAINT `WishList_courseId_fkey` FOREIGN KEY (`courseId`) REFERENCES `Course`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
