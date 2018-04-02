CREATE TABLE Student(
	studentnum integer PRIMARY KEY,
	name varchar(30),
	standing varchar(30),
	gpa real,
	check (gpa>0.0), check (gpa<=4.00),
	check(standing in('first year','sophomore','junior','senior')));

CREATE TABLE Class(
	schedulenum integer,
	semester varchar(30),
	department varchar(30),
	num int, 
	days varchar(30), 
	time integer, 
	place varchar(40),
	enrollment varchar(30),
 	PRIMARY KEY (schedulenum,semester),
 	UNIQUE (semester,days,time,place),
 	check(days in('MWF','TuTh')),
 	check(time>=0),check(time<=23)
 	);

CREATE TABLE Instructor(name varchar(30), 
	department varchar(30), 
	office varchar(30),
	PRIMARY KEY(name));

CREATE TABLE Teaches(name varchar(30),
	schedulenum integer,
	semester varchar(30),
	PRIMARY KEY (schedulenum,semester),
	foreign key(name) references instructor(name), 
	foreign key(schedulenum, semester) references class(schedulenum,
	semester
));

create table Taking(
	studentnum integer, 
	schedulenum integer, 
	semester varchar(30), 
	grade varchar(30),
	PRIMARY KEY(studentnum, schedulenum, semester),
	foreign key(studentnum) references student(studentnum) ON DELETE CASCADE, foreign key(schedulenum, semester) references class(schedulenum,
	semester) ON DELETE CASCADE
);



INSERT INTO Student(studentnum, name, standing, gpa) VALUES(1, 'Joshua Holden', 'first year', 2.8);
INSERT INTO Student(studentnum, name, standing, gpa) VALUES(2, 'Joseph Hernandez', 'sophomore', 3.3);
INSERT INTO Student(studentnum, name, standing, gpa) VALUES(3, 'Jakub Grzegorgowski', 'junior', 3.5);
INSERT INTO Student(studentnum, name, standing, gpa) VALUES(4, 'Neil Pasricha', 'senior', 2.9);
INSERT INTO Student(studentnum, name, standing, gpa) VALUES(5, 'Abderrazzak Asmaayni', 'senior', 3.5);
INSERT INTO Student(studentnum, name, standing, gpa) VALUES(9, 'zak', 'senior', 3.5);


INSERT INTO Class(schedulenum, semester, department, num, days, time, place, enrollment) 
VALUES(123, 'S18', 'CMPSC', 430, 'TuTh', '1', 'EAB', 'Enrolled');
INSERT INTO Class(schedulenum, semester, department, num, days, time, place, enrollment) 
VALUES(023, 'F18', 'CMPSC', 430, 'TuTh', '1', 'EAB', 'Enrolled');
INSERT INTO Class(schedulenum, semester, department, num, days, time, place, enrollment) 
VALUES(124, 'S18', 'MATH', 455, 'TuTh', '9', 'Olmstead', 'Enrolled');
INSERT INTO Class(schedulenum, semester, department, num, days, time, place, enrollment) 
VALUES(125, 'F18', 'BIO', 100, 'MWF', '7', 'EAB', ' Not Enrolled');
INSERT INTO Class(schedulenum, semester, department, num, days, time, place, enrollment) 
VALUES(126, 'S18', 'CMPSC', 463, 'MWF', '6', 'SEC', 'Not Enrolled');
INSERT INTO Class(schedulenum, semester, department, num, days, time, place, enrollment) 
VALUES(127, 'S18', 'CMPSC', 460, 'MWF', '18', 'Olmstead', 'Enrolled');
INSERT INTO Class(schedulenum, semester, department, num, days, time, place, enrollment) 
VALUES(001, 'S18', 'BIO', 141, 'MWF', '3', 'Olmstead', 'Enrolled');

INSERT INTO Instructor(name, department, office) VALUES('Jeremy Blum', 'CMPSC', 'Olmstead');
INSERT INTO Instructor(name, department, office) VALUES('Sukmoon Chang', 'CMPSC', 'Olmstead');
INSERT INTO Instructor(name, department, office) VALUES('Linda Null', 'CMPSC', 'EAB');
INSERT INTO Instructor(name, department, office) VALUES('Hyuntae Na', 'CMPSC', 'SEC');
INSERT INTO Instructor(name, department, office) VALUES('Naga not working here', 'MATH', 'SEC');
INSERT INTO Instructor(name, department, office) VALUES('Justin Keller', 'Math', 'Olmstead');

INSERT INTO Teaches(name, schedulenum, semester) VALUES('Jeremy Blum', 123, 'S18');
INSERT INTO Teaches(name, schedulenum, semester) VALUES('Jeremy Blum', 126, 'S18');
INSERT INTO Teaches(name, schedulenum, semester) VALUES('Sukmoon Chang', 127, 'S18');
INSERT INTO Teaches(name, schedulenum, semester) VALUES('Linda Null', 125, 'F18');
INSERT INTO Teaches(name, schedulenum, semester) VALUES('Justin Keller', 124, 'S18');

