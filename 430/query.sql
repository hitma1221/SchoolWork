select studentnum, count(schedulenum)
from taking
where taking.studentnum = student.studentnum
group by studentnum;