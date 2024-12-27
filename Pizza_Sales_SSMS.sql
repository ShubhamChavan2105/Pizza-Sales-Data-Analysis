
/*total_revenue*/
select sum(total_price) as Total_Revenue from Pizza_sales;

/*Avg order value*/
select sum(total_price)/count(distinct order_id) as Avg_order_value from Pizza_Sales;

/*Total Pizzas sold*/
select sum(quantity) as total_pizzas_sold from Pizza_Sales;

/*total_orders*/
select count(distinct order_id) as total_orders from Pizza_Sales;

/*Avg_pizzas_per_order*/
select cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as avg_pizzas_per_order from Pizza_sales;  

/*Visualization*/
/*Daily Trends for total orders*/
select datename(dw, order_date) as order_day, count(distinct order_id) as total_orders from Pizza_sales
group by datename(dw, order_date);

/*Monthly Trends for total orders*/
select DATENAME(MONTH, order_date) as month_name, count(distinct order_id) as total_orders
from Pizza_sales
group by datename(month, order_date)
order by total_orders desc;

/*percentage sales by pizza size*/
/*percentage sales of total order*/
select pizza_size, cast(sum(total_price)*100/ (select sum(total_price) from Pizza_sales) as decimal(10,2))  as Percentage_sales_pizza_size
from Pizza_sales
group by pizza_size
order by Percentage_sales_pizza_size  asc;


/*Total pizza sold by category*/
select pizza_category, count(quantity) as total_sold_by_category
from Pizza_sales
group by pizza_category;

/*Best Seller by revenue*/
select top 5 pizza_name, sum(total_price) as total_revenue from Pizza_sales
group by pizza_name
order by total_revenue desc;

/*Worst Seller by revenue*/
select top 5 pizza_name, sum(total_price) as total_revenue from Pizza_sales
group by pizza_name
order by total_revenue asc;

/*Best Seller by quantity*/
select top 5 pizza_name, sum(quantity) as total_quantity from Pizza_sales
group by pizza_name
order by total_revenue desc;

/*Worst Seller by quantity*/
select top 5 pizza_name, sum(quantity) as total_quantity from Pizza_sales
group by pizza_name
order by total_revenue asc;

/*Best Seller by order_id*/
select top 5 pizza_name, count(distinct order_id) as total_orders from Pizza_sales
group by pizza_name
order by total_revenue desc;

/*Worst Seller by order_id*/
select top 5 pizza_name, count(distinct order_id) as total_orders from Pizza_sales
group by pizza_name
order by total_revenue asc;