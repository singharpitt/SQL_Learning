-- Case Statements

Select first_name,last_name,age,
case
	when age <= 30 then "Young"
    when age between 31 and 50 then "Old"
    when age >= 50 then "retire"
end as age_check
from employee_demographics;

-- Pay increase 
-- < 50000 then 5%
-- > 50000 then 7%
-- in finance dept then 10%

select first_name,last_name,salary,
case
	when salary < 50000 then salary + (salary * 0.05)
    when salary > 50000 then salary + (salary * 0.07)
end as new_salary,

case
	when dept_id = 6 then (salary * 0.10)
end as bonus
from employee_salary;
