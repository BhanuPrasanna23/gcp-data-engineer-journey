# Requirement 1:
We are planning regional customer events. Give me a list of all the cities in which we currently have customers. Each city should appear only once.

SELECT DISTINCT
    city
FROM customers;

# Requirement 2: We are launching a campaign for customers aged 24 through 30 who live in either Hyderabad or Chennai

SELECT 
    customer_name,
    city,
    age
FROM customers
where age between 24 and 30
AND city in ('Hyderabad','Chennai');

#Requirement 3: We need to contact customers whose names begin with either R or S.
SELECT
    customer_name
FROM customers
WHERE customer_name LIKE 'R%' 
   OR customer_name LIKE 'S%';

# Requirement 4 : The Bangalore branch is temporarily unavailable. Give us all customers who are not associated with Bangalore
select
    customer_name,
    city
from customers
where city != 'Bangalore';

# Requirement 5: Give me customers younger than 28, starting with the youngest customer. We only need the first three records.
select
    customer_name,
    age
from customers
where age < 28
order by age asc
limit 3;

# Requirement 6 : We are looking for customers whose names contain the letters 'an' somewhere in their name
select
    customer_name,
    city
from customers
where customer_name like '%an%';

# Requirement 7 : We want to identify customers for a new product. The customer must be from Hyderabad or Bangalore, must be younger than 30, and their name must contain the letter 'a'
select
    customer_name,
    city,
    age
from customers
where city in ('Hyderabad','Bangalore')
and age < 30 
and customer_name like '%a%';
