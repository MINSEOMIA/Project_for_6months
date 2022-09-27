use mywork;
/* (테이블) box_office table : 2004~2019년까지 개봉된 영화 정보
-- seq_no : 일련번호, 기본키
-- years : 제작연도
-- ranks : 순위
-- movie_name : 영화명
-- release_date : 개봉일
-- sale_amt : 매출액
-- share_rate : 점유율(매출액 기준)
-- audience_num : 관객수
-- screen_num : 스크린수
-- showing_count : 상영횟수
-- rep_country : 대표국적
-- countries : 국적
-- distributor : 배급사
-- movie_type : 유형(장편, 단편, ...)
-- genre : 장르(스릴러, 액션..)
-- director : 감독
*/
select *
	from box_office
    where release_date >= '2018-01-01'
     and release_date <= '2018-12-31'
     and rep_country = '한국';
     
-- 2019년 개봉영화 관객수>500만명이상 
select *
	from box_office
 where release_date between '2019-01-01' and '2019-12-31'
  and audience_num >= 5000000;
  
-- 2019 개뵹영화 중 관객수>500만 이상이거나 매출액이 400억원 이상인 영화 
select years,ranks,movie_name,release_date,audience_num,sale_amt /100000000 as sales
	from box_office
 where release_date between '2019-01-01' and '2019-12-31'
  and (audience_num >= 5000000 or sale_amt >= 40000000000);
  
-- 2012년에 제작ㅡ2019년에 개봉
select *
	from box_office
 where years between '2012-01-01' and '2012-12-31'
  and release_date between '2019-01-01' and '2019-12-31';

/* 데이터 정렬*/
use world;
desc country;

select code,name, continent, region,population 
	from country
    where population > 100000000
     order by population desc; 

select name, continent, region
	from country
    where population > 50000000
     order by continent asc; 
     
select continent
	from country
    where population > 50000000
     order by continent;
     
select name, continent, region
	from country
    where population > 50000000
     order by 2,3 desc;

desc country;
-- city table 참조 우리나라에 속한 도시를 조건, 도시명 오름차순 인구 내림차순
select * from city
	where CountryCode = 'KOR'
     order by name, population desc;
     
use mywork;

select * from box_office  
limit 10;

select * from box_office  
 where release_Date between 20190101 and 20191231
  and audiaence_num >= 500000;
 order by sale_amt desc
  limit 5;
  
-- (실습) world database의 countrylanguage table에 국가별 사용 언어가 있고,
-- 이 테이블 percentage 컬럼에는 해당 언어가 사용되는 비율값이 들어 있음
-- 이 비율이 99% 이상인 것을 국가코드 순으로 조회하기
use world;
desc countrylanguage;
desc percentage;
select * from countrylanguage
 where Percentage >= 99
  order by countrycode;
 
 -- (실습) world database에 접속된 상태ㅔ서 mywork database에 있는 box_office 테이블에서
 -- 2019년 제작된 영화중 순위(ranks)가 1위에서 10위까지인 영화를 순위별로 조회하기
use mywork;
desc box_office;
select* from box_office
 where years = 2019 and ranks between 1 and 10
   order by ranks;
    
-- (실습) mywork database로 이동해 box_office 테이블에서
-- 2019년 제작된 영화중 영화유형(movie_type)이 장편이 아닌 영화를 순위(ranks)대로 조회하기
select* from box_office
  where years = 2019
  and movie_type != '장편'
   order by ranks;

-- -- (실습) box_office 테이블에서 2019년 제작된 영화 중 스크린수 기준 상위 10개 영화 조회하기
 select* from box_office
  where years = 2019
  order by screen_num
  limit 10;
  
  
  /* 함수 사용 */
--  숫자형 함수
select  abs(1),abs(-1);

select length('mysql');

select 7%2, 7 mod 2, 7/2, 7 div 2;

select ceil(4.5), floor(4.5);

select log(10,100), log10(100), ln(100), log(100);

select mod(5,4),5 mod 4;

select power(4,3), sqrt(25), sign(5), sign(-5);

select round(1153.456,1), round(1153.456,2), round(1153.456,3);
select round(1153.456,-1);

select truncate(2.4536,2), truncate(1153.4536,-2);

select rand(), rand(3);
select round(rand());

select char_length('sql'),length('sql');

select char_length('홍길동'), length('홍길동');

select concat('this', 'is','mysql');
select concat('this', null ,'mysql');
select concat_ws(',', 'this', 'is', 'mysql');

select format(123456789.123456, 3);

select instr('thisissql','sql') as instr,
	    locate('sql','thisissql') as locate,
        position('sql' in 'thisissql') as pos;

-- select lovwer('Abcd

select left ('thisismysql', 4),
	   right('thisismysql', 3);
       
select repeat('sql', 3);

select replace('생일 축하해 철수야', '철수', '영희') as rep;

select reverse('sql');
select substr('this is mysql',6,2);
select substr('this is mysql',6);
select substr('this is mysql',6,2);
select substring('this is mysql',-5);

select mid('this is mysql',-5);

select trim('	mysql   ');
select trim(leading '*' from "***mysql***"),
 trim(trailing '*' from "***mysql***"),
 trim(both '*' from "***mysql***");
 
 select strcmp('mysql','mysql')as same,
         strcmp('mysql1','mysql2')as small,
         strcmp('mysql1','mysql2')as large;
         
select repalce ('산토끼 토끼야','토끼' ,'거북이');

-- 날짜형 함수
select curdate(), current_date(), current_date;

select curtime(), current_time(), current_time;

select now(), current_timestamp(),current_timestamp;

select dayname(20220405);
select dayofmonth(20220405);
select dayofweek(20220405);
select dayofyear(20220405);

select last_day(20220405);
select year(20220405);
select month(20220405);
select quarter(20220405);
select weekofyear(20220405);


select week(20220103);

select yearweek(20220103);

-- 현재 날짜 기준으로 현재일이 속한 월의 마지막 날짜에 해당하는 요일
select dayname(last_day(curdate()));

select makedate(2022,365);

 
-- (실습) world 데이터베이스에 접속해 country 테이블에서 인구가 4,500만 명에서 5,000만 명 사이에 있는 국가를 조회
-- 이 때 해당 국가명(name)과 대륙명(continent)을 연결해서 "국가명 (대륙명)" 형태로 조회하기 (예: South Korea (Asia))
use world;
select code, name, continent, concat(name,'(',continent,')') as name_continent 
from country 
where popualtion between 45000000 and  50000000; 
  

-- (실습) mywork 데이터베이스에 접속해 box_office 테이블에서 2019년 개봉한 영화 중 관객수가 500만명 이상인 영화를 조회
-- 이 때 매출액은 1억을 나눈 후 소수점 없이 반올림 한 결과를 표시하기
 use mywork;
 select years, ranks, movie_name, released_date,audience_num,sale_round(amt/100000000) from box_office
 where years = 2019 
 and rep_country = '한국' 
 and audience_num >= 5000000;
 
 -- 연인과 처음으로 만난 날 2021.5.21 100일 500일 1000일 되는 날 
 select adddate('20210521',100) as days_100,
		adddate('20210521',500) as days_500,
	    adddate('20210521',interval 999 day) as days_1000;
 
 -- (실습) mywork 데이터베이스에 접속해 box_office 테이블에서 2019년 12월에 개봉한 영화의 제목과 개봉일을 조회
use mywork;
select movie_name, release_date from box_office
 where extract(year_month from release_date) = '201912';
 -- where release_date  between '2019-12-01' and '2019-12-31'
 -- order by movie_name and release_date;
 
-- (실습) mywork 데이터베이스에 접속해 box_office 테이블에서 영화감독(director)이 두 명 이상이면 현재 ','로 연결되어 있음
-- 감독이 1명이면 그대로 두고, 두명 이상이면 ',' 대신 '/'값으로 대체해 조회
select movie_name, replace(director, ',','/') from box_office
where instr(director, ',');
 
-- (실습) mywork 데이터베이스에 접속해 box_office 테이블에서 2019년에 개봉된 영화 중, 영화 제목에 ':'이 들어간 영화 조회
select movie_name, release_date from box_office
 where year(release_date) = 2019
 and instr(movie_name, ':') > 0;
 
-- 선생버전

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
      