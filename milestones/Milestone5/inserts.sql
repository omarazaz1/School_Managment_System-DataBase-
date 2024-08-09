-- School data
USE SchoolDB;

INSERT INTO school (school_id, school_name) VALUES 
(1, 'MVLA'),
(2, 'SANC'),
(3, 'SACO');

-- User data
INSERT INTO user (user_id, username, email, password, name, school_school_id) VALUES 
(1, 'mar1', 'mar1@mail.com', 'pass1', 'Omar', 1),
(2, 'mar2', 'mar2@mail.com', 'pass2', 'Azaz', 1),
(3, 'mar3', 'mar3@mail.com', 'pass3', 'Ali', 1);

-- Guardian data
INSERT INTO guardian (guardian_id, email, first_name, last_name) VALUES
(1, 'A@mail.com', 'Azaz', 'Cao'),
(2, 'm@mail.com', 'Mike', 'Osma'),
(3, 'S@mail.com', 'Sam', 'Don');

-- Student data
INSERT INTO student (student_id, user_id, department, guardian_guardian_id, school_school_id) VALUES
(1, 1, 'Science', 1, 1),
(2, 2, 'Math', 2, 2),
(3, 3, 'Arts', 3, 3);

-- Teacher data
INSERT INTO teacher (teacher_id, username, user_id, department) VALUES
(1, 'jose', 1, 'Science'),
(2, 'omar', 2, 'Math'),
(3, 'danmar', 3, 'Arts');

-- Course data
INSERT INTO course (course_id, username, title, max_capacity) VALUES
(1, 'jose1', 'Biology', 30),
(2, 'asmar2', 'Fundamentals of Math', 205),
(3, 'dog33', 'Sudan History', 400);

-- Grade data
INSERT INTO grade (grade_id, username, student_id, course_id, mark) VALUES
(1, 'omar1', 1, 1, 88),
(2, 'meron2', 2, 2, 82.0),
(3, 'salim22', 3, 3, 77.0);

-- Assignment data
INSERT INTO assignment (assignment_id, username, email, course_id, title, class_time, student_student_id) VALUES
(1, 'mst', 'jade@mail.com', 1, 'Linear Algebra', '2024-05-15 09:00:00', 1),
(2, 'cls', 'me@mail.com', 2, 'Algebraic Expressions', '2024-05-16 10:00:00', 2),
(3, 'dsd', 'fort@mail.com', 3, 'Kush Kingdom', '2024-05-17 11:00:00', 3);

-- Schedule data
INSERT INTO schedule (schedule_id, username, email, user_id, class_time, student_student_id) VALUES
(1, 'sst', 'omar1@mail.com', 1, '2024-04-20 08:00:00', 1),
(2, 'ssd', 'omar2@mail.com', 2, '2024-04-21 08:30:00', 2),
(3, 'can', 'omar3@mail.com', 3, '2024-04-22 09:00:00', 3);

-- Classroom data
INSERT INTO classroom (classroom_id, username, email, capacity, equipment, student_student_id, school_school_id) VALUES
(1, 'mano', 'mano@mail.com', 30, 'Projector', 1, 1),
(2, 'criss', 'hood@mail.com', 25, 'Boards', 2, 2),
(3, 'sam', 'faro@mail.com', 40, 'Test Equipments', 3, 3);

-- Attendance data
INSERT INTO attendance (attendance_id, username, student_id, student_name, date) VALUES
(1, 'omar1', 1, 'John', CURRENT_TIMESTAMP),
(2, 'omar2', 2, 'Alice', CURRENT_TIMESTAMP),
(3, 'omar3', 3, 'Jones', CURRENT_TIMESTAMP);

-- Exam data
INSERT INTO exam (exam_id, username, course_id, date, student_student_id) VALUES
(1, 'mar22', 1, '2024-06-15', 1),
(2, 'mar33', 2, '2024-06-16', 2),
(3, 'mar44', 3, '2024-06-17', 3);

-- School Event data
INSERT INTO schoolEvent (event_id, username, name, date, school_school_id) VALUES
(1, 'moon', 'Science Day', '2024-10-05', 1),
(2, 'jose', 'Spanish Culture Day', '2024-10-06', 2),
(3, 'cornal', 'Black History', '2024-10-07', 3);

-- Textbook data
INSERT INTO textbook (textbook_id, username, course_id, ISBN, student_student_id) VALUES
(1, 'omar', 1, 874823748, 1),  
(2, 'don', 2, 52545345, 2),
(3, 'ali', 3, 34234233, 3);

-- Teacher has Course data
INSERT INTO teacher_has_course (teacher_teacher_id, course_course_id) VALUES
(1, 1), 
(2, 2),  
(3, 3); 

-- School has Teacher data
INSERT INTO school_has_teacher (school_school_id, teacher_teacher_id) VALUES
(1, 1), -- Teacher 1 works at School 1
(2, 2),  
(3, 3);

-- Account data
INSERT INTO account (username, account_id, password, last_login, user_id, status) VALUES
('omar', 101, 'Pass123', CURRENT_TIMESTAMP, 1, 'Active'),
('elhadi', 102, 'Pass456', CURRENT_TIMESTAMP, 2, 'Inactive'),
('ahmed', 103, 'Pass789', CURRENT_TIMESTAMP, 3, 'Active');

-- Role data
INSERT INTO role (role_id, username, email, name, parent_id, user_user_id) VALUES
(1, 'cano', 'a@mail.com', 'Teacher', NULL, 1),
(2, 'ali', 'b@mail.com', 'Administrator', NULL, 2),
(3, 'mario', 'c@mail.com', 'Support Staff', NULL, 3);
