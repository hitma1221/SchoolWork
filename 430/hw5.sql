//number 1
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

//number 2

create table Taking(
	studentnum integer, 
	schedulenum integer, 
	semester varchar(30), 
	grade varchar(30),
	PRIMARY KEY(studentnum, schedulenum, semester),
	foreign key(studentnum) references student(studentnum) ON DELETE CASCADE, foreign key(schedulenum, semester) references class(schedulenum,
	semester) ON DELETE CASCADE
);

//number 4

INSERT INTO Student(studentnum, name, standing, gpa) VALUES(6, 'christian', 'first year', 3.0);
INSERT INTO Student(studentnum, name, standing, gpa) VALUES(1, 'Joshua Holden', 'first year', 2.8);
INSERT INTO Student(studentnum, name, standing, gpa) VALUES(2, 'Joseph Hernandez', 'sophomore', 3.3);
INSERT INTO Student(studentnum, name, standing, gpa) VALUES(3, 'Jakub Grzegorgowski', 'junior', 3.5);
INSERT INTO Student(studentnum, name, standing, gpa) VALUES(4, 'Neil Pasricha', 'senior', 2.9);
INSERT INTO Student(studentnum, name, standing, gpa) VALUES(5, 'Abderrazzak Asmaayni', 'senior', 3.5);

// number 5
insert into taking(studentnum, schedulenum, semester)
(select student.studentnum, class.schedulenum, class.semester
from student, class
where class.department = 'CMPSC' and class.semester = 'S18');

//number 6
update student
	set gpa =
	case
		when (gpa > 3.5) then 4.0
		else gpa + .5
	end;

//number 7
create view report_card as
	(select name, taking.semester, department, schedulenum, grade
		from student inner join taking using(studentnum)
		inner join class using (schedulenum)
		where taking.semester = 'S18'
		);

//number 8
delete from student
	where EXISTS
	(select *
		from student inner join taking using(studentnum),
		class
		where department = 'CMPSC' and num = '430'
	);

//number 9
a.) No you cannot see the student in the second connection. Im guessing the database
updates after your connection ends so it can be preserved in 
case of errors no one but oracle knows why

b.) Yes it worked no one but oracle knows why

c.) Yes you can see the instructor after you exit no one but oracle knows why

d.) No it did not show up no one but oracle knows why