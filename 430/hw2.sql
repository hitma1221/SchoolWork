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

INSERT INTO Instructor(name, department, office)
VALUES('Jeremy Blum', 'CMPSCI', 'W255'),
('Sukmoon Chang', 'CMPSCI', 'W255');

SELECT name
FROM Instructor;

DROP TABLE Taking;
DROP TABLE Student;
DROP TABLE Teaches;
DROP TABLE Class;
DROP TABLE Instructor;