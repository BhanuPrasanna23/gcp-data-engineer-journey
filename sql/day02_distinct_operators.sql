/*
Day 2

Topics:
- Distinct
- Comparison Operators (=, !=, >, <, >=, <=)
- Logical Operators (AND, OR, NOT)
- Set Operators (IN, BETWEEN, LIKE)

Objective:
Practice basic filtering and sorting using a sample customers table.
*/
# Task 1: Display all unique cities.
select
distinct city
from customers;

# Task 2:Show customers whose age is between 25 and 30.
select
    customer_name,
    age
from customers
where age between 25 and 30;

# task 3: Show customers who belong to Hyderabad or Chennai.
select
    customer_name,
    city
from customers
where city = 'Hyderabad' or city = 'Chennai';

# Task 4 : rewrite the above query using IN operator.
select
    customer_name,
    city
from customers
where city in ('Hyderabad', 'Chennai');

# Task 5: Show customers who do not belong to Hyderabad.
select
    customer_name,
    city
from customers
where city not in ('Hyderabad');

# task 6: Show customers whose name starts with 'R'.
select
    customer_name
from customers
where customer_name like 'R%';

# Task 7: Show customers whose name ends with 'a'.
select
    customer_name
from customers
where customer_name like '%a';

# Task 8: Show customers whose name contains 'an'.
select
    customer_name
from customers
where customer_name like '%an%';

# Task 9: Show customers whose age is between 25 and 30 and belong to Hyderabad or Bangalore.
select
    customer_name,
    age,
    city
from customers
where age between 25 and 30 
and city in ('Hyderabad', 'Bangalore');
