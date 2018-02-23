select schedulenum, semester, avg(grade)
from taking
where schedulenum in (select schedulenum
					  from class
					  where num = 430 and department = 'CMPSCI')
group by schedulenum;