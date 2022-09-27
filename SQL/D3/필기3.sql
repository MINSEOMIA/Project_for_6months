select cast(10 as char),
	cast("10.21315" as double),
	cast("2022-04-06" as datetime);

select convert(10, char),
	convert("10.21315", double),
	convert("2022-04-06", datetime);
    
    
-- select if(참, 참일경우실행, 거짓일경우실행);
select if(2<1, 1, 0);

select ifnull(null, "null입니다"),
	   ifnull(1, "null입니다");
       
select nullif(1, 1), 
       nullif(1, 2);  
       
select case 1  when 0 then 'a'
			   when 1 then 'b'
	   end case1,
       
       case 3  when 0 then 'a'
			   when 1 then 'b'
               else "none"
	   end case2,
       
       case when 25 between 1 and 19  then '10대'
			when 25 between 20 and 30  then '20대'
            else "30대 이상"
	   end case3;       


-- (실습) box_office 테이블에서 2019년 개봉한 영화 중 순위기준 상위 10위까지 영화
-- 이 때 개봉일이 무슨 요일인지와 개봉일이 어떤분기(quarter)에 속해있는지도 조회하기 
-- (예: quarter(release_date) 가 1 또는 2이면 상반기, 3 또는 4이면 하반기)
use mywork;
select release_date, ranks,dayname(release_date),
	case when quarter(release_date) in (1, 2) then '상반기'
	     else '하반기'
	end 분기
and box_office
where release_date = 2019
order by ranks
desc limit 10;

-- (실습) world 데이터베이스에 있는 country 테이블에는 indepyear라는 컬럼에는 해당 국가의 독립연도가 저장되어 있음
-- 이 때 각 국가명과 독립연도를 조회해 독립연도의 값이 없으면 '없음', 있으면 해당 독립연도를 조회하는 쿼리 작성하기
-- (힌트 : ifnull 함수 이용하기)
use world;
select name, indepyear, ifnull(indepyear,'없음') 
from country
where name = 'south korea';
 

-- (실습) mywork 데이터베이스의 box_office 테이블에서 2019년 개봉한 영화 중 
-- 순위(ranks)가 1~10위인 경우 "상위10" 그 외(11위 이상)는 "나머지" 라고 표시하기
-- (힌트 : case when 활용)
use mywork;
select movie_name, ranks,
 case when ranks between 1 and 10 then '상위 10'
	  else '나머지'
 end 순위
 from box_office
 where year = 2019;
 
 -- 데이터 집계
 use world;
 -- 그룹화
 select  continent
  from country
  group by continent
  order by continent;
   
   select  continent
  from country
  group by 1
  order by 1;
  
   select  continent,region
  from country
  group by continent, region
  order by continent, region;
  
  select name, district,substring(district, 1, 3) as dist
   from city
   where countrycode = 'KOR'
   group by dist;
   
   
   -- 집계함수
   select count(*), count(continent)
    from country;
       select count(*), count(distinct continent)
    from country;
    
    select count(*), count(distinct name)
      from country
      where continent = 'europe';
      
      select max (population), min(populaiton),avg(population)
        from country 
        where continent = 'europe';
        
         -- 1
         select max (population)
        from country 
        where continent = 'europe';
        -- 2
        select name, population
        from country
        where continent='europe' and population = 14693400;
        
		select a.name, a.populaiton, b.max_population
	from (
        select max(population) as max_pp
        from country
        where continent = 'europe'
        )b, country a 
        where  a.population = b.max_population;
        
        desc city;
        select countrycode, count(*)
         from city
          group by countrycode;
          
-- (실습) 2019년 개봉 영화의 유형별 최대, 최소 매출액과 전체 매출액 집계하기 
use mywork
select movie_type, max(sale_amt),min(sale_amt), sum(sale_amt)
	from box_office
	where year= 2019
	group by movie_type;

desc box_office;
-- (실습) 2019년 개봉 영화 중 매출액이 1억 원 이상인 영화의 분기별, 배급사별 개봉 영화 수와 매출액 집계하기
select quarter(year), distributor,count(*),round(sum(sale_amt)/100000000) as 매출액
from box_office
where year= 2019
	 and sale_amt >= 100000000
     group by quarter(year),distributor 
     order by 1;

-- (실습) world 데이터베이스의 country 테이블에서 대륙별 면적(surface)이 가장 크고 인구가 가장 많은 대륙 순으로 정렬하는 쿼리

use world;
select continent, sum(surfacearea), sum(population), count(*)
from country
group by continent
order by 2 desc, 3 desc;

-- (실습) mywork 데이터베이스의 box_office 테이블에서 2019년 개봉 영화 중 1~10위 영화와 나머지 영화의 매출액 합계를 구하는 쿼리
use mywork;
select case when ranks between 1 and 10 then '상위10'
            else '나머지'
		end 순위,sum(sale_amt),count(*)
 from box_office
 where year(release_date) = 2019
 group by 1;
 
 -- 2019 1분기개봉 매출액천만이상
 select month(year),movie_type,sum(sale_amt),count(*)
 from box_office
 where year = 2019
 and quarter = 1
 and sale_amt >= 10000000
 group by month(year), movie_type
 order by 1;
 
 select *
 from box_office
 where ranks between 1 and 10
 group by extract(year_month from release_date);
 
 -- 개봉월별로 순위가 1-10위에 있는 영화 편수
 -- 이때 영화가 2편이상 개봉한 년월만 골라 조회 
 select extract(year_month from release_date) as 개봉년월, count(*) 개봉편수
 from box_office
   where ranks between 1 and 10
   group by extract(year_month from release_date)
   having count(*) > 2;
 
 -- 개봉월별 매출액이 1500억 이상인 경우 조회
  select extract(year_month from release_date) as 개봉년월, round(sum(sale_amt)/100000000)
 from box_office
   where ranks between 1 and 10
   group by extract(year_month from release_date)
   having sum(sale_amt)/100000000 > 1500
   order by 2 desc;
   
  -- 
  select movie_type, sum(sale_amt)
  from box_office
  where year = 2019
  and sale_amt > 10000000
  group by movie_type


-- inner 내부조인
use world;
select a.id, a.name,a.countrycode,b.code,b.continent,a.population
	from city a 
	inner join country b 
     on a.countrycode = b.code;
-- from 
-- left outer join 
-- on a con1 =b con2

select b.name, a.language, a.percentage 
 from countrylanguage a
 join country b
  on a.countrycode = b.code
  where a.countrycode = 'KOR';

select a.code, a.name, b.language, b.name, c.population
from country a
join countrylanguage b
on a.code = b.countrycode
join city c 
 on a.code = c.countrycode
 where a.code = 'KOR';
 
 -- world 데이터베이스에서 country와 city 테이블을 내부 조인해 국가명과
 -- 해당 국가애 속한 도시 개수를 구하고 전체도시수 구해라
use world;
select a.name,count(*) 도시수
from country a
join city b
on a.code = b.countrycode
group by a.name;


-- 외부 조인
-- selec




