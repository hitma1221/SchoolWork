select studentnum
from max(select studentnum, count(schedulenum)
		from taking
		group by studentnum);
