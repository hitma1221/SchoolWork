select studentnum, count(schedulenum)
from taking
group by studentnum;
						