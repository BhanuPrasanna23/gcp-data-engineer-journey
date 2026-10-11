/*
Day 7 - SQL Subqueries

Topics:
- Scalar subqueries
- Subqueries in WHERE
- Aggregate subqueries
- IN / EXISTS

Goal:
Use subqueries to solve multi-step business requirements.
*/

Requirement 1

Management wants to identify customers whose total order value is greater than the average order value across all individual orders.

select
	c.customer_id,
	sum(o.order_amount) as total_order
from customers c
inner join orders o
on c.customer_id = o.customer_id
group by c.customer_id,c.customer_name
having sum(o.order_amount) > (select avg(o.order_amount) as avg_order_value
from orders o );

Requirement 2

A business manager wants to find customers who have placed at least one order whose value is greater than 1000.

Return:

customer_name
city

Each customer should appear only once, even if they have multiple orders above 1000.

Sort the customers alphabetically by name.

select
	customer_name,
	city
	
from (
select
	distinct c.customer_id,
	c.customer_name,
	c.city
from customers c
inner join orders o
on c.customer_id = o.customer_id
where o.order_amount > 1000 ) as t
order by customer_name;

Subqueries: Requirement 3

Management wants to identify customers whose total order value is greater than Rahul's total order value.

Return:

customer_name
total_order_value

Include only customers who have placed at least one order.

Sort by total_order_value descending.

select
	c.customer_name,
	t.total_order_value
from customers c
inner join 
(select
	customer_id,
	sum(order_amount) as total_order_value
from orders o
group by customer_id) as t
on c.customer_id = t.customer_id
where t.total_order_value > (select 
	sum(o.order_amount)
	from orders o inner join customers c on c.customer_id = o.customer_id where c.customer_name = 'Rahul')
order by t.total_order_value desc;

The business wants to find customers who have never placed an order.

Return:

customer_name
city

Each customer should appear only once.

Constraint: For this question, use a subquery. Do not use a JOIN.

select
	customer_name,
	city
from customers c
where customer_id not in ( select 
	distinct customer_id
	from orders);

Subqueries: Requirement 5

The business wants to identify customers whose total order value is higher than the average total order value of customers who have placed orders.

Return:

customer_name
total_order_value

Sort from highest to lowest.

Constraint: Use a subquery. No CTE.

select
	c.customer_name,
	t.total_order_value
from (select
	customer_id,
	sum(order_amount) as total_order_value
from orders
group by customer_id) as t
inner join customers c
on t.customer_id = c.customer_id
where t.total_order_value > (select 
	avg(total_order_value) as avg_total_value
from (select
	customer_id,
	sum(order_amount) as total_order_value
from orders
group by customer_id) as t)
order bu total_order_value desc;

Subqueries: Requirement 6

A business analyst wants to find cities that have at least one customer whose total order value is greater than 1,000.

Return:

city
customer_name
total_order_value

If a city has multiple qualifying customers, show all of them.

Sort by city, then by total_order_value descending.

select 
	c.city,
	c.customer_name,
	t.total_order_value
from (select 
	customer_id,
	sum(order_amount) as total_order_value
from orders
group by customer_id
having sum(order_amount) > 1000 ) as t
left join customers c
on t.customer_id = c.customer_id
order by c.city,t.total_order_value desc;

Subqueries: Requirement 7

Management wants a list of customers who have placed at least one order.

Return:

customer_name
city

Each customer must appear only once.

Constraint: Use a subquery with EXISTS. Do not use JOIN, IN, or DISTINCT.

select
	c.customer_name,
	c.city
from customers c
where exists ( select 
	o.customer_id
from orders o 
where c.customer_id = o.customer_id);

Requirement 8

One last subquery pattern for today.

The business wants to find customers who have placed an order, but none of their orders are greater than 1,000.

Return:

customer_name
city

Each customer should appear once.

Constraint: Use EXISTS / NOT EXISTS. Do not use JOIN, IN, or DISTINCT.

select
	c.customer_name,
	c.city
from customer c
where not exists (select customer_id
from orders o
where c.customer_id = o.customer_id and o.order_amount > 1000 )
and
exists (select 1
from orders o
where c.customer_id = o.customer_id);
