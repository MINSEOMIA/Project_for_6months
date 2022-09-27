create database mywork;
create database if not exists mywork;
drop database if exists mywork;

-- mywork database 생성
use mywork;
create table highschool_students (
  student_no varchar(20) not null primary key,
  student_name varchar(100) not null,
  grade tinyint,
  class varchar(20),
  gender varchar(20),
  age smallint,
  enter_date date
);

desc highschool_students;
drop table highschool_students;

create table highschool_students (
  student_no varchar(20) not null,
  student_name varchar(100) not null,
  grade tinyint,
  class varchar(20),
  gender varchar(20),
  age smallint,
  enter_date date,
  constraint primary key (student_no)
);
desc highschool_students;

alter table highschool_students
drop primary key;

desc highschool_students;

alter table highschool_students
add primary key (student_no);
desc highschool_students;

