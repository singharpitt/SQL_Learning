-- Data Cleaning
use world_layoffs;

Select * from layoffs;

-- 1 - remove duplicates
-- 2 - Standardize the data
-- 3 - Null or Blank values
-- 4 - Remove columns and rows if not necessary


create table layoffs_staging
like layoffs;


Select * from layoffs_staging;


insert layoffs_staging 
select * 
from layoffs;

Select * from layoffs_staging;


Select * ,
row_number() over (partition by company , location , industry , total_laid_off , 
percentage_laid_off,`date`,stage, country,funds_raised_millions) as row_num
from layoffs_staging;





with duplicate_cte as
(
Select * ,
row_number() over (partition by company , location , industry , total_laid_off , 
percentage_laid_off,`date`,stage, country,funds_raised_millions) as row_num
from layoffs_staging
)
select * from duplicate_cte
where row_num > 1;


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


Select * from layoffs_staging2;


Insert into layoffs_staging2
Select * ,
row_number() over (partition by company , location , industry , total_laid_off , 
percentage_laid_off,`date`,stage, country,funds_raised_millions) as row_num
from layoffs_staging;

Select * from layoffs_staging2;

Select * from layoffs_staging2 where row_num >1 ;

Delete from layoffs_staging2 where row_num >1 ;

-- Standardization of data
-- finding issuesin your data and fixing it


Select company ,trim(company) from layoffs_staging2;

update layoffs_staging2
set company = trim(company);


 
Select * 
from layoffs_staging2
where industry like 'Crypto%' ;


update layoffs_staging2
set industry= 'Crypto'
where industry like 'Crypto%';


Select distinct(industry) from layoffs_staging2 order by industry;



Select distinct(location) from layoffs_staging2 order by location;
Select distinct(country) from layoffs_staging2 order by 1;

Select distinct country , trim(trailing '.' from country)
from layoffs_staging2
order by 1;

update layoffs_staging2
set country = 'United States'
where country = 'United States.';


Select `date` from layoffs_staging2;


Select `date`
from layoffs_staging2;

Update layoffs_staging2
set `date` = str_to_date(`date`,'%m/%d/%Y');



alter table layoffs_staging2
modify column `date` date;


Select * from layoffs_staging2;


-- Working with null 

Select * from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select distinct industry from layoffs_staging2 order by 1;


Select * from layoffs_staging2 where industry is null or industry = '';

Select * from layoffs_staging2 where company = 'Airbnb';

update layoffs_staging2
set industry = null
where industry = '';


Select * 
from layoffs_staging2 t1
join layoffs_staging2 t2
	 on t1.company = t2.company 
where t1.industry is null 
and t2.industry is not null;


update layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company 
set t1.industry = t2.industry
where t1.industry is null 
and t2.industry is not null;

Select * from layoffs_staging2 where industry is null;

select * from layoffs_staging2;


Select * from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

Select * from layoffs_staging2;


delete from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;



alter table layoffs_staging2
drop column row_num;

Select * from layoffs_staging2;


