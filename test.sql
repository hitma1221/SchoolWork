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
	PRIMARY KEY(schedulenum, semester),
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
	PRIMARY KEY(studentnum, semester),
	FOREIGN KEY(studentnum) REFERENCES Student,
	FOREIGN KEY(schedulenum, semester) REFERENCES Class
);

CREATE TABLE deans_list(
	studentnum int,
	semester varchar(255),
	PRIMARY KEY(studentnum, semester),
	FOREIGN KEY(studentnum) REFERENCES Student,
	FOREIGN KEY(studentnum, semester) REFERENCES Taking
);

ALTER TABLE Student
ADD address varchar(255);

DELETE FROM Student;

INSERT INTO Instructor(name)
VALUES('Blum');

SELECT name
FROM Instructor;