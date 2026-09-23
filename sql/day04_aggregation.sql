/*
Day 4 - SQL Aggregation

Topics:
- COUNT
- AVG
- GROUP BY
- HAVING

Goal:
Translate business reporting requirements into SQL.
*/
-- Requirement 1:
-- Management wants to know how many customers we have in each city.

select 
	city,
	count(customer_name)
from customers
group by city;

-- Requirement 2:
-- The analytics team wants to know the average customer age in each city.

select 
	city,
	avg(age) as avg_age_percity
from customers
group by city;

-- Requirement 3:
-- Show only cities that have at least 2 customers.

select 
	city,
	count(customer_name) as count_city
from customers
group by city
having count_city > 1;

-- Requirement 4:
-- Management wants a report showing each city,
-- the number of customers, and the average age.
-- Only include cities where the average customer age
-- is greater than 26.

select 
	city,
	count(customer_name) as count_city,
	avg(age) as avg_age_city,
from customers
group by city 
having avg(age) > 26;