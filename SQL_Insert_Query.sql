--1. Inserting data into Patients Table

INSERT INTO Patients (Patient_id, First_name, Last_name, DOB, Gender, Contact_number, Pat_add, Reg_date) VALUES
('P001', 'John', 'Doe', '1985-04-23', 'Male', '9876543210', '123 Main St', '2023-09-20'),
('P002', 'Jane', 'Smith', '1990-06-12', 'Female', '8765432109', '456 Oak Ave', '2023-09-22'),
('P003', 'Robert', 'Brown', '1978-11-08', 'Male', '7654321098', '789 Pine Blvd', '2023-09-23'),
('P004', 'Emily', 'Davis', '2001-02-14', 'Female', '6543210987', '321 Elm St', '2023-09-24'),
('P005', 'Michael', 'Johnson', '1995-03-25', 'Male', '5432109876', '654 Maple Dr', '2023-09-25')

--2. Inserting data into Departments Table

INSERT INTO Deapartments (Dept_id, Dept_name) VALUES
('D001', 'Cardiology'),
('D002', 'Neurology'),
('D003', 'Orthopedics'),
('D004', 'Pediatrics'),
('D005', 'Dermatology')

--3. Inserting data into Doctors Table

INSERT INTO Doctors (Doctor_id, First_name, Last_name, Specialization, Contact_no, Email_id, Dept_id) VALUES
('DOC001', 'Alice', 'Taylor', 'Cardiologist', '9876543211', 'alice.taylor@hospital.com', 'D001'),
('DOC002', 'David', 'Wilson', 'Neurologist', '8765432108', 'david.wilson@hospital.com', 'D002'),
('DOC003', 'Sophia', 'Lee', 'Orthopedic Surgeon', '7654321097', 'sophia.lee@hospital.com', 'D003'),
('DOC004', 'James', 'Moore', 'Pediatrician', '6543210986', 'james.moore@hospital.com', 'D004'),
('DOC005', 'Olivia', 'Martin', 'Dermatologist', '5432109875', 'olivia.martin@hospital.com', 'D005')

--4. Inserting data into Appointments Table

INSERT INTO Appointments (App_id, Patient_id, Doctor_id, App_date, App_time, App_Status) VALUES
('A001', 'P001', 'DOC001', '2023-09-25', '09:30:00', 'Completed'),
('A002', 'P002', 'DOC002', '2023-09-26', '10:00:00', 'Cancelled'),
('A003', 'P003', 'DOC003', '2023-09-27', '11:15:00', 'Pending'),
('A004', 'P004', 'DOC004', '2023-09-28', '12:00:00', 'Pending'),
('A005', 'P005', 'DOC005', '2023-09-29', '14:30:00', 'Completed')

--5. Inserting data into Medical_records Table

INSERT INTO Medical_records (Record_id, Patient_id, Doctor_id, Diagnosis, Treatment, Prescription, Visit_date) VALUES
('MR001', 'P001', 'DOC001', 'Hypertension', 'Lifestyle changes and medication', 'Lisinopril', '2023-09-25'),
('MR002', 'P002', 'DOC002', 'Migraine', 'Medication and stress management', 'Sumatriptan', '2023-09-26'),
('MR003', 'P003', 'DOC003', 'Knee pain', 'Physical therapy', 'Ibuprofen', '2023-09-27'),
('MR004', 'P004', 'DOC004', 'Flu', 'Rest and fluids', 'Paracetamol', '2023-09-28'),
('MR005', 'P005', 'DOC005', 'Acne', 'Topical treatment', 'Benzoyl peroxide', '2023-09-29')

--6. Inserting data into Billing Table

INSERT INTO Billing (Bill_id, Patient_id, App_id, Bill_date, Total_amount, Payment_status, Payment_mode) VALUES
('B001', 'P001', 'A001', '2023-09-25', 200, 'Paid', 'Card'),
('B002', 'P002', 'A002', '2023-09-26', 150, 'Unpaid', 'Insurance'),
('B003', 'P003', 'A003', '2023-09-27', 100, 'Pending', 'Cash'),
('B004', 'P004', 'A004', '2023-09-28', 50, 'Paid', 'Cash'),
('B005', 'P005', 'A005', '2023-09-29', 250, 'Paid', 'Card')

--7. Inserting data into Staff Table

INSERT INTO Staff (Staff_id, First_name, Last_name, Staff_Role, Dept_id, Contact_no, Hire_date) VALUES
('S001', 'Liam', 'Harris', 'Nurse', 'D001', '9876543212', '2020-01-15'),
('S002', 'Emma', 'Clark', 'Admin', 'D002', '8765432107', '2019-05-20'),
('S003', 'Noah', 'King', 'Pharmacist', 'D003', '7654321096', '2021-03-10'),
('S004', 'Ava', 'Wright', 'Nurse', 'D004', '6543210985', '2022-07-22'),
('S005', 'William', 'Walker', 'Admin', 'D005', '5432109874', '2018-11-05')

--8. Inserting data into Rooms Table

INSERT INTO Rooms (Room_id, Room_no, Room_type, Dept_id, Availability_status) VALUES
('R001', '101', 'Single', 'D001', 'Occupied'),
('R002', '102', 'Shared', 'D002', 'Available'),
('R003', '103', 'ICU', 'D003', 'Occupied'),
('R004', '104', 'Single', 'D004', 'Available'),
('R005', '105', 'Shared', 'D005', 'Occupied')

--9. Inserting data into Medications Table

INSERT INTO Medications (Med_id, Med_name, Dosage, Cost, Patient_id, Doctor_id) VALUES
('MED001', 'Amoxicillin', '500mg', 10, 'P001', 'DOC001'),
('MED002', 'Ibuprofen', '200mg', 5, 'P002', 'DOC002'),
('MED003', 'Metformin', '500mg', 8, 'P003', 'DOC003'),
('MED004', 'Omeprazole', '20mg', 12, 'P004', 'DOC004'),
('MED005', 'Aspirin', '75mg', 6, 'P005', 'DOC005')

--10. Inserting data into Lab_Tests Table

INSERT INTO Lab_Tests (Test_id, Test_name, Test_Description, Price, Patient_id, Doctor_id) VALUES
('T001', 'Blood Test', 'Complete blood count', 50, 'P001', 'DOC001'),
('T002', 'MRI', 'Brain scan', 200, 'P002', 'DOC002'),
('T003', 'X-Ray', 'Knee X-ray', 100, 'P003', 'DOC003'),
('T004', 'Urine Test', 'Routine check', 30, 'P004', 'DOC004'),
('T005', 'Skin Biopsy', 'Sample analysis', 150, 'P005', 'DOC005')

--11. Inserting data into Test_Results Table

INSERT INTO Test_Results (Result_id, Patient_id, Doctor_id, Test_id, Test_date, Result) VALUES
('TR001', 'P001', 'DOC001', 'T001', '2023-09-25', 'Normal'),
('TR002', 'P002', 'DOC002', 'T002', '2023-09-26', 'No abnormalities detected'),
('TR003', 'P003', 'DOC003', 'T003', '2023-09-27', 'Fracture detected'),
('TR004', 'P004', 'DOC004', 'T004', '2023-09-28', 'No issues'),
('TR005', 'P005', 'DOC005', 'T005', '2023-09-30', 'Benign growth detected')

SELECT * FROM Patients
SELECT * FROM Deapartments
SELECT * FROM Doctors
SELECT * FROM Rooms
SELECT * FROM Staff
SELECT * FROM Billing
SELECT * FROM Appointments
SELECT * FROM Medical_records
SELECT * FROM Medications
SELECT * FROM Test_Results
SELECT * FROM Lab_Tests