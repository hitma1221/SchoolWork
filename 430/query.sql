select name
from student
where studentnum = (select studentnum, count(schedulenum)
					from taking
					where count(schedulenum) = max(count(schedulenum)));
						