SELECT name
FROM Student
where studentnum in (select studentnum
					from taking
					where schedulenum in (select schedulenum
										 from class
										 where num = 430 and department = 'CMPSCI'));