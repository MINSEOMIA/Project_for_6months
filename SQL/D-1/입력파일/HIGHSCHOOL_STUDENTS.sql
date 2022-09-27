CREATE DATABASE MYWORK;
USE MYWORK;
CREATE TABLE HIGHSCHOOL_STUDENTS (
STUDENT_NO VARCHAR(20) not null primary key,
STUDENT_NAME VARCHAR(100)not null,
GRADE TINYINT,
CLASS VARCHAR(20),
GENDER  VARCHAR(20),
AGE SMALLINT,
ENTER_DATE DATE
);

desc highschool_students;
drop table highschool_students;

CREATE DATABASE MYWORK;
USE MYWORK;
CREATE TABLE HIGHSCHOOL_STUDENTS (
	STUDENT_NO VARCHAR(20) not null primary key,
	STUDENT_NAME VARCHAR(100)not null,
	GRADE TINYINT,
	CLASS VARCHAR(20),
	GENDER  VARCHAR(20),
	AGE SMALLINT,
	ENTER_DATE DATE,

	constraint primary key (student_no)
);
desc hightshool_students;

alter table highschool_students
drop primary key;

alter table highschool_students
add primary key (student_no);
departments