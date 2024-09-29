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

--1. Find all the patients who have the appointment "Pending".

SELECT p.First_name,p.Last_name,a.App_date,a.App_Status
FROM Patients as p
JOIN 
Appointments as a
ON p.Patient_id=a.Patient_id
WHERE a.App_Status='Pending'

--2. Which patients visited Cardiologist?

SELECT p.First_name,p.Last_name,a.App_date,d.Specialization
FROM Patients p
JOIN
Appointments a
ON p.Patient_id=a.Patient_id
JOIN
Doctors d
ON d.Doctor_id=a.Doctor_id
WHERE d.Specialization = 'Cardiologist'

--3. Show all patients who were prescribed "Ibuprofen".

SELECT p.First_name,p.Last_name,mr.Prescription
FROM Patients p
JOIN
Medical_records mr
ON p.Patient_id=mr.Patient_id
WHERE mr.Prescription='Ibuprofen'

--4. List all completed appointments with patient name and doctors name.

SELECT p.First_name,p.Last_name,a.App_date,d.First_name,d.Last_name
FROM Patients p
JOIN
Appointments a
ON p.Patient_id=a.Patient_id
JOIN
Doctors d
ON a.Doctor_id=d.Doctor_id
WHERE a.App_Status='Completed'

--5. Find the next available appointment for Dr. Alice Taylor.

SELECT a.App_date,a.App_time
FROM Appointments a
JOIN
Doctors d
ON a.Doctor_id=d.Doctor_id
WHERE d.First_name='Alice' AND d.Last_name='Taylor' AND a.App_Status='Pending'
ORDER BY a.App_date,a.App_time

--6. How many doctors are there in each department?

SELECT dpt.Dept_name,COUNT(d.Doctor_id) AS Doctors
FROM Deapartments dpt
JOIN
Doctors d
ON dpt.Dept_id=d.Dept_id
GROUP BY dpt.Dept_name
ORDER BY dpt.Dept_name

--7. Find the doctor who attended the most patients.

SELECT TOP 1 d.First_name,d.Last_name,COUNT(a.Patient_id) AS Patient_count
FROM Appointments a
JOIN 
Doctors d
ON a.Doctor_id=d.Doctor_id
GROUP BY d.First_name,d.Last_name
ORDER BY Patient_count DESC

--8. List all bills that are unpaid and the total amount due.

SELECT p.First_name,p.Last_name,b.Bill_id,SUM(b.Total_amount) AS Due_Amount
FROM Billing b
JOIN
Patients p
ON b.Patient_id=p.Patient_id
WHERE b.Payment_status='Unpaid'
GROUP BY p.First_name,p.Last_name,b.Bill_id
ORDER BY Due_Amount

--9. Calculate the total revenue generated from paid bills.

SELECT SUM(Total_amount) AS Total_Revenue
FROM Billing
WHERE Payment_status='Paid'

--10. Show the diagnosis and treatment details for patient 'John Doe'.

SELECT p.First_name,p.Last_name,mr.Diagnosis,mr.Treatment
FROM Medical_records mr
JOIN
Patients p
ON mr.Patient_id=p.Patient_id
WHERE p.First_name='John' AND p.Last_name='Doe'

--11. Which doctors have diagnosed 'Hypertension'?

SELECT DISTINCT d.First_name,d.Last_name, mr.Diagnosis
FROM Medical_records mr
JOIN 
Doctors d
ON mr.Doctor_id=d.Doctor_id
WHERE mr.Diagnosis='Hypertension'

--12. List all available rooms with their type and department.

SELECT r.Room_no,r.Room_type,dpt.Dept_name
FROM Rooms r
JOIN
Deapartments dpt
ON r.Dept_id=dpt.Dept_id
WHERE r.Availability_status='Available'

--13. Which departments have staff members with the role of 'Nurse'?

SELECT s.Staff_id,s.First_name,s.Last_name,s.Staff_Role,dpt.Dept_name
FROM Staff s
JOIN 
Deapartments dpt
ON s.Dept_id=dpt.Dept_id
WHERE s.Staff_Role='Nurse'

--14. List all patients who had an MRI test.

SELECT lt.Test_name,p.First_name,p.Last_name
FROM Lab_Tests lt
JOIN
Patients p
ON lt.Patient_id=p.Patient_id
WHERE lt.Test_name='MRI'

--15. Find all test results for patient 'Jane Smith'.

SELECT lt.Test_name,lt.Test_Description,tr.Result,tr.Test_date
FROM Test_Results tr
JOIN 
Lab_Tests lt
ON lt.Test_id=tr.Test_id
JOIN
Patients p
ON tr.Patient_id=p.Patient_id
WHERE p.First_name='Jane' AND p.Last_name='Smith'

--16. Which patient has spent the most money on their bills?

SELECT TOP 1 p.Patient_id,p.First_name,p.Last_name,SUM(b.Total_amount) AS Total_Spent
FROM Billing b
JOIN
Patients p
ON b.Patient_id=p.Patient_id
WHERE b.Payment_status='Paid'
GROUP BY p.Patient_id,p.First_name,p.Last_name
ORDER BY Total_Spent DESC

--17. What is the average cost of medication prescribed by each doctor?

SELECT d.Doctor_id,d.First_name,d.Last_name,AVG(m.Cost) AS Avg_Cost
FROM Medications m
JOIN
Doctors d
ON M.Doctor_id=d.Doctor_id
GROUP BY d.Doctor_id,d.First_name,d.Last_name

--18. List all tests performed by a specific doctor ('Dr. David Wilson').

SELECT lt.Test_id,lt.Test_name,lt.Test_Description
FROM Lab_Tests lt
JOIN
Doctors d
ON lt.Doctor_id=d.Doctor_id
WHERE d.First_name='David' AND d.Last_name='Wilson'

--19. Find patients who were prescribed medication that costs more than $5.

SELECT p.Patient_id,p.First_name,p.Last_name,m.Med_name,m.Cost
FROM Medications m
JOIN
Patients p
ON m.Patient_id=p.Patient_id
WHERE m.Cost>5

