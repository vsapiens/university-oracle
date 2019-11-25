---INSERCION DE 6 PROFESORES---

INSERT INTO faculty VALUES (1, 'Juan Carlos', 'Lavariega', '4-OCT-2000', 'Titular', 10000, NULL, NULL, NULL);
INSERT INTO faculty VALUES (2, 'Pablo', 'Diaz', '5-OCT-2000', 'Asociado', 12000, NULL, NULL, NULL);
INSERT INTO faculty VALUES (3, 'Leonardo', 'Garrido', '6-OCT-2000', 'Asistente', 15000, NULL, NULL, NULL);
INSERT INTO faculty VALUES (4, 'Luis Humberto', 'Gonzalez', '8-OCT-2000', 'Asociado', 10000, NULL, NULL, NULL);
INSERT INTO faculty VALUES (5, 'Elda', 'Quiroga', '9-OCT-2000', 'Instructor', 20000, NULL, NULL, NULL);
INSERT INTO faculty VALUES(6, 'Mario', 'De la Fuente', '10-OCT-2000', 'Titular', 18000, NULL, NULL, NULL);

---INSERCION DE 2 DEPARTAMENTOS---
INSERT INTO department VALUES ('ING', 'Ingenieria', NULL);
INSERT INTO department VALUES ('ARQ', 'Arquitectura', NULL);

--Poniendo a los Profesores de los departamentos--
UPDATE faculty SET worksIn = (SELECT REF(d) FROM department d WHERE d.code='ING') WHERE PID=1;
UPDATE faculty SET worksIn = (SELECT REF(d) FROM department d WHERE d.code='ING') WHERE PID=2;
UPDATE faculty SET worksIn = (SELECT REF(d) FROM department d WHERE d.code='ING') WHERE PID=3;
UPDATE faculty SET worksIn = (SELECT REF(d) FROM department d WHERE d.code='ARQ') WHERE PID=4;
UPDATE faculty SET worksIn = (SELECT REF(d) FROM department d WHERE d.code='ARQ') WHERE PID=5;
UPDATE faculty SET worksIn = (SELECT REF(d) FROM department d WHERE d.code='ARQ') WHERE PID=6;

--Creacion de 3 clubes--
INSERT INTO campusClub VALUES (100, 'Club1', locationUdt('Garza Sada', 'A4','101'), '88808707',NULL,NULL);
INSERT INTO campusClub VALUES (101, 'Club2', locationUdt('Junco de la Vega', 'A3','301'), '88801000',NULL,NULL);
INSERT INTO campusClub VALUES (102, 'Club3', locationUdt('Garcia Roel', 'A5','202'), '83675859',NULL,NULL);

--Poniendo a los Advisors de los Clubes--
UPDATE campusClub SET Advisor= (SELECT REF(p) FROM faculty p WHERE p.PID=5) WHERE CID=100;
UPDATE campusClub SET Advisor= (SELECT REF(p) FROM faculty p WHERE p.PID=6) WHERE CID=102;
UPDATE campusClub SET Advisor= (SELECT REF(p) FROM faculty p WHERE p.PID=5) WHERE CID=101;

--INSERCION DE 30 ESTUDIANTES--

INSERT INTO student values ('0', 'Alex', 'Gg', '12-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO student values ('1', 'Charlie', 'Aa', '13-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO student values ('2', 'Juan', 'Bb', '14-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO student values ('3', 'Alexa', 'Gzz', '15-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO student values ('4', 'Carla', 'Alv', '16-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO student values ('5', 'Juan Pablo', 'Rdz', '17-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO student values ('6', 'Luis', 'P', '18-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO student values ('7', 'Pedro', 'Pp', '19-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO student values ('8', 'Maria', 'Sz', '20-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO student values ('9', 'Mario', 'Oo', '21-MAR-1990', 'freshman', NULL, NULL);
INSERT INTO student values ('10', 'Jorge', 'Gg', '12-JUL-1991', 'sophomore', NULL, NULL);
INSERT INTO student values ('11', 'Nando', 'Co', '13-JUL-1991', 'sophomore', NULL, NULL);
INSERT INTO student values ('12', 'Luisa', 'Lo', '14-JUL-1991', 'sophomore', NULL, NULL);
INSERT INTO student values ('13', 'Alvaro', 'El', '15-JUL-1991', 'sophomore', NULL, NULL);
INSERT INTO student values ('14', 'Andrea', 'Ar', '16-JUL-1991', 'sophomore', NULL, NULL);
INSERT INTO student values ('15', 'Isabel', 'Lp', '17-JUL-1991', 'sophomore', NULL, NULL);
INSERT INTO student values ('16', 'Eric', 'Jr', '18-JUL-1991', 'sophomore', NULL, NULL);
INSERT INTO student values ('17', 'Norma', 'Gt', '19-JUL-1991', 'sophomore', NULL, NULL);
INSERT INTO student values ('18', 'Alice', 'Mo', '20-JUL-1991', 'sophomore', NULL, NULL);
INSERT INTO student values ('19', 'Jahir', 'Kr', '12-SEP-1992', 'junior', NULL, NULL);
INSERT INTO student values ('20', 'Jessica', 'Olv', '13-SEP-1992', 'junior', NULL, NULL);
INSERT INTO student values ('21', 'Laura', 'Va', '14-SEP-1992', 'junior', NULL, NULL);
INSERT INTO student values ('22', 'Martin', 'Es', '15-SEP-1992', 'junior', NULL, NULL);
INSERT INTO student values ('23', 'Laura', 'Sad', '16-SEP-1992', 'junior', NULL, NULL);
INSERT INTO student values ('24', 'Peter', 'La', '17-SEP-1992', 'junior', NULL, NULL);
INSERT INTO student values ('25', 'Nestor', 'It', '16-AUG-1993', 'senior', NULL, NULL);
INSERT INTO student values ('26', 'Tamara', 'C', '17-AUG-1993', 'senior', NULL, NULL);
INSERT INTO student values ('27', 'Bernardo', 'Al', '18-AUG-1993', 'senior', NULL, NULL);
INSERT INTO student values ('28', 'Patricio', 'Sa', '19-AUG-1993', 'senior', NULL, NULL);
INSERT INTO student values ('29', 'Sandra', 'Ca', '20-AUG-1993', 'senior', NULL, NULL);

--Insertar memberOf a students--
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=100)) WHERE pid='0';
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=100)) WHERE pid='2';
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=100), (SELECT REF(c) FROM CampusClub c WHERE c.cId=102)) WHERE pid='4';
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=100)) WHERE pid='6';
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=100), (SELECT REF(c) FROM CampusClub c WHERE c.cId=102)) WHERE pid='8';
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=100)) WHERE pid='10';
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=100), (SELECT REF(c) FROM CampusClub c WHERE c.cId=102)) WHERE pid='12';
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=100)) WHERE pid='14';
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=100)) WHERE pid='16';
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=100)) WHERE pid='18';
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=101), (SELECT REF(c) FROM CampusClub c WHERE c.cId=102)) WHERE pid='7';
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=101), (SELECT REF(c) FROM CampusClub c WHERE c.cId=102)) WHERE pid='9';
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=101), (SELECT REF(c) FROM CampusClub c WHERE c.cId=102)) WHERE pid='11';
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=101), (SELECT REF(c) FROM CampusClub c WHERE c.cId=102)) WHERE pid='15';
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=101)) WHERE pid='19';
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=101), (SELECT REF(c) FROM CampusClub c WHERE c.cId=102)) WHERE pid='21';
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=101), (SELECT REF(c) FROM CampusClub c WHERE c.cId=102)) WHERE pid='23';
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=101)) WHERE pid='25';
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=101)) WHERE pid='27';
UPDATE student SET memberOf = campusClubAux ((SELECT REF(c) FROM CampusClub c WHERE c.cId=101)) WHERE pid='29';

-- 10 estudiantes en Club1
UPDATE campusClub SET members = studUdtAux (
						(SELECT REF(s) FROM Student s WHERE s.pId='0'),
						(SELECT REF(s) FROM Student s WHERE s.pId='2'),
						(SELECT REF(s) FROM Student s WHERE s.pId='4'),
						(SELECT REF(s) FROM Student s WHERE s.pId='6'),
						(SELECT REF(s) FROM Student s WHERE s.pId='8'),
						(SELECT REF(s) FROM Student s WHERE s.pId='10'),
						(SELECT REF(s) FROM Student s WHERE s.pId='12'),
						(SELECT REF(s) FROM Student s WHERE s.pId='14'),
						(SELECT REF(s) FROM Student s WHERE s.pId='16'),
						(SELECT REF(s) FROM Student s WHERE s.pId='18')
					    ) WHERE cId=100;

-- 10 estudiantes en Club2
UPDATE campusClub SET members = studUdtAux (
						(SELECT REF(s) FROM Student s WHERE s.pId='7'),
						(SELECT REF(s) FROM Student s WHERE s.pId='9'),
						(SELECT REF(s) FROM Student s WHERE s.pId='11'),
						(SELECT REF(s) FROM Student s WHERE s.pId='15'),
						(SELECT REF(s) FROM Student s WHERE s.pId='19'),
						(SELECT REF(s) FROM Student s WHERE s.pId='21'),
						(SELECT REF(s) FROM Student s WHERE s.pId='23'),
						(SELECT REF(s) FROM Student s WHERE s.pId='25'),
						(SELECT REF(s) FROM Student s WHERE s.pId='27'),
						(SELECT REF(s) FROM Student s WHERE s.pId='29')
					    ) WHERE cId=101;

-- 15 estudiantes en Club3
UPDATE campusClub SET members = studUdtAux (
						(SELECT REF(s) FROM Student s WHERE s.pId='3'),
						(SELECT REF(s) FROM Student s WHERE s.pId='4')
						(SELECT REF(s) FROM Student s WHERE s.pId='5'),
						(SELECT REF(s) FROM Student s WHERE s.pId='7'),
						(SELECT REF(s) FROM Student s WHERE s.pId='8'),
						(SELECT REF(s) FROM Student s WHERE s.pId='9'),
						(SELECT REF(s) FROM Student s WHERE s.pId='11'),
						(SELECT REF(s) FROM Student s WHERE s.pId='12'),
						(SELECT REF(s) FROM Student s WHERE s.pId='15'),
						(SELECT REF(s) FROM Student s WHERE s.pId='17'),
						(SELECT REF(s) FROM Student s WHERE s.pId='21'),
						(SELECT REF(s) FROM Student s WHERE s.pId='22'),
						(SELECT REF(s) FROM Student s WHERE s.pId='23'),
						(SELECT REF(s) FROM Student s WHERE s.pId='26'),
						(SELECT REF(s) FROM Student s WHERE s.pId='28')
					    ) WHERE cId=102;