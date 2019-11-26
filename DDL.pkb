DROP TYPE personudt FORCE;

DROP TYPE facultyudt FORCE;

DROP TYPE locationudt FORCE;

DROP TYPE studentudt FORCE;

DROP TYPE campusclubudt FORCE;

DROP TYPE stududtaux FORCE;

DROP TABLE faculty;

DROP TABLE person;

DROP TABLE student;

DROP TABLE campusclub;

DROP TABLE department;

DROP TYPE departmentudt FORCE;

DROP TYPE campusclubaux FORCE;

DROP TYPE studarr FORCE;

DROP TYPE facultyarr FORCE;

CREATE TYPE personudt AS OBJECT (
    pid         VARCHAR(11),
    firstname   VARCHAR(20),
    lastname    VARCHAR(20),
    dob         DATE
) INSTANTIABLE NOT FINAL;
/

CREATE TYPE locationudt AS OBJECT (
    street   VARCHAR(30),
    bldg     VARCHAR(5),
    room     VARCHAR(5)
) NOT FINAL;
/

CREATE TYPE facultyudt UNDER personudt (
    rank     VARCHAR(10),
    salary   NUMBER(10)
) INSTANTIABLE NOT FINAL;
/

CREATE TYPE studentudt UNDER personudt (
    status VARCHAR(10)
) INSTANTIABLE NOT FINAL;
/

CREATE TABLE person OF personudt (
    pid PRIMARY KEY
) OBJECT IDENTIFIER IS SYSTEM GENERATED;

CREATE TABLE faculty OF facultyudt;

CREATE TABLE student OF studentudt;

CREATE TYPE stududtaux AS
    VARRAY(50) OF ref

studentudt;
/

CREATE TYPE campusclubudt AS OBJECT (
    cid        NUMBER,
    name       VARCHAR(50),
    location   locationudt,
    phone      VARCHAR(12),
    advisor    REF facultyudt,
    members    stududtaux
) INSTANTIABLE NOT FINAL;
/

CREATE TABLE campusclub OF campusclubudt (
    CONSTRAINT cidpk PRIMARY KEY ( cid ),
    advisor
        SCOPE IS faculty
) OBJECT IDENTIFIER IS SYSTEM GENERATED;
/

CREATE TYPE studarr AS
    VARRAY(1000) OF ref

studentudt;
/

CREATE TYPE facultyarr AS
    VARRAY(50) OF ref

facultyudt;
/

CREATE TYPE departmentudt AS OBJECT (
    code        VARCHAR(3),
    name        VARCHAR(40),
    deptchair   REF facultyudt,
    MEMBER FUNCTION getstudents (
           arg1 IN VARCHAR
       ) RETURN studarr,
    MEMBER FUNCTION getfaculty (
           arg1 IN VARCHAR
       ) RETURN facultyarr
) INSTANTIABLE NOT FINAL;
/

ALTER TYPE studentudt ADD ATTRIBUTE ( major REF departmentudt )
    CASCADE;
/

CREATE TABLE department OF departmentudt (
    CONSTRAINT dep_pk PRIMARY KEY ( code ),
    deptchair
        SCOPE IS faculty
) OBJECT IDENTIFIER IS SYSTEM GENERATED;

CREATE TYPE campusclubaux AS
    VARRAY(5) OF ref

campusclubudt;
/

ALTER TYPE facultyudt ADD ATTRIBUTE ( advisorof campusclubaux, worksin REF departmentudt, chairof REF departmentudt )
    CASCADE;
/

ALTER TYPE studentudt ADD ATTRIBUTE ( memberof campusclubaux )
    CASCADE;
/

ALTER TABLE faculty
    ADD CONSTRAINT check_rank CHECK ( rank IN (
        'Instructor',
        'Asistente',
        'Asociado',
        'Titular'
    ) );
/

ALTER TABLE student
    ADD CONSTRAINT check_status CHECK ( status IN (
        'freshman',
        'sophomore',
        'junior',
        'senior'
    ) );
/

ALTER TABLE faculty ADD (
    SCOPE FOR ( worksin ) IS department,
    SCOPE FOR ( chairof ) IS department
);
/

ALTER TABLE student ADD (
    SCOPE FOR ( major ) IS department
);
/

ALTER TABLE faculty ADD CONSTRAINT dirdept CHECK ( worksin = chairof ) ENABLE;
/

COMMIT;
