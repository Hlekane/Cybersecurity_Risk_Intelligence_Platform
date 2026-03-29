-- Create a database

CREATE DATABASE Cybersecurity_Risk_Intelligence_Platform;

GO

USE Cybersecurity_Risk_Intelligence_Platform;

-- Create tables

-- Create the Date Dimension 
CREATE TABLE Dim_Date (

	Date_id DATE PRIMARY KEY,
    Year INT,
    Month INT,
    Day INT,
    Weekday VARCHAR(15)
);

-- Create the User Dimension 

CREATE TABLE Dim_User (
    User_ID INT PRIMARY KEY,
    Full_Name VARCHAR (255),
    Department VARCHAR(255),
    Role VARCHAR(255),
    Location VARCHAR(255),
    Employment_Type VARCHAR(255)
);

-- Create the Event Type Dimension

CREATE TABLE Dim_Event_Type (
    Event_Type_ID INT PRIMARY KEY IDENTITY(1,1), -- Auto-incriment feild, automatically assign a new number when a new record is inserted
    Event_Type_Name VARCHAR(255),
    Category VARCHAR(255),   -- Risk / Training / Awareness
    Description VARCHAR(255)
);

-- Create the Training Dimension 

CREATE TABLE Dim_Training (
    Training_ID INT PRIMARY KEY IDENTITY(1,1),
    Training_Name VARCHAR(255),
    Difficulty_Level VARCHAR(255),
    Duration_Minutes INT,
    Provider VARCHAR(255)
);

-- Create the Threat Dimension 
CREATE TABLE Dim_Threat (
    Threat_ID INT PRIMARY KEY IDENTITY(1,1),
    Threat_Type VARCHAR(255),
    Severity_Level VARCHAR(255),
    Description VARCHAR(255)
);

-- Create the Fact Table

CREATE TABLE Fact_User_Cyber_Event (
    event_id INT PRIMARY KEY,
    user_id INT,
    date_id DATE,
    event_type_id INT,
    training_id INT NULL,
    threat_id INT NULL,
    device_type VARCHAR(50),
    risk_score INT,

    -- Use constraint to prevent actions that could destroy the link between tables

    CONSTRAINT FK_User
        FOREIGN KEY (user_id) REFERENCES Dim_User(user_id),

    CONSTRAINT FK_Date
        FOREIGN KEY (date_id) REFERENCES Dim_Date(date_id),

    CONSTRAINT FK_EventType
        FOREIGN KEY (event_type_id) REFERENCES Dim_Event_Type(event_type_id),

    CONSTRAINT FK_Training
        FOREIGN KEY (training_id) REFERENCES Dim_Training(training_id),

    CONSTRAINT FK_Threat
        FOREIGN KEY (threat_id) REFERENCES Dim_Threat(threat_id)
);