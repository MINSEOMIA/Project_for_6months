use mywork;

CREATE TABLE emp_hierarchy (
       employee_id   INT, 
       emp_name      VARCHAR(80),
       manager_id    INT,
       salary        INT,
       dept_name     VARCHAR(80)
);

iNSERT INTO emp_hierarchy VALUES 
(200,'Jennifer Whalen',101,4400,'Administration'),
(203,'Susan Mavris',101,6500,'Human Resources'),
(103,'Alexander Hunold',102,9000,'IT'),
(104,'Bruce Ernst',103,6000,'IT'),
(105,'David Austin',103,4800,'IT'),
(107,'Diana Lorentz',103,4200,'IT'),
(106,'Valli Pataballa',103,4800,'IT'),
(204,'Hermann Baer',101,10000,'Public Relations'),
(100,'Steven King',null,24000,'Executive'),
(101,'Neena Kochhar',100,17000,'Executive'),
(102,'Lex De Haan',100,17000,'Executive'),
(113,'Luis Popp',108,6900,'Finance'),
(112,'Jose Manuel Urman',108,7800,'Finance'),
(111,'Ismael Sciarra',108,7700,'Finance'),
(110,'John Chen',108,8200,'Finance'),
(108,'Nancy Greenberg',101,12008,'Finance'),
(109,'Daniel Faviet',108,9000,'Finance'),
(205,'Shelley Higgins',101,12008,'Accounting'),
(206,'William Gietz',205,8300,'Accounting');

select employee_id, emp_name, dept_name, salary
 from emp_hierachy
order by 3,4 desc;

-- 부서별 salary 합계
select emp_name,dept_name,salary, sum(salary) over (partition by dept_name) sum_salary
from emp_hierchy
order by 3,4 desc;

-- row number()
select emp_name,dept_name,salary, sum(salary) over (partition by dept_name), 
row_number() over (partition by dept_name) sequence
from emp_hierchy
order by 3,4 desc;

-- 2019년 상위 10편 영화순위,제목,매출ㄹ액 연도별 총매출액
use mywork;
select movie_name, ranks, sum(sale_amt), 
--  어차피 2019로 필터링 되어있어서 파티션 안해도 됨 sum(sale_amt) over (partition by year(release_date))rates
sum(sale_amt) over () rates
from box_office
where year(release_date) = 2019
and ranks <= 10;
-- 매출액 많은 순서대로 누적분포 값 구하는 쿼리
use mywork;
select movie_name, ranks, sum(sale_amt), 
sum(sale_amt) over () rates,
cume_dist() over(order by sale_amt  desc) cume_dist_amt -- 누적분포 컬럼
from box_office
where year(release_date) = 2019
and ranks <= 10;

 select employee_id, emp_name, dept_name, salary,
 ntile(3) over (partition by dept_name order by salary desc) ntiles
from emp_hierchy
order by 3,4 desc;