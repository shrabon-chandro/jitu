CREATE Table `doctors`(
    `doctor_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `specialization` VARCHAR(30) NOT NULL,
    `phone` INT(11) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() on update CURRENT_TIMESTAMP()
);

INSERT INTO `doctors`(name, specialization, phone) 
VALUES
('Dr. Tahmid Hasan', 'Neurologist', '01756789123'),
('Dr. Ayesha Siddique', 'Gynecologist', '01767891234'),
('Dr. Mahbub Alam', 'Oncologist', '01778912345'),
('Dr. Laila Karim', 'ENT Specialist', '01789123456'),
('Dr. Nazmul Huda', 'Psychiatrist', '01791234567');


CREATE Table `patients`(
    `patient_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `age` INT NOT NULL,
    `gender` VARCHAR(10) NOT NULL,
    `phone` INT(11) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() on update CURRENT_TIMESTAMP()
);

INSERT INTO `patients`(name, age, gender, phone) 
VALUES
('Rahim Uddin', 34, 'Male', '01712345678'),
('Fatema Akhter', 29, 'Female', '01823456789'),
('Mahmudul Hasan', 45, 'Male', '01934567890'),
('Nasrin Jahan', 22, 'Female', '01645678901'),
('Abdul Karim', 50, 'Male', '01556789012');

CREATE Table `appointments`(
    `appointment_id` INT PRIMARY KEY AUTO_INCREMENT,
    `date` VARCHAR(10) NOT NULL,
    `time` VARCHAR(10) NOT NULL,
    `status` VARCHAR(20) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() on update CURRENT_TIMESTAMP()
);

INSERT INTO `appointments`(date, time, status) VALUES
('22-12-24', '10 am', 'pending'),
('22-12-24', '11 am', 'pending'),
('22-12-24', '12 pm', 'pending'),
('22-12-24', '1 pm', 'pending'),
('22-12-24', '2 pm', 'pending');

CREATE Table `departments`(
    `department_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `location` VARCHAR(50) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() on update CURRENT_TIMESTAMP()
);

INSERT into `departments` (name, location) VALUES

('Cardiology', 'Building A, Floor 1, Room 101'),
('Dermatology', 'Building A, Floor 2, Room 202'),
('Orthopedic Surgery', 'Building A, Floor 3, Room 303'),
('Pediatrics', 'Building A, Floor 4, Room 404'),
('General Medicine', 'Building A, Floor 5, Room 505');



CREATE Table `confirm_appointments`(
    `final_appointment` INT PRIMARY KEY AUTO_INCREMENT, 
    `patient_id` INT  ,
    `doctors_id` INT  ,
    `department_id` INT  ,
    `appointment_id` INT  ,
    `confirm_status` VARCHAR(10) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() on update CURRENT_TIMESTAMP(),

    Foreign Key (`patient_id`) REFERENCES `patients`(`patient_id`) ON DELETE CASCADE,
    Foreign Key (`doctors_id`) REFERENCES `doctors`(`doctor_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    Foreign Key (`department_id`) REFERENCES `departments`(`department_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    Foreign Key (`appointment_id`) REFERENCES `appointments`(`appointment_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO `confirm_appointments`(confirm_status) VALUES
('Approve'),
('Approve'),
('Approve'),
('Approve'),
('Approve');