USE monday_coffee;

-- =====================================================
-- DATA VALIDATION & INTEGRITY CHECKS
-- Purpose: Ensure imported data is complete, clean,
-- and relationally consistent before analysis.
-- =====================================================


-- -----------------------------------------------------
-- 1. Row Count Verification
-- -----------------------------------------------------

-- 1.1 Total Records Per Table
SELECT COUNT(*) AS total_cities FROM city;
SELECT COUNT(*) AS total_customers FROM customers;
SELECT COUNT(*) AS total_products FROM products;
SELECT COUNT(*) AS total_sales FROM sales;



-- -----------------------------------------------------
-- 2. Null Value Checks
-- -----------------------------------------------------

-- 2.1 Check for Missing Dates
SELECT *
FROM sales
WHERE sale_date IS NULL;

-- 2.2 Check for Missing Customer References
SELECT *
FROM sales
WHERE customer_id IS NULL;

-- 2.3 Check for Missing Product References
SELECT *
FROM sales
WHERE product_id IS NULL;

-- 2.4 Check for Missing Revenue Values
SELECT *
FROM sales
WHERE total IS NULL;



-- -----------------------------------------------------
-- 3. Sample Date Format Verification
-- -----------------------------------------------------

-- 3.1 Inspect First 5 Sale Dates
SELECT sale_date
FROM sales
LIMIT 5;



-- -----------------------------------------------------
-- 4. Foreign Key Integrity Checks
-- -----------------------------------------------------

-- 4.1 Sales Without Matching Customers
SELECT *
FROM sales s
LEFT JOIN customers c
    ON s.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


-- 4.2 Sales Without Matching Products
SELECT *
FROM sales s
LEFT JOIN products p
    ON s.product_id = p.product_id
WHERE p.product_id IS NULL;
