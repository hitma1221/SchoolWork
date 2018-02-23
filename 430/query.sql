select name
from student
where studentnum = (select studentnum
					from taking
					where max(
						(select count(schedulenum)
						from taking
						where taking.studentnum = student.studentnum)));
						