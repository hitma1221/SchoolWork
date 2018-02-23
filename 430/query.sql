select distinct name
from student inner join taking on (student.studentnum = taking.studentnum) 
inner join class on (class.schedulenum = taking.schedulenum)
where department = 'CMPSCI' and num = 430;