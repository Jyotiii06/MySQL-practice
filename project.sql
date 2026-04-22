CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    join_date DATE
);

INSERT INTO employees (name, department, salary, join_date) VALUES
('Amit Sharma', 'IT', 60000, '2023-01-15'),
('Neha Verma', 'HR', 45000, '2022-11-10'),
('Raj Patel', 'Finance', 55000, '2023-03-20');


CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100),
    emp_id INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);


INSERT INTO projects (project_name, emp_id) VALUES
('Website Development', 1),
('Recruitment Drive', 2),
('Budget Planning', 3);


SELECT e.name, e.department, p.project_name
FROM employees e
JOIN projects p ON e.emp_id = p.emp_id;

CREATE VIEW employee_projects AS
SELECT e.name, p.project_name
FROM employees e
JOIN projects p ON e.emp_id = p.emp_id;

CREATE PROCEDURE GetEmployees()
BEGIN
    SELECT * FROM employees;

DELIMITER ;

CALL GetEmployees();
