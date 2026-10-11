Day 8 — CTEs: Requirement 1

Management wants a report showing customers whose total order value is greater than 1,000.

Return:

customer_name
city
total_order_value

Sort highest total first.

Constraint: Use a CTE.

with customer_order_value as
	( select
		c.customer_name,
		c.city,
		sum(o.order_amount) as total_order_value
from customers c
inner join orders o
on c.customer_id = o.customer_id
group by c.customer_id,c.customer_name,c.city)

select *
from customer_order_value
where total_order_value > 1000
order by total_order_value desc;

Requirement 2

Find the average total order value per city, then return cities whose average is greater than 500.

Return:

city
avg_order_value

Sort highest average first.

Use a CTE.

with Custavg_order_value as
	( select
		customer_id,
		sum(order_amount) as total_order_value
from orders 
group by customer_id)

select
	c.city,
	avg(t.total_order_value) as avg_total_order_value
from customers c
inner join Custavg_order_value t
on c.customer_id = t.customer_id
group by c.city
having avg(t.total_order_value) > 500
order by avg(t.total_order_value) desc;

Requirement 3

Management wants each city's highest-value customer.

Return:

city
customer_name
total_order_value

If two customers in the same city have the same highest total, return both.

with high_value_cust as
( select
	c.city,
	c.customer_id,
	c.customer_name,
	sum(o.order_amount) as total_order_value
from customers c
inner join orders o
on c.customer_id = o.customer_id
group by c.customer_id,c.customer_name,c.city) ,

max_value_city as(
select 
	city,
	max(total_order_value) as max_total_value
from high_value_cust
group by city )

select 
	* 
from high_value_cust c
inner join max_value_city mc
on c.city = mc.city
and c.total_order_value = mc.max_total_value;

Requirement 4
Find customers whose total order value is greater than every other customer's total order value in their city.
Return:
- city
- customer_name
- total_order_value
If there is a tie for highest value, return all tied customers.
Use CTEs, no window functions.

with customer_totals as ( select
	customer_id,
	sum(order_amount) as total_order_value
from orders
group by customer_id),

city_totals  as (select
	c.city,
	max(t.total_order_value) as max_city_total
from customers c
inner join customer_totals t
on c.customer_id = t.customer_id
group by c.city
)
select 
	c.city,
	t.*
from customer_totals t
inner join customers c
on c.customer_id = t.customer_id
inner join city_totals as c1
on c.city = c1.city
and t.total_order_value >= c1.max_city_total;

Requirement 5
Management wants to find customers whose total order value is greater than the average total order value of customers in the same city.
Return:
- city
- customer_name
- total_order_value
Include only customers who have placed orders. Sort by city, then total order value descending.
Use CTEs, no window functions.

with customer_totals as ( select
	customer_id,
	sum(order_amount) as total_ordervalue
from orders 
group by customer_id),

city_avg as (select
	c.city,
	avg(cust.total_ordervalue) as city_avg_total
from customers c
inner join customer_totals as cust
on c.customer_id = cust.customer_id
group by c.city)

select c.city,
	c.customer_name,
	cust.total_ordervalue
from customers c
inner join customer_totals cust
on c.customer_id = cust.customer_id
inner join city_avg cavg
on c.city = cavg.city
and cust.total_ordervalue > cavg.city_avg_total ;

Requirement 6
Management wants a report showing each city's customers whose total order value is below the average total order value across all customers who placed orders.
Return:
- city
- customer_name
- total_order_value
Sort by total order value ascending.

with customer_totals as ( select
	customer_id,
	sum(order_amount) as total_order
from orders 
group by customer_id)


select 
	c.city,
	c.customer_name,
	cust.total_order
from customers c
inner join customer_totals cust
on c.customer_id = cust.customer_id
and cust.total_order < (select
	avg(total_order) as avg_city_total
from customer_totals
)
order by cust.total_order;

Requirement 7
Find customers who live in the same city as Rahul and have placed at least one order. Assume Rahul means customer_id = 1.
Return:
- customer_id
- customer_name
- city
Use a CTE and a subquery. No window functions.

with custs as (select
	*
from customers c
inner join orders o
on c.customer_id = o.customer_id
where c.city = (select city
from customers where customer_id =1))

select 	
	distinct customer_id,
	city,
	customer_name
from custs;

Business requirement: Find customers whose total order value is greater than the total order value of every customer in Chennai.
Return:
- customer_name
- city
- total_order_value
Include only customers who have placed orders. Sort by total_order_value descending.

with cust_totals as (select
	customer_id,
	sum(order_amount) as cust_total_value
from orders
group by customer_id),

max_total_chennai as( select
	c.city,
	max(cust.cust_total_value) as max_chennai_value
from customers c
inner join cust_totals cust
on c.customer_id = cust.customer_id
group by c.city
having c.city = "Chennai")

select
	c.customer_name,
	c.city,
	cust.cust_total_value as total_order_value
from customers c
inner join cust_totals cust
on c.customer_id = cust.customer_id
where cust.cust_total_value > ( select max_chennai_value from max_total_chennai )
order by cust.cust_total_value desc;
