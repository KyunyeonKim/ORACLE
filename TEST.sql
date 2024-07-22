SELECT
    *
FROM departments;



SELECT employee_id , salary
    
FROM employees order by salary;

--?궗?썝?뀒?씠釉붿뿉?꽌 ?뾽臾댁퐫?뱶?? 湲됱뿬 異쒕젰
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

select last_name,job_id,salary,decode(job_id,'IT_PROG',salary*1.1)AS"?떎?닔?졊?븸"FROM employees;

select SYSDATE from dual;

select HIRE_DATE,ADD_MONTHS(HIRE_DATE,3)from employees where EMPLOYEE_ID = 100;

select ADD_MONTHS('13/04/20',12)from dual;

select sysdate,to_char(sysdate,'HH')from dual;

select SYSDATE, TO_CHAR(SYSDATE, 'HH') from dual;

 SELECT TO_NUMBER('100')+1 FROM dual;
 
 select TO_DATE(sysdate, 'yy/mm/dd') FROM dual;
 
  select TO_DATE('13-03-20', 'dd/mm/yy') FROM dual;
  
  --절대값 즉 - 또는 + 부호를 떼어낸수
  select abs(-30) from dual;
  --올림값
  select ceil(11.001)from dual;
  --내림값
  select floor(4.999)from dual;
  
   select cos(180*3.14/180) from dual;
   
   select sin(180*3.14/180)from dual;
   
   select tan(45*3.14/180)from dual;
   
   select MOD(11, 4) from dual;
   
   select count(first_name)from employees;
   
   select count(employee_id)from employees;
   
   select count(*)from employees;
--null은 제외됨   
   select count(commission_pct) from employees;

   
   select sum(salary)from employees;
   
   select sum (commission_pct)from employees;
   
   --null갯수 제외
   select avg(commission_pct)from employees;
   
   --null값을 0으로 대체되기때문에 갯수 포함
   select avg(NVL(commission_pct,0))from employees;
   
   select MAX(salary) from employees;
   
   select MIN(salary) from employees;
   
   select avg(salary) , department_id from employees group by department_id;
   
   select round (avg(salary)),department_id from employees group by department_id having department_id is not null;
   
   --연봉 8000이상인 사원들의 부서별 평균연봉의 반올림값을 출력하라.
   

   
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
   
   
 --  john이 속해있는 부서의 모든 사람의 부서번호 , 사원아이디 ,이름 입사일,급여를 출력해라
 select employee_id, first_name ||''|| last_name,
 department_id, hire_date , salary
 from employees;
 
 
 --7-1 전체 사원의 평균 임금보다 많은 사원의 사원번호,이름,부서명,입사일 급여를 출력해라
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, e.hire_date, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT AVG(salary) 
    FROM employees
);
 
 
 --7-2 전체 사원의 평균임금보다 많은 사원의 사원번호, 이름,부서명 입사일 지역명 급여를  출력해라
 SELECT e.employee_id, e.first_name, e.last_name, d.department_name, e.hire_date, l.city, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.salary > (
    SELECT AVG(salary) 
    FROM employees
);


--10번 부서중에서 30번 부서에서 없는 업무를 하는 사원의 사원번호,업무,이름,부서명,입사일,지역을 출력하라
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


--10번 부서와 같은 일을 하는 사원의 사원번호,업무,이름,부서번호,부서명,지역,급여를 출력하라
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

-- 11neena혹은 david의 급여와 같은 사원의 사원번호,이름,급여를 출력하라
SELECT e.employee_id, e.first_name || ' ' || e.last_name AS employee_name, e.salary
FROM employees e
WHERE e.salary IN (
    SELECT salary
    FROM employees
    WHERE first_name = 'Neena' OR first_name = 'David'
);

--12 급여가 30번 부서의 최고 급여보다 높은 사원의 사원번호,이름,급여를 출력하라
SELECT e.employee_id, e.first_name || ' ' || e.last_name AS employee_name, e.salary
FROM employees e
WHERE e.salary > (
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = 30
);

--13 급여가 30번 부서의 최고 급여보다 낮은 사원의 사원번호,이름,급여를 출력하라
SELECT e.employee_id, e.first_name || ' ' || e.last_name AS employee_name, e.salary
FROM employees e
WHERE e.salary > (
    SELECT MIN(salary)
    FROM employees
    WHERE department_id = 30
);

--14급여가 90번 부서의 최저급여보다 높은 사원의 사원번호,이름,급여 를 출력하라.

SELECT e.employee_id, e.first_name || ' ' || e.last_name AS employee_name, e.salary
FROM employees e
WHERE e.salary > (
    SELECT MIN(salary)
    FROM employees
    WHERE department_id = 90
);


--15급여가 90번 부서의 최저급여보다 낮은 사원의 사원번호,이름,급여 를 출력하라.
select e.employee_id,e.first_name || ' ' || e.last_name AS employee_name,e.salary
from employees e
where e.salary > (
select max(salary)
from employees
where department_id = 90
);

--16 사원이름과 부서명을 출력하라(단 뷰나 조인을 사용하지말고 서브쿼리 이용

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

-- 모든 번호는 pk설정
-- 각 테이블별 번호에 사용될 시퀀스 각각생성

-- 사람테이블person
-- 번호 ,이름, 나이, 생일
drop table person;
create table person(
num number primary key,
name varchar2(20),
age number,
birthday date
);
drop sequence seq_person;
create sequence seq_person;

-- 회원테이블member
-- 번호, 아이디,비번,이름 ,폰번
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

-- 게시글테이블 board
-- 번호, 제목, 내용, 작성자,작성일자
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

-- 상품테이블 product
-- 번호,제품명,모델,가격,갯수pcount
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

--학교
CREATE TABLE school (
    sch_num NUMBER PRIMARY KEY,
    sch_name VARCHAR2(20),
    sch_adr VARCHAR2(20),
    sch_phonenumber NUMBER,
    sch_date DATE
);

INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (1, '서울고', '서울', 02, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (2, '부산고', '부산', 051, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (3, '대구고', '대구', 054, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (4, '인천고', '인천', 051, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (5, '경북고', '경북', 054, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (6, '광주고', '광주', 062, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (7, '대전고', '대전', 042, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (8, '울산고', '울산', 052, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (9, '세종고', '세종', 044, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (10, '강원고', '강원', 033, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

select * from school;
--학과
CREATE TABLE department(
    dep_num NUMBER PRIMARY KEY,
    sch_num number,
    dep_name VARCHAR2(20),
    dep_phonenumber NUMBER,
    dep_date DATE
);
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (1, 1, '동물학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (2, 1, '심리학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (3, 3, '컴퓨터학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (4, 4, '생물학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (5, 5, '화학학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (6, 1, '전자학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (7, 1, '수학학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (8, 1, '영어학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (9, 1, '통계학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (10, 5, '회계학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));



select * from student;

--학생
CREATE TABLE student (
    stu_num NUMBER PRIMARY KEY,
    sch_num NUMBER,
    maj_num NUMBER,
    stu_name VARCHAR2(20),
    stu_phonenumber NUMBER
);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (1, 1, 2, '김철수', 01012345678);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (2, 1, 3, '김주먹', 01023456789);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (3, 2, 4, '김바위', 01034567890);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (4, 2, 1, '김가위', 01045678901);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (5, 3, 2, '장동건', 01056789012);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (6, 3, 3, '김동건', 01067890123);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (7, 4, 3, '박동건', 01078901234);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (8, 4, 2, '이동건', 01089012345);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (9, 5, 4, '김하나', 01090123456);

INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (10, 5, 1, '이하나', 01001234567);

select * from student;

--전공
CREATE TABLE major (
    maj_num NUMBER PRIMARY KEY,
    sch_num NUMBER,
    maj_name VARCHAR2(20),
    maj_phonenumber NUMBER,
    maj_date date
);

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (1, 1 ,'영어학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (2, 3, '심리학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (3, 4, '자동차학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (4, 6, '상담학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (5, 4, '컴퓨터학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (6, 5, '수학학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (7, 2,'통계학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (8, 3, '상경학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (9, 2, '불교학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (10, 8, '심리학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

select * from school;
select * from department;
select * from student;
select * from major;






-- 학교 테이블 생성
CREATE TABLE school (
    sch_num NUMBER PRIMARY KEY,
    sch_name VARCHAR2(20),
    sch_adr VARCHAR2(20),
    sch_phonenumber NUMBER,
    sch_date DATE
);

-- 학교 데이터 삽입
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (1, '서울고', '서울', 02, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (2, '부산고', '부산', 051, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (3, '대구고', '대구', 054, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (4, '인천고', '인천', 051, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (5, '경북고', '경북', 054, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (6, '광주고', '광주', 062, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (7, '대전고', '대전', 042, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (8, '울산고', '울산', 052, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (9, '세종고', '세종', 044, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO school (sch_num, sch_name, sch_adr, sch_phonenumber, sch_date)
VALUES (10, '강원고', '강원', 033, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

-- 학과 테이블 생성 (학교 참조)
CREATE TABLE department(
    dep_num NUMBER PRIMARY KEY,
    sch_num NUMBER REFERENCES school(sch_num),
    dep_name VARCHAR2(20),
    dep_phonenumber NUMBER,
    dep_date DATE
);

-- 학과 데이터 삽입
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (1, 1, '동물학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (2, 1, '심리학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (3, 3, '컴퓨터학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (4, 4, '생물학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (5, 5, '화학학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (6, 1, '전자학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (7, 1, '수학학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (8, 1, '영어학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (9, 1, '통계학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO department (dep_num, sch_num, dep_name, dep_phonenumber, dep_date)
VALUES (10, 5, '회계학부', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

-- 전공 테이블 생성 (학교 참조)
CREATE TABLE major (
    maj_num NUMBER PRIMARY KEY,
    sch_num NUMBER REFERENCES school(sch_num),
    maj_name VARCHAR2(20),
    maj_phonenumber NUMBER,
    maj_date DATE
);

-- 전공 데이터 삽입
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (1, 1, '영어학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (2, 3, '심리학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (3, 4, '자동차학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (4, 6, '상담학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (5, 4, '컴퓨터학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (6, 5, '수학학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (7, 2, '통계학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (8, 3, '상경학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (9, 2, '불교학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO major (maj_num, sch_num, maj_name, maj_phonenumber, maj_date)
VALUES (10, 8, '심리학과', 01012345678, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

-- 학생 테이블 생성 (학교 및 전공 참조)
CREATE TABLE student (
    stu_num NUMBER PRIMARY KEY,
    sch_num NUMBER REFERENCES school(sch_num),
    maj_num NUMBER REFERENCES major(maj_num),
    stu_name VARCHAR2(20),
    stu_phonenumber NUMBER
);

-- 학생 데이터 삽입
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (1, 1, 2, '김철수', 01012345678);
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (2, 1, 3, '김주먹', 01023456789);
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (3, 2, 4, '김바위', 01034567890);
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (4, 2, 1, '김가위', 01045678901);
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (5, 3, 2, '장동건', 01056789012);
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (6, 3, 3, '김동건', 01067890123);
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (7, 4, 3, '박동건', 01078901234);
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (8, 4, 2, '이동건', 01089012345);
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (9, 5, 4, '김하나', 01090123456);
INSERT INTO student (stu_num, sch_num, maj_num, stu_name, stu_phonenumber)
VALUES (10, 5, 1, '이하나', 01001234567);

-- 테이블 출력
SELECT * FROM school;
SELECT * FROM department;
SELECT * FROM major;
SELECT * FROM student;






















 
 
   

  
  






