
GO

USE Cybersecurity_Intelligence_Platform;

-- Create Dimensions
CREATE TABLE Dim_User (
    User_ID INT IDENTITY(1,1)PRIMARY KEY,
    User_Name VARCHAR(100),
    Email VARCHAR(150),
    Department VARCHAR(100),
    Role VARCHAR(100),
    Location VARCHAR(100),
    Employment_Type VARCHAR(50),
    Join_Date DATE,
    Status VARCHAR(50)
);

CREATE TABLE Dim_Date (
    Date_ID INT IDENTITY(1,1) PRIMARY KEY,
    Day INT,
    Month INT,
    Year INT,
    Month_Name VARCHAR(20),
    Week INT
);

CREATE TABLE Dim_Training (
    Training_ID INT IDENTITY(1,1) PRIMARY KEY,
    Module_Name VARCHAR(150),
    Category VARCHAR(100),
    Difficulty_Level VARCHAR(50),
    Duration_Minutes INT
);

CREATE TABLE Dim_Threat (
    Threat_ID INT IDENTITY(1,1) PRIMARY KEY,
    Threat_Type VARCHAR(100),
    Severity VARCHAR(50),
    Description TEXT
);


CREATE TABLE Dim_Event_Type (
    Event_Type_ID INT IDENTITY(1,1)PRIMARY KEY,
    Event_Name VARCHAR(100),
    Event_Category VARCHAR(100)
   
);

-- Create a Fact Table

CREATE TABLE Fact_User_Cyber_Event (
    Event_ID INT IDENTITY(1,1)PRIMARY KEY,

    User_ID INT,
    Date_ID INT,
    Training_ID INT,
    Threat_ID INT,
    Event_Type_ID INT,

    Quiz_Score DECIMAL(5,2),
    Passed_Flag BIT,
    Clicked_Flag BIT,
    Reported_Flag BIT,
    Risk_Weight DECIMAL(5,2),

    -- Foreign Keys
    CONSTRAINT FK_User
        FOREIGN KEY (User_ID) REFERENCES Dim_User(User_ID),

    CONSTRAINT FK_Date
        FOREIGN KEY (Date_ID) REFERENCES Dim_Date(Date_ID),

    CONSTRAINT FK_Training
        FOREIGN KEY (Training_ID) REFERENCES Dim_Training(Training_ID),

    CONSTRAINT FK_Threat
        FOREIGN KEY (Threat_ID) REFERENCES Dim_Threat(Threat_ID),

    CONSTRAINT FK_Event_Type
        FOREIGN KEY (Event_Type_ID) REFERENCES Dim_Event_Type(Event_Type_ID)
);


