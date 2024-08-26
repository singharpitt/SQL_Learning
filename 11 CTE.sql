-- CTE
-- easy to read in cte 
with cte_example (GENDER , AVG_SAL , MAX_SAL , MIN_SAL, COUNT_SAL) as
(
Select gender , avg(salary) avg_sal , max(salary) max_sal,min(salary) min_sal,
count(salary)
from employee_demographics ed
join employee_salary es
	on ed.employee_id = es.employee_id
group by gender
)
-- It can only be used immediately after creating it
Select *
from cte_example
;



-- not easy to read in subquery
Select avg(avg_sal)
from (
Select gender , avg(salary) avg_sal , max(salary) max_sal,min(salary) min_sal,
count(salary)
from employee_demographics ed
join employee_salary es
	on ed.employee_id = es.employee_id
group by gender
) sub_query_example
;





with cte_example as
(
Select gender , employee_id , birth_date
from employee_demographics 
where birth_date > '1985-01-01'
),
cte_ex02 as
(
Select employee_id,salary 
from employee_salary
where salary > 50000
)
-- It can only be used immediately after creating it
Select *
from cte_example
join cte_ex02
	on cte_example.employee_id = cte_ex02.employee_id
;
