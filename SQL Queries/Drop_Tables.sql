USE Cybersecurity_Risk_Intelligence_DB;
GO

-- Drop fact first (it has FKs pointing to dimensions)
DROP TABLE IF EXISTS Fact_User_Cyber_Event;

-- Then drop dimensions
DROP TABLE IF EXISTS Dim_User;
DROP TABLE IF EXISTS Dim_Date;
DROP TABLE IF EXISTS Dim_Training;
DROP TABLE IF EXISTS Dim_Event_Type;
DROP TABLE IF EXISTS Dim_Threat;