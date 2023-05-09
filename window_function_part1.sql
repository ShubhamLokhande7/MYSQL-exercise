use employeeDB;

select * from employee;

-- max salary eared by employee
select *, max(salary) from employee;

-- department wise max salary
select *, max(salary) as max_salary
from employee
group by dept_name;

-- over() clause ==> is telling sql to create a window of record over the max() function 
select *, max(salary) over() as max_salary
from employee ;

-- partitionby() clause ==> to partition rows of table into groups.
select *, max(salary) over(partition by dept_name) as max_sal 
from employee;

select *, round(avg(salary),2) as avg_sal
from employee
group by dept_name;

select *, avg(salary) over(partition by dept_name) as avg_sal
from employee;

-- row_number() ==> to insert the row number for the column/s
select *, row_number() over() as row_num
from employee;

-- this will asign the row number department wise 
select *, row_number() over(partition by dept_name) as RN
from employee;

-- fetch the 1st 2 employees for the each dept to join the company
select * from (
	select *, row_number() over(partition by dept_name order by dept_name) as RN
	from employee) as x
where x.rn < 3;



-- fetch the top 3 employees in each department who has highest salary

-- rank() ==> will skip every duplicate value 

select * from (
	select *, rank() over(partition by dept_name order by salary desc) as rnk
	from employee) as x 
where x.rnk < 4;

-- dence_rank() ==> 

select * from(
	select *,
	dense_rank() over(partition by dept_name order by salary desc ) as dense_rnk,
    row_number() over(partition by dept_name order by salary desc ) as RN
	from employee) as x
where x.dense_rnk < 4;


-- lag() ==> brings the records form the previous rows  

-- fetch the records to display the salary of an employee is highest, lower or equal to the previous emloyee

select *,
lag(salary) over(partition by dept_name) as pre_emp_sal
from employee;

select * ,
lag(salary,2,"NA") over(partition by dept_name ) as pre_emp_sal
from employee;

-- lead()  ==> is the record following to urrent record
select *,
lead(salary) over (partition by dept_name order by emp_id) as lead_emp_sal
from employee;


select *,
lag (salary) over(partition by dept_name) as pre_emp_salary,
case when salary > lag (salary) over(partition by dept_name order by emp_id) then "Higher"
			when salary < lag (salary) over(partition by dept_name order by emp_id) then "Lower"
            when salary = lag (salary) over(partition by dept_name order by emp_id) then "Same"
			end sal_range
from employee;








