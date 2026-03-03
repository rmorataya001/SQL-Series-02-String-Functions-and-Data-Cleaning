-- ================================================
-- SQL Learning Series | Episode 02
-- Banking Branch & Customer Analysis
-- ================================================
-- Author  : Rene Morataya
-- Tool    : PostgreSQL / pgAdmin
-- Date    : March 2026
-- ------------------------------------------------
-- Description:
-- Part of an ongoing SQL learning series
-- documenting my progress toward a career
-- in data analytics. This episode focuses
-- on multi-table JOINs, aggregations, and
-- string cleaning functions applied to a
-- synthetic banking database.
-- ================================================

--Which bank branches are managing the most accounts?

SELECT 
  INITCAP(TRIM(REPLACE(b.branch_name, '  ', ' '))) AS cleaned_branch_name,
  COUNT(a.account_id) AS total_accounts
FROM branches AS b
INNER JOIN accounts AS a
  ON b.branch_id = a.branch_id
GROUP BY INITCAP(TRIM(REPLACE(b.branch_name, '  ', ' ')))
ORDER BY total_accounts DESC;

--Business Question:Which bank branches hold more than $1,000 in total starting deposits?
SELECT 
INITCAP(TRIM(REPLACE(branch_name,'  ',' '))) AS cleaned_branch_name,
UPPER(region) AS cleaned_region,
SUM(A.starting_balance) AS total_start_bal
FROM branches AS B
LEFT JOIN accounts AS A
ON B.branch_id = A.branch_id
GROUP BY INITCAP(TRIM(REPLACE(branch_name, '  ', ' '))), 
UPPER(region)
HAVING SUM(A.starting_balance) > 1000
ORDER BY total_start_bal DESC;

--Business Question:Which active customers have the highest total transaction volume across their accounts? 
SELECT 
CONCAT(TRIM(c.first_name),' ',TRIM(c.last_name)) AS cleaned_full_name,
INITCAP(TRIM(REPLACE(b.branch_name,'  ',' '))) AS cleaned_branch_name,
SUM(t.amount) AS sum_transaction,
COUNT(t.transaction_id) AS total_transaction
FROM customers AS c
LEFT JOIN accounts AS a
ON c.customer_id = a.customer_id
LEFT JOIN transactions AS t
ON a.account_id = t.account_id
LEFT JOIN branches AS b
ON a.branch_id = b.branch_id
WHERE a.status = 'active'
GROUP BY CONCAT(TRIM(c.first_name),' ',TRIM(c.last_name)),
INITCAP(TRIM(REPLACE(b.branch_name,'  ',' ')))
HAVING COUNT(t.transaction_id) > 1
ORDER BY sum_transaction DESC;
















