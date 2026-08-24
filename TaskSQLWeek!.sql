-- Part 1 :  Create Database
CREATE DATABASE HospitalDB;
USE HospitalDB;


--Part 2 : Create Tables 

CREATE TABLE Patients
(
PatientID  INT Primary Key Identity (1,1),
 FirstName NVARCHAR(50) Not null ,
 LastName  NVARCHAR(50)  not null,
 Gender NVARCHAR(10) not null ,
 Age INT ,
 City  NVARCHAR(50) ,
Phone  VARCHAR(20) 

);

CREATE TABLE Doctors(

DoctorID INT Primary Key Identity(1,1) ,
 DoctorName NVARCHAR(100) Not null,
 Specialty NVARCHAR(100) Not null,
 Salary  DECIMAL(10,2)

);

CREATE TABLE Departments(

DepartmentID  INT Primary Key Identity (1,1),
 DepartmentName NVARCHAR(100) Not null ,
 Location  NVARCHAR(100)

);

CREATE TABLE  Appointments
(AppointmentID INT Primary Key Identity (1,1),
 PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
DoctorID INT   FOREIGN KEY REFERENCES  Doctors (DoctorID),
 DepartmentID INT FOREIGN KEY REFERENCES  Departments(DepartmentID), 
AppointmentDate  DATE Not null ,
Fee  DECIMAL(10,2) ,
 Status  NVARCHAR(30) 

 );

 -- Part 3: Insert Into Tables
 -- Insert 10 Patients 
INSERT INTO Patients (FirstName, LastName, Gender, Age, City, Phone) VALUES
(N'أحمد', N'محمود', N'ذكر', 45, N'القاهرة', '01012345678'),
(N'مريم', N'علي', N'أنثى', 28, N'القاهرة', '01123456789'),
(N'عمر', N'حسين', N'ذكر', 60, N'الفيوم', '01234567890'),
(N'سارة', N'إبراهيم', N'أنثى', 52, N'الإسكندرية', '01098765432'),
(N'خالد', N'مصطفى', N'ذكر', 35, N'الفيوم', '01187654321'),
(N'فاطمة', N'حسن', N'أنثى', 22, N'الجيزة', '01287654321'),
(N'علي', N'رضا', N'ذكر', 65, N'القاهرة', '01055554444'),
(N'أميرة', N'طارق', N'أنثى', 41, N'المنصورة', '01144443333'),
(N'مصطفى', N'كمال', N'ذكر', 55, N'طنطا', '01233332222'),
(N'منى', N'سعيد', N'أنثى', 30, N'القاهرة', '01022221111');

-- Insert 5 Doctors 
INSERT INTO Doctors (DoctorName, Specialty, Salary) VALUES
(N'د. حازم العبد', N'أمراض القلب', 25000.00),
(N'د. شريف زكي', N'مخ وأعصاب', 22000.00),
(N'د. نادين يوسف', N'أطفال', 18000.00),
(N'د. وهيب فاروق', N'عظام', 15000.00),
(N'د. هناء العشري', N'أمراض القلب', 21000.00);

-- Insert 4 Departments 
INSERT INTO Departments (DepartmentName, Location) VALUES
(N'قسم القلب', N'المبنى أ - الدور الأول'),
(N'قسم المخ والأعصاب', N'المبنى أ - الدور الثاني'),
(N'قسم الأطفال', N'المبنى ب - الدور الأول'),
(N'قسم العظام', N'المبنى ب - الدور الثاني');

-- Insert 15 Appointments
INSERT INTO Appointments (PatientID, DoctorID, DepartmentID, AppointmentDate, Fee, Status) VALUES
(1, 1, 1, '2026-01-10', 1200.00, N'مكتمل'),
(2, 2, 2, '2026-01-12', 800.00, N'مكتمل'),
(3, 1, 1, '2026-01-15', 1500.00, N'مكتمل'),
(4, 3, 3, '2026-01-18', 400.00, N'ملغى'),
(5, 4, 4, '2026-01-20', 600.00, N'مكتمل'),
(6, 2, 2, '2026-01-22', 900.00, N'قيد الانتظار'),
(7, 1, 1, '2026-01-25', 2000.00, N'مكتمل'),
(8, 3, 3, '2026-01-28', 450.00, N'مكتمل'),
(1, 2, 2, '2026-02-01', 1000.00, N'مكتمل'),
(2, 1, 1, '2026-02-03', 1300.00, N'مكتمل'),
(9, 4, 4, '2026-02-05', 550.00, N'مكتمل'),
(10, 5, 1, '2026-02-08', 1100.00, N'مكتمل'),
(3, 5, 1, '2026-02-10', 1400.00, N'مكتمل'),
(5, 1, 1, '2026-02-12', 1600.00, N'مكتمل'),
(7, 2, 2, '2026-02-15', 850.00, N'مكتمل');

--Part 4:  Basic Queries
SELECT * FROM Patients;

SELECT * FROM Doctors;

SELECT * FROM Departments;

SELECT * FROM Appointments;

SELECT FirstName + N' ' + LastName AS PatientName, City 
FROM Patients;

SELECT DoctorName, Specialty
FROM Doctors;


--Part 5 : WHERE & Operators 

--1 Patients older than 50

SELECT FirstName + N' ' + LastName AS PatientName , Age
FROM Patients
WHERE Age >=50 ;

--2 Patients from Cairo.

SELECT FirstName + N' ' + LastName AS PatientName , City
FROM Patients
WHERE City =N'القاهرة' ;

--3 Patients from Fayoum. 

SELECT FirstName + N' ' + LastName AS PatientName , City
FROM Patients
WHERE City =N'الفيوم' ;

--4. Doctors with salary greater than 20,000. 
SELECT DoctorName, Salary
FROM Doctors
WHERE Salary > 20000;

--5 Appointments with fees between 500 and 2,000. 
SELECT * FROM Appointments 
WHERE Fee BETWEEN 500 AND 2000;

--6 Patients whose names start with أ.
SELECT * FROM Patients 
WHERE FirstName LIKE N'أ%';


--7 Doctors specializing in Cardiology or Neurology. 
SELECT DoctorName ,Specialty
FROM Doctors 
WHERE Specialty IN (N'أمراض القلب', N'مخ وأعصاب');


--8 Appointments with status Completed. 

SELECT AppointmentID , Status 
FROM Appointments 
WHERE Status = N'مكتمل'


-- Part 6 — ORDER BY & TOP 
--1 Display patients from youngest to oldest. 

SELECT * FROM Patients
ORDER BY Age ASC;


-- 2 Display doctors from highest salary to lowest
SELECT * FROM Doctors
ORDER BY Salary DESC;

-- 3 Display the 3 highest-paid doctors 
SELECT TOP 3 * FROM Doctors
ORDER BY Salary DESC;

-- 4 Display the 5 most expensive appointments
SELECT TOP 5 * FROM Appointments
ORDER BY Fee DESC;



-- Part 7: Aggregate Functions
-- 1 How many patients are there? 
SELECT COUNT(*) AS NUMBEROFPatients FROM Patients;

-- 2 What is the average patient age?
SELECT AVG(Age) As AVGAGEOFPATIENT FROM Patients;

-- 3 What is the oldest patient age?
SELECT MAX(Age) As MAXAGEOFPATIENT FROM Patients;

--4What is the youngest patient age?
SELECT MIN(Age) As MINAGEOFPATIENT FROM Patients;

-- 5 What is the highest doctor salary?
SELECT MAX(Salary) AS MAXDOCTORSALARY FROM Doctors;

-- 6 What is the average doctor salary?
SELECT AVG(Salary) AS AVGDOCTORSALARY FROM Doctors;


-- 7 What is the total appointment revenue?
SELECT SUM(Fee) AS TOTALREVENUE FROM Appointments;


--8 What is the average appointment fee?
SELECT AVG(Fee) AS AvgAppointmentFee FROM Appointments;



-- Part 8: GROUP BY & HAVING

-- 1 Count patients by city
SELECT City, COUNT(*) AS NUMBEROFPATIENTS
FROM Patients 
GROUP BY City;

-- 2 Count doctors by specialty
SELECT Specialty, COUNT(*) AS NUMBEROFDOCTORS 
FROM Doctors 
GROUP BY Specialty;

-- 3 Count appointments by department
SELECT DepartmentID, COUNT(*) AS NUMOFAPPOINTMENTS
FROM Appointments 
GROUP BY DepartmentID;

-- 4 Calculate average appointment fee by department
SELECT DepartmentID, AVG(Fee) AS AVGFEE
FROM Appointments
GROUP BY DepartmentID;

--5. Find departments with more than 3 appointments. 

SELECT DepartmentID, COUNT(*) AS APPOINMENTSCOUNT
FROM Appointments 
GROUP BY DepartmentID 
HAVING COUNT(*) > 3;


-- 6. Find specialties with an average salary greater than 15,000
SELECT Specialty, AVG(Salary) AS AVGSALARY
FROM Doctors 
GROUP BY Specialty 
HAVING AVG(Salary) > 15000;


--Part 9 :  INNER JOIN


--1 Patient name + appointment date
SELECT  Patients.FirstName + N' ' + Patients.LastName AS PatientName ,  Appointments.AppointmentDate 
FROM Patients INNER JOIN Appointments 
ON Patients.PatientID= Appointments.PatientID;



-- 2. Patient name + doctor name
SELECT Patients.FirstName + N' ' + Patients.LastName AS PatientName , Doctors.DoctorName
FROM Patients INNER JOIN Appointments 
ON Patients.PatientID= Appointments.PatientID
INNER JOIN Doctors
ON Appointments.DoctorID = Doctors.DoctorID;




--3. Doctor name + specialty + appointment date
SELECT  Doctors.DoctorName ,  Doctors. specialty ,Appointments.AppointmentDate
FROM  Doctors INNER JOIN Appointments 
ON Doctors.DoctorID= Appointments.DoctorID;



-- 4. Patient + Doctor + Department + Appointment Date + Fee
SELECT Patients.FirstName + N' ' + Patients.LastName AS PatientName ,
Doctors.DoctorName,
Departments.DepartmentName ,
Appointments.AppointmentDate ,Appointments.Fee
FROM Appointments 
INNER JOIN Patients 
ON  Appointments.PatientID =Patients.PatientID
INNER JOIN Doctors
ON Appointments.DoctorID = Doctors.DoctorID
INNER JOIN Departments
ON Appointments.DepartmentID = Departments.DepartmentID;



-- 5. Patient + Doctor + Appointment Status. 
SELECT Patients.FirstName + N' ' + Patients.LastName AS PatientName ,
Doctors.DoctorName,
Appointments.Status
FROM Appointments 
INNER JOIN Patients 
ON  Appointments.PatientID =Patients.PatientID
INNER JOIN Doctors
ON Appointments.DoctorID = Doctors.DoctorID;





-- Part 10 : LEFT JOIN 
--1. Display all doctors and their appointments. 

SELECT Doctors.DoctorName ,
Appointments.AppointmentID,Appointments.AppointmentDate
FROM Doctors LEFT JOIN Appointments
ON Appointments.DoctorID = Doctors.DoctorID;


--2. Find doctors who have no appointments.

SELECT Doctors.DoctorName ,
Appointments.AppointmentID
FROM Doctors LEFT JOIN Appointments
ON Appointments.DoctorID = Doctors.DoctorID
WHERE Appointments.AppointmentID IS NULL ;


--3. Display all departments and their appointments. 


SELECT Departments.DepartmentName ,
Appointments.AppointmentID,Appointments.AppointmentDate
FROM Departments LEFT JOIN Appointments
ON Appointments.DepartmentID = Departments.DepartmentID;


--4. Find departments with no appointments
SELECT Departments.DepartmentName
FROM Departments LEFT JOIN Appointments
ON Appointments.DepartmentID = Departments.DepartmentID
WHERE AppointmentID IS NULL ;





-- Part 11: Subqueries
--1. Find patients older than the average patient age. 

SELECT * FROM Patients 
WHERE Age > 
(

SELECT AVG(Age)
 FROM Patients

);


-- 2. Find doctors earning more than the average doctor salary
SELECT * FROM Doctors 
WHERE Salary > 
(

SELECT AVG(Salary)
FROM Doctors
);

-- 3. Find appointments with a fee greater than the average appointment fee
SELECT * FROM Appointments 
WHERE Fee > 
(
SELECT AVG(Fee)
FROM Appointments

);

-- 4. Find the doctor with the highest salary
SELECT * FROM Doctors 
WHERE Salary = 
(
SELECT MAX(Salary)
FROM Doctors

);


-- Part 12: EXISTS

-- 1.Find patients who have at least one appointment
SELECT * FROM Patients 
WHERE EXISTS 
(SELECT 1 FROM Appointments
WHERE Appointments .PatientID = Patients.PatientID

);


-- 2. Find patients who have no appointments
SELECT * FROM Patients 
WHERE NOT EXISTS 
(
SELECT 1 FROM Appointments  
WHERE Appointments .PatientID = Patients.PatientID
);


-- 3 Find doctors who have at least one appointment
SELECT * FROM Doctors 
WHERE EXISTS 
(
SELECT 1 FROM Appointments 
WHERE  Appointments .DoctorID = Doctors.DoctorID

);



-- Part 13: Business Questions

-- 1.Who is the Oldest patient?
SELECT TOP 1 FirstName + N' ' + LastName AS THEOLDESTPATIENT, Age
FROM Patients 
ORDER BY Age DESC;


-- 2.Who is the youngest patient?
SELECT TOP 1 FirstName + N' ' + LastName AS THEYOUNGESTPATIENT, Age 
FROM Patients 
ORDER BY Age ASC;


-- 3. Who is the highest-paid doctor?
SELECT TOP 1 DoctorName, Salary 
FROM Doctors
ORDER BY Salary DESC;



-- 4.Which specialty has the most doctors?
SELECT TOP 1 Specialty, COUNT(*) AS NUMBEROFDOCTORS 
FROM Doctors 
GROUP BY Specialty 
ORDER BY  NUMBEROFDOCTORS  DESC;



-- 5. Which city has the most patients?
SELECT TOP 1 City, COUNT(*) AS PatientCount
FROM Patients
GROUP BY City 
ORDER BY PatientCount DESC;


-- 6.Which department has the most appointments?
SELECT TOP 1 Departments.DepartmentName, COUNT(*) AS TOTALAPPOINMENTS
FROM Appointments
INNER JOIN Departments  ON Appointments.DepartmentID =  Departments.DepartmentID
GROUP BY  Departments.DepartmentName
ORDER BY  TOTALAPPOINMENTS DESC;



-- 7. What is the total hospital appointment revenue?
SELECT SUM(Fee) AS TOTALREVENUE
FROM Appointments;



-- 8. What is the average appointment fee?
SELECT AVG(Fee) AS AVGFEE
FROM Appointments;


--9.Which doctor has the most appointments?
SELECT TOP 1 Doctors.DoctorName, COUNT(*) AS TOTALAPPOINMENTS
FROM Appointments INNER JOIN Doctors 
ON Appointments.DoctorID = Doctors .DoctorID
GROUP BY  Doctors .DoctorName
ORDER BY TOTALAPPOINMENTS DESC;



-- 10.Which patients have more than one appointment?
SELECT Patients .FirstName + N' ' + Patients .LastName AS PatientName, COUNT(*) AS  APPOINMENTSCOUNT
FROM Appointments INNER JOIN Patients 
ON Appointments .PatientID = Patients .PatientID
GROUP BY Patients .FirstName, Patients .LastName
HAVING COUNT(*) > 1;



-- 11. Which doctors have no appointments?
SELECT DoctorName FROM Doctors 
WHERE NOT EXISTS
(
SELECT 1 FROM Appointments 
WHERE Appointments .DoctorID =  Doctors.DoctorID
);



-- 12.Which departments have more than 3 appointments?
SELECT Departments.DepartmentName, COUNT(*) AS APPOINMENTSCOUNT
FROM Appointments INNER JOIN Departments 
ON Appointments.DepartmentID = Departments.DepartmentID
GROUP BY Departments.DepartmentName
HAVING COUNT(*) > 3;



-- 13. Which patients are older than the average patient?
SELECT FirstName + N' ' + LastName AS PatientName, Age
FROM Patients 
WHERE Age > 
(SELECT AVG(Age) 
FROM Patients
);


-- 14. Which doctors earn more than the average salary?
SELECT DoctorName, Salary
FROM Doctors 
WHERE Salary > 
(
SELECT AVG(Salary)
FROM Doctors

);


-- 15. Display a complete report containing Patient, Doctor, Specialty, Department, Date, Fee, and Status.
SELECT 
Patients.FirstName+N' '+ Patients.LastName  AS PatientName ,
Doctors.DoctorName ,Doctors.Specialty ,
Departments.DepartmentName,
Appointments.AppointmentDate,
Appointments.Fee,
Appointments.Status
FROM Appointments 
INNER JOIN Patients 
ON Patients.PatientID = Appointments.PatientID
INNER JOIN Doctors
ON Doctors.DoctorID = Appointments.DoctorID
INNER JOIN Departments
ON Departments.DepartmentID = Appointments.DepartmentID















