# Cybersecurity Awareness Analytics

## Project Overview

This project is an end-to-end **data engineering and analytics solution** designed to measure and improve cybersecurity awareness within an organization.

It focuses on analyzing **user behavior**, identifying **security risks**, and evaluating the effectiveness of **training programs** in reducing vulnerabilities such as phishing attacks and unsafe practices.

---

## Objectives

* Track user interactions related to cybersecurity awareness
* Measure risky behavior (e.g. phishing clicks, suspicious logins)
* Evaluate training effectiveness using quiz performance and engagement
* Develop a **risk scoring model** to identify high-risk users
* Provide actionable insights through a dashboard

---

## Data Model (Star Schema)

### Fact Table

**Fact_User_Cyber_Event**

* Stores all cybersecurity-related user events

### Dimension Tables

* **Dim_User** → User attributes (department, role, location)
* **Dim_Date** → Time-based analysis
* **Dim_Training** → Training modules and metadata
* **Dim_Threat** → Threat types and severity
* **Dim_Event_Type** → Categorisation of events (Training, Risk, Awareness)

---

## Relationships

* One-to-many relationships between dimensions and fact table

---

##  Key Metrics & KPIs

* Risk Score per user
* Phishing Click Rate
* Training Completion Rate
* Quiz Performance (Pass/Fail)
* Department Risk Ranking
* Awareness Impact (Before vs After Training)

---

##  Risk Scoring Model

The platform assigns a **risk weight** to each event:

```
phishing_click        = +5
quiz_failed           = +3
suspicious_login      = +4
training_completed    = -2
phishing_reported     = -3
```

This allows calculation of:

* Individual risk scores
* Department-level risk exposure
* Behavioral trends over time

---

##  Tech Stack

* **SQL Server** → Data warehouse & transformations
* **Python** → Data simulation (Pandas, Faker)
* **Power BI** → Dashboard & visualization
* **GitHub** → Version control & portfolio

---

##  Project Structure

```
Cybersecurity-Awareness-Analytics/
│
├── data/                  # Raw & simulated data
├── sql/
│   ├── create_tables.sql
│   ├── transformations.sql
│
├── python/
│   └── data_generator.py
│
├── dashboard/
│   └── screenshots/
│
├── README.md
```
---

##  Business Impact

This project demonstrates how organizations can:

* Identify vulnerable users and departments
* Measure the effectiveness of cybersecurity training
* Reduce human-related security risks
* Improve overall cybersecurity posture

---

##  Author

**Hlekane Ngobeni**
Data & IT Professional | Aspiring Data Engineer
Focused on building data-driven solutions for security, operations, and social impact

---
