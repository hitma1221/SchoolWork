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
	gpa int,
	PRIMARY KEY(studentnum)
);

CREATE TABLE Taking(
	studentnum int,
	schedulenum int,
	semester varchar(255),
	grade varchar(255),
	PRIMARY KEY(studentnum, schedulenum, semester),
	FOREIGN KEY(studentnum) REFERENCES Student,
	FOREIGN KEY(schedulenum, semester) REFERENCES Class
);

INSERT INTO Instructor(name, department, office) VALUES('Jeremy Blum', 'CMPSCI', 'W255');
INSERT INTO Instructor(name, department, office) VALUES('Sukmoon Chang', 'CMPSCI', 'W255');
INSERT INTO Instructor(name, department, office) VALUES('Linda Null', 'CMPSCI', 'W255');
INSERT INTO Instructor(name, department, office) VALUES('Hyuntae Na', 'CMPSCI', 'W255');
INSERT INTO Instructor(name, department, office) VALUES('Justin Keller', 'Math', 'W255');

INSERT INTO Class(schedulenum, semester, department, num, days, time, place, enrollment) 
VALUES(123, 'Spring', 'CMPSCI', 430, 'T/Th', '1:35', 'EAB', 'Enrolled');
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



SELECT name
FROM Instructor;

DROP TABLE Taking;
DROP TABLE Student;
DROP TABLE Teaches;
DROP TABLE Class;
DROP TABLE Instructor;