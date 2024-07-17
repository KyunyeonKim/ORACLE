ALTER SESSION SET CURRENT_SCHEMA = HR;

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

