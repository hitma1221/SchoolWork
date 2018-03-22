create view report_card as
	(select name, taking.semester, department, schedulenum, grade
		from student inner join taking using(studentnum)
		inner join class using (schedulenum)
		where taking.semester = 'F18'
		);