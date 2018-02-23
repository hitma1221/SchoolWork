/* problem b
SELECT name
FROM Student
where studentnum in (select studentnum
					from taking
					where schedulenum in (select schedulenum
										 from class
										 where num = 430 and department = 'CMPSCI' and year = '2018'));
*/
/*problem e

select name
from student
where standing = (select standing
					from student
					where name = 'Joshua Holden')
order by name asc;
*/

Select avg(gpa)
from student;

select name, department
from instructor
where office = 'Olmstead';






/*
select name, standing
from student
MINUS
select name, standing
from student
where studentnum in (select studentnum
					from taking
					where schedulenum in (select schedulenum
						 				  from teaches
						 				  where name != 'Linda Null' or name != 'Jeremy Blum'));
*/
