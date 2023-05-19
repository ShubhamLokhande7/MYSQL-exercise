CREATE TABLE sales_data1 (
  product VARCHAR(50),
  category VARCHAR(50),
  sales DECIMAL(10,2)
);
SELECT * from sales_data1;

INSERT INTO sales_data1 (product, category, sales)
VALUES
  ('Product A', 'Category 1', 1000.00),
  ('Product B', 'Category 1', 1500.00),
  ('Product C', 'Category 1', 2000.00),
  ('Product D', 'Category 2', 500.00),
  ('Product E', 'Category 2', 750.00),
  ('Product F', 'Category 2', 1000.00);
  
  COMMIT;
  
  -- calculates the total sales for each product, and the percentage of each product's sales within its category:
  select *,
  sum(sales) as sales , sum(sales)/sum(sum(sales)) over(partition by category ) as sales_pct
  from sales_data1
  group by  product;
  
  select * from sales_data1;
  
  select *,
  sum(sales) over(partition by category order by sales) as running_sales
  from sales_data1
  having running_sales > 500;
  
  select *
  from (  
				  select *,
				  sum(sales) over(partition by category order by sales) as running_sales
				  from sales_data1) x
having x.running_sales > 1000;      

-- query calculates the difference between the current sales and the previous sales for each product category:
select * ,
lag(sales,1) over(partition by category order by sales) as lag_wf,
lead(sales,1) over(partition by category order by sales) as lead_wf
from sales_data1;












         
  
  
  
  
  
  
  
  
  