delete from student
	where EXISTS
	(select *
		from student inner join taking using(studentnum),
		class
		where department = 'CMPSC' and num = '430'
	);