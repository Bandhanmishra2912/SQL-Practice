--1.Create a Query to display the name and salary of employees earning more than 2850

SELECT * FROM EMP WHERE SAL > 2850

--2.Create a query to display the employee name and department number for employee number 7566

SELECT ENAME,DEPTNO FROM EMP WHERE EMPNO = 7566

--3.Display the name and salary of all employees whose salary is not in the range of 1500,2850

SELECT * FROM EMP WHERE NOT SAL BETWEEN 1500 AND 2850

--4.Display the employee name, job and start date of employees hired between February 20,1993 and May 1 2000 

SELECT ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE BETWEEN '02-20-1993' AND '05-01-2000'

--5.Display the employee name and department number of all employees in departments 10 and 30 

SELECT ENAME, DEPTNO FROM EMP WHERE DEPTNO IN (10, 30) 

--6.List the name and salary of employees who earn more than 1500 and are in department 10 or 30

SELECT ENAME, SAL FROM EMP WHERE SAL > 1500 AND DEPTNO IN (10,30)

--7.Display the name and hiredate of every employee who was hired in 1993

SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE BETWEEN '01-01-1993' AND '12-31-1993'

--8.Display the name and job title of all employees who is not a manager

SELECT ENAME, JOB FROM EMP WHERE JOB != 'MANAGER'

--9.Display the name, salary and commission for all employees who earn commission

SELECT ENAME, SAL, COMM FROM EMP WHERE COMM > 0

--10.Display the name of all employees where the third letter of their name is an A

SELECT ENAME FROM EMP WHERE ENAME LIKE '__A%'

--11.Display the name of all employees who have two Ls in their name and are in department 30 or their manager is 7782

SELECT ENAME FROM EMP WHERE ENAME LIKE '%LL%' AND DEPTNO = 30 OR MGR = 7782

--12.Display the name, job and salary for all employees whose job is clerk or analyst and their salary is not equal to 1000,3000,5000

SELECT ENAME, JOB, SAL FROM EMP WHERE JOB IN ('CLERK', 'ANALYST') AND SAL NOT IN (1000, 3000, 5000)

--13.Display the name, salary and commission for all employees whose commission amount is greater than their 10% of their salary

SELECT ENAME, SAL, COMM FROM EMP WHERE COMM > (SAL/10) --YOU CAN ALSO USE (SAL*N)/100 IN CASE OF ABRUPT NUMBERS