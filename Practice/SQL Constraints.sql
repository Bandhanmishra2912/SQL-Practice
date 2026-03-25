-- SQL CONSTRAINTS
-- N0T NULL CONSTARINT
CREATE TABLE Sale (
    Sale_Id int NOT NULL,
    Sale_Amount int NOT NULL,
    Vendor_Name varchar(255) NOT NULL,
    Profit int
)
INSERT INTO SALE VALUES(101,1050,'AMAZON',89)
SELECT * FROM SALE
INSERT INTO SALE VALUES(NULL,NULL,'AMAZON',89)

--------------------------------------------------------
-- UNIQUE CONSTRAINT
CREATE TABLE Person (
    ID int UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
)

INSERT INTO PERSON VALUES(11,'JAMES','CAMERON',65)

INSERT INTO PERSON VALUES(NULL,'JAMES','CAMERON',65)
SELECT * FROM PERSON

--------------------------------------------------------
-- CHECK CONSTRAINTS

CREATE TABLE NEWSales (
    Sale_Id int UNIQUE,
    Sale_Amount int NOT NULL CHECK (Sale_Amount > 500),
    Vendor_Name varchar(255),
    Profit int
)

INSERT INTO NEWSales VALUES(112,600,'AMAZON',400)--VALUE ABOVE 500 IS INSERTED

INSERT INTO NEWSales VALUES(113,400,'AMAZON',400)--VALUES ON CHECK WILL GET TERMINATED
---------------------------------------------------------------
--DEFAULT CONSTRAINT
CREATE TABLE SalesDEF (
    Sale_Id int  UNIQUE,
    Sale_Amount int NOT NULL 
	,Vendor_Name varchar(255) DEFAULT 'UNKNOWN VENDOR',
    Sale_Date date,
    Profit int
)

INSERT INTO SalesDEF VALUES(33,4000,'AMAZON','2021-05-21',25)

SELECT * FROM SalesDEF

INSERT INTO SalesDEF(Sale_Id,Sale_Amount,Sale_Date,Profit)
VALUES(55,40,'2021-09-25',85)
-------------------------------------------------------------
-- PRIMARY KEY
CREATE TABLE SalesPRI (
    Sale_Id int PRIMARY KEY,
    Sale_Amount int NOT NULL,
    Vendor_Name varchar(255),
    Sale_Date date,
    Profit int,
    )

	INSERT INTO SalesPRI VALUES(100,345,'AMAZON','2020-08-12',45)

	INSERT INTO SalesPRI VALUES(100,345,'AMAZON','2020-08-12',45)--INSERTING SAME ROW WILL BE TERMINATED
	DELETE FROM SALESPRI WHERE SALE_ID =100
	SELECT * FROM SalesPRI
--ALTERNATE SYNTAX FOR PRIMARY KEY


CREATE TABLE SalesPRINEW (
    Sale_Id int NOT NULL,
    Sale_Amount int NOT NULL,
    Vendor_Name varchar(255),
    Profit int,
    CONSTRAINT PK_Sales PRIMARY KEY (Sale_Id, Sale_Amount) 
)

----------------------------------------------------------------
-- FOREIGN KEY

CREATE TABLE Sales_Person (
    Sales_Person_Id int  PRIMARY KEY,
    Sales_Person_Name varchar(255),
    Sales_Person_Location varchar(255),
    Sale_Id int FOREIGN KEY REFERENCES SalesPRI(Sale_Id)
)

INSERT INTO Sales_Person VALUES(123,'JAMES','ARIZONA',100)--INSERT statement conflicted with the FOREIGN KEY

SELECT * FROM Sales_Person
DELETE FROM SALES_PERSON WHERE SALE_ID = 100
-----------------------------------------------------
--IF WE WOULD LIKE TO DELETE FROM PARENT TABLE WHEN CORRESPONDING VALUE IS IN CHILD

DROP TABLE Sales_Person

CREATE TABLE Sales_Person (
    Sales_Person_Id int NOT NULL PRIMARY KEY,
    Sales_Person_Name varchar(255),
    Sales_Person_Location varchar(255),
    Sale_Id int FOREIGN KEY REFERENCES SalesPRI(Sale_Id) ON DELETE CASCADE
)