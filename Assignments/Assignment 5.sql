--ASSIGNMENT ON SQL CONSTRAINTS

--1.	Creating a Table with Constraints
/*Write an SQL query to create a table named Employees with the following constraints:
•	EmployeeID (Integer, Primary Key, Auto Increment)
•	FullName (Varchar(100), Cannot be NULL)
•	Email (Varchar(100), Must be Unique)
•	Salary (Decimal(10,2), Must be greater than 30,000)
•	DepartmentID (Integer, Foreign Key referencing Departments(DepartmentID))
•	HireDate (Date, Default value is current date)*/

CREATE TABLE EMPLOYEES (
EmployeeID INT PRIMARY KEY IDENTITY (101, 1),
FullName VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE,
Salary DECIMAL (10, 2) CHECK (SALARY > 30000),
DepartmentID INT,
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
HireDate DATE DEFAULT GETDATE())

CREATE TABLE DEPARTMENTS (
DEPARTMENTID INT PRIMARY KEY,
)

--2.	Adding Constraints to an Existing Table

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT
);
/*1.	Add a NOT NULL constraint on ProductName.
2.	Add a UNIQUE constraint on ProductName.
3.	Add a CHECK constraint ensuring Price is greater than 0.
4.	Add a DEFAULT constraint to Stock, setting it to 50.*/

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL UNIQUE,
    Price DECIMAL(10,2) CHECK(Price > 0),
    Stock INT DEFAULT 50
)

--3.	Working with Foreign Keys
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

CREATE TABLE Orders10 (
    OrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
--Perform the following:
--•	Insert a new record into Customers.

INSERT INTO CUSTOMERS VALUES (101, 'BANDHAN')

--•	Insert a new order referencing an existing customer.

INSERT INTO ORDERS10 VALUES (1001, '07-02-2025', 101)

--•	Try inserting an order with a CustomerID that does not exist in Customers. What happens?

INSERT INTO ORDERS10 VALUES (1002, '07-02-2025', 102)
--ANS: The statement has been terminated since there is no value in the Orders10 table matching the primary key of Customers table

--•	Modify the Foreign Key constraint to ON DELETE CASCADE and test what happens when a customer is deleted.

ALTER TABLE ORDERS10 DROP CONSTRAINT FK__Orders10__Custom__63A3C44B

ALTER TABLE ORDERS10 ADD CONSTRAINT FK__ORDERS10__CUSTOM__63AC44B
FOREIGN KEY (CustomerID) REFERENCES CUSTOMERS(CustomerID)
ON DELETE CASCADE

DELETE FROM CUSTOMERS WHERE CUSTOMERID = 101

/*4.	Composite Primary Key

•	Create a table StudentCourses where a student can enroll in multiple courses, but a student cannot enroll in the same course twice.
•	StudentID (Integer, Foreign Key referencing Students(StudentID))
•	CourseID (Integer, Foreign Key referencing Courses(CourseID))
•	EnrollmentDate (Date, Default to current date)
•	The combination of StudentID and CourseID should be the Primary Key*/

CREATE TABLE STUDENTNAME (
STUDENTID INT,
FOREIGN KEY (STUDENTID) REFERENCES STUDENTS(STUDENTID)
