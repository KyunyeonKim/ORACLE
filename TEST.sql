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


--10�� �μ��߿��� 30�� �μ����� ���� ������ �ϴ� ����� �����ȣ,����,�̸�,�μ���,�Ի���,������ ����϶�
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, e.hire_date, l.city, e.job_id
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.department_id = 10
AND e.job_id NOT IN (
    SELECT job_id
    FROM employees
    WHERE department_id = 30
);

select * from locations;

select * from departments;

select * from employees;


--10�� �μ��� ���� ���� �ϴ� ����� �����ȣ,����,�̸�,�μ���ȣ,�μ���,����,�޿��� ����϶�
SELECT e.employee_id, e.job_id, e.first_name || ' ' || e.last_name AS employee_name, 
       e.department_id, d.department_name, l.city, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.job_id IN (
    SELECT job_id
    FROM employees
    WHERE department_id = 10
);

-- 11neenaȤ�� david�� �޿��� ���� ����� �����ȣ,�̸�,�޿��� ����϶�
SELECT e.employee_id, e.first_name || ' ' || e.last_name AS employee_name, e.salary
FROM employees e
WHERE e.salary IN (
    SELECT salary
    FROM employees
    WHERE first_name = 'Neena' OR first_name = 'David'
);

--12 �޿��� 30�� �μ��� �ְ� �޿����� ���� ����� �����ȣ,�̸�,�޿��� ����϶�
SELECT e.employee_id, e.first_name || ' ' || e.last_name AS employee_name, e.salary
FROM employees e
WHERE e.salary > (
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = 30
);

--13 �޿��� 30�� �μ��� �ְ� �޿����� ���� ����� �����ȣ,�̸�,�޿��� ����϶�
SELECT e.employee_id, e.first_name || ' ' || e.last_name AS employee_name, e.salary
FROM employees e
WHERE e.salary > (
    SELECT MIN(salary)
    FROM employees
    WHERE department_id = 30
);

--14�޿��� 90�� �μ��� �����޿����� ���� ����� �����ȣ,�̸�,�޿� �� ����϶�.

SELECT e.employee_id, e.first_name || ' ' || e.last_name AS employee_name, e.salary
FROM employees e
WHERE e.salary > (
    SELECT MIN(salary)
    FROM employees
    WHERE department_id = 90
);


--15�޿��� 90�� �μ��� �����޿����� ���� ����� �����ȣ,�̸�,�޿� �� ����϶�.
select e.employee_id,e.first_name || ' ' || e.last_name AS employee_name,e.salary
from employees e
where e.salary > (
select max(salary)
from employees
where department_id = 90
);

--16 ����̸��� �μ����� ����϶�(�� �䳪 ������ ����������� �������� �̿�

SELECT e.first_name || ' ' || e.last_name AS employee_name,
       (SELECT d.department_name
        FROM departments d
        WHERE d.department_id = e.department_id) AS department_name
FROM employees e;


CREATE TABLE sample1 (
    num NUMBER PRIMARY KEY,
    fname VARCHAR2(20),
    lname VARCHAR2(20) NOT NULL,
    tel VARCHAR2(20) NOT NULL,
    addr VARCHAR2(100),
    regdate DATE DEFAULT SYSDATE
);

create table job as select * from jobs;

create table sample2(num number);

alter table sample2 add(fname varchar2(20));

drop table sample2;


create table sample2(num number);

alter table sample2 add(fname varchar2(20));

-- ��� ��ȣ�� pk����
-- �� ���̺� ��ȣ�� ���� ������ ��������

-- ������̺�person
-- ��ȣ ,�̸�, ����, ����
drop table person;
create table person(
num number primary key,
name varchar2(20),
age number,
birthday date
);
drop sequence seq_person;
create sequence seq_person;

-- ȸ�����̺�member
-- ��ȣ, ���̵�,���,�̸� ,����
drop table member;
CREATE TABLE MEMBER 
(
  NUM NUMBER NOT NULL 
, ID VARCHAR2(20) NOT NULL 
, PW VARCHAR2(20) NOT NULL 
, NAME VARCHAR2(20) NOT NULL 
, TEL VARCHAR2(20) NOT NULL 
, CONSTRAINT MEMBER_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);
drop sequence seq_member;
create sequence seq_member;

-- �Խñ����̺� board
-- ��ȣ, ����, ����, �ۼ���,�ۼ�����
drop table board;
CREATE TABLE board 
(
  NUM NUMBER NOT NULL 
, title VARCHAR2(50) NOT NULL 
, content VARCHAR2(2000) 
, writer VARCHAR2(20) NOT NULL 
, wdate date default sysdate
, CONSTRAINT BOARD_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);
drop sequence seq_board;
create sequence seq_board;

-- ��ǰ���̺� product
-- ��ȣ,��ǰ��,��,����,����pcount
drop table product;
CREATE TABLE product 
(
  NUM NUMBER NOT NULL 
, PNAME VARCHAR2(50) NOT NULL 
, MODEL VARCHAR2(2000) NOT NULL 
, PRICE NUMBER NOT NULL 
, COUNT NUMBER default 0
, CONSTRAINT PRODUCT_PK PRIMARY KEY 
  (
    NUM 
  )
  ENABLE 
);
drop sequence seq_product;
create sequence seq_product;

insert into
person(num,name,age,birthday)
values(4,'kim',11,'2024-11-11');

SELECT
    *
FROM person;

drop table school;
drop table major;
drop table student;

--�б�
CREATE TABLE school (
    sch_num NUMBER PRIMARY KEY,
    sch_name VARCHAR2(20),
    sch_adr VARCHAR2(20),
    sch_phonenumber NUMBER,
    sch_date DATE
);

INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (1, '�����', '����', 02, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (2, '�λ��', '�λ�', 051, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (3, '�뱸��', '�뱸', 054, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (4, '��õ��', '��õ', 051, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (5, '��ϰ�', '���', 054, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (6, '���ְ�', '����', 062, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (7, '������', '����', 042, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (8, '����', '���', 052, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (9, '������', '����', 044, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (10, '������', '����', 033, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

select * from school;
--�а�
CREATE TABLE department(
    dep_num NUMBER PRIMARY KEY,
    sch_num number,
    dep_name VARCHAR2(20),
    dep_phonenumber NUMBER,
    dep_date DATE
);
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (1, 1, '�����к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (2, 1, '�ɸ��к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (3, 3, '��ǻ���к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (4, 4, '�����к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (5, 5, 'ȭ���к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (6, 1, '�����к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (7, 1, '�����к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (8, 1, '�����к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (9, 1, '����к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (10, 5, 'ȸ���к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));



select * from student;

--�л�
CREATE TABLE student (
    stu_num NUMBER PRIMARY KEY,
    sch_num NUMBER,
    maj_num NUMBER,
    stu_name VARCHAR2(20),
    stu_phonenumber NUMBER
);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (1, 1, 2, '��ö��', 01012345678);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (2, 1, 3, '���ָ�', 01023456789);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (3, 2, 4, '�����', 01034567890);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (4, 2, 1, '�谡��', 01045678901);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (5, 3, 2, '�嵿��', 01056789012);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (6, 3, 3, '�赿��', 01067890123);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (7, 4, 3, '�ڵ���', 01078901234);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (8, 4, 2, '�̵���', 01089012345);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (9, 5, 4, '���ϳ�', 01090123456);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (10, 5, 1, '���ϳ�', 01001234567);

select * from student;

--����
CREATE TABLE major (
    maj_num NUMBER PRIMARY KEY,
    sch_num NUMBER,
    maj_name VARCHAR2(20),
    maj_phonenumber NUMBER,
    maj_date date
);

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (1, 1 ,'�����а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (2, 3, '�ɸ��а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (3, 4, '�ڵ����а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (4, 6, '����а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (5, 4, '��ǻ���а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (6, 5, '�����а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (7, 2,'����а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (8, 3, '����а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (9, 2, '�ұ��а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (10, 8, '�ɸ��а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

select * from school;
select * from department;
select * from student;
select * from major;






-- �б� ���̺� ����
CREATE TABLE school (
    sch_num NUMBER PRIMARY KEY,
    sch_name VARCHAR2(20),
    sch_adr VARCHAR2(20),
    sch_phonenumber NUMBER,
    sch_date DATE
);

-- �б� ������ ����
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (1, '�����', '����', 02, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (2, '�λ��', '�λ�', 051, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (3, '�뱸��', '�뱸', 054, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (4, '��õ��', '��õ', 051, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (5, '��ϰ�', '���', 054, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (6, '���ְ�', '����', 062, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (7, '������', '����', 042, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (8, '����', '���', 052, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (9, '������', '����', 044, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (10, '������', '����', 033, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

-- �а� ���̺� ���� (�б� ����)
CREATE TABLE department(
    dep_num NUMBER PRIMARY KEY,
    sch_num NUMBER REFERENCES school(sch_num),
    dep_name VARCHAR2(20),
    dep_phonenumber NUMBER,
    dep_date DATE
);

-- �а� ������ ����
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (1, 1, '�����к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (2, 1, '�ɸ��к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (3, 3, '��ǻ���к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (4, 4, '�����к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (5, 5, 'ȭ���к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (6, 1, '�����к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (7, 1, '�����к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (8, 1, '�����к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (9, 1, '����к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (10, 5, 'ȸ���к�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

-- ���� ���̺� ���� (�б� ����)
CREATE TABLE major (
    maj_num NUMBER PRIMARY KEY,
    sch_num NUMBER REFERENCES school(sch_num),
    maj_name VARCHAR2(20),
    maj_phonenumber NUMBER,
    maj_date DATE
);

-- ���� ������ ����
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (1, 1, '�����а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (2, 3, '�ɸ��а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (3, 4, '�ڵ����а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (4, 6, '����а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (5, 4, '��ǻ���а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (6, 5, '�����а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (7, 2, '����а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (8, 3, '����а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (9, 2, '�ұ��а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (10, 8, '�ɸ��а�', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

-- �л� ���̺� ���� (�б� �� ���� ����)
CREATE TABLE student (
    stu_num NUMBER PRIMARY KEY,
    sch_num NUMBER REFERENCES school(sch_num),
    maj_num NUMBER REFERENCES major(maj_num),
    stu_name VARCHAR2(20),
    stu_phonenumber NUMBER
);

-- �л� ������ ����
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (1, 1, 2, '��ö��', 01012345678);
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (2, 1, 3, '���ָ�', 01023456789);
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (3, 2, 4, '�����', 01034567890);
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (4, 2, 1, '�谡��', 01045678901);
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (5, 3, 2, '�嵿��', 01056789012);
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (6, 3, 3, '�赿��', 01067890123);
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (7, 4, 3, '�ڵ���', 01078901234);
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (8, 4, 2, '�̵���', 01089012345);
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (9, 5, 4, '���ϳ�', 01090123456);
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (10, 5, 1, '���ϳ�', 01001234567);

-- ���̺� ���
SELECT * FROM school;
SELECT * FROM department;
SELECT * FROM major;
SELECT * FROM student;






















 
 
   

  
  






