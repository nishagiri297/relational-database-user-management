-- IMPORTANT: This follows the class module's practice-data migration.
-- BACK UP db_school first. TRUNCATE TABLE students permanently deletes existing student rows.
-- Run this only if you are comfortable clearing the current practice student data.
USE db_school;

CREATE TABLE majors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO majors (name) VALUES
('Informatics'), ('Information Systems'), ('Computer Science');

TRUNCATE TABLE students;
ALTER TABLE students DROP COLUMN major;
ALTER TABLE students ADD major_id INT NOT NULL;
ALTER TABLE students
    ADD CONSTRAINT fk_students_major
    FOREIGN KEY (major_id) REFERENCES majors(id)
    ON DELETE RESTRICT;

INSERT INTO students (nim, name, major_id) VALUES
('2301001', 'Andi Pratama', 1),
('2301002', 'Siti Rahma', 2),
('2301003', 'Budi Santoso', 1),
('2301004', 'Dewi Lestari', 3);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'staff') NOT NULL DEFAULT 'staff'
);
