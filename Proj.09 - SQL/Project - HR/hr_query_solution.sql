use hr;
show tables;

-- 1. Fetch all the records for Employees Table. 
select * from employees;

-- 2. Show all the emp_id, first_name, last_name from employee Table. 
select employee_id,first_name,last_name from employees;

/* 3. Write a query in SQL to display the first_name and last_name,  department_id and salary from 
employees Table who earn more than 20000.*/

select first_name,last_name,department_id,salary
from employees 
where salary > 20000;

/* 4.  Write a query in SQL to display the first_name and last_name, email, salary and 
manager_ID for those employees  whose managers_ID  is 120, 103 or 145.(18 rows) */

select first_name,last_name,salary,manager_id
from employees
where manager_id in (120,103,145);

/* 5. Write a query in SQL to display the first_name and  last_name,department_id and 
salary from employees Table   who earn more than 8000 And whose managers_ID  is 
120, 103 or 145.(3 rows) */

select first_name,last_name,department_id,salary
from employees
where salary > 8000 and manager_id in (120,103,145);

/* 6. Write a query to display all the locations (id, city) which do not have any state province 
mentioned.  (6 rows) [NOTE: LOCATION TABLE] */
select location_id,city 
from locations
where state_province is null;

/* 7. Write a query to display job_id, job titles, min_salary, max_salary whose maximum 
salary is greater than 10000. (9 rows) [NOTE: JOBS TABLE] */

select job_id,job_title,min_salary,max_salary
from jobs
where max_salary > 10000
order by max_salary;

/* 8. Write a query to display department_id,department_name, Manager_id whose manager_id is greater than  200 and   
location_id is 2400.(1 row) [NOTE : DEPARTMENTS TABLE] */
select department_id,department_name,manager_id
from departments
where manager_id > 200 and location_id = 2400;

/* 9. Write a query to display the job title whose minimum  salary is greater than 8000 and 
max salary less than 20000 (3 rows).[NOTE : JOBS TABLE] */

select job_title
from jobs
where min_salary > 8000 and max_salary < 20000;

/* 10. Write a query to retrieve all the records of departments with managers for the location 
id 1700. (5 rows) [NOTE : DEPARTMENTS TABLE] */

select * from departments
where location_id = 1700 and manager_id is not null;

/* 11. List all departments starting with “P” where there are managers.
(2 rows)[NOTE:DEPARTMENT TABLE] */
select * from departments
where department_name like 'p%'
and manager_id is not null;

/* 12. Print a bonafide certificate for an employee (say for emp. id 123) as below: 
#"This is to certify that <full name> with employee id <emp. id> is working as <job id> in 
dept. <dept ID>. (1 ROW)  [NOTE : EMPLOYEES table]. */

select concat('This is to certify that ',first_name,' ',last_name, 
				' with employee id ',employee_id,' is working as job id '
                ,job_id,' in department ',department_id) as emp_details
from employees
where employee_id = 123;

/* 13. Write a  query to display the  employee id, salary & salary range of employees as 'Tier1', 
'Tier2' or 'Tier3' as per the range <5000, 5000-10000, >10000 respectively,ordering the 
output by those tiers.(107 ROWS)[NOTE :EMPLOYEES TABLE] */

select employee_id,salary,
	case
		when salary < 5000 then 'Tier 1'
		when salary between 5000 and 10000 then 'Tier 2'
        when salary > 10000 then 'Tier 3'
	end as tiers
from employees
order by salary;

/* 14. Write a query to display the department-wise and job-id-wise  total  salaries of employees 
whose salary is more than 25000.(8 rows) [NOTE : EMPLOYEES TABLE] */

select department_id,job_id,sum(salary)
from employees
group by department_id,job_id
having sum(salary) > 25000; 

/* 15. Write a query to display names of employees whose first name as well as last name ends 
with vowels.  (vowels : aeiou ) (5 rows) [NOTE : EMPLOYEES TABLE] */

select first_name,last_name
from employees
where 
(first_name like '%a' or first_name like '%e' or first_name like '%i' or first_name like '%o' or first_name like '%u')
and
(last_name like '%a' or last_name like '%e' or last_name like '%i' or last_name like '%o' or last_name like '%u');

/* 16. What is the average salary range (diff. between min & max salary) of all types 'Manager's 
and 'Clerk's. (9 rows)[NOTE : JOBS TABLE] */

select job_id,job_title,avg(max_salary - min_salary) as diff_avg
from jobs
where job_title like '% Manager' or job_title like '% Clerk'
group by job_id,job_title; 

/* 17. Write a query to list the names of all people who report to the same person in department 
Accounting (i.e.2). */

select concat(e.first_name,' ',e.last_name) as full_name,d.department_name,d.manager_id
from employees e
left join departments d
on e.department_id = d.department_id
where d.department_name = 'Accounting';

/* 18. Write a query in SQL to display the first name, last name, department number, and 
department name for each employee.(106 rows) */

select e.first_name,e.last_name,e.department_id,d.department_name
from employees e 
left join departments d
on e.department_id = d.department_id
where d.department_id is not null and d.department_name is not null;

/* 19. Write a query in SQL to display the name of the department, average salary and 
number of employees working in that department who got commission.(One row) */

select * from employees;

select e.department_id, d.department_name, avg(e.salary) as average_salary, count(e.employee_id) as count
from employees e
left join departments d
on e.department_id = d.department_id
where e.commission_pct > 0 and e.department_id is not null
group by e.department_id;


-- 20. Display the first name where commission percentage is not provided.(72 rows)
select first_name
from employees
where commission_pct is null;

/* 21. Display first_name ,commission and where commission is null print 'Its Null' 
otherwise print 'It’s not null' (107 Rows) */

select first_name, commission_pct,
	case
    when commission_pct is null then 'Its Null'
    else 'Its not null'
    end as commission_status
from employees;

#---------------------- end ---------------------------#





        

