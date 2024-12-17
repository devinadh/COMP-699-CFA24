CREATE DATABASE IF NOT EXISTS teacher_communication_hub;

USE teacher_communication_hub;

CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    role ENUM('parent', 'teacher')
);

CREATE TABLE IF NOT EXISTS grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    student_email VARCHAR(100),
    subject VARCHAR(100),
    grade VARCHAR(5),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    parent_email VARCHAR(100),
    teacher_id INT,
    appointment_date DATETIME,
    contact_number VARCHAR(15),
    status ENUM('Pending', 'Approved', 'Rejected'),
    FOREIGN KEY (teacher_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS classroom_updates (
    update_id INT AUTO_INCREMENT PRIMARY KEY,
    update_text TEXT,
    teacher_email VARCHAR(255) NOT NULL, -- New column for teacher email
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Track when the update was created
);
