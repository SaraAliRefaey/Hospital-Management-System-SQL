# 🏥 Hospital Management System - SQL Analysis

## 📌 Project Overview
This project demonstrates an end-to-end **Relational Database Design & Data Analysis** for a Hospital Management System using **SQL Server (T-SQL)**. 
It covers database creation, schema design, relational integrity, data insertion, and solving **15+ real-world business questions** using advanced SQL techniques.

---

## 🛠️ Database Schema & Architecture
The system consists of **4 interconnected tables**:
- 👤 **Patients:** Patient demographics (Name, Gender, Age, City, Phone).
- 🩺 **Doctors:** Doctor profile and compensation (Name, Specialty, Salary).
- 🏢 **Departments:** Medical departments and hospital locations.
- 📅 **Appointments:** Transactional data (PatientID, DoctorID, DepartmentID, Date, Fee, Status).

---

## 💡 Key SQL Skills Demonstrated
- **DDL & DML:** `CREATE TABLE`, Primary Keys, Foreign Keys, `IDENTITY`, `INSERT INTO`.
- **Filtering & Aggregations:** `WHERE`, `LIKE`, `BETWEEN`, `ORDER BY`, `TOP`, `GROUP BY`, `HAVING`.
- **Joins:** Multi-table `INNER JOIN` and `LEFT JOIN` to identify missing records.
- **Subqueries & Logical Operators:** Scalar subqueries, `EXISTS`, and `NOT EXISTS`.
- **Business Intelligence (BI):** Querying financial revenue, doctor utilization, and patient demographics.

---

## 🔍 Key Insights & Sample Query Results
- **Top Revenue Generator:** Successfully aggregated hospital revenue and average appointment fees.
- **Workload Analysis:** Identified top doctors by appointment counts and departments with the highest visit volumes.
- **Unassigned Doctors/Departments:** Used `LEFT JOIN` and `NOT EXISTS` to discover doctors currently without active patient appointments.

---

## 📁 Repository Contents
```text
├── Hospital_Database_Queries.sql   # Full T-SQL script (Tables, Data, & Queries)
└── README.md                       # Project documentation
