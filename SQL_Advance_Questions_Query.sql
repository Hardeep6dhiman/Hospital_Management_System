USE HMS_DB

SELECT * FROM Doctors
SELECT * FROM Patients
SELECT * FROM Appointments
SELECT * FROM Billing
SELECT * FROM Deapartments
SELECT * FROM Medical_records
SELECT * FROM Medications
SELECT * FROM Lab_Tests
SELECT * FROM Test_Results
SELECT * FROM Rooms
SELECT * FROM Staff

--1.  Find the total number of appointments, grouped by doctor and their respective department, for appointments that are either 'Completed' or 'Pending'.


WITH CTE_App AS (
	SELECT a.Doctor_id,a.App_Status,d.Dept_id
	FROM Appointments a
	JOIN
	Doctors d
	ON a.Doctor_id=d.Doctor_id
	WHERE a.App_Status IN('Completed','Pending')
)
SELECT d.First_name,d.Last_name,dpt.Dept_name,COUNT(c.App_Status) AS Total_Appointments
FROM CTE_App c
JOIN Doctors d ON c.Doctor_id=d.Doctor_id
JOIN Deapartments dpt ON c.Dept_id=dpt.Dept_id
GROUP BY d.First_name,d.Last_name,dpt.Dept_name

--2. List all doctors with their specializations, and the average bill amount generated from their completed appointments.

WITH CTE_Doc AS(
	SELECT d.Doctor_id,d.First_name,d.Last_name,d.Specialization,b.Total_amount
	FROM Doctors d
	JOIN Appointments a ON d.Doctor_id=a.Doctor_id
	JOIN Billing b ON a.App_id=b.App_id
	WHERE a.App_Status='Completed' AND b.Payment_status='Paid')
SELECT First_name, Last_name, Specialization, AVG(Total_amount) AS Total_Bill
FROM CTE_Doc
GROUP BY First_name, Last_name, Specialization

--3. Find patients who have seen doctors in more than one department.

WITH CTE_pat AS (
	SELECT d.Dept_id,a.Patient_id
	FROM Appointments a
	JOIN Doctors d ON a.Doctor_id=d.Doctor_id
	GROUP BY d.Dept_id,a.Patient_id
)
SELECT p.First_name,p.Last_name
FROM Patients p
JOIN CTE_pat cp ON p.Patient_id=cp.Patient_id
GROUP BY p.First_name,p.Last_name
HAVING COUNT(DISTINCT cp.Dept_id)>1

--4. For each patient, list their doctors and how many different medications were prescribed by each doctor.

WITH CTE_Med_Pre AS (
	SELECT m.Patient_id,m.Doctor_id,COUNT(DISTINCT m.Med_id) as Med_Count
	FROM Medications m
	GROUP BY m.Patient_id,m.Doctor_id
)
SELECT p.First_name,p.Last_name,CONCAT(d.First_name,d.Last_name) AS Doc_name, mp.Med_Count
FROM Patients p 
JOIN CTE_Med_Pre mp ON p.Patient_id=mp.Patient_id 
JOIN Doctors d ON mp.Doctor_id=d.Doctor_id

--5. List the most frequent diagnosis given by each doctor along with the count.

WITH CTE_Fre_Dia AS (
	SELECT mr.Doctor_id,mr.Diagnosis, COUNT(*) AS Diagnosis_Count
	FROM Medical_records mr
	GROUP BY  mr.Doctor_id,mr.Diagnosis)
SELECT d.First_name,d.Last_name,cfd.Diagnosis,MAX(cfd.Diagnosis_Count) AS Diagnosis_Count
FROM Doctors d
JOIN CTE_Fre_Dia cfd ON d.Doctor_id=cfd.Doctor_id
GROUP BY d.First_name,d.Last_name,cfd.Diagnosis
ORDER BY Diagnosis_Count DESC

--6. Find doctors who have treated patients from every department (i.e., doctors who have treated at least one patient from each department).

WITH CTE_Tre_Pat AS (
	SELECT d.Doctor_id,dpt.Dept_id
	FROM Doctors d
	JOIN Appointments a ON d.Doctor_id=a.Doctor_id
	JOIN Patients p ON a.Patient_id=p.Patient_id
	JOIN Deapartments dpt ON d.Dept_id=dpt.Dept_id
	GROUP BY d.Doctor_id,dpt.Dept_id)
SELECT CONCAT (d.First_name,d.Last_name) AS Doc_name,d.Doctor_id 
FROM Doctors d
JOIN CTE_Tre_Pat ctp ON d.Doctor_id=ctp.Doctor_id
GROUP BY d.First_name,d.Last_name,d.Doctor_id
HAVING COUNT(DISTINCT ctp.Dept_id) = (SELECT COUNT(*) FROM Deapartments)

--7. Find the patient with the highest total bill amount across all departments, and the department where they spent the most.

WITH Patient_Bills_CTE AS (
    SELECT B.Patient_id, D.Dept_id, SUM(B.Total_amount) AS Total_Bill
    FROM Billing B
    JOIN Appointments A ON B.App_id = A.App_id
    JOIN Doctors D ON A.Doctor_id = D.Doctor_id
    WHERE B.Payment_status = 'Paid'
    GROUP BY B.Patient_id, D.Dept_id
)
SELECT TOP 1 CONCAT (P.First_name, P.Last_name) AS Patient_name, Dep.Dept_name, PB.Total_Bill
FROM Patient_Bills_CTE PB
JOIN Patients P ON PB.Patient_id = P.Patient_id
JOIN Deapartments Dep ON PB.Dept_id = Dep.Dept_id
ORDER BY PB.Total_Bill DESC








