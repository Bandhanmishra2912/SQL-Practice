--Assignment for Joins

--1. Display the name of each employee with his department name.

SELECT EMP.ENAME, DEPT.DNAME FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO

--2. Display a list of all departments with the employees in each department.

SELECT DEPT.DEPTNO, DEPT.DNAME, EMP.ENAME FROM DEPT INNER JOIN EMP ON DEPT.DEPTNO = EMP.DEPTNO ORDER BY DEPT.DEPTNO

--3. Display all the departments with the manager for that department.

SELECT E.DEPTNO, M.ENAME DEPT_MANAGER FROM EMP E, EMP M WHERE E.MGR = M.EMPNO ORDER BY E.DEPTNO

--4. Display the names of each employee with the name of his/her boss.

SELECT E.ENAME, M.ENAME BOSS FROM EMP E, EMP M WHERE E.MGR = M.EMPNO ORDER BY E.DEPTNO