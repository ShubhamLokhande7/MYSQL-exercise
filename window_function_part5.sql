CREATE TABLE datas (
  id INT PRIMARY KEY,
  product VARCHAR(50),
  date DATE,
  sales DECIMAL(10, 2)
);

select * from datas;
INSERT INTO datas (id, product, date, sales) VALUES
  (1, 'Product A', '2022-01-01', 1000.00),
  (2, 'Product B', '2022-01-01', 2000.00),
  (3, 'Product C', '2022-01-01', 1500.00),
  (4, 'Product A', '2022-02-01', 1200.00),
  (5, 'Product B', '2022-02-01', 2500.00),
  (6, 'Product C', '2022-02-01', 1800.00),
  (7, 'Product A', '2022-03-01', 800.00),
  (8, 'Product B', '2022-03-01', 3000.00),
  (9, 'Product C', '2022-03-01', 2200.00),
  (10, 'Product A', '2022-04-01', 900.00),
  (11, 'Product B', '2022-04-01', 2700.00),
  (12, 'Product C', '2022-04-01', 1900.00),
  (13, 'Product A', '2022-05-01', 1500.00),
  (14, 'Product B', '2022-05-01', 1800.00),
  (15, 'Product C', '2022-05-01', 1200.00);
  
  commit;
 -- calculates the top 3 products by total sales for each month: 
 
 SELECT * from datas;
  
  
  -- query calculates the rank of the row with the highest sales for each product:
  
  SELECT *,
  ROW_NUMBER() over(PARTITION BY product ORDER BY sales desc) as rn
  from datas;

-- 2nd highest sales 
 
 select * 
 from (
				 SELECT *,
				  ROW_NUMBER() over(PARTITION BY product ORDER BY sales desc) as rn
				  from datas ) as x
  where x.rn = 2;                
                  
                  
-- calculates the cumulative sum of sales for each product:
select *,
sum(sales) over(partition by product order by sales ) as cum_sum
from datas;

select *,
sum(sales) over(partition by product order by sales   ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
 ) as cum_sum
from datas;
  
  
  -- first_value()
  select *,
  -- FIRST_VALUE(sales) over(PARTITION BY product ORDER BY sales desc) as fst_val,
  LAST_VALUE(sales) over (PARTITION BY product ORDER BY sales DESC) as lst_val
  from  datas;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  