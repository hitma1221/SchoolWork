select studentnum, max(count)
from (select studentnum, count(schedulenum) as count
	  from taking
	  group by studentnum)
where max(count) = count
group by studentnum;