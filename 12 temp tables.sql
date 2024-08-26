-- temporary tables

create temporary table temp_table
(first_name varchar(50),
last_name varchar(50),
fav_movie varchar(100)
);


Select * from temp_table;


Insert into temp_table values 
( 'Arpit', 'Singh', 'Some Movie');

Select * from temp_table;




select * from employee_salary;



Create temporary table salary_over_50k
Select * 
from employee_salary
where salary >= 50000; 
;

select * from salary_over_50k;