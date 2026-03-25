--Assignment on SubQuery

--1. Find ename ,sal,deptno with minimum salary from each department.

SELECT ENAME, SAL, DEPTNO FROM EMP WHERE SAL IN (SELECT MIN(SAL) FROM EMP GROUP BY DEPTNO)

--2. Find average salary from all departments ,But Dispay an employee who has greater salary from average from all departments.

SELECT E.ENAME, E.SAL, E.DEPTNO, (SELECT AVG(A.SAL) FROM EMP A WHERE A.DEPTNO = E.DEPTNO) DEPT_AVG 
FROM EMP E WHERE E.SAL > (SELECT AVG(A.SAL) FROM EMP A WHERE A.DEPTNO = E.DEPTNO)

--3. Display the employee name, department number, and job title for all employees whose department location is Dallas.

SELECT ENAME, DEPTNO, JOB FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOCATION = 'DALLAS')

--4. What Is Wrong With This Statement?

SELECT empno, ename FROM emp WHERE sal = (SELECT MIN(sal)FROM emp GROUP BY deptno);

/*ANS. HERE, THE SUBQUERY GIVES OUT MULTIPLE VALUES WHICH AS A RESULT IS NOT ACCEPTED BY '=' OPERATOR SINCE IT CAN COMPARE ONE VALUE 
WITH ONLY ONE OTHER VALUE AND NOT MULTIPLE VALUES. THE RIGHT QUERY WOULD BE TO REPLACE THE '=' BY 'IN' OPERATOR*/

SELECT empno, ename FROM emp WHERE sal IN (SELECT MIN(sal)FROM emp GROUP BY deptno); -- CORRECT QUERY --

--5. Find top 2 highest paid employees from emp table.

SELECT * FROM EMP WHERE SAL IN (SELECT TOP 2 SAL FROM EMP ORDER BY SAL DESC)

--6. Find only Second Highest Salary from emp table.

SELECT * FROM EMP WHERE SAL = (SELECT MIN(SAL) FROM EMP WHERE SAL IN (SELECT TOP 2 SAL FROM EMP ORDER BY SAL DESC))

--7. Find only Third Highest salary from emp table.

SELECT * FROM EMP WHERE SAL = (SELECT MIN(SAL) FROM EMP WHERE SAL IN (SELECT TOP 3 SAL FROM EMP ORDER BY SAL DESC))

--8. Fetch employees who earn more than their department's average salary

SELECT * FROM EMP E WHERE E.SAL > (SELECT AVG(A.SAL) FROM EMP A WHERE A.DEPTNO = E.DEPTNO)