--Assignment on views:

--1. Create Table Employee with Existing Table of EMP( Replicate EMP table)

CREATE VIEW EMPLOYEE3 AS SELECT * FROM EMP

--2. Create Table Department with Existing Table of DEPT( Replicate DEPT table).

CREATE VIEW DEPARTMENT AS SELECT * FROM DEPT

--3. Create A view on Employee table as "EmpView" where the view should consist of columns Empno,ename,job,deptno.

CREATE VIEW EMP_VIEW AS SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP

--4. Insert few records in "Empview".

INSERT INTO EMP_VIEW VALUES (200, 'Bandhan Mishra', 'Data Scientist', 10)

--5. Delete an employee with empno = 7900 from empview.

DELETE FROM EMP_VIEW WHERE EMPNO = 7900

--6. Create a view (emp_city_view) for those employee belong to the city 'New York' displaying empname ,job,location. 

-- ** --

--7. Create View as "New_Dept" where deptno value should not exceed above 50 while inserting data.

-- ** --