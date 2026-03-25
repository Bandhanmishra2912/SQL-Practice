--SQL VIEWS 
/*
DATABASE OBJECTS 
	1. SPACE DEMANDING OBJECTS
		TABLES
	2. NON-SPACE DEMANDING OBJECTS
		IDENTITY | SEQUENCE 
		VIEWS
		INDEX 
		SYNONYMS


VIEW - VIRTUAL TABLE CREATED UPON EXISTING TABLE 
CUSTOMER 
CID CNAME CONTACT EMAIL ADD INCOME AADHAR PAN 
*/
-- SIMPLE VIEW -- DML TRANSACTIONS CAN BE PERMITTED

CREATE VIEW EMPV AS SELECT EMPNO,ENAME,DEPTNO FROM EMP

SELECT * FROM EMPV

SP_HELPTEXT EMPV

--COMPLEX VIEW -- N0 DML TRANSACTIONS PERMITTED
Select empno,ename,dname,location from emp right outer join dept
on emp.deptno=dept.deptno

create view complexview as Select empno,ename,dname,location from emp right outer join dept on emp.deptno=dept.deptno

 select * from complexview

  -- CHECK VIEW

Create Table SampleCheck ( ID int, Score int)

Insert into SampleCheck values (3,9)

select * from SampleCheck

Create view checkview  as select * from SampleCheck
where score  > 10 with check option;

insert into checkview values(2, 11);

insert into checkview values(3,9);

select * from checkview;


CREATE VIEW TESTV AS SELECT DEPTNO,AVG(SAL) FROM EMP GROUP BY DEPTNO

CREATE TABLE VTEST (ID INT,NAME CHAR(10))

INSERT INTO VTEST VALUES (1,'TOM'),(2,'HARRY')

SELECT * FROM VTEST
-- CREATING VIEW ON VTEST TABLE 

CREATE VIEW VWTEST AS SELECT * FROM VTEST

SELECT * FROM VWTEST

-- INSERT DATA INTO VIEW
INSERT INTO VWTEST VALUES (3,'TOM'),(4,'HARRY')
SELECT * FROM VWTEST

DELETE FROM VTEST WHERE ID = 4
