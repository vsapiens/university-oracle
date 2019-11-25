drop type personUdt FORCE;
drop type facultyUdt FORCE;
drop type locationUdt FORCE;
drop type studentUdt FORCE;
drop type campusClubUdt FORCE;
drop type studUdtAux FORCE;
drop table faculty;
drop table person;
drop table student;
drop table campusClub;
drop table department;
drop type departmentUdt FORCE;
drop type campusClubAux FORCE;
drop type studArr FORCE;
drop type facultyArr FORCE;

create type personUdt AS OBJECT
(pid varchar(11),
firstName varchar(20),
lastName varchar(20),
dob date)
instantiable not final;
/

CREATE TYPE locationUdt AS OBJECT
(street varchar(30),
bldg varchar(5),
room varchar(5)
)not final;
/

create type facultyUdt under personUdt(
rank varchar(10),
salary number(10)
) instantiable not final;
/

create type studentUdt under personUdt
( status varchar(10)
) instantiable not final;
/

create table person of personUdt(pid PRIMARY KEY)  OBJECT IDENTIFIER IS SYSTEM GENERATED;

create table faculty of facultyUdt;

create table student of studentUdt;


create type studUdtAux as VARRAY(50) of REF studentUdt;
/

create type campusClubUdt as OBJECT
( cId number, 
name varchar(50), 
location locationUdt, 
phone varchar(12), 
advisor REF facultyUdt,
members studUdtAux
) instantiable not final
;
/

create table campusClub of campusClubUdt(
CONSTRAINT cIdPK PRIMARY KEY (cId), 
advisor SCOPE IS faculty
)
OBJECT IDENTIFIER IS SYSTEM GENERATED;
/

create type studArr as VARRAY(1000) of REF studentUdt;
 /
 
create type facultyArr as VARRAY(1000) of REF facultyUdt;
  /


CREATE TYPE departmentUdt AS OBJECT (
  code varchar(3),
  name varchar(40),
  deptChair REF facultyUdt,
  MEMBER FUNCTION getStudents(arg1 in Number) RETURN studArr,
  MEMBER FUNCTION getFactulty(arg1 in Number) RETURN facultyArr
  )instantiable not final;
  /

 ALTER TYPE studentUdt ADD ATTRIBUTE (
   major REF departmentUdt
 )CASCADE;
/
  
CREATE TABLE department of departmentUdt(
  CONSTRAINT dep_PK PRIMARY KEY(code),
  deptChair SCOPE IS faculty 
 )OBJECT IDENTIFIER IS SYSTEM GENERATED;
 
 create type campusClubAux as VARRAY(5) of REF campusClubUdt;
 /
   
 ALTER TYPE facultyUdt ADD ATTRIBUTE (
   advisorOF campusClubAux,
   worksIn REF departmentUdt,
   chairOf REF departmentUdt
 )CASCADE;
 /
  ALTER TYPE studentUdt ADD ATTRIBUTE (
   memberOf campusClubAux
 )CASCADE;
 /
 
 ALTER TABLE faculty add CONSTRAINT check_rank CHECK (rank IN ('Instructor', 'Asistente', 'Asociado', 'Titular'));
 /
 ALTER TABLE student add CONSTRAINT check_status CHECK (status IN ('freshman', 'sophomore', 'junior', 'senior'));
 /
  ALTER TABLE faculty ADD(
    SCOPE FOR (worksIn) IS department,
    SCOPE FOR (chairOf) is department
  ); 
/
    ALTER TABLE student ADD(
      SCOPE FOR (major) is department
); 
/
 ALTER TABLE faculty 
      ADD CONSTRAINT dirDept CHECK (worksIn = chairOf) ENABLE;
/
/*
CREATE OR REPLACE TYPE BODY departmentUdt AS
	MEMBER FUNCTION getStudents(arg1 in Number) RETURN studArr IS
		cosa studArr;
		BEGIN
			Select REF(s) BULK COLLECT into cosa from student S where ROWNUM<=50 AND deref(major).code = arg1;
			RETURN cosa;
		END;
END;
/
*/
commit;