-- String Functions

select length('Hair');

select first_name , length(first_name)
from employee_demographics
order by 2;

select upper('sky');
select lower('SKY');

select first_name , upper(first_name)
from employee_demographics
order by 2;

select trim('      ABCD       ');


select first_name,
left(first_name,3),
right(first_name,3),
substring(first_name,3,2),
birth_date,
substring(birth_date,6,2) as abc
from employee_demographics
order by abc desc;


select first_name, replace(first_name, 'a','z') 
from employee_demographics;

select locate ('p','arpit');

select first_name, locate('An' ,first_name) 
from employee_demographics;

select first_name, last_name, concat(first_name,' ',last_name) as fullname
from employee_demographics;