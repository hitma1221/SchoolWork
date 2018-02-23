SELECT name
				FROM Student stud
				where studentnum in
				(select studentnum
					from taking
					where schedulenum not in 
					(select schedulenum
					 from class
					 where num = 430 and department = 'CMPSCI'))
/*select name
from student
where EXISTS (SELECT name
				FROM Student stud
				where student.studentnum = stud.studentnum and 
				studentnum in
				(select studentnum
					from taking
					where schedulenum in 
					(select schedulenum
					 from class
					 where num != 430 and department != 'CMPSCI')));*/
