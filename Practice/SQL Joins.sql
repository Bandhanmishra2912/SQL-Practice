-- SQL JOINS -- TO RETRIVE DATA FROM ONE OR MORE TABLES 
-- TYPES OF JOINS
1. INNER JOIN (COMMON VALUES)
	1. EQUI JOIN (=)
	2. NON - EQUI JOIN (< > != ) 
2. OUTER JOIN (FETCH COMPLETE TABLE VALUES BASED ON CONDITION)
	1. LEFT OUTER JOIN /LEFT JOIN
	2. RIGHT OUTER JOIN
	3. FULL OUTER JOIN 
3. CROSS JOIN (CARTESIAN PRODUCT)
4. SELF JOIN (JOIN A TABLE BY ITSELF)


create table tab1
(numid int)
insert into tab1 values(12)
insert into tab1 values(14)
insert into tab1 values(10)
insert into tab1 values(11)

select * from tab1


This is table tab2 data:

create table tab2
(numid int)
insert into tab2 values(13)
insert into tab2 values(15)
insert into tab2 values(11)
insert into tab2 values(12) 

select * from tab2


SELECT * FROM TAB1,TAB2 

SELECT * FROM TAB1,TAB2 WHERE TAB1.NUMID = TAB2.NUMID

-- ON CLAUSE
-- EQUI JOIN 
SELECT * FROM TAB1 INNER JOIN TAB2 ON 
TAB1.NUMID = TAB2.NUMID

-- NON - EQUI JOIN 
SELECT * FROM TAB1 INNER JOIN TAB2 ON 
TAB1.NUMID > TAB2.NUMID

--OUTER JOIN 
-- LEFT OUTER JOIN 
SELECT * FROM TAB1 LEFT OUTER JOIN TAB2 ON 
TAB1.NUMID = TAB2.NUMID

-- RIGHT OUTER JOIN 
SELECT * FROM TAB1 RIGHT OUTER JOIN TAB2 ON 
TAB1.NUMID = TAB2.NUMID

-- FULL  OUTER JOIN 
SELECT * FROM TAB1 FULL OUTER JOIN TAB2 ON 
TAB1.NUMID = TAB2.NUMID

-- CROSS JOIN 
SELECT * FROM TAB1 CROSS JOIN TAB2

-- SELF JOIN 

SELECT * FROM EMP
-- DISPLAY ENAME WHICH EMPLOYEE REPORTS TO 
-- ADAM -> SCOTT

SELECT E.ENAME "EMPLOYEE" ,M.ENAME "MANAGER"  FROM EMP E,EMP M
WHERE E.MGR = M.EMPNO


SELECT * FROM EMP INNER JOIN DEPT ON 
EMP.deptno = DEPT.deptno

SELECT EMPNO,ENAME,JOB,EMP.DEPTNO,DNAME,DEPT.DEPTNO,LOCATION FROM EMP
INNER JOIN DEPT ON EMP.deptno = DEPT.deptno

SELECT EMP.EMPNO,EMP.ENAME,EMP.JOB,EMP.DEPTNO,DEPT.DNAME,DEPT.DEPTNO,DEPT.LOCATION FROM EMP
INNER JOIN DEPT ON EMP.deptno = DEPT.deptno


-- TABLE ALIAS

SELECT E.EMPNO "EMPLOYEE NUMBER",E.ENAME,E.JOB,E.DEPTNO,D.DNAME,D.DEPTNO,D.LOCATION FROM EMP E
INNER JOIN DEPT D ON E.deptno = D.deptno

-- When join condition is omitted / invalid

--then cartesian product will be formed = The CARTESIAN JOIN is also known as CROSS JOIN. In a CARTESIAN JOIN there is a join for each row of one table to every row of another table.

--To avoid cartesian product we must include valid join condition in "where" clause

--Actually joins performed by "where" clause itself

select * from emp,dept where emp.deptno = dept.deptno

select empno,ename,job,sal,dname,location
from emp,dept where emp.deptno = dept.deptno

select empno,ename,job,sal,dname,location
from emp inner join dept on emp.deptno = dept.deptno

select empno,ename,job,sal,deptno,deptno,dname,location
from emp inner join dept on emp.deptno = dept.deptno -- ambiguity

--If the same columnname appears in two tables then we prefix the columnname with either tablename / tablealias to prevent column ambiguity

select empno,ename,job,sal,emp.deptno,dept.deptno,dname,location
from emp inner join dept on emp.deptno = dept.deptno


select empno,ename,job,sal,e.deptno,d.deptno,dname,location
from emp e inner join dept d on e.deptno = d.deptno -- table alias EMP as E and DEPT as D

select e.empno,e.ename,e.job,e.sal,e.deptno,d.deptno,d.dname,d.location
from emp e inner join dept d on e.deptno = d.deptno


--self join - A self join allows you to join a table to itself. It is useful for querying hierarchical data or comparing rows within the same table.
select e.ename,m.ename
from emp e,emp m 
where e.mgr = m.empno

-- to know for which employee with their mgr 
select e.ename "Employee",m.ename "Manager"
from emp e,emp m
where e.mgr = m.empno

-- to know hiredate for ename and mgr
select e.ename "Employee",e.hiredate,m.ename "Manager",m.hiredate
from emp e,emp m 
where e.mgr = m.empno

-- SET OPERATORS
UNION 
UNION ALL 
INTERSECT

SELECT ENAME FROM EMP UNION
SELECT LOCATION FROM DEPT

SELECT ENAME FROM EMP UNION ALL
SELECT LOCATION FROM DEPT

SELECT NUMID FROM TAB1 INTERSECT
SELECT NUMID FROM TAB2