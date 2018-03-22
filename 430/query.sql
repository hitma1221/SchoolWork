create view report_card as
	(select info.name, info.semester, semester.department, info.schedulenum, info.grade
		from student inner join taking using(studentnum) info, class
		where semester = "F18"
		);