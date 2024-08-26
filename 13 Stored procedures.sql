-- stored procedures


Select * 
from employee_salary
where salary >= 50000;


use parks_and_recreation;
create procedure large_salary()
Select * 
from employee_salary
where salary >= 50000;


call large_salary();







delimiter $$
create procedure large_salary2()
begin
	Select * 
	from employee_salary
	where salary >= 50000;
	Select * 
	from employee_salary
	where salary >= 10000;
end $$
delimiter ;


call large_salary2();




delimiter $$
create procedure large_salary3(p_employee_id INT)
begin
	Select first_name,salary 
	from employee_salary
    where employee_id = p_employee_id
	;
end $$
delimiter ;

call large_salary3(1)
