select schedulenum, semester
from taking
where schedulenum in (select schedulenum
					  from class
					  where num = 430 and department = 'CMPSCI')
group by avg(grade);