--Assignment on subquery and Set Operators

--1. Display the names and job titles of all employees with the same job as Jones.

SELECT ENAME, JOB FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'JONES') AND ENAME != 'JONES'

--2. Display the name of the employee whose salary is the lowest.

SELECT TOP 1 ENAME FROM EMP ORDER BY SAL

--3. Display the names of all employees except the lowest paid.

SELECT ENAME FROM EMP WHERE SAL != (SELECT TOP 1 SAL FROM EMP ORDER BY SAL)

--4. Display the names of all employees whose job title is the same as anyone in the sales dept.

SELECT ENAME FROM EMP WHERE JOB IN (SELECT JOB FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES')) AND
DEPTNO != (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES')

--5. Display the names of all employees who work in a department that employs an analyst.

SELECT ENAME FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE JOB = 'ANALYST')

--6. Display the names of all employees with their job title, their current salary and their salary following:
--A. 10% pay rise for clerks and 
--B. 7% pay rise for all other employees.

SELECT ENAME, JOB, SAL, 
CASE
WHEN JOB = 'CLERK' THEN SAL * 0.1 
ELSE SAL * 0.07 END HIKE_BY,
CASE
WHEN JOB = 'CLERK' THEN SAL + SAL * 0.1 
ELSE SAL + SAL * 0.07 END HIKED_SAL 
FROM EMP

--7. Display the names of all employees with their salary and commission earned. Employees with a null commission field should have 0 in the commission column.

SELECT ENAME, SAL, ISNULL(COMM, 0) COMM FROM EMP

--8. Display the names of ALL employees with the total they have earned (ie. salary plus commission).

SELECT ENAME, (SAL + ISNULL(COMM, 0)) TOTAL_SAL FROM EMP