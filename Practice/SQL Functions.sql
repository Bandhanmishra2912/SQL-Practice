--SQL FUNCTION: 
--A function in SQL is a reusable block of code that takes input(s), 
-- performs operations, and returns a result.
-- simplify complex logic, manipulate data, to perform repetitive tasks.

-- Types of Functions:
 1. Aggregate Functions
 2. String Functions
 3. Date and Time Functions
 4. Mathematical/Numeric Functions
 5. Conversion Functions
 6. Logical Functions


---------------------------------------------------------------------
--1. AGGREGATE : SUM ,COUNT,AVG,MIN,MAX
SELECT * FROM EMP;
SELECT SUM(SAL) FROM EMP
SELECT COUNT(SAL) FROM EMP
SELECT AVG(SAL) FROM EMP
SELECT MIN(SAL) FROM EMP
SELECT MAX(SAL) FROM EMP

select min(sal),max(sal) from emp;
select min(sal) "Min Salary",max(sal) "Max Salary" from emp;
select sum(sal) "Total Salary",avg(sal) "Avg Salary" from emp;
select count(*) "No Of Rows" from emp;
select min(sal) "Min Sal",max(sal) "Max Salary" from emp where deptno=10;
select sum(sal) "Total Salary",avg(sal) "Avg Salary" from emp where job='CLERK';
select count(*) "No Of Rows" from emp where deptno=30;
--------------------------------------------------------------------------
--  2. String Functions
SELECT LOWER(ENAME) FROM EMP
select lower('MICROSOFT'),upper('microsoft'),len('MICROSOFT');
select ename,lower(ename),upper(ename),len(ename) from emp;
select * from emp where ename=upper('jones');
select ename from emp where len(ename) > 5;
select ename,substring(ename,3,3) from emp;
select ename,substring(ename,1,2) from emp;
select replace('MICROSOFT SQLSERVER 2000','SQLSERVER','SS');
select trim('   ABC    '),ltrim('  abc'),rtrim('abc  ');
select left('MICROSOFT SQLSERVER 2000',9);
select right('MICROSOFT SQLSERVER 2000',11);

----------------------------------------------------------
-- 3. Date and Time Functions
select getdate();
select current_timestamp;
select getdate(),datename("YEAR",getdate()),datename("MM",getdate());
select getdate(),datename("YY",getdate());
select getdate(),datediff("YY",'2020/01/01',getdate());
select getdate(),datediff("DAY",'2025/01/01','2025/06/18');
select getdate(),dateadd("MONTH",3,getdate());
select getdate(),dateadd("DAY",20,getdate());
SELECT DATEADD(year, 1, '2017/08/25') AS DateAdd;
SELECT DATEPART(year, '2017/08/25') AS DatePartInt;

--------------------------------------------------------
 -- 4. Mathematical/Numeric Functions

SELECT CEILING(25.10) AS CeilValue;
SELECT FLOOR(25.99) AS FloorValue;
SELECT ROUND(25.90,1,1) AS RoundValue;
SELECT ROUND(235.12,0) AS RoundValue;

SELECT ABS(-20) AS AbsoluteValue; 
SELECT POWER(2, 3) AS PowerValue;
SELECT SQRT(49) AS SquareRoot;

-----------------------------------------------
-- 5. Conversion Functions

--The CAST() function converts a value (of any type) into a specified datatype.
SELECT CAST(25.65 AS int);
SELECT CAST(25.65 AS varchar);
SELECT CAST('2017-08-25' AS datetime);

select * from emp
sp_help emp

SELECT *,LOWER(SUBSTRING(ENAME,1,3)) AS NEWNAME FROM EMP

SELECT ename, CAST (comm AS Integer)  
Int_comm FROM emp;  

SELECT cast(hiredate as datetime) hiretime, CAST (comm AS Integer)  
Int_comm FROM emp;  

--The CONVERT() function converts a value (of any type) into a specified datatype.
SELECT CONVERT(VARCHAR(15),GETDATE(),6)

SELECT CONVERT(VARCHAR(16),GETDATE(),106)

SELECT CONVERT(VARCHAR(24),GETDATE(),120)


SELECT CAST ('10.25' as float) * 20,
       CONVERT (int, '10') * 20

--CAST is part of the ANSI-SQL specification; whereas, CONVERT is not. 
--In fact, CONVERT is SQL implementation specific.

--------------------------------------------------
 --6. Logical Functions

 SELECT ISNULL(NULL, 'No Data') AS Result;

 SELECT comm, ISNULL(comm, '0') AS Newcomm
FROM emp;

--Simplified IF...ELSE that returns one of two values based on a condition.
SELECT IIF(sal >= 2000, 'Good', 'Avg') AS sal_status
FROM emp;

--COALESCE() Function Return the first non-null value in a list:


SELECT COALESCE(NULL, 100, 200, 'SQL Server');
SELECT COALESCE(NULL, null,100, 200, 'SQL Server');
select coalesce(cast(Comm as varchar),'NA') from emp
SELECT *,COALESCE(comm,'0') newcomm from emp;


--FORMAT() function to format date/time values and number values.
SELECT FORMAT (getdate(), 'dd/MM/yyyy ') as date	
SELECT FORMAT (getdate(), 'dd/MM/yyyy, hh:mm:ss ') as date	
SELECT FORMAT (getdate(), 'dddd, MMMM, yyyy') as date	
SELECT FORMAT (getdate(), 'MM.dd.yy') as date	
SELECT FORMAT (getdate(), 'MM-dd-yy') as date	
SELECT FORMAT (getdate(), 'hh:mm:ss tt') as date	
SELECT FORMAT (getdate(), 'd','us') as date	
SELECT FORMAT(GETDATE(),'MM/dd/yyyy') as date
SELECT FORMAT(123456789, '##-##-#####');
select getdate() as date