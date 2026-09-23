/*
Day 6 - SQL JOINs

Goal:
Combine information from multiple business tables.
*/
Requirement 1 — Customer Orders

The operations team wants a report showing:

customer name + order ID + order amount

for every order.

select 
	c.customer_name,
	o.order_id,
	o.order_amount
from orders as o
left join customers as c
where o.customer_id = c.customer_id;

-- Requirement 2:
-- The business wants every customer listed,
-- including customers who have not placed any orders.
-- If they have orders, show the order information.

select
	c.*,
	o.* 
from customers as c
left join orders as o
on c.customer_id = o.customer_id;

-- Requirement 3:
-- The finance team wants to identify customers
-- who have placed at least one order.
--
-- Return:
-- customer_name
-- total number of orders
-- total order value

select
	c.customer_name,
	c.customer_id,
	count(o.order_id),
	sum(o.order_amount)
from orders as o
left join customers as c
on o.customer_id = c.customer_id
group by o.customer_id,c.customer_name;

-- Requirement 4:
-- Management wants a customer-level report showing:
-- customer name
-- city
-- total number of orders
-- total order value
--
-- Include ALL customers, even those with no orders.
-- Customers with no orders should still appear.
-- Show the highest total order value first.

select
	c.*,
	count(o.order_id) as total_orders,
	sum(o.order_amount) as total_order_value
from customers c
left join order o
on c.customer_id = o.customer_id
group by c.customer_id,c.customer_name,c.city
order by sum(o.order_amount) desc;