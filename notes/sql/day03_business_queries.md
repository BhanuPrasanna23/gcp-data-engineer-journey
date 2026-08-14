# Day 3 - Business SQL Requirements

## Objective

Practice translating business requirements into SQL without being given the SQL concept or syntax.

"We are planning regional customer events. Give me a list of all the cities in which we currently have customers. Each city should appear only once."

Return:

city
** this is not much difficult its clear that I have to get DISTINCT cities but my query is what if there is some uncleaned data in table where the city field is present without a customer name. requirement is asking for cities which have customers that would be a city without customer.**

Business Request 2 — Marketing

"We are launching a campaign for customers aged 24 through 30 who live in either Hyderabad or Chennai."

Return:

customer_name
city
age
** age through 24 and 30 are 24 and 30 inclusive. I suppose it is.**

Business Request 3 — Customer Success

"We need to contact customers whose names begin with either R or S."

Return:
customer_name
** either R or s can I write customer_name like ('R%','S%').not sure so went the generic way**

Business Request 4 — Operations

"The Bangalore branch is temporarily unavailable. Give us all customers who are not associated with Bangalore."

Return:

customer_name
city
** which one works not in ('banglore') or != 'Bangalore'. Hopefully both but went with 2nd one**

Business Request 5 — Customer Analytics

"Give me customers younger than 28, starting with the youngest customer. We only need the first three records."

Return:
customer_name
age
** this is quite clear.**

Business Request 6 — Marketing

"We are looking for customers whose names contain the letters 'an' somewhere in their name."

Return:
customer_name
city
** clear enough**

🔥 Challenge — No Hints

This one is intentionally closer to an interview question.

The Product team says:

"We want to identify customers for a new product. The customer must be from Hyderabad or Bangalore, must be younger than 30, and their name must contain the letter 'a'."

**this is also clear**