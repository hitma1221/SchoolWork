select schedulenum, semester, avg(grade) as "avg Grade"
from taking
where schedulenum in (select schedulenum
					  from class
					  where num = 430 and department = 'CMPSCI');