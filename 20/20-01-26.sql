-- =====================================
-- PROGRAM 1 : UNIVERSITY TABLE
-- =====================================

CREATE TABLE UNIVERSITY (
    university_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO UNIVERSITY (university_id, name) VALUES (1,'Example University');
INSERT INTO UNIVERSITY (university_id, name) VALUES (2,'Another University');
INSERT INTO UNIVERSITY (university_id, name) VALUES (3,'Third University');
INSERT INTO UNIVERSITY (university_id, name) VALUES (4,'Fourth University');
INSERT INTO UNIVERSITY (university_id, name) VALUES (5,'Fifth University');
INSERT INTO UNIVERSITY (university_id, name) VALUES (6,'Sixth University');
INSERT INTO UNIVERSITY (university_id, name) VALUES (7,'Seventh University');


-- =====================================
-- PROGRAM 2 : DEPARTMENT TABLE
-- =====================================
CREATE TABLE DEPARTMENT(
  dept_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  building VARCHAR(50),
  budget DECIMAL(12,2),
  university_id INT,
  FOREIGN KEY(university_id) REFERENCES UNIVERSITY(university_id)
);

INSERT INTO DEPARTMENT(dept_id,name,building,budget,university_id)VALUES
(1,'Computer Science','Taylor',100000,1);
INSERT INTO DEPARTMENT(dept_id,name,building,budget,university_id)VALUES
(2,'Mathematics','Watson',90000,1);
INSERT INTO DEPARTMENT(dept_id,name,building,budget,university_id)VALUES
(3,'Physics','Newton',85000,1);
INSERT INTO DEPARTMENT(dept_id,name,building,budget,university_id)VALUES
(4,'Chemistry','Curie',78000,2);
INSERT INTO DEPARTMENT(dept_id,name,building,budget,university_id)VALUES
(5,'Biology','Darwin',82000,2);


-- =====================================
-- PROGRAM 3 : DEPARTMENT TABLE 
-- =====================================

CREATE TABLE DEPARTMENT (
  dept_id NUMBER PRIMARY KEY,
  dept_name VARCHAR2(50) NOT NULL
);

INSERT INTO DEPARTMENT (dept_id, dept_name)
VALUES (1, 'COMPUTER SCIENCE');

CREATE TABLE INSTRUCTOR (
  instructor_id NUMBER PRIMARY KEY,
  name VARCHAR2(50) NOT NULL,
  dept_id NUMBER,
  is_hod CHAR(1) DEFAULT 'N' CHECK (is_hod IN ('Y','N')),
  salary NUMBER(10,2),
  CONSTRAINT fk_instructor_dept
    FOREIGN KEY (dept_id)
    REFERENCES DEPARTMENT (dept_id)
);

INSERT INTO INSTRUCTOR (instructor_id, name, dept_id, is_hod, salary)
VALUES (1, 'JOHN DOE', 1, 'Y', 80000);

INSERT INTO INSTRUCTOR (instructor_id, name, dept_id, is_hod, salary)
VALUES (2, 'JOHN SMITH', 1, 'N', 75000);

INSERT INTO INSTRUCTOR (instructor_id, name, dept_id, salary)
VALUES (3, 'JANE DOE', 1, 72000);



-- =====================================
-- PROGRAM 4 : COURSE TABLE
-- =====================================
CREATE TABLE COURSE(
  course_id VARCHAR(8) PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  dept_id INT,
  credits INT,
  FOREIGN KEY(dept_id) REFERENCES DEPARTMENT(dept_id)
);

INSERT INTO COURSE(course_id,title,dept_id,credits)VALUES
('BIO-101','Introduction to Biology',4,4);
INSERT INTO COURSE(course_id,title,dept_id,credits)VALUES
('CS-101','Introduction to Computer Science',1,4);
INSERT INTO COURSE(course_id,title,dept_id,credits)VALUES
('MAT-101','Calculus I',2,3);
INSERT INTO COURSE(course_id,title,dept_id,credits)VALUES
('PHY-101','General Physics',3,4);
INSERT INTO COURSE(course_id,title,dept_id,credits)VALUES
('CHE-101','Basic Chemistry',4,3);


-- =====================================
-- PROGRAM 5 : SECTION TABLE
-- =====================================
CREATE TABLE SECTION(
  section_id INT PRIMARY KEY,
  course_id VARCHAR(8),
  sec_id INT,
  semester VARCHAR(6),
  year INT,
  building VARCHAR(10),
  time_slot_id VARCHAR(4),
  FOREIGN KEY(course_id) REFERENCES COURSE(course_id)
);

INSERT INTO SECTION(section_id,course_id,sec_id,semester,year,building,time_slot_id)
VALUES (1,'CS-101',1,'FAIL',2023,'Taylor','A');
INSERT INTO SECTION(section_id,course_id,sec_id,semester,year,building,time_slot_id)
VALUES (2,'BIO-101',1,'FAIL',2023,'Curie','A');
INSERT INTO SECTION(section_id,course_id,sec_id,semester,year,building,time_slot_id)
VALUES (3,'MAT-101',1,'FAIL',2023,'Watson','A');
INSERT INTO SECTION(section_id,course_id,sec_id,semester,year,building,time_slot_id)
VALUES (4,'PHY-101',1,'FAIL',2023,'Newton','A');
INSERT INTO SECTION(section_id,course_id,sec_id,semester,year,building,time_slot_id)
VALUES (5,'CHE-101',1,'FAIL',2023,'Curie','A');


-- =====================================
-- PROGRAM 6 : TEACHES TABLE
-- =====================================
CREATE TABLE TEACHES (
  instructor_id INT,
  section_id INT,
  PRIMARY KEY(instructor_id,section_id),
  FOREIGN KEY(instructor_id) REFERENCES INSTRUCTOR(instructor_id),
  FOREIGN KEY(section_id) REFERENCES SECTION(section_id)
);

INSERT INTO TEACHES (instructor_id,section_id) VALUES(1,1);
INSERT INTO TEACHES (instructor_id,section_id) VALUES(2,2);
INSERT INTO TEACHES (instructor_id,section_id) VALUES(3,3);
INSERT INTO TEACHES (instructor_id,section_id) VALUES(4,4);
INSERT INTO TEACHES (instructor_id,section_id) VALUES(5,5);
INSERT INTO TEACHES (instructor_id,section_id) VALUES(6,6);
INSERT INTO TEACHES (instructor_id,section_id) VALUES(7,7);


-- =====================================
-- PROGRAM 7 : STUDENT TABLE
-- =====================================
CREATE TABLE STUDENT(
  student_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  tot_cred INT
);

INSERT INTO STUDENT(student_id,name,tot_cred)VALUES(1,'MIKE JOHNSON',60);
INSERT INTO STUDENT(student_id,name,tot_cred)VALUES(2,'SARAH LEE',45);
INSERT INTO STUDENT(student_id,name,tot_cred)VALUES(3,'TOM BROWN',30);
INSERT INTO STUDENT(student_id,name,tot_cred)VALUES(4,'EMILY DAVIS',75);
INSERT INTO STUDENT(student_id,name,tot_cred)VALUES(5,'DAVID WILSON',90);
INSERT INTO STUDENT(student_id,name,tot_cred)VALUES(6,'LISA ANDERSON',15);


-- =====================================
-- PROGRAM 8 : TAKES TABLE
-- =====================================
CREATE TABLE TAKES(
  student_id INT,
  section_id INT,
  grade CHAR(2),
  PRIMARY KEY(student_id,section_id),
  FOREIGN KEY(student_id) REFERENCES STUDENT(student_id),
  FOREIGN KEY(section_id) REFERENCES SECTION(section_id)
);

INSERT INTO TAKES(student_id,section_id,grade)VALUES(1,1,'A');
INSERT INTO TAKES(student_id,section_id,grade)VALUES(2,1,'B');
INSERT INTO TAKES(student_id,section_id,grade)VALUES(3,2,'A');
INSERT INTO TAKES(student_id,section_id,grade)VALUES(4,3,'C');
INSERT INTO TAKES(student_id,section_id,grade)VALUES(5,4,'B');


-- =====================================
-- PROGRAM 9 : TIME_SLOT TABLE
-- =====================================
CREATE TABLE TIME_SLOT(
  time_slot_id VARCHAR2(4) PRIMARY KEY,
  day CHAR(1),
  start_time DATE,
  end_time DATE
);
INSERT INTO TIME_SLOT(time_slot_id,day,start_time,end_time)
VALUES ('A','M',TO_DATE('09:00','HH24:MI'),TO_DATE('10:30','HH24:MI'));
INSERT INTO TIME_SLOT(time_slot_id,day,start_time,end_time)
VALUES ('B','T',TO_DATE('10:30','HH24:MI'),TO_DATE('12:00','HH24:MI'));
INSERT INTO TIME_SLOT(time_slot_id,day,start_time,end_time)
VALUES ('C','W',TO_DATE('12:00','HH24:MI'),TO_DATE('13:30','HH24:MI'));
INSERT INTO TIME_SLOT(time_slot_id,day,start_time,end_time)
VALUES ('D','T',TO_DATE('14:00','HH24:MI'),TO_DATE('15:30','HH24:MI'));
INSERT INTO TIME_SLOT(time_slot_id,day,start_time,end_time)
VALUES ('E','F',TO_DATE('15:30','HH24:MI'),TO_DATE('17:00','HH24:MI'));



-- =====================================
-- PROGRAM 10 : CLASSROOM TABLE
-- =====================================
CREATE TABLE CLASSROOM(
  building VARCHAR(50),
  room_number VARCHAR(10),
  capacity INT,
  PRIMARY KEY (building,room_number)
);

INSERT INTO CLASSROOM(building,room_number,capacity)VALUES('TAYLOR','3128',50);
INSERT INTO CLASSROOM(building,room_number,capacity)VALUES('TAYLOR','3114',40);
INSERT INTO CLASSROOM(building,room_number,capacity)VALUES('WATSON','2340',60);
INSERT INTO CLASSROOM(building,room_number,capacity)VALUES('WATSON','2245',45);
INSERT INTO CLASSROOM(building,room_number,capacity)VALUES('NEWTON','1320',55);
INSERT INTO CLASSROOM(building,room_number,capacity)VALUES('NEWTON','1310',50);
