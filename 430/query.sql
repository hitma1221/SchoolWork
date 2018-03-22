delete from student
	where EXISTS
	(select *
		from student inner join taking using(studentnum) innerSql
		where innerSql.schedulenum = (select schedulenum
										from class
										where department = 'CMPSC' and num = 463)
		and student.studentnum = innerSql.studentnum
	);