# SQL-Series-02-String-Functions-and-Data-Cleaning
PostgreSQL practice project covering string functions, data cleaning, and multi-table JOINs using a synthetic banking database.

# SQL Portfolio Series: Banking Analytics
**Author:** Rene Morataya  
**Database:** PostgreSQL (pgAdmin)  
**Series:** SQL Series 02: String Functions and Data Cleaning

---

## Overview

This project is part of an ongoing SQL learning series built while working through a structured SQL course focused on real-world data analytics skills. This entry tackles string functions and data cleaning using a synthetic banking database that I helped design and expand.

Honestly? This one was challenging and a lot of fun. Cleaning messy, real-looking data and turning it into meaningful business answers is exactly the kind of work I am building toward.

Every query was written manually from scratch. AI was used only to help generate the synthetic banking schema, which I then expanded with additional tables and intentionally dirty data to push my skills further.

---

## Database Schema

The banking database has 6 connected tables working together:

- **customers:** customer profiles and contact info
- **accounts:** checking and savings accounts linked to customers
- **transactions:** deposits, withdrawals, fees, transfers, and interest
- **loans:** personal, auto, and student loans with status tracking
- **branches:** physical bank branch locations and regions
- **employees_hr:** bank staff linked to branches with salary and hire date

The data was intentionally dirtied with inconsistent casing, extra spaces, and mixed formatting to simulate the kind of messy data you actually encounter in the real world.

---

## Concepts/Learned Applied

**String Functions**
- `INITCAP`: capitalize the first letter of each word
- `TRIM`: remove leading and trailing spaces
- `REPLACE`: substitute characters within a string
- `CONCAT`: combine multiple columns into one
- `UPPER` / `LOWER`: standardize text casing
- `LENGTH`: measure character count
- `SUBSTRING`: extract a portion of a string from any position
- `LEFT` / `RIGHT`: extract characters from either end of a string

**Aggregations**
- `SUM`: total values across grouped rows
- `COUNT`: count rows within a group
- `AVG`: average values across grouped rows

**Filtering**
- `WHERE`: filter rows before aggregation
- `HAVING`: filter groups after aggregation

**Joins**
- `INNER JOIN`: return only matching rows across tables
- `LEFT JOIN`: return all rows from the left table with matches from the right

**Other**
- `GROUP BY`: group rows for aggregation
- `ORDER BY`: sort results ascending or descending
- `AS`: alias columns and tables for readability

---

## Business Questions Answered

### Query 1: Branch Account Distribution
**Question:** Which bank branches are managing the most accounts?  
**Concepts:** INNER JOIN, COUNT, GROUP BY, INITCAP, TRIM, REPLACE, ORDER BY

### Query 2: Branch Deposit Analysis
**Question:** Which bank branches hold more than $1,000 in total starting deposits?  
**Concepts:** LEFT JOIN, SUM, GROUP BY, HAVING, INITCAP, TRIM, REPLACE, UPPER

### Query 3: Customer Transaction Report (Challenge)
**Question:** Which active customers have the highest total transaction volume across their accounts?  
**Concepts:** 4-table LEFT JOIN chain, WHERE, GROUP BY, HAVING, SUM, COUNT, CONCAT, INITCAP, TRIM, REPLACE

---

## Notes

- `ROUND` was covered in this section but not yet applied in a query. It will show up in a future entry once I have a strong example to pair it with.
- `LEFT` and `RIGHT` were studied and understood, but `REPLACE` was the better fit here since it handles substitutions dynamically without needing to hardcode character positions.
- Some branch names like `Downtown  Branch` still show a double space in the output. This is a known limitation of `REPLACE` when you do not know how many spaces are hiding inside a value. `REGEXP_REPLACE` is on the roadmap and will handle this more cleanly in a future entry.

---

## Series Index

| Entry | Topic |
|-------|-------|
| SQL Series 01 | JOINs and Aggregations |
| SQL Series 02 | String Functions and Data Cleaning (this entry) |
| SQL Series 03 | Coming soon |
