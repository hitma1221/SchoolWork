select name
from student inner join taking on(studentnum)
where department = 'CMPSCI' and num = '430';