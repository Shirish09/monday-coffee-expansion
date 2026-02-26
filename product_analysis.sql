USE monday_coffee;

-- =====================================================
-- PRODUCT PERFORMANCE ANALYSIS
-- Purpose: Identify high-demand products and
-- understand product preferences by city
-- =====================================================


-- -----------------------------------------------------
-- 1. Total Units Sold Per Product
-- -----------------------------------------------------

SELECT 
    p.product_name,
    COUNT(s.sale_id) AS total_units_sold
FROM sales s
JOIN products p 
    ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC;



-- -----------------------------------------------------
-- 2. Total Revenue Per Product
-- -----------------------------------------------------

SELECT 
    p.product_name,
    SUM(s.total) AS total_revenue
FROM sales s
JOIN products p 
    ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;



-- -----------------------------------------------------
-- 3. Top 3 Products Per City (Based on Units Sold)
-- -----------------------------------------------------

WITH product_city_sales AS (
    SELECT 
        ci.city_name,
        p.product_name,
        COUNT(s.sale_id) AS units_sold,
        RANK() OVER (
            PARTITION BY ci.city_name 
            ORDER BY COUNT(s.sale_id) DESC
        ) AS product_rank
    FROM sales s
    JOIN customers c 
        ON s.customer_id = c.customer_id
    JOIN city ci 
        ON c.city_id = ci.city_id
    JOIN products p 
        ON s.product_id = p.product_id
    GROUP BY ci.city_name, p.product_name
)

SELECT 
    city_name,
    product_name,
    units_sold,
    product_rank
FROM product_city_sales
WHERE product_rank <= 3
ORDER BY city_name, product_rank;