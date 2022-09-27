/* 서브 쿼리 복습 */
-- (실습 1) 현재를 기준으로 각 부서에서 급여를 가장 많이 받는 사원은 누구인지 찾는 쿼리 작성하기


-- (실습 2) box_office 테이블에서 2018년과 2019년에 개봉한 영화를 대상으로 연도별, 분기별 매출액을 구하는데,
-- 다음 형식으로 조회되도록 쿼리를 작성하기
-- ----------------------------------------------
-- 연도  |    1분기  |   2분기  |   3분기  |  4분기 
-- ----------------------------------------------
-- 2018 |          |         |         |
-- ----------------------------------------------
-- 2019 |          |         |         |
-- ----------------------------------------------

 
-- (실습 3) 현재를 기준으로 어느 부서에도 속하지 않은 사원은 모두 몇 명인지 구하는 쿼리 작성하기


-- inerst'
use mywork;
create table emp_test(
	emp_no int not null,
	emp_name varchar(30) not null,
	hire_date date null,
	salary int null,
	primary key (emp_no)
);

insert into emp_test(emp_no, emp_name, hire_date)
	          values(1003,'뉴턴','2022-02-01');
              
insert into emp_test values
              (1005,'퀴리','2022-02-04'),
		      (1006,'아이작','2022-02-06');
 
create table emp_test2(
	emp_no int not null,
	emp_name varchar(30) not null,
	hire_date date null,
	salary int null,
	primary key (emp_no)
);

select * from emp_test2;

insert into emp_test2 (emp_no, emp_name, hire_date, salary)
select emp_no, emp_name, hire_date, salary
    from emp_test
    where emp_no in (1003,1004);
    
select * from emp_test2;


create table emp_update1 as 
select *
 from emp_test;
 alter table emp_update1
        add constraint primary key (emp_no);

create table emp_update2 as 
select *
 from emp_test2;
 alter table emp_update2
        add constraint primary key (emp_no);
        
update emp_update1
 set emp_name = concat(emp_name,'2'),
	 salary = salary + 100;
     
select * from emp_update1;

update emp_update2 a, a.emp_update1 b
 set a.emp_name = b.emp_name
 where a.emp_name = b.emp_name
 and a.emp_no between 1001 and 1002; -- emp_no in (1001,1002);

     
insert into emp_update2
select emp_no, emp_name, hire_date, salary
from emp_update1 a
where emp_no between 1001 and 1002
on duplicate key update emp_name = a.emp_name;

create table emp_delete
select * from emp_test;

delete from emp_delete
where emp_name = '맥스웰'
order by emp_no desc
limit 1;

create table emp_delete2
select * from emp_test;

alter table emp_delete2
add constraint primary key(emp_no);

-- using 문법으로 대체(삭제 대상 테이블 1개만 두기)
delete b
from emp_delete a, emp_delete b
where a.emp_no = b.emp_no;

delete from a,b
using emp_delete a, emp_delte2 b
where a.emp_no = b.emp_no;
select * from emp_Delete;



