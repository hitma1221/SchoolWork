/*PROBLEM A*/
select distinct name
from student inner join taking on (student.studentnum = taking.studentnum) 
inner join class on (class.schedulenum = taking.schedulenum)
where department = 'CMPSCI' and num = 430 and class.semester = 'Spring';
/* PROBLEM B */
SELECT name
FROM Student
where studentnum in (select studentnum
					from taking
					where schedulenum in (select schedulenum
										 from class
										 where num = 430 and department = 'CMPSCI' and year = '2018'));
/*PROBLEM C*/
select distinct name, standing
from student inner join taking on (student.studentnum = taking.studentnum)
where schedulenum in ( select schedulenum
					 from student inner join taking
					 on (student.studentnum = taking.studentnum)
						Intersect
					select schedulenum
					from teaches inner join Instructor on(teaches.name = Instructor.name)
					where teaches.name = 'Linda Null' or teaches.name = 'Jeremy Blum');
/*PROBLEM D*/
select name
from student
where EXISTS(
			SELECT name
			FROM Student stud
			where student.studentnum = stud.studentnum 
			and stud.studentnum not in
				(
				select studentnum
				from taking
				where schedulenum in 
					(select schedulenum
					 from class
					 where num = 430 and department = 'CMPSCI')));
/*PROBLEM E*/
select name
from student
where standing = (select standing
					from student
					where name = 'Joshua Holden')
order by name asc;
/* PROBLEM F*/
select name, department
from instructor
where office = 'Olmstead';
/* PROBLEM G*/
Select avg(gpa)
from student;
/* PROBLEM H*/
select name, standing
from student
where gpa = (select max(gpa)
			from student);
/* PROBLEM I */
Select count(name)
from student
where gpa > 3;
/*PROBLEM J*/
select schedulenum, semester, avg(grade)
from taking
where schedulenum in (select schedulenum
					  from class
					  where num = 430 and department = 'CMPSCI')
group by schedulenum, semester;
/*PROBLEM K*/
with test as 
	(select studentnum, count(schedulenum)as classcount
	  from taking
	  where semester = 'Spring'
	  group by studentnum)
	select name, max(classcount)
	from student, test
	where classcount >= (select max(classcount)
						from test)
	and student.studentnum = test.studentnum
	group by name;
