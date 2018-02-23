select name
from student, taking, class
where class.department = 'CMPSCI' and class.num = 430;