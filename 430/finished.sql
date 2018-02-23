/* PROBLEM B
SELECT name
FROM Student
where studentnum in (select studentnum
					from taking
					where schedulenum in (select schedulenum
										 from class
										 where num = 430 and department = 'CMPSCI' and year = '2018'));
*/
/*PROBLEM E

select name
from student
where standing = (select standing
					from student
					where name = 'Joshua Holden')
order by name asc;
*/
/* PROBLEM G
Select avg(gpa)
from student;
*/
/* PROBLEM F
select name, department
from instructor
where office = 'Olmstead';
*/
/* PROBLEM H
select name, standing
from student
where gpa = (select max(gpa)
			from student);
*/
/* PROBLEM I
Select count(name)
from student
where gpa > 3;
*/