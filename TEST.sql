SELECT
    *
FROM departments;



SELECT employee_id , salary
    
FROM employees order by salary;

--?��?��?��?��블에?�� ?��무코?��?? 급여 출력
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

select first_name,job_id from employees;

select last_name,job_id,salary,decode(job_id,'IT_PROG',salary*1.1)AS"?��?��?��?��"FROM employees;

select SYSDATE from dual;

select HIRE_DATE,ADD_MONTHS(HIRE_DATE,3)from employees where EMPLOYEE_ID = 100;

select ADD_MONTHS('13/04/20',12)from dual;

select sysdate,to_char(sysdate,'HH')from dual;

select SYSDATE, TO_CHAR(SYSDATE, 'HH') from dual;

 SELECT TO_NUMBER('100')+1 FROM dual;
 
 select TO_DATE(sysdate, 'yy/mm/dd') FROM dual;
 
  select TO_DATE('13-03-20', 'dd/mm/yy') FROM dual;
  
  --���밪 �� - �Ǵ� + ��ȣ�� �����
  select abs(-30) from dual;
  --�ø���
  select ceil(11.001)from dual;
  --������
  select floor(4.999)from dual;
  
   select cos(180*3.14/180) from dual;
   
   select sin(180*3.14/180)from dual;
   
   select tan(45*3.14/180)from dual;
   
   select MOD(11, 4) from dual;
   
   select count(first_name)from employees;
   
   select count(employee_id)from employees;
   
   select count(*)from employees;
--null�� ���ܵ�   
   select count(commission_pct) from employees;

   
   select sum(salary)from employees;
   
   select sum (commission_pct)from employees;
   
   --null���� ����
   select avg(commission_pct)from employees;
   
   --null���� 0���� ��ü�Ǳ⶧���� ���� ����
   select avg(NVL(commission_pct,0))from employees;
   
   select MAX(salary) from employees;
   
   select MIN(salary) from employees;
   
   select avg(salary) , department_id from employees group by department_id;
   
   select round (avg(salary)),department_id from employees group by department_id having department_id is not null;
   
   --���� 8000�̻��� ������� �μ��� ��տ����� �ݿø����� ����϶�.
   

   
SELECT department_id, ROUND(AVG(salary))
FROM employees
WHERE salary >= 8000
GROUP BY department_id;

SELECT department_id, ROUND(AVG(salary)) AS r
FROM employees
WHERE salary >= 8000
GROUP BY department_id
ORDER BY r ASC;

select department_id, round(avg(salary)) as r 
from employees 
where salary >=8000
group by department_id
order by r asc;

select department_id,round(avg(salary)) as r
from employees
where salary>=10000
group by department_id
order by department_id asc;

select department_id , job_id,count(*)
from employees
group by department_id,job_id
order by department_id,job_id desc;
   
   
 --  john�� �����ִ� �μ��� ��� ����� �μ���ȣ , ������̵� ,�̸� �Ի���,�޿��� ����ض�
 select employee_id, first_name ||''|| last_name,
 department_id, hire_date , salary
 from employees;
 
 
 --7-1 ��ü ����� ��� �ӱݺ��� ���� ����� �����ȣ,�̸�,�μ���,�Ի��� �޿��� ����ض�
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, e.hire_date, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT AVG(salary) 
    FROM employees
);
 
 
 --7-2 ��ü ����� ����ӱݺ��� ���� ����� �����ȣ, �̸�,�μ��� �Ի��� ������ �޿���  ����ض�
 SELECT e.employee_id, e.first_name, e.last_name, d.department_name, e.hire_date, l.city, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.salary > (
    SELECT AVG(salary) 
    FROM employees
);

 
 
   

  
  






