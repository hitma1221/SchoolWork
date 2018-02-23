select name
from student inner join taking on(studentnum) inner join class on (schedulenum)
where department = 'CMPSCI' and num = 430;