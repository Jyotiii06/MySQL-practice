CREATE DATABASE student_management;
USE student_management;
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    course_code VARCHAR(20) UNIQUE,
    credits INT
);
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);
CREATE TABLE marks (
    mark_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT CHECK (marks >= 0 AND marks <= 100),
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
INSERT INTO students (first_name, last_name, email, phone, date_of_birth, gender)
VALUES 
('Rahul', 'Sharma', 'rahul@gmail.com', '9876543210', '2002-05-10', 'Male'),
('Anita', 'Verma', 'anita@gmail.com', '9123456780', '2003-08-15', 'Female');

INSERT INTO courses (course_name, course_code, credits)
VALUES
('Computer Science', 'CS101', 4),
('Mathematics', 'MATH101', 3);

INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
(1, 1, '2025-01-10'),
(2, 2, '2025-01-12');

INSERT INTO marks (student_id, course_id, marks, grade)
VALUES
(1, 1, 85, 'A'),
(2, 2, 78, 'B');
SELECT * FROM students;
SELECT s.first_name, c.course_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;
SELECT s.first_name, c.course_name, m.marks, m.grade
FROM marks m
JOIN students s ON m.student_id = s.student_id
JOIN courses c ON m.course_id = c.course_id;
