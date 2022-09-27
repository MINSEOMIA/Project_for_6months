/* 내부 조인 */
USE WORLD;
select a.name, b.name, count(*) 도시수
  from country a
  join city b
    on a.code = b.countrycode
  group by a.name WITH ROLLUP;
  

select if(grouping(a.name), '전체도시수',a.name) 도시, count(*) 도시수
  from country a
  join city b
    on a.code = b.countrycode
  group by a.name WITH ROLLUP;
  
  /* 외부 조인*/
  SELECT continent
  FROM COUNTRY 
  group by continent;
  -- vs
  /* 내부 조인 */
select a.continent, count(*) 
  from country a
  join city b
    on a.code = b.countrycode
  group by a.continent;
  
  
  select a.name, b.language
  from country a
  left join countrylanguage b
    on a.code = b.countrycode
    where a.continent = 'africa';
    
    
/*union*/
use mywork;
drop table tbl1
drop table tbl2
create table tbl1 (col1 int, col2 varchar(20));
create table tbl2 (col1 int, col2 varchar(20));


/* 사원 기존 정보를 이용한 테이블 조인 실습 */

-- (실습 1) 사원의 사번, 이름, 부서명 조회하기

-- (실습 2) 부서의 현재 관리자 정보 조회하기

-- (실습 3) 모든 부서의 이름과 현재 관리자의 사번 조회하기

-- (실습 4) 부서별 사원 수와 전체 부서의 총 사원 수 구하기


use mywork;
select year(release_date),movie_name, sale_amt 
 from box_office
 where rannks = 1
order by 1;

-- 1위 영화들의 평균 매출액--
use mywork;
select year(release_date), movie_name, avg(sale_amt)
 from box_office
 where rannks = 1
order by 1;

-- 1위 영화들의 평균을 알고 싶을 때
select ave(sale_amt)
from box_office
where ranks = 1;

-- 1위인 각 여오하들 매출액이 전체평균매출액보다 큰 영화
select year(release_date), movie_name, sale_amt
 from box_office
 where rannks = 1
and sale_amt >= 81906468809.5
order by 1;

-- 서브쿼리 이용
select col
 from tbl, (서브쿼리)
 where cond;
 
 -- 파생 테이블 이용
 select year(release_Date), movie_name, sale_amt, b.avg_amt
 from box_office a,
 (select avg(sale_amt) avg_amt
  from box_office
  where ranks = 1
  )b
 where ranks = 1
and a.sale_amt > b.avg_amt;

-- where 절 서브쿼리
 select year(release_Date), movie_name, sale_amt
 from box_office 
 where ranks = 1
and sale_amt > (select avg(sale_amt)
				 from box_office
                  where ranks =1);
                  
-- 스칼라 서브쿼리
use world;
select name, district, population, countrycode

  
