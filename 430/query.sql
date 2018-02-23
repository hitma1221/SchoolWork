SELECT name
FROM Student
where studentnum = (select studentnum
					from taking
					where schedulenum = (select schedulenum
										 from class
										 where num = 430 and department = 'CMPSCI'));