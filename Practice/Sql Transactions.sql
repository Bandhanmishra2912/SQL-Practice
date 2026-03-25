-- SQL TRANSACTIONS 
1. START TRANSACTION: starts a SQL transaction for us.
2. COMMIT: helps to save the changes made in the database.
3. ROLLBACK: helps to restore the previous state of the database.
4. SAVEPOINT: helps to create points in the transaction groups to which the system might try to rollback.
-------------------------------------------------------------------

--Create Product table
CREATE TABLE Productnew
(
 ProductID INT PRIMARY KEY, 
 Name VARCHAR(40), 
 Price INT,
 Quantity INT
 )
 GO
 -- Populate Product Table with test data
 INSERT INTO Productnew VALUES(101, 'Product-1', 100, 10)
 INSERT INTO Productnew VALUES(102, 'Product-2', 200, 15)
 INSERT INTO Productnew VALUES(103, 'Product-3', 300, 20)
 INSERT INTO Productnew VALUES(104, 'Product-4', 400, 25)

select * from Productnew


BEGIN TRANSACTION
 INSERT INTO Productnew VALUES(105,'Product-5',500, 30)
 UPDATE Productnew SET Price =350 WHERE ProductID = 103
 DELETE FROM Productnew WHERE ProductID = 103
COMMIT TRANSACTION -- commit will permanently store data to a physical file.

select * from Productnew


BEGIN TRANSACTION
INSERT INTO Productnew VALUES(106,'Product-6',600, 30)
UPDATE Productnew SET Price =550 WHERE ProductID = 105
DELETE FROM Productnew WHERE ProductID = 104

select * from Productnew

ROLLBACK TRANSACTION -- will undo and returns to previous state of database.

--savepoint transaction

CREATE TABLE TestTable
(
   ID INT NOT NULL,
   Value INT NOT NULL,
   PRIMARY KEY (ID)
)

BEGIN TRANSACTION 
 
   INSERT INTO TestTable( ID, Value )
   VALUES  ( 5,50)
   
   -- this will create a savepoint after the first INSERT
   SAVE TRANSACTION FirstInsert

   INSERT INTO TestTable( ID, Value )
   VALUES  ( 6, 60)
 
 select * from TestTable -- check table for new rows
   -- this will rollback to the savepoint right after the first INSERT was done
   ROLLBACK TRANSACTION FirstInsert

-- this will commit the transaction leaving just the first INSERT 
COMMIT
 
SELECT * FROM TestTable


