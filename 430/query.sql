insert into taking(studentnum, schedulenum, semester)
(select student.studentnum, class.schedulenum, class.semester
from student, class
where class.department = 'CMPSC' and class.semester = 'S18');