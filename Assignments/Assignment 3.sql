--1.Display the highest, lowest ,sum and average salary of all employees

SELECT MAX(SAL) HIGHEST_SAL, MIN(SAL) LOWEST_SAL, SUM(SAL) TOTAL_SAL, AVG(SAL) AVERAGE_SAL FROM EMP

--2.Display the minimum ,maximum, sum and average salary for each job type

SELECT JOB, MIN(SAL) LOWEST_SAL, MAX(SAL) HIGHEST_SAL, SUM(SAL) TOTAL_SAL, AVG(SAL) AVERAGE_SAL FROM EMP GROUP BY JOB

--3.Write a query to display the no.of people with same job

SELECT JOB, COUNT(JOB) TOTAL_EMP FROM EMP GROUP BY JOB

--4.Determine the no.of managers without listing them

SELECT JOB, COUNT(JOB) TOTAL_EMP FROM EMP GROUP BY JOB HAVING JOB = 'MANAGER'

--5.Write a query that will display the difference between the highest and lowest salary

SELECT MAX(SAL) HIGHEST_SAL, MIN(SAL) LOWEST_SAL, MAX(SAL) - MIN(SAL) DIFF FROM EMP

--6.Display manager number and the salary of the lowest paid employee for their manager. Exclude anyone whose manager is not known.Exclude any groups where the minimum salary is less than 1000

SELECT MGR, COUNT(MGR) TOTAL_EMP, MIN(SAL) LOWEST_SAL FROM EMP WHERE MGR > 0 AND SAL > 1000 GROUP BY MGR

--7.Create a query that will display total no.of employees and of that total no. who were hired in 1990,1992,1993

SELECT YEAR(HIREDATE) HIREYEAR, COUNT(ENAME) TOTAL_EMP FROM EMP WHERE YEAR(HIREDATE) IN (1990, 1992, 1993) GROUP BY YEAR(HIREDATE)

--8. Display job, salary of that job based on department number and the total salary for that job for all departments

SELECT JOB, SAL FROM EMP WHERE EXISTS (SELECT SUM(SAL) FROM EMP GROUP BY JOB)

--9. Find the job which has the highest salary

SELECT TOP 1 JOB, MAX(SAL) HIGHEST_SAL FROM EMP GROUP BY JOB ORDER BY MAX(SAL) DESC

--10. Find the number of Clerks in each department
SELECT DEPTNO, COUNT(JOB) TOTAL_EMP FROM EMP WHERE JOB = 'CLERK' GROUP BY DEPTNO
