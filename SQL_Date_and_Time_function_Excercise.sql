SHOW DATABASES;
use org;

select * From worker;

SELECT now(); -- NOW() is used to return the current system date and time value.

SELECT curdate(); -- CURDATE() is used to return the current system date.

select current_time(); 
SELECT curtime(); -- CURTIME() is used to return the current system time.

SELECT first_name, last_name, date(joining_date) joining_date from worker; -- Extracts only the date part from the column having the DateTime value.

SELECT extract(day from joining_date) from worker; -- EXTRACT() function is used to retrieve a particular part of the date/time value.
SELECT extract(month from joining_date) from worker;
SELECT extract(year from joining_date) from worker;
SELECT extract(week from joining_date) from worker;

SELECT first_name, last_name, date(joining_date) FROM worker;

SELECT first_name, last_name, day(joining_date) as day FROM worker;

SELECT first_name, last_name, month(joining_date) as Month  FROM worker;

SELECT first_name, last_name, year(joining_date) as year FROM worker;

SELECT first_name, last_name, week(joining_date) FROM worker;

SELECT first_name, last_name, weekday(joining_date) FROM worker;

SELECT first_name, last_name, weekofyear(joining_date) FROM worker;

