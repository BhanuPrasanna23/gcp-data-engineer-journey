**Aug-04-2026**
**SELECT **
used to select the columns of table.
we use select * ----> for selecting all the rows of the table ( not preferred in general bcoz for this query system has to read all the rows which can be slow and cause load on system.
its prefered not to use this unless the entire table data is required.
----------------
**WHERE**
we use this to filter out the data in specific column, like
age >18 
city = "hyderabad"
we can use all operators in where clause
comparision operators---> =<>!=>=<=
logical -----> AND OR NOT
range ----> between val1 AND val2 [both values are included in between]
membership ------> In , not in
search --------> like [M%[0,1,many],%M,%M%,_r[only 1char ],r_,_r_]
------------------
**ORDER BY** DESC, ASC[default]
will order the result from select statement either ascending or descending based on columns in select statement, we use multiple columns with orderby 
Ex: ORDER BY age desc, city ASC;
------------------
**LIMIT**
will be the last clause to executed in the query, will limit the result to a specific number of rows
example:
SELECT
	customer_name 
FROM customers
ORDER BY age
LIMIT 3;
this will limit to youngest 3 customers
------------------
