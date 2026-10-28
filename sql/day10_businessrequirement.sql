Requirement 1: Customer order analysis

The business wants to identify customers whose total order value is higher than their own average individual order amount.

Using the orders table, return:
- customer_id
- order_id
- order_amount
- customer_total
- customer_avg_order
Rules:
- Use window functions.
- Keep every order row that meets the condition.
- Return only orders belonging to customers whose total order value exceeds their average individual order amount.
- Sort by customer_id, then order_amount descending.

with bussreq1 as (select 
	customer_id,
	order_id,
	order_amount,
	sum(order_amount) over (partition by customer_id) as customer_total,
	avg(order_amount) over (partition by customer_id) as customer_avg_order
from orders )

select * from bussreq1
where customer_total > customer_avg_order
order by customer_id asc,order_amount desc;

Day 10 — Requirement 2
Business scenario: The sales team wants to find each customer's second-highest distinct order amount, including all orders tied at that amount.

Using orders, return:
- customer_id
- order_id
- order_amount
- order_rank
Rules:
- Use DENSE_RANK().
- Rank orders separately for each customer, highest amount first.
- Return only rows with order_rank = 2.
- Use a CTE to filter the rank.

with bussreq2 as (select 
	customer_id,
	order_id,
	order_amount,
	dense_rank() over(partition by customer_id order by order_amount desc) as order_rank
from orders) 

select * from bussreq2
where order_rank =2;	

Day 10 — Requirement 3
Business scenario: Management wants to compare every order with the previous order placed by the same customer.

Using orders, return:
- customer_id
- order_id
- order_amount
- previous_order_amount
Rules:
- Use LAG().
- Partition by customer_id.
- Order by order_id ASC.
- Keep every order row, including the first order for each customer.

select 
	customer_id,
	order_id,
	order_amount,
	lag(order_amount) over (partition by customer_id order by order_id) as previous_order_amount
from orders
order by order_id asc;

Day 10 — Requirement 4: LEAD()
Business scenario: The sales team wants to see the next order amount for each customer to analyze changes between consecutive orders.

Return:
- customer_id
- order_id
- order_amount
- next_order_amount
Rules:
- Use LEAD().
- Partition by customer_id.
- Order by order_id ASC.
- Keep every order row, including the last order for each customer.

select
	customer_id,
	order_id,
	order_amount,
	lead(order_amount) over(partition by customer_id order by order_id) as next_order_amount
from orders
order by order_id;

Day 10 — Requirement 5: Compare consecutive orders
Business scenario: Management wants to identify orders where the amount increased compared with the customer's previous order.

Return:
- customer_id
- order_id
- order_amount
- previous_order_amount
Rules:
- Use LAG().
- Partition by customer_id.
- Order by order_id ASC.
- Return only rows where order_amount is greater than previous_order_amount.
- Use a CTE to calculate the previous amount before filtering.

with bussreq5 as (select
	customer_id,
	order_id,
	order_amount,
	lag(order_amount) over(partition by customer_id order_by order_id) as previous_order_amount
from orders)

select * from bussreq5
where previous_order_amount < order_amount
order by order_id;

Day 10 — Requirement 6 (final exercise)
Business scenario: Management wants to calculate the change in order amount between consecutive orders for each customer.

Return:
- customer_id
- order_id
- order_amount
- previous_order_amount
- amount_difference
Rules:
- Use LAG().
- Partition by customer_id.
- Order by order_id ASC.
- Calculate amount_difference as the current order amount minus the previous order amount.
- Keep every order row, including the first order for each customer.

with bussreq6 as (select
	customer_id,
	order_id,
	order_amount,
	lag(order_amount) over (partition by customer_id order by order_id) as previous_order_amount
from orders)

select *,
 order_amount-previous_order_amount as amount_difference
from bussreq6
order by order_id ;


