CREATE TABLE Instructor(
	name varchar(255),
	department varchar(255),
	office varchar(255),
	PRIMARY KEY(name)
);

CREATE TABLE Class(
	schedulenum int,
	semester varchar(255),
	department varchar(255),
	num int,
	days varchar(255),
	time varchar(255),
	place varchar(255),
	enrollment varchar(255),
	PRIMARY KEY(schedulenum, semester)
);

CREATE TABLE Teaches(
	name varchar(255),
	schedulenum int,
	semester varchar(255),
	PRIMARY KEY(name, schedulenum, semester),
	FOREIGN KEY(name) REFERENCES Instructor,
	FOREIGN KEY(schedulenum, semester) REFERENCES Class
);

CREATE TABLE Student(
	studentnum int,
	name varchar(255),
	standing int,
	gpa real,
	PRIMARY KEY(studentnum)
);

CREATE TABLE Taking(
	studentnum int,
	schedulenum int,
	semester varchar(255),
	grade real,
	PRIMARY KEY(studentnum, schedulenum, semester),
	FOREIGN KEY(studentnum) REFERENCES Student,
	FOREIGN KEY(schedulenum, semester) REFERENCES Class
);

INSERT INTO Instructor(name, department, office) VALUES('Jeremy Blum', 'CMPSCI', 'Olmstead');
INSERT INTO Instructor(name, department, office) VALUES('Sukmoon Chang', 'CMPSCI', 'Olmstead');
INSERT INTO Instructor(name, department, office) VALUES('Linda Null', 'CMPSCI', 'EAB');
INSERT INTO Instructor(name, department, office) VALUES('Hyuntae Na', 'CMPSCI', 'SEC');
INSERT INTO Instructor(name, department, office) VALUES('Justin Keller', 'Math', 'Olmstead');

INSERT INTO Class(schedulenum, semester, department, num, days, time, place, enrollment) 
VALUES(123, 'Spring', 'CMPSCI', 430, 'T/Th', '1:35', 'EAB', 'Enrolled');
INSERT INTO Class(schedulenum, semester, department, num, days, time, place, enrollment) 
VALUES(023, 'Fall', 'CMPSCI', 430, 'T/Th', '1:35', 'EAB', 'Enrolled');
INSERT INTO Class(schedulenum, semester, department, num, days, time, place, enrollment) 
VALUES(124, 'Spring', 'MATH', 455, 'T/Th', '9:00', 'Olmstead', 'Enrolled');
INSERT INTO Class(schedulenum, semester, department, num, days, time, place, enrollment) 
VALUES(125, 'Fall', 'BIO', 100, 'M/W/F', '1:25', 'EAB', ' Not Enrolled');
INSERT INTO Class(schedulenum, semester, department, num, days, time, place, enrollment) 
VALUES(126, 'Spring', 'CMPSCI', 463, 'W', '6:00', 'SEC', 'Not Enrolled');
INSERT INTO Class(schedulenum, semester, department, num, days, time, place, enrollment) 
VALUES(127, 'Spring', 'CMPSCI', 460, 'W', '6:00', 'Olmstead', 'Enrolled');

INSERT INTO Teaches(name, schedulenum, semester) VALUES('Jeremy Blum', 123, 'Spring');
INSERT INTO Teaches(name, schedulenum, semester) VALUES('Jeremy Blum', 126, 'Spring');
INSERT INTO Teaches(name, schedulenum, semester) VALUES('Sukmoon Chang', 127, 'Spring');
INSERT INTO Teaches(name, schedulenum, semester) VALUES('Linda Null', 125, 'Fall');
INSERT INTO Teaches(name, schedulenum, semester) VALUES('Justin Keller', 124, 'Spring');

INSERT INTO Student(studentnum, name, standing, gpa) VALUES(1, 'Joshua Holden', 8, 2.8);
INSERT INTO Student(studentnum, name, standing, gpa) VALUES(2, 'Joseph Hernandez', 8, 3.3);
INSERT INTO Student(studentnum, name, standing, gpa) VALUES(3, 'Jakub Grzegorgowski', 8, 3.5);
INSERT INTO Student(studentnum, name, standing, gpa) VALUES(4, 'Neil Pasricha', 7, 2.9);
INSERT INTO Student(studentnum, name, standing, gpa) VALUES(5, 'Abderrazzak Asmaayni', 8, 3.5);

INSERT INTO Taking(studentnum, schedulenum, semester, grade) VALUES(1, 123, 'Spring', 1.5);
INSERT INTO Taking(studentnum, schedulenum, semester, grade) VALUES(1, 124, 'Spring', 2.1);
INSERT INTO Taking(studentnum, schedulenum, semester, grade) VALUES(1, 126, 'Spring', 3.7);
INSERT INTO Taking(studentnum, schedulenum, semester, grade) VALUES(1, 127, 'Spring', 2.4);
INSERT INTO Taking(studentnum, schedulenum, semester, grade) VALUES(2, 123, 'Spring', 0.2);
INSERT INTO Taking(studentnum, schedulenum, semester, grade) VALUES(2, 124, 'Spring', 1.3);
INSERT INTO Taking(studentnum, schedulenum, semester, grade) VALUES(2, 126, 'Spring', 2.3);
INSERT INTO Taking(studentnum, schedulenum, semester, grade) VALUES(2, 127, 'Spring', 2.5);
INSERT INTO Taking(studentnum, schedulenum, semester, grade) VALUES(5, 123, 'Spring', 3.3);
INSERT INTO Taking(studentnum, schedulenum, semester, grade) VALUES(4, 124, 'Spring', 2.4);
INSERT INTO Taking(studentnum, schedulenum, semester, grade) VALUES(3, 126, 'Spring', 4.0);
INSERT INTO Taking(studentnum, schedulenum, semester, grade) VALUES(5, 124, 'Spring', 1.4);
/*
DROP TABLE Taking;
DROP TABLE Student;
DROP TABLE Teaches;
DROP TABLE Class;
DROP TABLE Instructor;
*/