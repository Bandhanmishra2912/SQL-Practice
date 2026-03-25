--Exercise on SQL Joins
CREATE TABLE Customers1 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO Customers1 (CustomerID, CustomerName) VALUES 
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Charlie Brown'),
(4, 'David Lee'),
(5, 'Emma Wilson');

CREATE TABLE Orders2 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Orders2 (OrderID, CustomerID, OrderDate, TotalAmount) VALUES 
(101, 1, '2025-01-10', 120.50),
(102, 2, '2025-02-15', 250.75),
(103, 3, '2025-03-05', 320.00),
(104, 1, '2025-04-10', 99.99),
(105, 2, '2025-05-20', 450.25),
(106, NULL, '2025-06-01', 500.00); 

INSERT INTO Orders2 (OrderID, CustomerID, OrderDate, TotalAmount) VALUES 
(107, 4, '2025-07-10', 120.50),
(108, 5, '2025-08-15', 250.75),
(109, 4, '2025-09-05', 320.00),
(110, 3, '2025-10-10', 99.99),
(111, 2, '2025-11-20', 450.25),
(112, 1, '2025-12-01', 500.00); 

--1.	Write a query to retrieve all orders along with the customer names.

SELECT CUSTOMERS1.CUSTOMERNAME CUSTOMER_NAME, ORDERS2.ORDERID ORDER_ID FROM CUSTOMERS1 INNER JOIN ORDERS2 ON CUSTOMERS1.CUSTOMERID = ORDERS2.CUSTOMERID

--2.	Retrieve only those customers who have placed at least one order.

SELECT CUSTOMERS1.CUSTOMERNAME CUSTOMER_NAME, ORDERS2.ORDERID ORDER_ID FROM CUSTOMERS1 INNER JOIN ORDERS2 
ON CUSTOMERS1.CUSTOMERID = ORDERS2.CUSTOMERID ORDER BY CUSTOMERS1.CUSTOMERNAME

--3.	Retrieve all orders placed after '2025-01-01' along with the customer names.

SELECT CUSTOMERS1.CUSTOMERNAME CUSTOMER_NAME, ORDERS2.ORDERID ORDER_ID FROM CUSTOMERS1 INNER JOIN ORDERS2 
ON CUSTOMERS1.CUSTOMERID = ORDERS2.CUSTOMERID ORDER BY CUSTOMERS1.CUSTOMERNAME

--2: LEFT JOIN
--Given the same tables as above:
--1.	Write a query to display all customers and their orders, including those customers who have never placed an order.

SELECT CUSTOMERS1.CUSTOMERID, CUSTOMERS1.CUSTOMERNAME, ORDERS2.ORDERID, ORDERS2.TOTALAMOUNT FROM CUSTOMERS1 LEFT JOIN ORDERS2 
ON CUSTOMERS1.CUSTOMERID = ORDERS2.CUSTOMERID

--2.	Retrieve all customers who have not placed any orders.

SELECT CUSTOMERS1.CUSTOMERID, CUSTOMERS1.CUSTOMERNAME, ORDERS2.ORDERID, ORDERS2.TOTALAMOUNT FROM CUSTOMERS1 LEFT JOIN ORDERS2 
ON CUSTOMERS1.CUSTOMERID = ORDERS2.CUSTOMERID WHERE ORDERS2.ORDERID IS NULL

--3: RIGHT JOIN
--1.	Write a query to display all orders and their customers, including any orders that might not have a matching customer.

SELECT ORDERS2.ORDERID, CUSTOMERS1.CUSTOMERID, CUSTOMERS1.CUSTOMERNAME, ORDERS2.TOTALAMOUNT FROM ORDERS2 RIGHT JOIN CUSTOMERS1 
ON CUSTOMERS1.CUSTOMERID = ORDERS2.CUSTOMERID

--4: FULL OUTER JOIN
--1.	Write a query to retrieve all customers and their orders, showing customers without orders and orders without customers.

SELECT CUSTOMERS1.CUSTOMERID, CUSTOMERS1.CUSTOMERNAME, ORDERS2.ORDERID, ORDERS2.TOTALAMOUNT FROM CUSTOMERS1 FULL JOIN ORDERS2 
ON CUSTOMERS1.CUSTOMERID = ORDERS2.CUSTOMERID

--5: SELF JOIN

/*CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    ManagerID INT
);
INSERT INTO Employees1 (EmployeeID, EmployeeName, ManagerID) VALUES 
(1, 'John Doe', NULL), -- CEO (No Manager)
(2, 'Jane Smith', 1),
(3, 'Robert Brown', 1),
(4, 'Emily Davis', 2),
(5, 'Michael Wilson', 2),
(6, 'Sarah Johnson', 3);*/

--1.	Write a query to retrieve all employees along with their manager names (self-join on ManagerID).

SELECT A.EMPLOYEENAME EMPLOYEE, M.EMPLOYEENAME MANAGER  FROM EMPLOYEES1 A, EMPLOYEES1 M WHERE A.MANAGERID = M.EMPLOYEEID

--6: CROSS JOIN

/*CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100)
);
INSERT INTO Products (ProductID, ProductName) VALUES 
(1, 'Laptop'),
(2, 'Smartphone'),
(3, 'Tablet'),
(4, 'Monitor'),
(5, 'Keyboard');

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);
INSERT INTO Categories (CategoryID, CategoryName) VALUES 
(1, 'Electronics'),
(2, 'Accessories'),
(3, 'Office Equipment');*/

--Write a query to retrieve all possible combinations of products and categories.

SELECT CATEGORYNAME, PRODUCTNAME FROM CATEGORIES CROSS JOIN PRODUCTS

--7: JOIN with Aggregate Functions
--Using the Orders and Customers tables:
--1. Write a query to get each customer's total order amount using GROUP BY and INNER JOIN.

SELECT ORDERS2.CustomerID, CUSTOMERS1.CustomerName, SUM(ORDERS2.TotalAmount) TOTAL_AMOUNT FROM 
CUSTOMERS1 INNER JOIN ORDERS2 ON CUSTOMERS1.CUSTOMERID = ORDERS2.CUSTOMERID GROUP BY ORDERS2.CUSTOMERID, CUSTOMERS1.CUSTOMERNAME

--2. Retrieve customers who have spent more than $500 on orders.

SELECT ORDERS2.CustomerID, CUSTOMERS1.CustomerName, SUM(ORDERS2.TotalAmount) TOTAL_AMOUNT FROM 
CUSTOMERS1 INNER JOIN ORDERS2 ON CUSTOMERS1.CUSTOMERID = ORDERS2.CUSTOMERID GROUP BY ORDERS2.CUSTOMERID, CUSTOMERS1.CUSTOMERNAME 
HAVING SUM(ORDERS2.TotalAmount) > 500

--Scenario Based

--1. Update Customer's Total Order Amount
--You need to update the TotalAmount of each Customer based on their orders. For some reason, the original order amounts need to be increased by 10% for year 2025.

UPDATE ORDERS2 SET TOTALAMOUNT = TOTALAMOUNT + TOTALAMOUNT * 0.1

--2. Update Product Category
--You need to change the category of all products that are "Office Equipment" to "Electronics".

-- **Invalid Data**

--3. Update Employee Manager
--You need to update the manager of all employees in the "Sales" department to be a new employee, Michael Wilson (EmployeeID = 5).

-- **Invalid Data**

--4. Update Customer Status Based on Order Amount
--You need to update the CustomerStatus column in the Customers table based on the total amount of orders they’ve placed:
--•	Customers with total spending greater than $5000 should be marked as "Premium".
--•	Others should be marked as "Regular".

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Employees2 (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert Departments
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Finance'),
(2, 'HR'),
(3, 'IT'),
(4, 'Sales');

-- Insert Employees
INSERT INTO Employees2 (EmployeeID, EmployeeName, DepartmentID, Salary) VALUES
(101, 'Alice Johnson', 1, 60000.00),  -- Finance
(102, 'Bob Smith', 2, 55000.00),      -- HR
(103, 'Charlie Davis', 1, 62000.00),  -- Finance
(104, 'Diana Roberts', 3, 70000.00),  -- IT
(105, 'Ethan Brown', 4, 50000.00),    -- Sales
(106, 'Fiona Wilson', 1, 58000.00);   -- Finance

--5. Update Employee Salary Based on Department
--You need to give all employees in the "Finance" department a 10% salary increase.

UPDATE EMPLOYEES2 SET SALARY = SALARY + SALARY * 0.1 WHERE DEPARTMENTID = 1