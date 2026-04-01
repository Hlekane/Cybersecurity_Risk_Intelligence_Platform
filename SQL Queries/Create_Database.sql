CREATE DATABASE Cybersecurity_Risk_Intelligence_DB;
GO

USE Cybersecurity_Risk_Intelligence_DB;
GO

/* =========================
   DIMENSION TABLES
========================= */

-- 1. Dim_User
CREATE TABLE Dim_User (
    UserID          INT PRIMARY KEY,
    User_Name       VARCHAR(100) NOT NULL,
    Email           VARCHAR(150),
    Department      VARCHAR(100),
    Role            VARCHAR(100),
    Location        VARCHAR(100),
    Employment_Type VARCHAR(50),
    Join_Date       DATE,
    Status          VARCHAR(50)
);

-- 2. Dim_Date
CREATE TABLE Dim_Date (
    DateID      INT PRIMARY KEY,
    Day         INT NOT NULL,
    Month       INT NOT NULL,
    Year        INT NOT NULL,
    Month_Name  VARCHAR(20),
    Week        INT NOT NULL
);

-- 3. Dim_Event_Type
CREATE TABLE Dim_Event_Type (
    Event_TypeID    INT PRIMARY KEY,
    Event_Name      VARCHAR(100) NOT NULL,
    Event_Category  VARCHAR(100),
    Row_3           VARCHAR(100)
);

-- 4. Dim_Training  (replaces Dim_Module)
CREATE TABLE Dim_Training (
    TrainingID          INT PRIMARY KEY,
    Module_Name         VARCHAR(100) NOT NULL,
    Category            VARCHAR(100),
    Difficulty_Level    VARCHAR(50),
    Duration_Minutes    INT
);

-- 5. Dim_Threat
CREATE TABLE Dim_Threat (
    ThreatID     INT PRIMARY KEY,
    Threat_Type  VARCHAR(100) NOT NULL,
    Severity     VARCHAR(50),
    Description  VARCHAR(500)
);

/* =========================
   FACT TABLE
========================= */

CREATE TABLE Fact_User_Cyber_Event (
    EventID         INT PRIMARY KEY,
    User_ID         INT NOT NULL,
    Date_ID         INT NOT NULL,
    Training_ID     INT NULL,
    Threat_ID       INT NULL,
    Event_Type_ID   INT NOT NULL,
    Quiz_Score      DECIMAL(5,1),
    Passed_Flag     BIT,
    Clicked_Flag    BIT,
    Reported_Flag   BIT,
    Risk_Weight     DECIMAL(4,2),

    CONSTRAINT FK_User
        FOREIGN KEY (User_ID)       REFERENCES Dim_User(UserID),
    CONSTRAINT FK_Date
        FOREIGN KEY (Date_ID)       REFERENCES Dim_Date(DateID),
    CONSTRAINT FK_Event_Type
        FOREIGN KEY (Event_Type_ID) REFERENCES Dim_Event_Type(Event_TypeID),
    CONSTRAINT FK_Training
        FOREIGN KEY (Training_ID)   REFERENCES Dim_Training(TrainingID),
    CONSTRAINT FK_Threat
        FOREIGN KEY (Threat_ID)     REFERENCES Dim_Threat(ThreatID)
);

