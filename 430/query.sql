with test as 
	(select studentnum, count(schedulenum) as count
	  from taking
	  where semester = 'Spring'
	  group by studentnum)
	select name, max(count)
	from student,test
	where count >= (select max(count)
						from test)
	group by name;