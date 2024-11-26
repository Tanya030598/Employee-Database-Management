-- schema.sql --

CREATE DATABASE EmployeeDB;
USE EmployeeDB;

-- Create the 'Departments' table --
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- Create the 'Employees' table --
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY, 
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    hire_date DATE,
    job_title VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Create the 'Salaries' table --
CREATE TABLE salaries (
    employee_id INT,
    salary DECIMAL(10, 2),
    from_date DATE,
    to_date DATE,
    PRIMARY KEY (employee_id, from_date),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Add Data --
-- data.sql --

-- Insert data in Departments table --
INSERT INTO departments
(department_name) 
VALUES
('Human Resources'),
('Engineering'),
('Sales'),
('Marketing'),
('Finance'),
('IT Support');

-- Insert data in Employees table --
INSERT INTO employees
(first_name, last_name, email, phone_number, hire_date, job_title, department_id)
VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '2021-01-15', 'Software Engineer', 2),
('Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', '2019-06-10', 'HR Manager', 1),
('Alice', 'Johnson', 'alice.johnson@example.com', '345-678-9012', '2020-03-20', 'Sales Manager', 3),
('Bob', 'Brown', 'bob.brown@example.com', '456-789-0123', '2018-07-30', 'Marketing Specialist', 4),
('Charlie', 'Davis', 'charlie.davis@example.com', '567-890-1234', '2022-11-10', 'IT Support Specialist', 6),
('David', 'Wilson', 'david.wilson@example.com', '678-901-2345', '2023-02-25', 'Financial Analyst', 5),
('Emily', 'Taylor', 'emily.taylor@example.com', '789-012-3456', '2020-04-15', 'Marketing Manager', 4),
('Frank', 'Moore', 'frank.moore@example.com', '890-123-4567', '2021-07-18', 'Software Engineer', 2),
('Grace', 'Lee', 'grace.lee@example.com', '901-234-5678', '2019-05-05', 'Sales Associate', 3),
('Hannah', 'Martinez', 'hannah.martinez@example.com', '012-345-6789', '2020-12-12', 'HR Assistant', 1),
('Isaac', 'Anderson', 'isaac.anderson@example.com', '123-456-7890', '2022-03-25', 'Data Analyst', 2),
('Jack', 'Thomas', 'jack.thomas@example.com', '234-567-8901', '2021-09-30', 'Finance Manager', 5),
('Lily', 'Jackson', 'lily.jackson@example.com', '345-678-9012', '2020-01-10', 'Sales Associate', 3),
('Mason', 'White', 'mason.white@example.com', '456-789-0123', '2021-11-05', 'IT Support Technician', 6),
('Nina', 'Clark', 'nina.clark@example.com', '567-890-1234', '2022-06-15', 'Marketing Coordinator', 4),
('Oscar', 'Lewis', 'oscar.lewis@example.com', '678-901-2345', '2021-02-14', 'Software Engineer', 2),
('Paul', 'Walker', 'paul.walker@example.com', '789-012-3456', '2020-10-20', 'HR Specialist', 1),
('Quincy', 'Harris', 'quincy.harris@example.com', '890-123-4567', '2021-04-12', 'Financial Analyst', 5),
('Rachel', 'Young', 'rachel.young@example.com', '901-234-5678', '2019-08-25', 'Software Engineer', 2);

-- Insert data in Salaries table --
INSERT INTO salaries
(employee_id, salary, from_date, to_date)
VALUES
(1, 95000.00, '2021-01-15', '2022-01-15'),
(2, 72000.00, '2019-06-10', '2020-06-10'),
(3, 85000.00, '2020-03-20', '2021-03-20'),
(4, 65000.00, '2018-07-30', '2019-07-30'),
(5, 55000.00, '2022-11-10', '2023-11-10'),
(6, 75000.00, '2023-02-25', '2024-02-25'),
(7, 80000.00, '2020-04-15', '2021-04-15'),
(8, 95000.00, '2021-07-18', '2022-07-18'),
(9, 60000.00, '2019-05-05', '2020-05-05'),
(10, 70000.00, '2020-12-12', '2021-12-12'),
(11, 60000.00, '2022-03-25', '2023-03-25'),
(12, 100000.00, '2021-09-30', '2022-09-30'),
(13, 85000.00, '2020-01-10', '2021-01-10'),
(14, 95000.00, '2021-11-05', '2022-11-05'),
(15, 65000.00, '2022-06-15', '2023-06-15'),
(16, 120000.00, '2021-02-14', '2022-02-14'),
(17, 70000.00, '2020-10-20', '2021-10-20'),
(18, 95000.00, '2021-04-12', '2022-04-12'),
(19, 75000.00, '2019-08-25', '2020-08-25');

-- SQL Queries --
-- Basic Queries--

Query 1: List all employees with their first and last names.
Ans-- SELECT first_name, last_name
      FROM employees;

Query 2: Get the email and hire date of the employee with ID 4
Ans-- SELECT email, hire_date
      FROM employees
      WHERE employee_id = 4;

Query 3: Find employees who work in the 'Engineering' department
Ans-- SELECT e.first_name, e.last_name
      FROM employees e
      Join departments d on d.department_id=e.department_id
      WHERE d.department_name='Engineering';

Query 4: List all departments in the company.
Ans-- SELECT department_name
      FROM departments;

Query 5: Get the first and last names of employees who were hired after January 1, 2020
Ans-- SELECT first_name, last_name, hire_date
      FROM employees
      WHERE hire_date > '2020-01-01';

-- Intermediate Queries -- 

Query 1: Get the count of employees in each department.
Ans-- SELECT d.department_name, COUNT(e.employee_id) AS num_employees
      FROM departments d
      JOIN employees e ON e.department_id = d.department_id
      GROUP BY d.department_name;

Query 2: Get the employees who earn more than $75,000.
Ans-- SELECT e.first_name, e.last_name, s.salary
      FROM employees e
      JOIN salaries s ON e.employee_id = s.employee_id
      WHERE s.salary > 75000;

Query 3: Find the department with the highest number of employees.
Ans-- SELECT d.department_name, COUNT(e.employee_id) AS num_employees
      FROM departments d
      JOIN employees e ON e.department_id = d.department_id
      GROUP BY d.department_name
      ORDER BY num_employees DESC
      LIMIT 1;

Query 4: Get the average salary for each department.
Ans-- SELECT d.department_name, AVG(s.salary) AS avg_salary
      FROM employees e
      JOIN departments d ON e.department_id = d.department_id
      JOIN salaries s ON e.employee_id = s.employee_id
      GROUP BY d.department_name;

-- Advance Queries --

Query 1: Find the employee with the highest salary in each department.
Ans-- SELECT d.department_name, MAX(s.salary) AS max_salary
      FROM departments d
      JOIN employees e ON e.department_id = d.department_id
      JOIN salaries s ON e.employee_id = s.employee_id
      GROUP BY d.department_name
      ORDER BY max_salary DESC;

Query 2: Get the total salary expenditure for each department
Ans-- SELECT d.department_name, SUM(s.salary) AS total_salary_expense
      FROM departments d
      JOIN employees e ON e.department_id = d.department_id
      JOIN salaries s ON e.employee_id = s.employee_id
      GROUP BY d.department_name;

Query 3: List departments where the total salary exceeds $500,000.
Ans-- SELECT d.department_name, SUM(s.salary) AS total_salary_expense
      FROM departments d
      JOIN employees e ON e.department_id = d.department_id
      JOIN salaries s ON e.employee_id = s.employee_id
      GROUP BY d.department_name
      HAVING total_salary_expense > 500000;

