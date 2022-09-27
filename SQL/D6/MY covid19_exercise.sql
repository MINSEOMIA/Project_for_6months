/* 코로나 데이터 분석하기 */
USE mywork;

-- 국가 정보 테이블
CREATE TABLE covid19_country 
(
  countrycode                 VARCHAR(10) NOT NULL, 
  countryname                 VARCHAR(80) NOT NULL, 
  continent                   VARCHAR(50), 
  population                  DOUBLE,
  population_density          DOUBLE,
  median_age                  DOUBLE,
  aged_65_older               DOUBLE,
  aged_70_older               DOUBLE,
  hospital_beds_per_thousand  INT,
  PRIMARY KEY (countrycode)
);

-- 코로나 데이터 테이블
CREATE TABLE covid19_data 
(
  countrycode                 VARCHAR(10) NOT NULL, 
  issue_date                  DATE        NOT NULL,  
  cases                       INT, 
  new_cases_per_million       DOUBLE, 
  deaths                      INT, 
  icu_patients                INT, 
  hosp_patients               INT, 
  tests                       INT, 
  reproduction_rate           DOUBLE, 
  new_vaccinations            INT, 
  stringency_index            DOUBLE,
  PRIMARY KEY (countrycode, issue_date)
);

 
-- file -> open sql script -> 01.covid19_country_insert.sql 파일 열기 -> 전체 실행

-- file -> open sql script -> 02.covid19_data_insert.sql 파일 열기 -> 전체 실행


-- 각 테이블의 입력 건수 확인

  

-- 1. 데이터 정제하기
-- (1) 불필요한 데이터 삭제하기 
-- countrycode와 countryname 테이블에는 대륙용으로 집계된 중복된 데이터가 들어가 있습니다.
-- 각 테이블에서 국가 코드가 OWID로 시작하는 데이터를 확인(select) 후 삭제(delete) 하세요.
delete from covid19_country
where countrycode like 'OWID%';

delete from covid19_data
where countrycode like 'OWID%';            

desc covid19_country;

-- (2) 숫자형 컬럼에 null 이 있는 값이 있습니다.
-- 이 건들을 0으로 변경하세요.

update covid19_country 
set population = ifnull(population, 0),
	population_density = ifnull(population_density, 0),
    median_age = ifnull(median_age, 0),
    aged_65_older = ifnull(aged_65_older, 0),
    aged_70_older = ifnull(aged_70_older, 0),
    hospital_beds_per_thousand = ifnull(hospital_beds_per_thousand, 0);

update covid19_Data 
set cases = ifnull(cases, 0),
	new_cases_per_million = ifnull(new_cases_per_million, 0),
    deaths = ifnull(deaths, 0),
    icu_patients = ifnull(icu_patients, 0),
    hosp_patients = ifnull(hosp_patients, 0),
    tests = ifnull(tests, 0),
    reproduction_rate = ifnull(reproduction_rate, 0),
	new_vaccinations = ifnull(new_vaccinations, 0),
    stringency_index = ifnull(stringency_index, 0);

/* 2. 데이터 분석 */

-- (1) 2020년 사망자 수 상위 10개국 조회/ 사망자수: death = data테이블, 국가명: countryname=country테이블
SELECT b.countryname, SUM(a.deaths) death_num -- ,SUM(a.cases) case_num 확진자수는왜..?
 
 FROM covid19_data a
 INNER JOIN covid19_country b
    ON a.countrycode = b.countrycode
 WHERE YEAR(a.issue_date) = 2020
 GROUP BY b.countryname
 ORDER BY 2 DESC
 LIMIT 10;
 
       
-- (2) 1) 2020년 2)인구(country텝) 대비 확진자(data텝) 수와 3)사망자(data탭) 수 비율 조회
-- 필요한거 국가명, 인구수, 확진자수, 사망자 수, 인구대비사망자, 인구대비확진자, 인구밀도는 왜?????

SELECT countryname, death_num, case_num, population, population_density,-- 대체 인구 밀도는 왜?
       ROUND(death_num / population * 100, 5) death_popul_rate, -- 인구대비사망자비율
       ROUND(case_num / population * 100, 5) case_popul_rate -- 인구대비확진자비율
  FROM (SELECT b.countryname, b.population, b.population_density,
               SUM(a.deaths) death_num, SUM(a.cases) case_num
          FROM covid19_data a
         INNER JOIN covid19_country b
            ON a.countrycode = b.countrycode
         WHERE YEAR(a.issue_date) = 2020
         GROUP BY 1, 2, 3
         ORDER BY 4 DESC
         LIMIT 10
        ) t
ORDER BY 6 DESC, 7 DESC;

-- (2-1) 2020년 사망자 수 상위 10개국을 뽑아서 
SELECT b.countryname, SUM(a.deaths) death_num -- ,SUM(a.cases) case_num
  FROM covid19_data a
 INNER JOIN covid19_country b
    ON a.countrycode = b.countrycode
 WHERE YEAR(a.issue_date) = 2020
 GROUP BY b.countryname
 ORDER BY 2 DESC
 LIMIT 10;

-- (2-2) 이 데이터의 인구대비 확진자 수 비율을 조회하세요.
SELECT countryname, death_num, case_num, population, population_density,
       ROUND(death_num / population * 100, 5) death_popul_rate,
       ROUND(case_num / population * 100, 5) case_popul_rate
  FROM (SELECT b.countryname, b.population, b.population_density,
               SUM(a.deaths) death_num, SUM(a.cases) case_num
          FROM covid19_data a
         INNER JOIN covid19_country b
            ON a.countrycode = b.countrycode
         WHERE YEAR(a.issue_date) = 2020
         GROUP BY 1, 2, 3
         ORDER BY 4 DESC
         LIMIT 10
        ) t
ORDER BY 6 DESC, 7 DESC;


-- (3) 우리나라의 월별 확진자 수와 사망자 수 조회
 -- (3-1) 우리나라의 연월별 확진자수와 사망자수의 합계를 구하세요.

SELECT EXTRACT(YEAR_MONTH FROM issue_date)  yearmonths,
       SUM(cases) case_num, SUM(deaths) death_num
  FROM covid19_data
 WHERE countrycode = 'KOR'
 GROUP BY 1
 ORDER BY 1;

-- (3-2) (3-1)에서 구한 월별 확진자수와 사망자수의 총계를 구하세요.
SELECT EXTRACT(MONTH FROM issue_date) months,
       SUM(cases) case_num, SUM(deaths) death_num
  FROM covid19_data
 WHERE countrycode = 'KOR'
 GROUP BY 1 with rollup
 ORDER BY 1;
 

-- (3-3) (3-1)에서 구한 결과를 참고해서 확진자수에 대해서만 년월별 합계를 컬럼 형태로 조회하세요.
-- 202002 202003 202004 202005 ...
-- 10	3139	6636	988	  729	1347	1486	5846	3707	2746	8017	27117	16739	11523



      
  

-- (4) 국가별, 월별 확진자 수와 사망자 수 조회
-- (4-1) 아래 그림과 같이 국가별로 확진자와 사망사주를 조회하되, 월을 컬럼에 위치시키세요.
-- countryname  종류   202001  202002 202003 .....
-- Afghanistan	1.확진	0	1	174	1952	13081	16299	5158	1494	1109	2157	4849	5252	3497	691
-- Afghanistan	2.사망	0	0	4	60	194	494	532	119	57	78	257	396	209	43
-- Albania	1.확진	0	0	243	530	364	1398	2741	4237	4136	7226	17307	20134	19811	29040
-- Albania	2.사망	0	0	15	16	2	29	95	127	103	122	301	371	199	416
-- Algeria	1.확진	0	1	715	3290	5388	4513	16487	14100	7036	6412	25257	16411	7729	5753
-- Algeria	2.사망	0	0	44	406	203	259	298	300	226	228	467	325	135	92
-- Andorra	1.확진	0	0	376	369	19	91	70	251	874	2706	1989	1304	1888	929
-- Andorra	2.사망	0	0	12	30	9	1	0	1	0	22	1	8	17	9




-- (4-2) (4-1)에서 만든 쿼리를 뷰로 만들어 미국의 현황(확진자수와 사망자수)을 조회하세요.
-- (힌트 : 뷰 만들기)


       

-- (5) 우리나라의 월별 누적 확진자 수와 사망자 수 조회
-- (5-1) 우리나라의 월별 확진자수와 사망자수의 합을 조회하세요.
SELECT EXTRACT(MONTH FROM issue_date) months,
       SUM(cases) case_num, SUM(deaths) death_num
  FROM covid19_data
 WHERE countrycode = 'KOR'
 GROUP BY 1 with rollup
 ORDER BY 1;
 

-- (5-2) 윈도우 함수를 사용하여 우리나라의 월별 누적 확진자수와 누적 사망자수를 조회하세요 
WITH raw_data1 AS
(SELECT EXTRACT(YEAR_MONTH FROM issue_date) months,
        SUM(cases) case_num, SUM(deaths) death_num
   FROM covid19_data
  WHERE countrycode = 'KOR'
  GROUP BY 1
)
SELECT months, case_num, death_num,
       SUM(case_num) OVER (ORDER BY months) cum_case_num,
       SUM(death_num) OVER (ORDER BY months) cum_death_num
  FROM raw_data1
 ORDER BY 1;
       
       

-- (6) 대륙별 사망자 수 상위 3개국 조회
-- 전 기간을 대상으로 대륙별로 사망자가 가장 많은 3개 국가와 해당 국가의 누적 사망자수를 조회하세요.
-- (힌트 : cte와 rank() 함수 활용하기)

WITH raw_data1 AS
(SELECT b.continent, b.countryname,
        SUM(a.deaths) death_num, SUM(a.cases) case_num
   FROM covid19_data a
  INNER JOIN covid19_country b
     ON a.countrycode = b.countrycode
  GROUP BY 1, 2
),
raw_data2 AS
(SELECT continent, countryname, death_num,
        RANK() OVER (PARTITION BY continent
                         ORDER BY death_num DESC) ranks
   FROM raw_data1
)
SELECT *
  FROM raw_data2
 WHERE ranks <= 3;


	


       
