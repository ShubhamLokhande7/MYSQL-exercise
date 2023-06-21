Create Table Employees
(
       
       Name varchar(50),
       DateOfBirth DateTime
);

show tables;

Insert Into Employees Values ('Tom', '2018-11-19 10:36:46.520');
Insert Into Employees Values ('Sara', '2018-11-18 11:36:26.400');
Insert Into Employees Values ('Bob', '2017-12-22 10:40:10.300');
Insert Into Employees Values ('Alex', '2017-12-30 9:30:20.100');
Insert Into Employees Values ('Charlie', '2017-11-25 7:25:14.700');
Insert Into Employees Values ('David', '2017-10-09 8:26:14.800');
Insert Into Employees Values ('Elsa', '2017-10-09 9:40:18.900');
Insert Into Employees Values ('George', '2018-11-15 10:35:17.600');
Insert Into Employees Values ('Mike', '2018-11-16 9:14:17.600');
Insert Into Employees Values ('Nancy', '2018-11-17 11:16:18.600');
Insert Into Employees Values ('Shubham', '2023-06-20 11:16:18.600');
Insert Into Employees Values ('Shubham', '2023-06-20 11:16:18.600');
Insert Into Employees Values ('Sumant', '2023-06-14 11:16:18.600');
Insert Into Employees Values ('ABC', '2023-06-22 11:16:18.600');
Insert Into Employees Values ('ABC', '2023-06-21 11:16:18.600');
select * from employees;

DELETE from employees 
WHERE name = 'Sumant';

-- Write a SQL query to retrieve all people who are born on a given date (For example, 9th October 2017)

SELECT Name, DateOfBirth , date(DateOfBirth) as Datepart
FROM employees
WHERE date(DateOfBirth) = '2017-10-9';

SELECT Name, DateOfBirth, CAST(DateOfBirth AS DATE) AS DatePart
FROM     Employees
WHERE  CAST(DateOfBirth AS DATE) = '2017-10-09';


-- Write a SQL query to retrieve all people who are born between 2 given dates (For example, all people born between Nov 1, 2017 and Dec 31, 2017)
SELECT Name, DateOfBirth, date(DateOfBirth) as DatePart FROM employees
WHERE date(dateofbirth) BETWEEN '2017-11-01' AND '2017-12-31';

-- Write a SQL query to retrieve all people who are born on the same day and month excluding the year (For example, 9th October)
select name, dateofbirth, date(dateofbirth) as datepart
from employees
where day(dateofBirth) = '9' and month(dateofbirth)= "10";

-- Write a SQL query to get all people who are born in a given year (Example, all people born in the year 2017)
SELECT *
FROM employees
where year(dateofbirth) = 2017;

-- To get all people who are born yesterday
SELECT curdate();
SELECT curdate() as today_date;
SELECT date_add(curdate(), Interval -1 day);

SELECT name, dateofbirth, date(dateofbirth) as day
FROM employees
WHERE date(dateofbirth) = date_add(curdate(), Interval -1 day);

SELECT name, dateofbirth, date(dateofbirth) as DayPart
FROM employees
WHERE date(dateofbirth) = date_add(curdate(), Interval -7 day);


-- To get all people who will be born tomorrow, add 1 to the DAY part of the DATE as shown below.
SELECT *, date(dateofbirth) as date 
from employees
WHERE date(dateofbirth) = date_add(curdate(), interval +1 day);


-- To get all people who are born since yesterday (i.e all the people who are born yesterday and today)
SELECT *,date(dateofbirth) as date
from employees
where date(dateofbirth) BETWEEN 
date_add(curdate(), interval -1 day) AND
date_add(curdate(), interval +1 day);

-- To get all people who are born in the last 7 days (excluding today)
SELECT *, date(dateofbirth) as DatePart
FROM employees
where date(dateofbirth) BETWEEN
date_add(curdate(), interval -7 day) AND 
date_add(curdate(), interval -1 day );

-- To get all people who are born today
SELECT *, date(dateofbirth) as datepart 
FROM employees
WHERE date(dateofbirth) = curdate();





