![hospital-8687007_1920](https://github.com/user-attachments/assets/458aae57-c475-4a4d-b2c0-49191d025140)
# Hospital_Management_System

**Project Title**:Hospital Management System  
**Database**: HMS

This project demonstrates the implementation of a Hospital Management System using SQL. It includes creating and managing tables, performing CRUD operations, and executing advanced SQL queries. The goal is to showcase skills in database design, manipulation, and querying.

## 1. Project Overview

The Hospital Management System (HMS) Database is designed to automate and streamline various operational and administrative tasks within a hospital. The database efficiently manages patient records, doctor information, appointments, billing, medical records, lab tests, medications, staff, and room availability. By ensuring data integrity and facilitating quick access to vital information, the system enhances overall hospital performance and supports decision-making through powerful data retrieval and reporting capabilities.

## 2. Project Objectives

Efficient Data Management: Maintain records of patients, doctors, appointments, and treatments in a structured manner.
Data Integrity and Accuracy: Implement data validation using constraints such as CHECK and FOREIGN KEY relationships.
Ease of Data Retrieval: Provide quick access to patient histories, doctor schedules, medical records, and billing information.
Support for Reporting and Analytics: Facilitate queries and reports for hospital administration, such as tracking revenue, patient outcomes, and staff performance.


## 3. Sample Data and Queries

  1. Which patients have pending or canceled appointments, and which doctor are they assigned to?

  2. Generate a report showing the total number of appointments handled by each doctor along with the department they belong to.

  3. List all patients who have been prescribed medication, along with the corresponding doctor, diagnosis, and treatment details.

  4. Retrieve the total billing amount for each patient, broken down by appointment status (completed, pending, canceled).

  5. Which rooms are currently available in each department and what type of room (Single, Shared, ICU) is it?

  6. Find the patients who have undergone the most expensive lab tests and list the doctor who ordered the tests.

  7. Generate a list of doctors who have treated patients across multiple departments.

  8. What is the total revenue generated from completed appointments, and how does it break down by department?

  9. Which patients have multiple pending bills, and what is the total outstanding amount for each?

  10. List all test results for patients treated by a specific doctor during a certain date range.


## 4. Advanced queries using JOINs and CTEs

  1. Find the total number of appointments, grouped by doctor and their respective department, for appointments that are either 'Completed' or 'Pending'.

  2. List all doctors with their specializations, and the average bill amount generated from their completed appointments.

  3. List the most frequent diagnosis given by each doctor along with the count.

  4. Find pa􀆟ents who have seen doctors in more than one department.

  5. For each pa􀆟ent, list their doctors and how many different medica􀆟ons were prescribed by each doctor.
  6. 

## 5. Database Design
![HMS_ERD](https://github.com/user-attachments/assets/c7c048e4-9e69-4549-a045-d42d52cada0e)

ER Diagram: Include an Entity-Relationship (ER) diagram illustrating how tables (entities) are connected via relationships (foreign keys).
Database Schema: List all tables and columns with the respective data types, primary keys, foreign keys, and constraints.
Tables: Provide a list of all tables created (Patients, Doctors, Departments, Appointments, etc.).
Keys & Constraints: Primary keys, foreign keys, and CHECK constraints for validation.


## 6. Key SQL Features Used

Primary and Foreign Keys: Ensure data integrity.
CHECK Constraints: Enforce data validation rules.
JOIN Operations: Used for combining data across multiple tables.
Common Table Expressions (CTE): For breaking down complex queries.
Aggregate Functions: Such as SUM(), COUNT(), AVG().
Group By & Having: For aggregated reports.
Subqueries: For advanced filtering and analysis.


## 7. References
SQL databases (e.g., SQL SERVER).
