# 05 aug 2026

Topics for today

DISTINCT
Comparison Operators (=, !=, >, <, >=, <=)
AND
OR
NOT
IN
BETWEEN
LIKE

## DISTINCT
Removes duplicate values from the result set.

**Syntax**
```sql
SELECT DISTINCT column_name
FROM table_name;
```

**Example**
```sql
SELECT DISTINCT city
FROM customers;
```

Returns each city only once.

---

## Comparison Operators

Used to compare values in a condition.

| Operator | Description |
|----------|-------------|
| = | Equal to |
| != or <> | Not equal to |
| > | Greater than |
| < | Less than |
| >= | Greater than or equal to |
| <= | Less than or equal to |

**Example**
```sql
SELECT *
FROM customers
WHERE age >= 25;
```

---

## AND

Returns rows only when **all** conditions are true.

**Example**
```sql
SELECT *
FROM customers
WHERE city = 'Hyderabad'
AND age > 25;
```

---

## OR

Returns rows when **at least one** condition is true.

**Example**
```sql
SELECT *
FROM customers
WHERE city = 'Hyderabad'
OR city = 'Bangalore';
```

---

## NOT

Reverses a condition.

**Example**
```sql
SELECT *
FROM customers
WHERE NOT city = 'Delhi';
```

Returns customers who are **not** from Delhi.

---

## IN

Checks if a value exists in a given list.

**Syntax**
```sql
SELECT *
FROM table_name
WHERE column_name IN (value1, value2);
```

**Example**
```sql
SELECT *
FROM customers
WHERE city IN ('Hyderabad', 'Chennai', 'Pune');
```

Equivalent to multiple `OR` conditions.

---

## BETWEEN

Selects values within a specified range (inclusive).

**Example**
```sql
SELECT *
FROM customers
WHERE age BETWEEN 20 AND 30;
```

Returns customers whose age is between **20 and 30**, including both values.

---

## LIKE

Used for pattern matching.

| Wildcard | Meaning |
|----------|---------|
| % | Zero or more characters |
| _ | Exactly one character |

**Examples**

Starts with 'A'
```sql
SELECT *
FROM customers
WHERE name LIKE 'A%';
```

Ends with 'n'
```sql
SELECT *
FROM customers
WHERE name LIKE '%n';
```

Contains 'mit'
```sql
SELECT *
FROM customers
WHERE name LIKE '%mit%';
```

Second character is 'a'
```sql
SELECT *
FROM customers
WHERE name LIKE '_a%';
```

---

## Summary

- **DISTINCT** → Removes duplicate values.
- **Comparison Operators** → Compare values.
- **AND** → All conditions must be true.
- **OR** → At least one condition must be true.
- **NOT** → Negates a condition.
- **IN** → Matches values from a list.
- **BETWEEN** → Selects values within a range (inclusive).
- **LIKE** → Searches using patterns (`%` and `_`).
