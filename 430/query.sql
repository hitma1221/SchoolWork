select studentnum
from (select studentnum, count(schedulenum) as count
	  from taking
	  group by studentnum)
where max(count) = count;