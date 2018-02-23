with test as 
	(select studentnum, count(schedulenum) as count
	  from taking
	  where semester = "SPRING"
	  group by studentnum)
	select name, max(newcount)
	from student,test
	where newcount >= (selext max(count)
						from test);