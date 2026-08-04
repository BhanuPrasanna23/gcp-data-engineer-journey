/*
Day 1

Topics:
- SELECT
- WHERE
- ORDER BY
- LIMIT

Objective:
Practice basic filtering and sorting using a sample customers table.
*/

-- Create Table

CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    age INT
);

-- Insert Sample Data

INSERT INTO customers VALUES
(1,'Rahul','Hyderabad',28),
(2,'Priya','Chennai',25),
(3,'Bhanu','Vijayawada',27),
(4,'Kiran','Hyderabad',31),
(5,'Anjali','Bangalore',24),
(6,'Ravi','Chennai',29),
(7,'Sneha','Hyderabad',26);

-- Task 1: Display every column from the customers table.

SELECT *
FROM customers;

-- Task 2: Display only customer_name and city.

SELECT
    customer_name,
    city
FROM customers;

-- Task 3: Show customers only from Hyderabad.

SELECT
    customer_name
FROM customers
WHERE city = 'Hyderabad';

-- Task 4: Show customers older than 26.

SELECT
    customer_name,
    age
FROM customers
WHERE age > 26;

-- Task 5: Show customers from Chennai who are younger than 30.

SELECT
    customer_name,
    age,
    city
FROM customers
WHERE city = 'Chennai'
  AND age < 30;

-- Task 6: Display customers ordered by age from highest to lowest.

SELECT
    customer_name,
    age
FROM customers
ORDER BY age DESC;

-- Task 7: Display the youngest three customers.

SELECT
    customer_name,
    age
FROM customers
ORDER BY age
LIMIT 3;

-- Task 8: Your manager needs customer names from Hyderabad sorted alphabetically.

SELECT
    customer_name,
    city
FROM customers
WHERE city = 'Hyderabad'
ORDER BY customer_name;

/*
Things I Learned Today

1.git commit through bash 
2.how to use vs code and git to-gether
3.sql select,where,orderby,limit

Mistakes I Made

1. understand the question before start writing the query we should select everything that we use to write the query.


Interview Questions

1. Why should we avoid SELECT * in production?
2.
*/