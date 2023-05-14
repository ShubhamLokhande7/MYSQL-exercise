use ProductDB;
select * from product;

--  FIRST_VALUE
-- LAST_VALUE
-- Frame Clause
--  NTH_VALUE
--  NTILE
-- CUME_DIST
-- PERCENT_RANK


-- first_value
select *,
first_value (product_name) over(partition by product_category order by price desc) as most_exp_product
from product;
-- last_value()
select *,
LAST_VALUE(product_name) over(PARTITION BY product_category order by price desc) as least_exp_product
from product;

select * from product group by product_category ORDER BY price desc;
select * from product ORDER BY price desc group by product_category;

-- Nth_value()
select *,
NTH_VALUE(product_name,2) over(partition by product_category order by price desc) as second_exp_product
from product;

select * from product;

-- ntile()
select *,
NTILE(3) over(order by price desc) as price_bucket
from product
where product_category = "Phone";


select product_category, brand,
case when X.bucket = 1 then "Expensive"
		when X.bucket = 2 then "Mid-Range"
        when X.bucket = 3 then "Inexpensive" end price_Range
from (
select *,
NTILE(3) over(order by price desc) as bucket
from product
where product_category ="Phone") x;

-- cume_dist()
SELECT * 
FROM(
select *,
round(CUME_DIST() over(ORDER BY price DESC)*100,2) as cum_sum 
from product) x
where x.cum_sum < 30;

-- percent_rank()
select *,
round(PERCENT_RANK() over(ORDER BY price )*100,2) as rk
from product;































