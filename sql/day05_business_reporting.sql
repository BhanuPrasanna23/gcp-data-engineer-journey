/*
Day 5 - Business Reporting

Goal:
Translate business questions into SQL using aggregation.
*/
The finance team asks:

"For each city, show the total order value."

select
	city,
	sum(order_amount) as total_city
from orders
group by city;

-- Requirement 2:
-- Finance wants to know the average order value for each city.

select
	city,
	avg(order_amount) as avg_order_value
from orders
group by city;

-- Requirement 3:
-- Finance wants to see only cities where the total order value
-- is greater than 100000.

select 
	city,
	sum(order_amount) as total_order_value
from orders	
group by city
having sum(order_amount) > 100000;

-- Requirement 4:
-- The business wants a report showing each city,
-- total order value,
-- average order value,
-- and number of orders.
--
-- Only include cities with at least 5 orders
-- and a total order value greater than 100000.
--
-- Show the cities with the highest total order value first.

select
	sum(order_amount) as total_order_value,
	avg(order_amount) as avg_order_value,
	count(order_id) as num_orders
from orders
group by city
having count(order_id) > 5 and
sum(order_amount) >100000
order by sum(order_amount) desc;