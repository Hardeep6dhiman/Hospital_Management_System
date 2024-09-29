USE HMS_DB

--Creating 12 Tables For this Project-

--1. Patient Table

CREATE TABLE Patients(
Patient_id VARCHAR(10) PRIMARY KEY,
First_name VARCHAR(15),
Last_name VARCHAR(15),
DOB DATE,
Gender VARCHAR(10),
Contact_number VARCHAR(10),
Pat_add VARCHAR(50),
Reg_date DATE,
CHECK (Gender IN('Male','Female','Others')))

--2. Departments Table

CREATE TABLE Deapartments(
Dept_id VARCHAR(10) PRIMARY KEY,
Dept_name VARCHAR(30))

--3. Doctors Table

CREATE TABLE Doctors(
Doctor_id VARCHAR(10) PRIMARY KEY,
First_name VARCHAR(15) NOT NULL,
Last_name VARCHAR(15),
Specialization VARCHAR(30) NOT NULL,
Contact_no VARCHAR(10) NOT NULL,
Email_id VARCHAR(35),
Dept_id VARCHAR(10) FOREIGN KEY REFERENCES Deapartments(Dept_id))

--4. Appointments Table

CREATE TABLE Appointments(
App_id VARCHAR(10) PRIMARY KEY,
Patient_id VARCHAR(10) FOREIGN KEY REFERENCES Patients(Patient_id),
Doctor_id VARCHAR(10) FOREIGN KEY REFERENCES Doctors(Doctor_id),
App_date DATE NOT NULL,
App_time TIME,
App_Status VARCHAR(15),
CHECK (App_Status IN('Completed','Cancelled','Pending'))
)

--5. Medical Records Table

CREATE TABLE Medical_records(
Record_id VARCHAR(10) PRIMARY KEY,
Patient_id VARCHAR(10) FOREIGN KEY REFERENCES Patients(Patient_id),
Doctor_id VARCHAR(10) FOREIGN KEY REFERENCES Doctors(Doctor_id),
Diagnosis VARCHAR(30) NOT NULL,
Treatment VARCHAR(100) NOT NULL,
Prescription VARCHAR(100) NOT NULL,
Visit_date DATE)

--6. Billing Table

CREATE TABLE Billing(
Bill_id VARCHAR(10) PRIMARY KEY,
Patient_id VARCHAR(10) FOREIGN KEY REFERENCES Patients(Patient_id),
App_id VARCHAR(10) FOREIGN KEY REFERENCES Appointments(App_id),
Bill_date DATE,
Total_amount int,
Payment_status VARCHAR(10),
Payment_mode VARCHAR(10),
CHECK(Payment_status IN('Paid','Unpaid','Pending')),
CHECK(Payment_mode IN('Cash','Insurance','Card'))
)

--7. Staff

CREATE TABLE Staff(
Staff_id VARCHAR(10) PRIMARY KEY,
First_name VARCHAR(15) NOT NULL,
Last_name VARCHAR(15),
Staff_Role VARCHAR(15),
Dept_id VARCHAR(10) FOREIGN KEY REFERENCES Deapartments(Dept_id),
Contact_no VARCHAR(10) NOT NULL,
Hire_date DATE,
CHECK (Staff_Role IN('Nurse','Admin','Pharmacist'))
)

--8. Rooms

CREATE TABLE Rooms(
Room_id VARCHAR(10) PRIMARY KEY,
Room_no VARCHAR(5) NOT NULL,
Room_type VARCHAR(15),
Dept_id VARCHAR(10) FOREIGN KEY REFERENCES Deapartments(Dept_id),
Availability_status VARCHAR(15),
CHECK(Room_type IN('Single','Shared','ICU')),
CHECK(Availability_status IN('Occupied','Available'))
)

--9. Medications

CREATE TABLE Medications(
Med_id VARCHAR(10) PRIMARY KEY,
Med_name VARCHAR(30) NOT NULL,
Dosage VARCHAR(30) NOT NULL,
Cost INT,
Patient_id VARCHAR(10) FOREIGN KEY REFERENCES Patients(Patient_id),
Doctor_id VARCHAR(10) FOREIGN KEY REFERENCES Doctors(Doctor_id)
)

--10. Lab Tests

CREATE TABLE Lab_Tests(
Test_id VARCHAR(10) PRIMARY KEY,
Test_name VARCHAR(30) NOT NULL,
Test_Description VARCHAR(100),
Price INT,
Patient_id VARCHAR(10) FOREIGN KEY REFERENCES Patients(Patient_id),
Doctor_id VARCHAR(10) FOREIGN KEY REFERENCES Doctors(Doctor_id)
)

--11. Test Results

CREATE TABLE Test_Results(
Result_id VARCHAR(10) PRIMARY KEY,
Patient_id VARCHAR(10) FOREIGN KEY REFERENCES Patients(Patient_id),
Doctor_id VARCHAR(10) FOREIGN KEY REFERENCES Doctors(Doctor_id),
Test_id VARCHAR(10) FOREIGN KEY REFERENCES Lab_Tests(Test_id),
Test_date DATE,
Result VARCHAR(100)
) 
