SELECT COUNT(*) FROM city;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM sales;

SELECT * FROM sales WHERE sale_date IS NULL;
SELECT * FROM sales WHERE customer_id IS NULL;
SELECT * FROM sales WHERE product_id IS NULL;
SELECT * FROM sales WHERE total IS NULL;

SELECT sale_date FROM sales LIMIT 5;

SELECT *
FROM sales s
LEFT JOIN customers c
ON s.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT *
FROM sales s
LEFT JOIN products p
ON s.product_id = p.product_id
WHERE p.product_id IS NULL;

