--Exercise on SQL Index
--1: Creating Indexes on a Table
--Consider the following Orders table:
CREATE TABLE Orders3 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2)
);

--Perform the below:
--A. Create a non-clustered index on CustomerID to improve query performance when searching by CustomerID.

CREATE NONCLUSTERED INDEX ABCD1 ON ORDERS3(CUSTOMERID)

--B. Create a unique index on OrderDate to ensure no two orders are placed on the same date.

CREATE UNIQUE INDEX EFGH1 ON ORDERS3(ORDERDATE)

--C. Check all indexes available on the Orders table.

SELECT NAME, TYPE_DESC FROM SYS.INDEXES WHERE OBJECT_ID = OBJECT_ID('ORDERS3')

--2: Using Composite Indexes
--Given the Products table:

CREATE TABLE Products1 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT,
    Price DECIMAL(10,2),
    Stock INT
);

--A. Create a composite index on CategoryID and Price to optimize searches filtering by both columns.

CREATE INDEX IJKL1 ON PRODUCTS1 (CATEGORYID, PRICE)

--B. Write a query to test the index by retrieving all products from a specific category with a price less than 100.

SELECT * FROM PRODUCTS1 WHERE CATEGORYID = 5 AND PRICE < 100

--C. Drop the composite index after testing.

DROP INDEX IJKL1 ON PRODUCTS1

--3: Indexed Views
--A. Create a view TopCustomers that shows CustomerID and total TotalAmount spent from the Orders table.

CREATE VIEW TOPCUSTOMERS WITH SCHEMABINDING AS SELECT CUSTOMERID, TOTALAMOUNT FROM DBO.ORDERS2

--B. Create a clustered index on the view to optimize queries retrieving top customers.

-- ** --

--C. Query the view and observe performance improvements.

-- ** --