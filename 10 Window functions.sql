-- Windows Functions

Select ed.first_name,ed.last_name,gender,avg(salary) as avg_salary
from employee_demographics as ed
join employee_salary as es
	on ed.employee_id=es.employee_id
    group by gender,ed.first_name,ed.last_name; 
    
    
    






Select ed.first_name,ed.last_name,gender,avg(salary) over(partition by gender)
from employee_demographics as ed
join employee_salary as es
	on ed.employee_id=es.employee_id; 



Select ed.first_name,ed.last_name,gender,salary,
sum(salary) over(partition by gender order by ed.employee_id) as Rolling_total
from employee_demographics as ed
join employee_salary as es
	on ed.employee_id=es.employee_id; 
    
    
    



Select ed.employee_id,ed.first_name,ed.last_name,gender,salary,
row_number()over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as rank_num,
dense_rank() over(partition by gender order by salary desc) as denserank_num
from employee_demographics as ed
join employee_salary as es
	on ed.employee_id=es.employee_id; 
    




