-- all tables

CREATE TABLE IF NOT EXISTS ratings (
                rating_id INT AUTO_INCREMENT PRIMARY KEY,
                doctor_name VARCHAR(255) NOT NULL,
                rating INT NOT NULL,
                timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
            )

 CREATE TABLE IF NOT EXISTS appointments (
                appointment_id INT AUTO_INCREMENT PRIMARY KEY,
                user_id VARCHAR(255) NOT NULL,
                timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
            )

CREATE TABLE IF NOT EXISTS doctors (
                doctor_id INT AUTO_INCREMENT PRIMARY KEY,
                email VARCHAR(255) UNIQUE NOT NULL,
                name VARCHAR(255) NOT NULL,
                password VARCHAR(255) NOT NULL,
                timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
            )

CREATE TABLE IF NOT EXISTS Admin_Recovery_Log (
                id INT AUTO_INCREMENT PRIMARY KEY,
                email VARCHAR(255) NOT NULL,
                timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
                FOREIGN KEY (email) REFERENCES Admins(email)
            )

 CREATE TABLE IF NOT EXISTS Admin_Security_Questions (
                id INT AUTO_INCREMENT PRIMARY KEY,
                email VARCHAR(255) NOT NULL,
                question VARCHAR(255) NOT NULL,
                answer VARCHAR(255) NOT NULL,
                FOREIGN KEY (email) REFERENCES Admins(email)
            )

CREATE TABLE IF NOT EXISTS Admins (
                organisational_name VARCHAR(255) NOT NULL,
                email VARCHAR(255) PRIMARY KEY,
                password VARCHAR(255) NOT NULL,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP
            )

CREATE TABLE IF NOT EXISTS help_requests (
                id INT AUTO_INCREMENT PRIMARY KEY,
                user_id VARCHAR(255) NOT NULL,
                message TEXT NOT NULL,
                timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
                FOREIGN KEY (user_id) REFERENCES Users(user_id)
            )

CREATE TABLE IF NOT EXISTS Users (
                user_id VARCHAR(255) PRIMARY KEY,
                password VARCHAR(255) NOT NULL
            )

CREATE TABLE IF NOT EXISTS Security_Questions (
                id INT AUTO_INCREMENT PRIMARY KEY,
                user_id VARCHAR(255) NOT NULL,
                question VARCHAR(255) NOT NULL,
                answer VARCHAR(255) NOT NULL,
                FOREIGN KEY (user_id) REFERENCES Users(user_id)
            )

CREATE TABLE IF NOT EXISTS doctor_sessions (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT NOT NULL,
    meet_link VARCHAR(255) NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    gender ENUM('Male', 'Female', 'Any') NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE IF NOT EXISTS blogs (
    blog_id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE IF NOT EXISTS recovered_password (
                id INT AUTO_INCREMENT PRIMARY KEY,
                user_id VARCHAR(255) NOT NULL,
                timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
                FOREIGN KEY (user_id) REFERENCES Users(user_id)
            )

CREATE TABLE IF NOT EXISTS appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    session_id INT NOT NULL,
    booked_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (session_id) REFERENCES doctor_sessions(session_id)
);

ALTER TABLE doctor_sessions ADD COLUMN booked BOOLEAN DEFAULT 0;
