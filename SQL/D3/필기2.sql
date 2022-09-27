-- (실습) world 데이터베이스에 접속해 country 테이블에서 인구가 4,500만 명에서 5,000만 명 사이에 있는 국가를 조회
-- 이 때 해당 국가명(name)과 대륙명(continent)을 연결해서 "국가명 (대륙명)" 형태로 조회하기 (예: South Korea (Asia))
use world;
select code, name, continent, concat(name, ' (', continent, ')') as name_continent
  from country
   where Population between 45000000 and 50000000;

-- (실습) mywork 데이터베이스에 접속해 box_office 테이블에서 2019년 개봉한 한국 영화 중 관객수가 500만 명 이상인 영화를 조회
-- 이 때 매출액은 1억으로 나눈 후 소수점 없이 반올림 한 결과를 표시하기
use mywork;
select years, ranks, movie_name, release_date, audience_num, round(sale_amt/100000000) as sales
  from box_office
  where year(release_date) = 2019
    and rep_country = "한국"
    and audience_num >= 5000000;


-- (실습) 연인과 처음으로 만난 날이 2021년 5월 12일인데, 100일, 500일, 1000일이 되는 날을 조회
select adddate("20210512", 100) as 100일,
       adddate("20210512", 500) as 500일,
       adddate("20210512", 1000) as 1000일;

-- (실습) mywork 데이터베이스에 접속해 box_office 테이블에서 2019년 12월에 개봉한 영화의 제목과 개봉일을 조회
select movie_name, release_date
  from box_office
  where extract(year_month from release_date) = "201912";
  
-- (실습) 현재 box_office 테이블에 영화감독(director)이 두 명 이상이면 ','로 연결되어 있음
-- 감독이 1명이면 그대로 두고, 두명 이상이면 ',' 대신 '/'값으로 대체해 조회
select movie_name, replace(director, ',', '/')
  from box_office
  where instr(director, ',');
  

-- (실습) mywork 데이터베이스에 접속해 box_office 테이블에서 2019년에 개봉된 영화 중, 영화 제목에 ':'이 들어간 영화 조회
use mywork;
select movie_name, release_date
  from box_office
    where year(release_date) = 2019
      and instr(movie_name, ':') > 0;
      
-- 기타 함수들

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

-- (실습) box_office 테이블에서 2019년 개봉한 영화 중 매출액 기준 상위 10위까지 영화
-- 이 때 개봉일이 무슨 요일인지와 개봉일이 어떤분기(quarter)에 속해있는지도 조회하기 
-- (예: quarter(release_date) 가 1 또는 2이면 상반기, 3 또는 4이면 하반기)

