-- Group by

SELECT * 
FROM employee_demographics
;


SELECT gender,avg(age),max(age),min(age),count(age)
FROM employee_demographics
group by gender
;





-- Order by
SELECT * 
FROM employee_demographics
order by gender desc , age desc
;



-- do with position of the column
SELECT * 
FROM employee_demographics
order by 5 , 4
;



-- having vs where
SELECT gender,avg(age) 
FROM employee_demographics
group by gender
having avg(age) >40
;


SELECT occupation,avg(salary)
FROM employee_salary 
where occupation like '%manager%'
group by occupation
having avg(salary) >75000
;
 