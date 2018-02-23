with test as 
	(select studentnum, count(schedulenum)
	  from taking
	  where semester = 'Spring'
	  group by studentnum)as classcount
	select name, max(classcount)
	from student,test
	where classcount >= (select max(classcount)
						from test)
	group by name;