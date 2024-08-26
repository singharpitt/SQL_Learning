-- Joins

Select * 
from employee_demographics;

Select * 
from employee_salary;

# Inner Joins

Select dem.employee_id,age,occupation 
from employee_demographics as dem
inner join employee_salary as sal
on dem.employee_id = sal.employee_id
;


-- Outer Join (left , right)

Select *
from employee_demographics as dem
right join employee_salary as sal
on dem.employee_id = sal.employee_id
;

-- Self Join

Select sal.employee_id as santa_id,
sal.first_name as santa_first_name,
sal.last_name as santa_last_name,
sal2.employee_id as emp_id,
sal2.first_name as emp_first_name,
sal2.last_name as emp_last_name
from employee_salary as sal
join employee_salary as sal2
	on sal.employee_id + 1 = sal2.employee_id;



-- Joining multiple tables

Select * 
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id= sal.employee_id
inner join parks_departments as pd
	on pd.department_id = sal.dept_id;