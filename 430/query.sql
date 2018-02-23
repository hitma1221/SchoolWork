select distinct name, standing
from student inner join taking on (student.studentnum = taking.studentnum)
where schedulenum in ( select schedulenum
					 from student inner join taking
					 on (student.studentnum = taking.studentnum)
						Intersect
					select schedulenum
					from teaches inner join Instructor on(teaches.name = Instructor.name)
					where name = 'Linda Null' or name = 'Jeremy Blum');