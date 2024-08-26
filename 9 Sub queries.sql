-- Subqueries


Select * 
from employee_demographics
where employee_id in 
					(Select employee_id from employee_salary
                    where dept_id=1);
                    
                    
                    
                    


Select first_name,salary,
(Select avg(salary) from employee_salary) 
from employee_salary
;





Select gender,avg(age),max(age),min(age),count(age)
from employee_demographics
group by gender;

Select avg(avg_age),max(max_age),min(min_age),count(count_age)   
from 
(Select gender,avg(age) as avg_age,max(age) as max_age,
min(age) as min_age,count(age) as count_age
from employee_demographics
group by gender) as Aggregated_table;

