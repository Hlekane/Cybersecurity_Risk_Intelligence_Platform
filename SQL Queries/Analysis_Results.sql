/*Departments most active in cybersecurity events*/
/* shows which departments generate the highest number of cybersecurity events overall, highlighting
where activity is concentrated.*/

SELECT 
	u.Department, COUNT(f.EventID) AS Event_Count 
FROM Fact_User_Cyber_Event AS f
JOIN Dim_User AS u
	ON f.User_ID = u.UserID
GROUP BY u.Department
ORDER BY Event_Count DESC;

/*Average quiz score per training module*/
/* Reveals which department’s users are most likely to click on phishing links relative to the number 
of phishing emails they receive.*/

SELECT 
    t.Module_Name,
    ROUND(AVG(CAST(f.Quiz_Score AS FLOAT)), 2) AS Module_Average
FROM Fact_User_Cyber_Event AS f
JOIN Dim_Training AS t
    ON f.Training_ID = t.TrainingID
GROUP BY t.Module_Name
ORDER BY Module_Average DESC;

/*Department with highest phishing click rate*/
/*Indicates how effective each training module is by showing the proportion of users who pass versus fail.*/

SELECT 
    u.Department,
    SUM(CASE 
        WHEN e.Event_Name = 'Phishing Click - Manual' THEN 1 
        ELSE 0 
    END) AS Clicks,
    SUM(CASE 
        WHEN e.Event_Name = 'Phishing Click - Tracked' THEN 1 
        ELSE 0 
    END) AS Emails
FROM Dim_User u
LEFT JOIN Fact_User_Cyber_Event f
    ON f.User_ID = u.UserID
LEFT JOIN Dim_Event_Type e
    ON f.Event_Type_ID = e.Event_TypeID
GROUP BY u.Department;

/*Pass vs Fail rate per training module*/
/*Shows the average performance of users on quizzes for each training module, highlighting which 
modules are better understood.*/

SELECT 
    t.Module_Name,
    COUNT(*) AS Total_Attempts,
    
    SUM(CASE WHEN f.Passed_Flag = 1 THEN 1 ELSE 0 END) AS Passed_Count,
    SUM(CASE WHEN f.Passed_Flag = 0 THEN 1 ELSE 0 END) AS Failed_Count,

    CAST(SUM(CASE WHEN f.Passed_Flag = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) 
         AS DECIMAL(5,2)) AS Pass_Rate_Percentage,

    CAST(SUM(CASE WHEN f.Passed_Flag = 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) 
         AS DECIMAL(5,2)) AS Fail_Rate_Percentage

FROM Fact_User_Cyber_Event f
JOIN Dim_Training t
    ON f.Training_ID = t.TrainingID
GROUP BY t.Module_Name
ORDER BY Pass_Rate_Percentage;

/*Find top 10 highest risk users*/
/*Identifies the individuals with the greatest cumulative risk scores, spotlighting users who pose the highest 
cybersecurity risk.*/
SELECT TOP 10
    u.User_Name,
    u.Department,
    u.Role,
    SUM(CAST(f.Risk_Weight AS float)) AS Total_Risk_Score,
    COUNT(f.EventID) AS Event_Count
FROM Fact_User_Cyber_Event f
JOIN Dim_User u
    ON f.User_ID = u.UserID
GROUP BY u.User_Name, u.Department, u.Role
ORDER BY Total_Risk_Score DESC;

/* Cybersecurity events trend across the year*/
/* Shows how the volume of cybersecurity events fluctuates month by month, revealing seasonal or 
periodic patterns.*/

SELECT 
    d.Year,
    d.Month,
    d.Month_Name,
    COUNT(f.EventID) AS Total_Events
FROM Fact_User_Cyber_Event f
JOIN Dim_Date d
    ON f.Date_ID = d.DateID
GROUP BY d.Year, d.Month, d.Month_Name
ORDER BY d.Year, d.Month;

/* Most common threat types users face*/
/*Highlights which threat categories occur most frequently, helping prioritize defense and awareness efforts.*/

SELECT 
    t.Threat_Type,
    t.Severity,
    COUNT(f.EventID) AS Threat_Event_Count
FROM Fact_User_Cyber_Event f
INNER JOIN Dim_Threat t
    ON f.Threat_ID = t.ThreatID
GROUP BY t.Threat_Type, t.Severity
ORDER BY Threat_Event_Count DESC;

/*Full detailed view of every event with all dimension details*/
/*Provides a comprehensive record of each event, combining user, date, event type, module, and threat 
information for complete analysis.*/

SELECT 
    f.EventID,
    f.Quiz_Score,
    f.Passed_Flag,
    f.Clicked_Flag,
    f.Reported_Flag,
    f.Risk_Weight,

    -- User details
    u.UserID,
    u.User_Name,
    u.Email,
    u.Department,
    u.Role,
    u.Location,
    u.Employment_Type,
    u.Join_Date,
    u.Status,

    -- Date details
    d.DateID,
    d.Day,
    d.Month,
    d.Year,
    d.Month_Name,
    d.Week,

    -- Event type details
    et.Event_TypeID,
    et.Event_Name,
    et.Event_Category,

    -- Training details
    tt.TrainingID,
    tt.Module_Name,
    tt.Category AS Training_Category,
    tt.Difficulty_Level,
    tt.Duration_Minutes,

    -- Threat details
    t.ThreatID,
    t.Threat_Type,
    t.Severity,
    t.Description

FROM Fact_User_Cyber_Event f
INNER JOIN Dim_User u
    ON f.User_ID = u.UserID
INNER JOIN Dim_Date d
    ON f.Date_ID = d.DateID
INNER JOIN Dim_Event_Type et
    ON f.Event_Type_ID = et.Event_TypeID
LEFT JOIN Dim_Training tt
    ON f.Training_ID = tt.TrainingID
LEFT JOIN Dim_Threat t
    ON f.Threat_ID = t.ThreatID
ORDER BY f.EventID;
