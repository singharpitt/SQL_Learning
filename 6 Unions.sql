-- unions

select first_name,last_name 
from employee_demographics
union
select first_name,last_name
from employee_salary
;


select first_name,last_name ,'Old Man' as Label
from employee_demographics 
where age > 40 and gender = "Male"
union
select first_name,last_name ,'Old lady' as Label
from employee_demographics 
where age > 40 and gender = "Female"
union
select first_name,last_name, 'High Pay' as Label
from employee_salary
where salary > 70000
order by first_name
;