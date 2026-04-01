-- Check and test the imported data, to confirm that all data is loaded correctly

-- Use Union all function to view the number of records stored in each table

USE Cybersecurity_Risk_Intelligence_DB;
GO

SELECT 'Dim_User'              AS TableName, COUNT(*) AS Records FROM Dim_User
UNION ALL
SELECT 'Dim_Date',              COUNT(*) FROM Dim_Date
UNION ALL
SELECT 'Dim_Training',          COUNT(*) FROM Dim_Training
UNION ALL
SELECT 'Dim_Event_Type',        COUNT(*) FROM Dim_Event_Type
UNION ALL
SELECT 'Dim_Threat',            COUNT(*) FROM Dim_Threat
UNION ALL
SELECT 'Fact_User_Cyber_Event', COUNT(*) FROM Fact_User_Cyber_Event;

-- Double check the rows
SELECT * 
	FROM Dim_Event_Type;