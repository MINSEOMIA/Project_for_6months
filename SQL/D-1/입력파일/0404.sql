use world;
desc city;

select id, name
   from city;
select count(*) from city;

select * from city;

select district, countrycode, name, id
    from city;
    
select *
	 from world.country;
     
select *
     from mywork.box_office;
     
select *
     from city
 where countrycode = 'KOR';

select *
     from city
 where countrycode = 'KOR'
  and district LIKE 'K%';
  
select *
     from city
 where counytycode = 'KOR'
  and district LIKE '%K';
     
select *
     from city
 where counytycode = 'KOR'
  and district LIKE '%K%';
  
select *
     from city
 where counytycode = 'KOR'
  and district in ('seoul','kyonggi' );
  
  select *
     from city
 where population between 45000000 and 5500000;
  