                                      --PIZZA SALES SQL QUERIES--

CREATE TABLE pizza_sales (
    pizza_id           INT,
    order_id           INT,
    pizza_name_id      VARCHAR(50),
    quantity           SMALLINT,
    order_date         DATE,
    order_time         TIME,
    unit_price         FLOAT,
    total_price        FLOAT,
    pizza_size         VARCHAR(50),
    pizza_category     VARCHAR(50),
    pizza_ingredients  VARCHAR(200),
    pizza_name         VARCHAR(50)
);

-------------------------------------------------------------------------------------------------------------------------
--Q1. Total Revenue:

select sum(total_price)as total_revenue from pizza_sales;

--Q2. Average Order Value

select sum(total_price)/count(distinct order_id)as avg_order_value
from pizza_sales;

--Q3. Total Pizzas Sold

select sum(quantity)as total_pizza_sold from pizza_sales;

--Q4. Total Orders

select count(distinct order_id)as total_order from pizza_sales;

--Q5. Average number of Pizzas sold Per Order

SELECT round(round(SUM(quantity),2) /round(count(DISTINCT order_id),2),2)as Avg_Pizzas_per_order
FROM pizza_sales;

--Q6. Daily Trend for Total Orders

select to_char(order_date,'Day')as Daily_trend,count(distinct order_id)as total_order
from pizza_sales
group by to_char(order_date,'Day');

--Q7. Monthly Trend for Orders

select to_char(order_date,'Month')as Monthly_trend,count(distinct order_id)as total_order
from pizza_sales
group by to_char(order_date,'Month');

--Q8.% of Sales by Pizza Category

select pizza_category ,round(sum(total_price)::numeric/(
select sum(total_price) from pizza_sales)::numeric*100,2) as precentage
from pizza_sales
group by pizza_category;

--Q9.% of Sales by Pizza Size

select pizza_size ,round(sum(total_price)::numeric/(
select sum(total_price) from pizza_sales)::numeric*100,2) as precentage
from pizza_sales
group by pizza_size;

--Q10.Total Pizzas Sold by Pizza Category

select pizza_category,sum(quantity)as pizza_sold 
from pizza_sales
group by pizza_category;

--Q11.Top 5 Pizzas by Revenue

select pizza_name,round(sum(total_price)::numeric,2)as Revenue
from pizza_sales
group by pizza_name
order by sum(total_price) desc 
limit 5;

--Q12.Bottom 5 Pizzas by Revenue

select pizza_name,round(sum(total_price)::numeric,2)as Revenue
from pizza_sales
group by pizza_name
order by sum(total_price)asc 
limit 5;

--Q13.Top 5 Pizzas by Quantity

select pizza_name,sum(quantity)as Quantity
from pizza_sales
group by pizza_name
order by sum(quantity)desc
limit 5;

--Q14.Bottom 5 Pizzas by Quantity

select pizza_name,sum(quantity)as Quantity
from pizza_sales
group by pizza_name
order by sum(quantity)asc
limit 5;

--Q15.Top 5 Pizzas by Total Orders

select pizza_name,count(distinct order_id)as Quantity
from pizza_sales
group by pizza_name
order by count(distinct order_id)desc
limit 5;

--Q16.. Borrom 5 Pizzas by Total Orders

select pizza_name,count(distinct order_id)as Quantity
from pizza_sales
group by pizza_name
order by count(distinct order_id) asc
limit 5;
