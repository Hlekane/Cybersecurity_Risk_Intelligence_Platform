# Cybersecurity Risk Intelligence Platform

> An end-to-end data engineering and analytics project that transforms raw cybersecurity behavioural events into structured intelligence — supporting risk visibility, training effectiveness measurement, and data-driven security decisions.

![SQL Server](https://img.shields.io/badge/SQL_Server-Data_Warehouse-lightgrey?logo=microsoftsqlserver&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-Dashboard-F2C811?logo=powerbi&logoColor=black)
![Star Schema](https://img.shields.io/badge/Architecture-Star_Schema-8A4FFF)
![Domain](https://img.shields.io/badge/Domain-Cybersecurity_Analytics-E53935)

---

## Problem Statement

Most organisations have no structured way to quantify **human-driven cybersecurity risk**. Security teams cannot easily measure whether training is working, which departments are most vulnerable, or which users require immediate intervention — because the data exists but isn't modelled for analysis.

This project addresses those gaps through a structured analytics pipeline applied to simulated organisational behaviour data.

---

## Solution Overview

The platform follows a full **data engineering lifecycle** — from synthetic data generation through to an interactive Power BI dashboard.

```
Simulate data  →  Model schema  →  Build warehouse  →  SQL analytics  →  BI reporting
```

---

## Data Architecture

A **star schema** was designed for analytical scalability and reporting performance.

**Fact table**

| Table | Description |
|---|---|
| `Fact_User_Cyber_Event` | Central table storing all user behavioural events with foreign keys to all dimensions |

**Dimension tables**

| Table | Description |
|---|---|
| `Dim_User` | User attributes — department, role, location |
| `Dim_Training` | Training module details and pass thresholds |
| `Dim_Date` | Time intelligence for trend and period analysis |
| `Dim_Threat` | Threat classification and severity levels |
| `Dim_Event_Type` | Event taxonomy (phishing, login, training, etc.) |

---

## Risk Scoring Model

A weighted scoring approach quantifies user behaviour and enables aggregation at both user and department level.

| Event | Weight | Direction |
|---|---|---|
| `phishing_click` | 5 | Risk increase |
| `suspicious_login` | 4 | Risk increase |
| `quiz_failed` | 3 | Risk increase |
| `training_completed` | 2 | Risk reduction |
| `phishing_reported` | 3 | Risk reduction |

Scores are aggregated per user and rolled up to department level to produce a **Department Risk Index**.

---

## Analytics Layer

SQL-based analysis generates the following insights:

- **User risk scoring** — composite score derived from weighted behavioural events
- **Departmental risk profiling** — ranked risk index across all departments
- **Phishing analysis** — click-through rates by department, role, and time period
- **Training effectiveness** — module completion rates and quiz pass/fail ratios
- **High-risk user identification** — flagging users for targeted security intervention

---

## Key Metrics

| Metric | Description |
|---|---|
| User risk score | Weighted composite of behavioural risk signals per user |
| Phishing click rate | % of phishing simulations clicked, segmented by department |
| Training completion rate | % of assigned modules completed across the organisation |
| Quiz pass vs fail rate | Assessment outcomes per training module |
| Department risk index | Ranked risk score across all departments |

---

## Reporting (Power BI)

An interactive dashboard delivers:

- Department-level risk monitoring and drill-down
- Training performance tracking over time
- Behavioural trend analysis
- High-risk user identification for security intervention

---

## Repository Structure

```
Cybersecurity-Awareness-Analytics/
│
├── 01_project_architecture/     # Star schema diagram & system design
├── 02_project_documents/        # Requirements & planning documentation
├── 03_simulated_dataset/        # Synthetic CSV datasets
├── 04_sql_scripts/              # Schema creation, loading & analytical queries
├── 05_analysis_results/         # Query outputs & insight summaries
└── README.md
```

---

## Tech Stack

| Tool | Purpose |
|---|---|
| SQL Server | Data warehouse design, schema implementation, T-SQL querying |
| Power BI | Interactive dashboard |
| Python / ChatGPT | Synthetic dataset generation |
| Git / GitHub | Version control and project management |

---

## Business Value

This platform demonstrates how organisations can use data to:

- Detect high-risk users and departments before incidents occur
- Measure whether cybersecurity training is actually working
- Reduce human-related security incidents through targeted intervention
- Move from reactive to data-driven security decision-making

---

## Author

**Hlekane Ngobeni**  
Aspiring Data Engineer · Data Analyst · BI Enthusiast  
Building data-driven systems.

[![GitHub](https://img.shields.io/badge/GitHub-Profile-181717?logo=github)](https://github.com/)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?logo=linkedin)](https://linkedin.com/)
