-- Insert dataset

INSERT INTO Dim_User 
(User_Name, Email, Department, Role, Location, Employment_Type, Join_Date, Status)
VALUES
('Alice Johnson', 'alice.johnson@company.com', 'Finance', 'Analyst', 'Johannesburg', 'Full-Time', '2022-03-15', 'Active'),
('Brian Smith', 'brian.smith@company.com', 'IT', 'Security Engineer', 'Cape Town', 'Full-Time', '2021-07-10', 'Active'),
('Cynthia Lee', 'cynthia.lee@company.com', 'HR', 'HR Manager', 'Durban', 'Full-Time', '2020-11-01', 'Active'),
('David Brown', 'david.brown@company.com', 'Operations', 'Supervisor', 'Johannesburg', 'Contract', '2023-01-20', 'Active'),
('Emma Davis', 'emma.davis@company.com', 'Finance', 'Accountant', 'Pretoria', 'Full-Time', '2019-05-30', 'Inactive'),

('Frank Wilson', 'frank.wilson@company.com', 'IT', 'Network Engineer', 'Cape Town', 'Full-Time', '2022-09-12', 'Active'),
('Grace Taylor', 'grace.taylor@company.com', 'Marketing', 'Coordinator', 'Johannesburg', 'Full-Time', '2023-02-01', 'Active'),
('Henry Anderson', 'henry.anderson@company.com', 'Sales', 'Sales Rep', 'Durban', 'Contract', '2021-06-18', 'Active'),
('Isabella Thomas', 'isabella.thomas@company.com', 'HR', 'Recruiter', 'Pretoria', 'Full-Time', '2022-11-25', 'Active'),
('Jack Moore', 'jack.moore@company.com', 'Operations', 'Manager', 'Johannesburg', 'Full-Time', '2018-08-14', 'Active'),

('Karen Martin', 'karen.martin@company.com', 'Finance', 'Senior Analyst', 'Cape Town', 'Full-Time', '2020-04-09', 'Active'),
('Liam Jackson', 'liam.jackson@company.com', 'IT', 'Support Specialist', 'Pretoria', 'Full-Time', '2023-03-11', 'Active'),
('Mia White', 'mia.white@company.com', 'Marketing', 'Content Strategist', 'Durban', 'Full-Time', '2021-12-05', 'Active'),
('Noah Harris', 'noah.harris@company.com', 'Sales', 'Account Manager', 'Johannesburg', 'Full-Time', '2019-09-23', 'Active'),
('Olivia Clark', 'olivia.clark@company.com', 'HR', 'HR Assistant', 'Cape Town', 'Contract', '2022-06-30', 'Active'),

('Paul Lewis', 'paul.lewis@company.com', 'Operations', 'Technician', 'Pretoria', 'Full-Time', '2020-10-17', 'Inactive'),
('Quinn Walker', 'quinn.walker@company.com', 'Finance', 'Auditor', 'Durban', 'Full-Time', '2021-01-28', 'Active'),
('Ryan Hall', 'ryan.hall@company.com', 'IT', 'Cloud Engineer', 'Johannesburg', 'Full-Time', '2022-08-08', 'Active'),
('Sophia Allen', 'sophia.allen@company.com', 'Marketing', 'SEO Specialist', 'Cape Town', 'Full-Time', '2023-05-19', 'Active'),
('Tyler Young', 'tyler.young@company.com', 'Sales', 'Sales Manager', 'Pretoria', 'Full-Time', '2017-03-03', 'Active');

INSERT INTO Dim_Date (Day, Month, Year, Month_Name, Week)
VALUES
(1, 1, 2024, 'January', 1),
(15, 2, 2024, 'February', 7),
(10, 3, 2024, 'March', 10),
(25, 3, 2024, 'March', 12),
(5, 4, 2024, 'April', 14),

(11, 1, 2024, 'January', 1),
(14, 2, 2024, 'February', 7),
(16, 3, 2024, 'March', 10),
(24, 3, 2024, 'March', 12),
(15, 4, 2024, 'April', 14),

(2, 1, 2024, 'January', 1),
(15, 1, 2024, 'February', 7),
(10, 3, 2024, 'March', 10),
(25, 3, 2024, 'March', 12),
(5, 3, 2024, 'April', 14),

(1, 4, 2024, 'January', 1),
(15, 2, 2024, 'February', 7),
(10, 3, 2024, 'March', 10),
(17, 3, 2024, 'March', 12),
(9, 4, 2024, 'April', 14);

-- Insert into Dim_Event_Type

INSERT INTO Dim_Event_Type (Event_Name, Event_Category)
VALUES
('Training Completed', 'Training'),
('Phishing Simulation Click', 'Simulation'),
('Threat Reported', 'Security'),
('Quiz Attempt', 'Assessment');

-- Insert into Dim_Training

INSERT INTO Dim_Training (Module_Name, Category, Difficulty_Level, Duration_Minutes)
VALUES
('Phishing Awareness', 'Security', 'Beginner', 30),
('Password Security', 'Security', 'Beginner', 20),
('Advanced Threat Detection', 'Security', 'Advanced', 60),
('Social Engineering Defense', 'Security', 'Intermediate', 45);

-- Insert into Dim_Threat

INSERT INTO Dim_Threat (Threat_Type, Severity, Description)
VALUES
('Phishing Email', 'High', 'Malicious email attempting to steal credentials'),
('Malware Download', 'Critical', 'User downloaded infected attachment'),
('Credential Theft', 'High', 'Unauthorized access using stolen credentials'),
('Suspicious Link', 'Medium', 'User encountered suspicious URL');

-- Insert into the Fact Table

INSERT INTO Fact_User_Cyber_Event
(User_ID, Date_ID, Training_ID, Threat_ID, Event_Type_ID, Quiz_Score, Passed_Flag, Clicked_Flag, Reported_Flag, Risk_Weight)
VALUES

(1, 1, 1, 1, 1, 85.00, 1, 0, 1, 0.2),
(2, 2, 2, 4, 4, 70.00, 1, 0, 1, 0.1),
(20, 1, 1, 1, 1, 85.00, 1, 0, 1, 0.2),
(15, 2, 2, 4, 3, 75.00, 1, 0, 1, 0.1),
(1, 1, 1, 1, 1, 85.00, 1, 0, 1, 0.2),
(2, 2, 2, 3, 3, 90.00, 1, 0, 1, 0.1),
(11, 3, 1, 1, 2, 30.00, 0, 1, 0, 0.8),

(3, 3, 1, 1, 2, 40.00, 0, 1, 0, 0.8),
(3, 3, 1, 1, 2, 25.00, 0, 1, 0, 0.8),
(3, 3, 1, 1, 2, 10.00, 0, 1, 0, 0.8),
(3, 3, 1, 1, 2, 15.00, 0, 1, 0, 0.8),
(3, 3, 1, 1, 2, 05.00, 0, 1, 0, 0.8),
(4, 4, 3, 2, 4, 70.00, 1, 1, 0, 0.6),
(5, 2, 2, 3, 2, 30.00, 0, 1, 0, 0.9),

(1, 5, 4, 4, 3, 88.00, 1, 0, 1, 0.2),
(3, 4, 1, 1, 2, 50.00, 0, 1, 0, 0.75),
(2, 3, 3, 2, 1, 95.00, 1, 0, 1, 0.1),
(4, 4, 2, 2, 4, 65.00, 1, 1, 0, 0.6),
(4, 5, 2, 2, 3, 70.00, 1, 0, 1, 0.3),
(4, 6, 3, 3, 4, 55.00, 0, 1, 0, 0.7),

(5, 7, 1, 1, 2, 35.00, 0, 1, 0, 0.9),
(5, 8, 1, 1, 2, 20.00, 0, 1, 0, 0.95),
(5, 9, 2, 3, 2, 25.00, 0, 1, 0, 0.85),
(6, 10, 3, 2, 1, 88.00, 1, 0, 1, 0.2),
(6, 11, 3, 2, 1, 92.00, 1, 0, 1, 0.1),
(6, 12, 4, 4, 3, 85.00, 1, 0, 1, 0.2),

(7, 13, 2, 3, 4, 60.00, 1, 1, 0, 0.6),
(7, 14, 2, 3, 3, 75.00, 1, 0, 1, 0.3),
(7, 15, 1, 1, 2, 45.00, 0, 1, 0, 0.7),
(8, 16, 1, 4, 4, 50.00, 0, 0, 0, 0.5),
(8, 17, 2, 4, 4, 55.00, 0, 0, 0, 0.5),
(9, 18, 3, 2, 3, 90.00, 1, 0, 1, 0.1),
(9, 19, 3, 2, 3, 85.00, 1, 0, 1, 0.2),
(9, 20, 4, 4, 3, 88.00, 1, 0, 1, 0.15),
(10, 21, 2, 3, 2, 65.00, 1, 1, 0, 0.6),
(10, 22, 2, 3, 2, 70.00, 1, 1, 0, 0.55),
(10, 23, 3, 2, 1, 75.00, 1, 0, 1, 0.3);
