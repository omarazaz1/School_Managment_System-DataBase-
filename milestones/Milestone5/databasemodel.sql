-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SchoolDB
-- -----------------------------------------------------
DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE IF NOT EXISTS SchoolDB;
USE SchoolDB;

-- -----------------------------------------------------
-- Table `school`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `school`;

CREATE TABLE IF NOT EXISTS `school` (
  `school_id` INT NOT NULL,
  `school_name` VARCHAR(255) NULL,
  PRIMARY KEY (`school_id`)
);

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user`;

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `school_school_id` INT NOT NULL,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  PRIMARY KEY (`user_id`),
  INDEX `fk_user_school1_idx` (`school_school_id` ASC),
  CONSTRAINT `fk_user_school1`
    FOREIGN KEY (`school_school_id`)
    REFERENCES `school` (`school_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `account`;

CREATE TABLE IF NOT EXISTS `account` (
  `username` VARCHAR(16) NOT NULL,
  `account_id` INT NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `last_login` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`account_id`),
  INDEX `fk_account_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_account_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `role`;

CREATE TABLE IF NOT EXISTS `role` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `name` VARCHAR(64) NULL,
  `parent_id` INT NULL,
  `user_user_id` INT NOT NULL,
  PRIMARY KEY (`role_id`),
  INDEX `fk_role_user1_idx` (`user_user_id` ASC),
  CONSTRAINT `fk_role_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `guardian`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `guardian`;

CREATE TABLE IF NOT EXISTS `guardian` (
  `guardian_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NULL,
  `first_name` VARCHAR(64) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`guardian_id`)
);

-- -----------------------------------------------------
-- Table `student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student`;

CREATE TABLE IF NOT EXISTS `student` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `department` VARCHAR(32) NOT NULL,
  `guardian_guardian_id` INT NOT NULL,
  `school_school_id` INT NOT NULL,
  PRIMARY KEY (`student_id`),
  INDEX `fk_student_guardian1_idx` (`guardian_guardian_id` ASC),
  INDEX `fk_student_school1_idx` (`school_school_id` ASC),
  CONSTRAINT `fk_student_guardian1`
    FOREIGN KEY (`guardian_guardian_id`)
    REFERENCES `guardian` (`guardian_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_school1`
    FOREIGN KEY (`school_school_id`)
    REFERENCES `school` (`school_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `teacher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teacher`;

CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `user_id` INT NOT NULL,
  `department` VARCHAR(64) NULL,
  PRIMARY KEY (`teacher_id`),
  INDEX `fk_teacher_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_teacher_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `course`;

CREATE TABLE IF NOT EXISTS `course` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `title` VARCHAR(32) NOT NULL,
  `max_capacity` INT NULL,
  PRIMARY KEY (`course_id`)
);

-- -----------------------------------------------------
-- Table `grade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grade`;

CREATE TABLE IF NOT EXISTS `grade` (
  `grade_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `student_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `mark` DECIMAL(5,2) NULL,
  PRIMARY KEY (`grade_id`),
  INDEX `fk_grade_student1_idx` (`student_id` ASC),
  CONSTRAINT `fk_grade_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `assignment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment`;

CREATE TABLE IF NOT EXISTS `assignment` (
  `assignment_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `course_id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `class_time` DATETIME NULL,
  `student_student_id` INT NOT NULL,
  PRIMARY KEY (`assignment_id`),
  INDEX `fk_assignment_student1_idx` (`student_student_id` ASC),
  CONSTRAINT `fk_assignment_student1`
    FOREIGN KEY (`student_student_id`)
    REFERENCES `student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `schedule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `schedule`;

CREATE TABLE IF NOT EXISTS `schedule` (
  `schedule_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `user_id` INT NOT NULL,
  `class_time` DATETIME NULL,
  `student_student_id` INT NOT NULL,
  PRIMARY KEY (`schedule_id`),
  INDEX `fk_schedule_student1_idx` (`student_student_id` ASC),
  CONSTRAINT `fk_schedule_student1`
    FOREIGN KEY (`student_student_id`)
    REFERENCES `student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `classroom`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `classroom`;

CREATE TABLE IF NOT EXISTS `classroom` (
  `classroom_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `capacity` INT NULL,
  `equipment` VARCHAR(45) NULL,
  `student_student_id` INT NOT NULL,
  `school_school_id` INT NOT NULL,
  PRIMARY KEY (`classroom_id`),
  INDEX `fk_classroom_student1_idx` (`student_student_id` ASC),
  INDEX `fk_classroom_school1_idx` (`school_school_id` ASC),
  CONSTRAINT `fk_classroom_student1`
    FOREIGN KEY (`student_student_id`)
    REFERENCES `student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_classroom_school1`
    FOREIGN KEY (`school_school_id`)
    REFERENCES `school` (`school_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `attendance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `attendance`;

CREATE TABLE IF NOT EXISTS `attendance` (
  `attendance_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `student_id` INT NOT NULL,
  `student_name` VARCHAR(32) NOT NULL,
  `date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`attendance_id`),
  INDEX `fk_attendance_student1_idx` (`student_id` ASC),
  CONSTRAINT `fk_attendance_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `exam`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exam`;

CREATE TABLE IF NOT EXISTS `exam` (
  `exam_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `course_id` INT NOT NULL,
  `date` DATE NULL,
  `student_student_id` INT NOT NULL,
  PRIMARY KEY (`exam_id`),
  INDEX `fk_exam_student1_idx` (`student_student_id` ASC),
  CONSTRAINT `fk_exam_student1`
    FOREIGN KEY (`student_student_id`)
    REFERENCES `student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `schoolEvent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `schoolEvent`;

CREATE TABLE IF NOT EXISTS `schoolEvent` (
  `event_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `name` VARCHAR(32) NOT NULL,
  `date` DATE NULL,
  `school_school_id` INT NOT NULL,
  PRIMARY KEY (`event_id`),
  INDEX `fk_schoolEvent_school1_idx` (`school_school_id` ASC),
  CONSTRAINT `fk_schoolEvent_school1`
    FOREIGN KEY (`school_school_id`)
    REFERENCES `school` (`school_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `libraryResource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `libraryResource`;

CREATE TABLE IF NOT EXISTS `libraryResource` (
  `resource_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `title` VARCHAR(32) NOT NULL,
  `date` DATE NULL,
  `school_school_id` INT NOT NULL,
  PRIMARY KEY (`resource_id`),
  INDEX `fk_libraryResource_school1_idx` (`school_school_id` ASC),
  CONSTRAINT `fk_libraryResource_school1`
    FOREIGN KEY (`school_school_id`)
    REFERENCES `school` (`school_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `textbook`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `textbook`;

CREATE TABLE IF NOT EXISTS `textbook` (
  `textbook_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `course_id` INT NOT NULL,
  `ISBN` INT NOT NULL,
  `student_student_id` INT NOT NULL,
  PRIMARY KEY (`textbook_id`),
  UNIQUE INDEX `ISBN_UNIQUE` (`ISBN` ASC),
  INDEX `fk_textbook_student1_idx` (`student_student_id` ASC),
  CONSTRAINT `fk_textbook_student1`
    FOREIGN KEY (`student_student_id`)
    REFERENCES `student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `teacher_has_course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teacher_has_course`;

CREATE TABLE IF NOT EXISTS `teacher_has_course` (
  `teacher_teacher_id` INT NOT NULL,
  `course_course_id` INT NOT NULL,
  PRIMARY KEY (`teacher_teacher_id`, `course_course_id`),
  INDEX `fk_teacher_has_course_course1_idx` (`course_course_id` ASC),
  INDEX `fk_teacher_has_course_teacher1_idx` (`teacher_teacher_id` ASC),
  CONSTRAINT `fk_teacher_has_course_teacher1`
    FOREIGN KEY (`teacher_teacher_id`)
    REFERENCES `teacher` (`teacher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teacher_has_course_course1`
    FOREIGN KEY (`course_course_id`)
    REFERENCES `course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `school_has_teacher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `school_has_teacher`;

CREATE TABLE IF NOT EXISTS `school_has_teacher` (
  `school_school_id` INT NOT NULL,
  `teacher_teacher_id` INT NOT NULL,
  PRIMARY KEY (`school_school_id`, `teacher_teacher_id`),
  INDEX `fk_school_has_teacher_teacher1_idx` (`teacher_teacher_id` ASC),
  INDEX `fk_school_has_teacher_school1_idx` (`school_school_id` ASC),
  CONSTRAINT `fk_school_has_teacher_school1`
    FOREIGN KEY (`school_school_id`)
    REFERENCES `school` (`school_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_school_has_teacher_teacher1`
    FOREIGN KEY (`teacher_teacher_id`)
    REFERENCES `teacher` (`teacher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
