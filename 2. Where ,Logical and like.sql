-- Where Clause

SELECT *
FROM employee_salary
WHERE first_name='Leslie';






SELECT *
FROM employee_salary
WHERE salary >= 50000;



SELECT *
FROM employee_salary
WHERE salary <= 50000;




SELECT * 
FROM employee_demographics
WHERE gender != 'Female';


SELECT * 
FROM employee_demographics
WHERE birth_date >= '1987-01-01';



-- logical operators AND OR NOT

SELECT * 
FROM employee_demographics
WHERE birth_date >= '1987-01-01' 
and gender='Male';

SELECT * 
FROM employee_demographics
WHERE birth_date >= '1987-01-01' 
or not gender='Male';



SELECT * 
FROM employee_demographics
WHERE (first_name='Leslie' and age = 44) or age > 55;

# like statement
-- % (gives you anything before and after no number is fixed) and _( gives you the exact no. of charcaters before or after)

SELECT * 
FROM employee_demographics
WHERE first_name like 'Jer%'
;

SELECT * 
FROM employee_demographics
WHERE first_name like '%er%'
;

SELECT * 
FROM employee_demographics
WHERE first_name like '__n'
;

SELECT * 
FROM employee_demographics
WHERE first_name like 'a___%'
;

SELECT * 
FROM employee_demographics
WHERE birth_date like '1977%'
;