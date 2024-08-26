-- limit & aliasing

select * 
from employee_demographics
limit 5
;

select * 
from employee_demographics
order by age desc
limit 5
;

select * 
from employee_demographics
order by age desc
limit 2,2
;


-- aliasing 

select gender,avg(age) as avg_age 
from employee_demographics
group by gender
having avg_age >40
;

# we cannot write as but it will be implemented

select gender,avg(age) avg_age 
from employee_demographics
group by gender
having avg_age >40
;