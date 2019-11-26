---INSERCION DE 6 PROFESORES---

INSERT INTO admin.faculty VALUES (501, 'Juan Carlos', 'Lavariega', '4-OCT-2000', 'Titular', 10000, NULL, NULL, NULL);
INSERT INTO admin.faculty VALUES (502, 'Pablo', 'Diaz', '5-OCT-2000', 'Asociado', 12000, NULL, NULL, NULL);
INSERT INTO admin.faculty VALUES (503, 'Leonardo', 'Garrido', '6-OCT-2000', 'Asistente', 15000, NULL, NULL, NULL);
INSERT INTO admin.faculty VALUES (504, 'Luis Humberto', 'Gonzalez', '8-OCT-2000', 'Asociado', 10000, NULL, NULL, NULL);
INSERT INTO admin.faculty VALUES (505, 'Elda', 'Quiroga', '9-OCT-2000', 'Instructor', 20000, NULL, NULL, NULL);
INSERT INTO admin.faculty VALUES(506, 'Mario', 'De la Fuente', '10-OCT-2000', 'Titular', 18000, NULL, NULL, NULL);

---INSERCION DE 2 DEPARTAMENTOS---
INSERT INTO admin.department VALUES ('ING', 'Ingenieria', NULL);
INSERT INTO admin.department VALUES ('ARQ', 'Arquitectura', NULL);

--Poniendo a los Profesores de los departamentos--
UPDATE admin.faculty SET worksIn = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=501;
UPDATE admin.faculty SET worksIn = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=502;
UPDATE admin.faculty SET worksIn = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=503;
UPDATE admin.faculty SET worksIn = (SELECT REF(d) FROM admin.department d WHERE d.code='ARQ') WHERE PID=504;
UPDATE admin.faculty SET worksIn = (SELECT REF(d) FROM admin.department d WHERE d.code='ARQ') WHERE PID=505;
UPDATE admin.faculty SET worksIn = (SELECT REF(d) FROM admin.department d WHERE d.code='ARQ') WHERE PID=506;

--Poniendo a los Profesores como Chair--
UPDATE admin.faculty SET chairOf = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=501;
UPDATE admin.faculty SET chairOf = (SELECT REF(d) FROM admin.department d WHERE d.code='ARQ') WHERE PID=504;

--Poniendo a los Chair de cada admin.department--
UPDATE admin.department SET deptChair = (SELECT REF(f) FROM admin.faculty f WHERE f.PID=501) WHERE code='ING';
UPDATE admin.department SET deptChair = (SELECT REF(f) FROM admin.faculty f WHERE f.PID=504) WHERE code='ARQ';

--Creacion de 3 clubes--
INSERT INTO admin.campusclub VALUES (100, 'Club1', locationUdt('Garza Sada', 'A4','101'), '88808707',NULL,NULL);
INSERT INTO admin.campusclub VALUES (101, 'Club2', locationUdt('Junco de la Vega', 'A3','301'), '88801000',NULL,NULL);
INSERT INTO admin.campusclub VALUES (102, 'Club3', locationUdt('Garcia Roel', 'A5','202'), '83675859',NULL,NULL);

--Poniendo a los Advisors de los Clubes--
UPDATE admin.campusclub SET Advisor= (SELECT REF(p) FROM admin.faculty p WHERE p.PID=502) WHERE CID=100;
UPDATE admin.campusclub SET Advisor= (SELECT REF(p) FROM admin.faculty p WHERE p.PID=505) WHERE CID=101;
UPDATE admin.campusclub SET Advisor= (SELECT REF(p) FROM admin.faculty p WHERE p.PID=506) WHERE CID=102;

--Asignando los Clubes a los advisors--
UPDATE admin.faculty SET advisorOf= campusclubAux((SELECT REF(c) FROM admin.campusclub c WHERE c.CID=100)) WHERE PID=502;
UPDATE admin.faculty SET advisorOf= campusclubAux((SELECT REF(c) FROM admin.campusclub c WHERE c.CID=101)) WHERE PID=505;
UPDATE admin.faculty SET advisorOf= campusclubAux((SELECT REF(c) FROM admin.campusclub c WHERE c.CID=102)) WHERE PID=506;



--INSERCION DE 30 ESTUDIANTES--

INSERT INTO admin.student values ('0', 'Alex', 'Gg', '12-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO admin.student values ('1', 'Charlie', 'Aa', '13-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO admin.student values ('2', 'Juan', 'Bb', '14-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO admin.student values ('3', 'Alexa', 'Gzz', '15-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO admin.student values ('4', 'Carla', 'Alv', '16-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO admin.student values ('5', 'Juan Pablo', 'Rdz', '17-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO admin.student values ('6', 'Luis', 'P', '18-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO admin.student values ('7', 'Pedro', 'Pp', '19-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO admin.student values ('8', 'Maria', 'Sz', '20-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO admin.student values ('9', 'Mario', 'Oo', '21-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO admin.student values ('10', 'Jorge', 'Gg', '12-JUL-1991', 'sophomore', NULL, NULL);
INSERT INTO admin.student values ('11', 'Nando', 'Co', '13-JUL-1991', 'sophomore', NULL, NULL);
INSERT INTO admin.student values ('12', 'Luisa', 'Lo', '14-JUL-1991', 'sophomore', NULL, NULL);
INSERT INTO admin.student values ('13', 'Alvaro', 'El', '15-JUL-1991', 'sophomore', NULL, NULL);
INSERT INTO admin.student values ('14', 'Andrea', 'Ar', '16-JUL-1991', 'sophomore', NULL, NULL);
INSERT INTO admin.student values ('15', 'Isabel', 'Lp', '17-JUL-1991', 'sophomore', NULL, NULL);
INSERT INTO admin.student values ('16', 'Eric', 'Jr', '18-JUL-1991', 'sophomore', NULL, NULL);
INSERT INTO admin.student values ('17', 'Norma', 'Gt', '19-JUL-1991', 'sophomore', NULL, NULL);
INSERT INTO admin.student values ('18', 'Alice', 'Mo', '20-JUL-1991', 'sophomore', NULL, NULL);
INSERT INTO admin.student values ('19', 'Jahir', 'Kr', '12-SEP-1992', 'junior', NULL, NULL);
INSERT INTO admin.student values ('20', 'Jessica', 'Olv', '13-SEP-1992', 'junior', NULL, NULL);
INSERT INTO admin.student values ('21', 'Laura', 'Va', '14-SEP-1992', 'junior', NULL, NULL);
INSERT INTO admin.student values ('22', 'Martin', 'Es', '15-SEP-1992', 'junior', NULL, NULL);
INSERT INTO admin.student values ('23', 'Laura', 'Sad', '16-SEP-1992', 'junior', NULL, NULL);
INSERT INTO admin.student values ('24', 'Peter', 'La', '17-SEP-1992', 'junior', NULL, NULL);
INSERT INTO admin.student values ('25', 'Nestor', 'It', '16-AUG-1993', 'senior', NULL, NULL);
INSERT INTO admin.student values ('26', 'Tamara', 'C', '17-AUG-1993', 'senior', NULL, NULL);
INSERT INTO admin.student values ('27', 'Bernardo', 'Al', '18-AUG-1993', 'senior', NULL, NULL);
INSERT INTO admin.student values ('28', 'Patricio', 'Sa', '19-AUG-1993', 'senior', NULL, NULL);
INSERT INTO admin.student values ('29', 'Sandra', 'Ca', '20-AUG-1993', 'senior', NULL, NULL);

--Insertar memberOf a admin.students--
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=100)) WHERE pid='0';
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=100)) WHERE pid='2';
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=100), (SELECT REF(c) FROM admin.campusclub c WHERE c.cId=102)) WHERE pid='4';
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=100)) WHERE pid='6';
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=100), (SELECT REF(c) FROM admin.campusclub c WHERE c.cId=102)) WHERE pid='8';
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=100)) WHERE pid='10';
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=100), (SELECT REF(c) FROM admin.campusclub c WHERE c.cId=102)) WHERE pid='12';
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=100)) WHERE pid='14';
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=100)) WHERE pid='16';
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=100)) WHERE pid='18';
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=101), (SELECT REF(c) FROM admin.campusclub c WHERE c.cId=102)) WHERE pid='7';
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=101), (SELECT REF(c) FROM admin.campusclub c WHERE c.cId=102)) WHERE pid='9';
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=101), (SELECT REF(c) FROM admin.campusclub c WHERE c.cId=102)) WHERE pid='11';
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=101), (SELECT REF(c) FROM admin.campusclub c WHERE c.cId=102)) WHERE pid='15';
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=101)) WHERE pid='19';
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=101), (SELECT REF(c) FROM admin.campusclub c WHERE c.cId=102)) WHERE pid='21';
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=101), (SELECT REF(c) FROM admin.campusclub c WHERE c.cId=102)) WHERE pid='23';
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=101)) WHERE pid='25';
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=101)) WHERE pid='27';
UPDATE admin.student SET memberOf = campusclubAux ((SELECT REF(c) FROM admin.campusclub c WHERE c.cId=101)) WHERE pid='29';

-- 10 estudiantes en Club1
UPDATE admin.campusclub SET members = studUdtAux (
						(SELECT REF(s) FROM admin.student s WHERE s.pId='0'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='2'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='4'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='6'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='8'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='10'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='12'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='14'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='16'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='18')
					    ) WHERE cId=100;

-- 10 estudiantes en Club2
UPDATE admin.campusclub SET members = studUdtAux (
						(SELECT REF(s) FROM admin.student s WHERE s.pId='7'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='9'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='11'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='15'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='19'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='21'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='23'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='25'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='27'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='29')
					    ) WHERE cId=101;

-- 15 estudiantes en Club3
UPDATE admin.campusclub SET members = studUdtAux (
						(SELECT REF(s) FROM admin.student s WHERE s.pId='3'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='4'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='5'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='7'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='8'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='9'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='11'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='12'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='15'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='17'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='21'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='22'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='23'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='26'),
						(SELECT REF(s) FROM admin.student s WHERE s.pId='28')
					    ) WHERE cId=102;

--Poniendo a los Estudiantes en sus majors--
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=0;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=1;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=2;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=3;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=4;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=5;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=6;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=7;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=8;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=9;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=10;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=11;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=12;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=13;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=14;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ING') WHERE PID=15;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ARQ') WHERE PID=16;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ARQ') WHERE PID=17;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ARQ') WHERE PID=18;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ARQ') WHERE PID=19;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ARQ') WHERE PID=20;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ARQ') WHERE PID=21;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ARQ') WHERE PID=22;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ARQ') WHERE PID=23;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ARQ') WHERE PID=24;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ARQ') WHERE PID=25;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ARQ') WHERE PID=26;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ARQ') WHERE PID=27;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ARQ') WHERE PID=28;
UPDATE admin.student SET major = (SELECT REF(d) FROM admin.department d WHERE d.code='ARQ') WHERE PID=29;