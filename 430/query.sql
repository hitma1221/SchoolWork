insert into taking(studentnum, schedulenum, semester)
select student.studentnum, class.schedulenum, class.semester
from class, student
where class.department = 'CMPSC' and semester = "S18";