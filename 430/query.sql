create view report_card as
	(select info.name, info.semester, info.department, schedulenum, grade
		from studnet inner join taking using(studentnum) as info,
		class
		);