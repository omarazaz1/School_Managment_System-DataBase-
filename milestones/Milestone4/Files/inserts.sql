-- ShoolBD System 
USE SchoolDB;

INSERT INTO school (school_id, school_name) VALUES 
('SC1' ,'MVLA'),
('SC2', 'SANC'),
 ('SC3', 'SACO');
 
-- inserting into user

INSERT INTO user (user_id, username, email, password, name, school_school_id) VALUES 
('USR1', 'mar1', 'mar1@mail.com', 'pass1', 'Omar', 'SC1'),
('USR2', 'mar2', 'mar2@mail.com','pass2', 'Azaz', 'SC1'),
('USR3', 'mar3', 'mar3@mail.com','pass3', 'Ali', 'SC1');


-- Inserting into guardian

INSERT INTO guardian (guardian_id, email, first_name, last_name) VALUES
('G1', 'A@mail.com', 'Azaz', 'cao'),
('G2', 'm@mail.com', 'Mike', 'osma'),
('G3', 'S@mail.com', 'Sam', 'Don');

--  inserting into student

INSERT INTO student (student_id, user_id, department, guardian_guardian_id, school_school_id) VALUES
('STU1', 'USR1',  'Science', 'G1', 'SC1'),
('STU2', 'USR2', 'Math', 'G2', 'SC1'),
('STU3', 'USR3', 'Arts', 'G3', 'SC1');
-- Inserting into teacher
INSERT INTO teacher (teacher_id, username, user_id, department, user_user_id) VALUES
('TEA1', 'jose', 'USR1', 'Science', 'USR1'),
('TEA2', 'omar', 'USR2', 'Math', 'USR2'),
('TEA3', 'danmar', 'USR3', 'Arts', 'USR3');

-- Inserting into course

INSERT INTO course (course_id, username, title, max_capacity) VALUES
('CR1', 'jose1', 'Biology', 30),
('CR2', 'asmar2', 'Fundamentals of Math', 205),
('CR3', 'dog33', 'Sudan History', 400);


-- Inserting into grade
INSERT INTO grade (grade_id, username, student_id, course_id, mark, student_student_id) VALUES
('GRD1', 'omar1', 1, 'CR1', 88, 'STU1'),
('GRD2', 'meron2', 2, 'CR2', 82.0, 'STU2'),
('GRD3', 'salim22', 3, 'CR3', 77.0, 'STU3');


-- Inserting assignment 

INSERT INTO assignment (assignment_id, username, email, course_id, title, class_time, student_student_id) VALUES
('AS1', 'mst', 'jade@mail.com', 'CR1', 'Linear Algebra', '2024-05-15 09:00:00', 'STU1'),
('AS2', 'cls', 'me@mail.com', 'CR2', 'Algebraic Expressions', '2024-05-16 10:00:00', 'STU2'),
('AS3', 'dsd', 'fort@mail.com', 'CR3', 'Kush kingdom', '2024-05-17 11:00:00', 'STU3');

-- Inserting into schedule
INSERT INTO schedule (schedule_id, username, email, user_id, class_time, student_student_id) VALUES
(1, 'sst', 'omar1@mail.com', 1, '2024-04-20 08:00:00', 'STU1'),
(2, 'ssd', 'omar2@mail.com', 2, '2024-04-21 08:30:00', 'STU2'),
(3, 'can', 'omar3@mail.com', 3, '2024-04-22 09:00:00', 'STU3');

-- Inserting into classroom
INSERT INTO classroom (classroom_id, username, email, capacity, equipment, student_student_id, school_school_id) VALUES
('CM1', 'mano', 'mano@mail.com', 30, 'Projector', 'STU1', 'SC1'),
('CM2', 'criss', 'hood@mail.com', 25, 'Boards', 'STU2', 'SC1'),
('CM3', 'sam', 'faro@mail.com', 40, 'Test Equipments', 'STU3', 'SC1');

-- Inserting into attendance
INSERT INTO attendance (attendance_id, username, student_id, student_name, date, student_student_id) VALUES
('ATT1', 'omar1', 'STU1', 'John', CURRENT_TIMESTAMP, 'STU1'),
('ATT2', 'omar2', 'STU2', 'Alice', CURRENT_TIMESTAMP, 'STU2'),
('ATT3', 'omar3', 'STU3', 'Jones', CURRENT_TIMESTAMP, 'STU3');


-- Inserting into 'exam'
INSERT INTO exam (exam_id, username, course_id, date, student_student_id) VALUES
('EXM1', 'mar22', 'CRS1', '2024-06-15', 'STU1'),
('EXM2', 'mar33', 'CRS2', '2024-06-16', 'STU2'),
('EXM3', 'mar44', 'CRS3', '2024-06-17', 'STU3');

-- Inserting into 'schoolEvent'
INSERT INTO schoolEvent (event_id, username, name, date, school_school_id) VALUES
('EVNT1', 'moon', 'Science Day', '2024-10-05', 'SC1'),
('EVNT2', 'jose', 'Spanish culture day' , '2024-10-06', 'SC2'),
('EVNT3', 'cornal', 'Black History', '2024-10-07','SC1');



-- Inserting into textbook
INSERT INTO textbook (textbook_id, username, course_id, ISBN, student_student_id) VALUES
(1, 'omar', 'CR1', 874823748, 'STU1'),  
(2, 'don', 'CR2', 52545345, 'STU2'),
(3, 'ali', 'CR3', 34234233, 'STU3');

-- Inserting into teacher_has_course
INSERT INTO teacher_has_course (teacher_teacher_id, course_course_id) VALUES
('TEA1', 'CR1'), 
('TEA2', 'CR2'),  
('TEA3', 'CR3'); 
-- Inserting into school_has_teacher
INSERT INTO school_has_teacher (school_school_id, teacher_teacher_id) VALUES
('SC1', 'TEA1'), -- TEA1 works at SC1
('SC1', 'TEA2'),  
('SC1', 'TEA3'); 

-- Inserting into account
INSERT INTO account (username, account_id, password, last_login, user_id, status, user_user_id) VALUES
('omar', 101, 'Pass123', CURRENT_TIMESTAMP, 'USR1', 'Active', 'USR1'),
('elhadi', 102, 'Pass456', CURRENT_TIMESTAMP, 'USR2', 'Inactive', 'USR2'),
('ahmed', 103, 'Pass789', CURRENT_TIMESTAMP, 'USR3', 'Active', 'USR3');


-- Inserting into role
INSERT INTO role (role_id, username, email, name, parent_id, user_user_id) VALUES
('ROL1', 'cano', 'a@mail.com', 'Teacher', NULL, 'USR1'),
('ROL2', 'ali', 'b@mail.com', 'Administrator', NULL, 'USR2'),
('ROL3', 'mario', 'c@mail.com', 'Support Staff', NULL, 'USR3');











