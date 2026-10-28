
Requirement 1
Let's start with a business requirement, not a complicated interview question.
Business scenario: The sales team wants to see every order alongside the total amount spent by that customer.

select
	order_id,
	customer_id,
	order_amount,
	sum(order_amount) over ( partition by customer_id) as total_order_value
from orders;

Day 09 — Requirement 2
Business scenario: The sales team wants to rank each customer's orders from highest amount to lowest.
Using orders, return:
- order_id
- customer_id
- order_amount
- order_rank

select 
	order_id,
	customer_id,
	order_amount,
	rank() over (partition by customer_id order by order_amount desc) as ranks
from orders;

Day 09 — Requirement 3
Business scenario: Management wants to identify each customer's second-highest order.
Using orders, return:
- customer_id
- order_id
- order_amount
- order_rank

with row_order as (select 
	customer_id,
	order_id,
	order_amount,
	row_number() over (partition by customer_id order by order_amount desc,order_id asc) as order_rank
from orders)

select * 
from row_order
where order_rank = 2;

Day 09 — Requirement 4
Business scenario: The sales team wants to compare each order with that customer's average order amount.
Using orders, return:
- customer_id
- order_id
- order_amount
- customer_avg_order

select
	customer_id,
	order_id,
	order_amount,
	avg(order_amount) over (partition by customer_id )
from orders;

Day 09 — Requirement 5
Business scenario: Management wants to see each order's amount alongside the customer's running total of orders, in chronological order.
Using orders, return:
- customer_id
- order_id
- order_amount
- running_total
select 
	customer_id,
	order_id,
	order_amount,
	sum(order_amount) over(partition by customer_id order by order_id asc )
from orders;

Day 09 — Requirement 6 (final window-function exercise)
Business scenario: Management wants to identify each customer's largest order while keeping ties.
Using orders, return:
- customer_id
- order_id
- order_amount
- order_rank

with ranks as (select
	customer_id,
	order_id,
	order_amount,
	dense_rank() over (partition by customer_id order by order_amount desc) as order_rank
from orders)

select *
from ranks
where order_rank =1 ;