SELECT
    *
FROM departments;



SELECT employee_id , salary
    
FROM employees order by salary;

--사원테이블에서 업무코드와 급여 출력
SELECT
    job_id,salary
FROM employees
ORDER BY job_id DESC, salary desc;

select EMPLOYEE_ID, SALARY from employees; 
select EMPLOYEE_ID, SALARY from employees order by SALARY; 
select EMPLOYEE_ID, SALARY from employees order by SALARY asc; 
select EMPLOYEE_ID, SALARY from employees order by SALARY desc; 
select JOB_ID, SALARY from employees order by JOB_ID, SALARY; 
select JOB_ID, SALARY from employees order by JOB_ID asc, SALARY asc; 
select JOB_ID, SALARY from employees order by JOB_ID, SALARY desc; 
select JOB_ID, SALARY from employees order by JOB_ID desc, SA

SELECT EMPLOYEE_ID,SALARY FROM EMPLOYEES
WHERE SALARY>=20000 OR SALARY <=2100
UNION
SELECT EMPLOYEE_ID,SALARY FROM EMPLOYEES
WHERE SALARY<=2200;

SELECT commission_pct * salary FROM employees;

select * from employees;

select last_name,job_id,salary,decode(job_id,'IT_PROG',salary*1.1)AS"실수령액"FROM employees;
