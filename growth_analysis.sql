USE monday_coffee;

-- =====================================================
-- GROWTH & SEASONALITY ANALYSIS
-- Purpose: Analyze revenue momentum and trends over time
-- =====================================================


-- -----------------------------------------------------
-- 1. Revenue in Last Quarter of 2023 (Q4)
-- -----------------------------------------------------

SELECT 
    SUM(total) AS revenue_last_quarter_2023
FROM sales
WHERE sale_date BETWEEN '2023-10-01' AND '2023-12-31';



-- -----------------------------------------------------
-- 2. Monthly Revenue Trend
-- -----------------------------------------------------

SELECT 
    DATE_FORMAT(sale_date, '%Y-%m') AS month,
    SUM(total) AS monthly_revenue
FROM sales
GROUP BY month
ORDER BY month;



-- -----------------------------------------------------
-- 3. Month-over-Month Growth Percentage
-- -----------------------------------------------------

WITH monthly_sales AS (
    SELECT 
        DATE_FORMAT(sale_date, '%Y-%m') AS month,
        SUM(total) AS revenue
    FROM sales
    GROUP BY month
)

SELECT 
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS previous_month,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY month)) 
        / LAG(revenue) OVER (ORDER BY month) * 100,
    2) AS growth_percent
FROM monthly_sales;