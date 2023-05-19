CREATE TABLE sales_data (
  product VARCHAR(50),
  date DATE,
  sales DECIMAL(10,2)
);
select * from sales_data;

INSERT INTO sales_data (product, date, sales)
VALUES
  ('Product A', '2022-01-01', 1000.00),
  ('Product A', '2022-01-02', 1500.00),
  ('Product A', '2022-01-03', 2000.00),
  ('Product B', '2022-01-01', 500.00),
  ('Product B', '2022-01-02', 750.00),
  ('Product B', '2022-01-03', 1000.00);
  
  COMMIT;
  
  SELECT *,
  sum(sales) over(PARTITION BY product ORDER BY date) as running_sum,
  round(avg(sales) over(PARTITION BY product ORDER BY date),2) as running_avg
  FROM sales_data;
  