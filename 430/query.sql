with test as 
	(select studentnum, count(schedulenum)as classcount
	  from taking
	  where semester = 'Spring'
	  group by studentnum)
	select name, max(classcount)
	from student, takes
	where classcount >= (select max(classcount)
						from test)
	and student.studentnum = takes.studentnum
	group by name;