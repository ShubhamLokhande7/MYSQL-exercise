select * from bonus;
select * from title;
select * from worker;

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>.
SELECT FIRST_NAME as "WORKER_NAME" FROM worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.
select upper(first_name) from worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.
SELECT DISTINCT department from worker;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from the Worker table.
SELECT substring(first_name, 1, 3) from worker;

SELECT first_name FROM worker WHERE first_name like "___%";

-- Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table.
select * from worker where first_name like "a%";

-- Q-6. Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side.
SELECT *, rtrim(first_name) as modified_name FROM worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side.
SELECT *, ltrim(department) as modified_dept_name FROM worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.
SELECT DISTINCT department, length(department) as length FROM worker;

select first_name, length(first_name) as length from worker;

-- Q 9. Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.
SELECT *, replace(first_name, "a", "A") as modified_name FROM worker;

select *, replace(department, "HR", "Human Resoures") as modified_name from worker;



-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME. 
-- A space char should separate them.
SELECT *, concat(first_name," ",last_name) as complete_name from worker;

select concat(first_name ," ", last_name ) as FN from worker;
-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM worker ORDER BY first_name;

select * from worker order by joining_date desc;

select * from worker where year(joining_date) = 2014 and month(joining_date) = 2;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM worker ORDER BY first_name asc , department desc;

-- Q-13. Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.
SELECT * FROM worker WHERE first_name in ("vipul", "satish");
select * from worker where first_name = "vipul" or first_name = "satish";
-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.
SELECT * from worker WHERE first_name not in ("vipul", "satish");

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
SELECT * FROM worker WHERE department = "admin";
select * from worker where department in  ("admin");
-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * from worker where first_name like "%a%";
-- first_name is starts with 'a'.
SELECT * from worker where first_name like "a%" ;
-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * from worker where first_name like "%a"; 
-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * 
FROM worker 
where first_name like "%h" and length(first_name) = 6;

select * from worker where first_name like "%h" and length(first_name)=6;
-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * 
FROM worker 
WHERE salary between 100000 and 500000 
ORDER BY salary ;
-- Q-20. Write an SQL query to print details of the Workers who joined in Feb’2014.
SELECT *
FROM Worker
WHERE year(joining_date) = 2014  and month(joining_date) = 2;
-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT count(*), department FROM worker
WHERE department = "admin";

select count(*) from worker where department = 'hr';

-- Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
SELECT * 
FROM worker 
WHERE salary >=50000 and salary <=100000
ORDER BY salary desc;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in descending order.
SELECT count(*), department FROM worker GROUP BY department ORDER BY department;


-- Q-24. Write an SQL query to print details of the Workers who are also Managers.


SELECT W.*, T.worker_title
from worker W
join title T on W.worker_id = T.worker_ref_id;

-- Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT W.*, count(T.worker_title ) as duplicate_number 
from worker W
join title T on W.worker_id = T.worker_ref_id
group by T.worker_title 
 having count(T.worker_title ) > 1;

-- Q-26. Write an SQL query to show only odd rows from a table.

SELECT * 
FROM (
			SELECT *,
			ROW_NUMBER() over(ORDER BY worker_id) as rn 
			from worker) as x
WHERE x.rn % 2 = 1;            

select * from worker where worker_id % 2 = 1 ;

-- Q-27. Write an SQL query to show only even rows from a table.
select * from worker;
SELECT * FROM title;

SELECT * 
FROM (
			SELECT *,
			ROW_NUMBER() over(order by worker_id ) as rn
			FROM worker) as x
WHERE x.rn % 2 = 0;            

select * from worker where worker_id % 2 = 0;

-- Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE new_table as 
SELECT * 
FROM worker;

select * from new_table;


-- Q-29. Write an SQL query to fetch intersecting records of two tables.
(SELECT * FROM worker)
intersect
(SELECT * FROM new_table);


-- Q-30. Write an SQL query to show records from one table that another table does not have.



-- Q-31. Write an SQL query to show the current date and time.
SELECT curdate();

-- Q-32. Write an SQL query to show the top n (say 10) records of a table.

SELECT * FROM worker;

select *
from (
			select *,
			ROW_NUMBER() OVER(order by salary DESC) as top_5
			from worker) as x
where x.top_5 <= 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

select * 
from (
		select *,
		rank() OVER(order by salary desc) as top_sal
		from worker) as x
where x.top_sal <=5;        

select *
from (
		select *,
		rank() over(PARTITION BY department ORDER BY salary desc ) as top_sal
		from worker) as x 
-- GROUP BY department 
having x.top_sal <= 3;      

SELECT worker_id, first_name,salary , X.TS
from (
			select * , 
			DENSE_RANK() over(ORDER BY salary desc ) as TS
			from worker) X
where X.TS <=5;            



-- Q-34. Write an SQL query to determine the 5th highest salary without using the TOP or limit method.
select *
from (
			SELECT *,
			DENSE_RANK() over(ORDER BY salary desc) as TS
			from worker) X
where X.TS = 5;            

-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
select  w1.*
from worker W1
join worker W2 on w1.salary = w2.salary
where  w1.worker_id != w2.worker_id;



-- Q-36. Write an SQL query to show the second-highest salary from a table.

select *
from (
			SELECT *,
			DENSE_RANK() over(order by salary desc) as ts
			from worker) X
where x.ts=2;


-- Q-37. Write an SQL query to show one row twice in the results from a table.
-- Q-38. Write an SQL query to fetch intersecting records of two tables.
-- Q-39. Write an SQL query to fetch the first 50% of records from a table.
-- Q-40. Write an SQL query to fetch the departments that have less than five people in them.
SELECT *
FROM (
			SELECT *,
			ROW_NUMBER() over(PARTITION BY department ORDER BY worker_id) as num
			FROM worker) AS X
WHERE X.num  < 5;



-- Q-41. Write an SQL query to show all departments along with the number of people in there.
select department, count(department) as emp_count from worker GROUP BY department order by department ;

SELECT department, COUNT(*) OVER (PARTITION BY department) AS num_of_people
FROM worker ;

-- Q-42. Write an SQL query to show the last record from a table.
SELECT * from worker ORDER BY worker_id desc LIMIT 1;


-- Q-43. Write an SQL query to fetch the first row of a table.
SELECT * from worker LIMIT 1;

SELECT * FROM worker order by worker_id limit 1;

-- Q-44. Write an SQL query to fetch the last five records from a table.

SELECT *
FROM(
			select *,
			ROW_NUMBER() over(ORDER BY worker_id) as last_record
			from worker) as X
ORDER BY X.last_record desc
limit 5;


-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT *
from (
			SELECT *,
			dense_rank() over(partition by department order by salary desc)	 sal
			FROM worker) x
where x.sal = 1;            

-- Q-46. Write an SQL query to fetch three max salaries from a table.
select DISTINCT salary, worker_id
from (
			select *, 
			dense_rank() over(order by  salary desc) sal
			from worker) as X
limit 3;            
 
-- Q-47. Write an SQL query to fetch three min salaries from a table.
select   distinct salary ,worker_id, first_name, x.low_sal
from (
			select * ,
			DENSE_RANK() over(ORDER BY salary ) as low_sal
			from worker) as x
limit 3;            

-- Q-48. Write an SQL query to fetch nth max salaries from a table.(5th lowest salary)
select * 
from (
			select *,
			dense_rank() over(order by salary desc) sal
			from worker) as x
where x.sal = 5;            



-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select  department, sum(salary) as total_sal
 from worker 
 group by department 
 order by sum(salary);
-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
select distinct salary, first_name
from (
			select *,
			dense_rank() over(order by salary desc) sal
			from worker) as x
where x.sal = 1;            






