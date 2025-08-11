    
-- Create database
CREATE DATABASE student_database;

-- Use the database
USE student_database;

-- 1. Create table
CREATE TABLE student_table (
    Student_id INTEGER PRIMARY KEY,
    Stu_name TEXT NOT NULL,
    Department TEXT NOT NULL,
    email_id TEXT NOT NULL,
    Phone_no NUMERIC NOT NULL,
    Address TEXT NOT NULL,
    Date_of_birth DATE NOT NULL,
    Gender TEXT NOT NULL,
    Major TEXT NOT NULL,
    GPA NUMERIC(3,1) NOT NULL,
    Grade TEXT NOT NULL CHECK (Grade IN ('A', 'B', 'C', 'D', 'F'))
);

-- 2. Data Entry: Insert 10 sample records
INSERT INTO student_table VALUES
(1, 'Li Ming', 'Computer Science', 'liming@email.com', 1234567890, 'Beijing Road 123', '2000-01-15', 'Male', 'Software Engineering', 8.5, 'A'),
(2, 'Wang Fei', 'Mathematics', 'wangfei@email.com', 1234567891, 'Shanghai Street 456', '2001-03-20', 'Female', 'Pure Mathematics', 7.8, 'B'),
(3, 'Zhang Wei', 'Physics', 'zhangwei@email.com', 1234567892, 'Guangzhou Ave 789', '2000-07-10', 'Male', 'Theoretical Physics', 9.0, 'A'),
(4, 'Liu Yan', 'Chemistry', 'liuyan@email.com', 1234567893, 'Nanjing Road 321', '2001-05-25', 'Female', 'Organic Chemistry', 6.5, 'C'),
(5, 'Chen Mei', 'Biology', 'chenmei@email.com', 1234567894, 'Wuhan Street 654', '2000-11-30', 'Female', 'Microbiology', 8.2, 'B'),
(6, 'Yang Lei', 'Computer Science', 'yanglei@email.com', 1234567895, 'Chengdu Road 987', '2001-09-05', 'Male', 'AI', 4.5, 'D'),
(7, 'Wu Ning', 'Mathematics', 'wuning@email.com', 1234567896, 'Xian Ave 147', '2000-04-12', 'Female', 'Statistics', 9.5, 'A'),
(8, 'Zhao Jun', 'Physics', 'zhaojun@email.com', 1234567897, 'Hangzhou Road 258', '2001-08-22', 'Male', 'Applied Physics', 7.0, 'B'),
(9, 'Sun Tao', 'Chemistry', 'suntao@email.com', 1234567898, 'Suzhou Street 369', '2000-12-18', 'Male', 'Analytical Chemistry', 5.5, 'C'),
(10, 'Lin Hui', 'Biology', 'linhui@email.com', 1234567899, 'Dalian Road 741', '2001-06-28', 'Female', 'Marine Biology', 8.8, 'A');

-- 3. Student Information Retrieval: Sort all records by grade in descending order
SELECT *
FROM student_table
ORDER BY Grade DESC;


-- 4. Query for Male Students: Implement a query to retrieve information about all male students
SELECT *
FROM student_table
WHERE Gender = 'Male';

-- 5. Query for Students with GPA less than 5.0: Create a query to fetch the details of students who have a GPA less than 5.0
SELECT *
FROM student_table
WHERE GPA < 5.0;

-- 6. Update Student Email and Grade: Write an update statement to modify the email and grade of a student with a specific ID
UPDATE student_table 
SET email_id = 'yanglei_new@email.com', 
    Grade = 'C'
WHERE Student_id = 6;

-- 7. Query for Students with Grade "B": Develop a query to retrieve the names and ages of all students who have a grade of "B"
-- Note: Age is calculated based on current date (2025-08-11). 
SELECT 
    Stu_name,
    Date_of_birth,
    TIMESTAMPDIFF(YEAR, Date_of_birth, CURDATE()) as Age
FROM student_table
WHERE Grade = 'B';

-- 8. Grouping and Calculation: Create a query to group the "student_table" by the "Department" and "Gender" columns and calculate the average GPA for each combination
SELECT 
    Department,
    Gender,
    ROUND(AVG(GPA), 1) as Average_GPA
FROM student_table
GROUP BY Department, Gender
ORDER BY Department, Gender;

-- 9. Table Renaming: Rename the "student_table" to "student_info" using the appropriate SQL statement
RENAME TABLE student_table TO student_info;

-- Verify the change by trying to select from the new table name
SELECT * FROM student_info LIMIT 1;

-- 10. Retrieve Student with Highest GPA: Write a query to retrieve the name of the student with the highest GPA from the student_info table
SELECT 
    Stu_name,
    GPA
FROM student_info 
WHERE GPA = (SELECT MAX(GPA) FROM student_info);

