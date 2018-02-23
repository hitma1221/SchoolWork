select studentnum, max(count)
from (select studentnum, count(schedulenum) as count
	  from taking
	  group by studentnum)
group by studentnum;
