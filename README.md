# 🔐 Cybersecurity Risk Intelligence Platform

![Status](https://img.shields.io/badge/Project-End--to--End%20BI-blue)
![SQL](https://img.shields.io/badge/SQL-Data%20Warehouse-lightgrey)
![PowerBI](https://img.shields.io/badge/PowerBI-Dashboard-yellow)
![Focus](https://img.shields.io/badge/Domain-Cybersecurity%20Analytics-red)

---

## 📌 Overview

The **Cybersecurity Risk Intelligence Platform** is an end-to-end data engineering and analytics project that simulates and analyses cybersecurity awareness behaviour within an organisation.

It transforms raw behavioural events into structured intelligence to support:

- 🔍 User-level risk visibility  
- 📊 Training effectiveness tracking  
- ⚠️ Departmental risk profiling  
- 📈 Security posture decision-making  

This project demonstrates applied skills in **data engineering, SQL warehousing, analytics, and BI reporting**.

---

## 🎯 Business Problem

Modern organisations struggle to quantify **human-driven cybersecurity risk**.

Key challenges include:

- No structured visibility of user risk behaviour  
- Limited measurement of training effectiveness  
- Difficulty identifying vulnerable departments  
- Lack of data-driven security decision-making  

This project addresses these gaps using a structured analytics pipeline.

---

## 🧠 Solution Approach

The solution follows a full **data engineering lifecycle**:

### 1. Data Simulation (Synthetic Layer)

Realistic cybersecurity behaviour datasets were generated, including:

- User activity events  
- Phishing interactions  
- Training records  
- Risk signals  

---

### 2. Data Architecture (Star Schema)

A dimensional model was designed for analytical scalability.

**Fact Table**
- `Fact_User_Cyber_Event`

**Dimension Tables**
- `Dim_User`
- `Dim_Training`
- `Dim_Date`
- `Dim_Threat`
- `Dim_Event_Type`

---

### 3. Data Warehouse (SQL Server)

Implemented using SQL Server:

- Schema design (Star Schema)
- Table creation and relationships
- Data loading (CSV ingestion)
- Schema refinement (ALTER operations)
- Analytical query development

---

### 4. Analytics Layer

Key insights generated using SQL:

- User risk scoring
- Department risk comparison
- Phishing click behaviour analysis
- Training pass vs fail rates
- Module performance trends

---

### 5. Reporting Layer (Power BI)

Interactive dashboard enabling:

- Department risk monitoring
- Training effectiveness tracking
- Behavioural trend analysis
- High-risk user identification

---

📊 Key Metrics
User Risk Score
Phishing Click Rate
Training Completion Rate
Quiz Pass vs Fail Rate
Department Risk Index
