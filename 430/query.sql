select name
from student
where EXISTS (select distinct name
				from student inner join taking on (stud.studentnum = taking.studentnum)
				inner join class on (class.schedulenum = taking.schedulenum) as stud
				where department != 'CMPSCI' and num != 430 and stud.studentnum = student.studentnum);