ALTER SESSION SET CURRENT_SCHEMA = HR;

SELECT
    *
FROM departments;



SELECT employee_id , salary
    
FROM employees order by salary;

--������̺��� �����ڵ�� �޿� ���
SELECT
    job_id,salary
FROM employees
ORDER BY job_id DESC, salary desc;

