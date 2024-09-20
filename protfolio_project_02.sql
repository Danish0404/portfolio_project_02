# Question: 1. Write a query to list all employees along with their respective department names. Include employee number, 
 # first name, last name, department number, and department name.
 select e.emp_no,e.first_name,e.last_name,d.dept_no,d.dept_name from employees e 
 join dept_emp  de on e.emp_no = de.emp_no 
 join departments  d on de.dept_no = d.dept_no;
 
 
# Question: 02 Write a query to retrieve all the salary records of a given employee (10044). 
# Include employee number, salary, from_date, and to_date.
SELECT * FROM salaries
WHERE emp_no = '10044' order by salary desc 
LIMIT 1;

# Question: 03 Write a query to find all employees who have held a specific title (e.g., 'Engineer').
#  Include employee number, first name, last name, and title.

select e.emp_no,e.first_name,e.last_name,t.title from employees e 
join titles t on e.emp_no = t.emp_no where t.title = 'Engineer';

# Question: 04 Write a query to list all departments along with their current managers.
# Include department number, department name, manager's employee number, first name, and last name.
select d.dept_no,d.dept_name,e.emp_no,e.first_name,e.last_name from departments d 
join dept_manager dm on d.dept_no = dm.dept_no
join employees e on dm.emp_no = e.emp_no;

# write 05 a quert to count the number of employee in each department,include dept number,dept name, and employee count.
select d.dept_no,d.dept_name,count(de.emp_no) as employee_count from departments d
join dept_emp de on d.dept_no = de.dept_no 
group by dept_no,dept_name;

# Question:06 Write a query to find all employees born in a specific year (e.g., 1953). 
#Include employee number, first name, last name, and birth date.
select emp_no,first_name,last_name,birth_date from employees where year(birth_date) = '1953'; 

# Question:07 Write a query to find all employees hired in the last 50 years. 
# Include employee number, first name, last name, and hire date.
select emp_no,first_name,last_name,hire_date from employees 
where hire_date >= date_sub(curdate(),INTERVAL 50 YEAR);

# Question:08 Write a query to calculate the average salary for each department.
# Include department number, department name, and average salary.
select d.dept_no,d.dept_name,avg(s.salary) as avg_salary from departments d
join dept_emp de on d.dept_no = de.dept_no
join salaries s on de.emp_no = s.emp_no 
group by dept_no,dept_name;

# Question: 09 Write a query to find the gender distribution (number of males and females) in each department. 
# Include department number, department name, count of males, and count of females.
select d.dept_no,d.dept_name,
sum(case when e.gender = 'M' then 1 else 0 end) as num_of_male,
sum(case when e.gender = 'F' then 1 else 0 end) as num_of_female from departments d
join dept_emp de on d.dept_no = de.dept_no
join employees e on de.emp_no = e.emp_no
group by d.dept_no,d.dept_name;

# Question:10 Write a query to find the employees who have served the longest in the company. 
# Include employee number, first name, last name, and number of years served.

select emp_no,first_name,last_name ,
timestampdiff(year,hire_date,curdate()) as years_served from employees
order by years_served desc limit 8;


