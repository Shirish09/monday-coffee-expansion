USE monday_coffee;

-- =====================================================
-- FINAL CITY RANKING MODEL (Business Logic Based)
--
-- Ranking Priority:
-- 1. Total Revenue (Primary Performance Indicator)
-- 2. Revenue-to-Rent Ratio (Operational Efficiency)
-- 3. Total Customers (Customer Strength)
-- 4. Market Potential (Long-Term Opportunity)
--
-- Purpose: Identify top expansion cities using
-- structured business prioritization.
-- =====================================================

WITH city_metrics AS (
    SELECT 
        ci.city_name,
        SUM(s.total) AS total_revenue,
        COUNT(DISTINCT s.customer_id) AS total_customers,
        ci.estimated_rent,
        ROUND(ci.population * 0.25) AS estimated_coffee_consumers,
        SUM(s.total) / ci.estimated_rent AS revenue_to_rent_ratio
    FROM sales s
    JOIN customers c ON s.customer_id = c.customer_id
    JOIN city ci ON c.city_id = ci.city_id
    GROUP BY ci.city_name, ci.estimated_rent, ci.population
)

SELECT 
    city_name,
    total_revenue,
    revenue_to_rent_ratio,
    total_customers,
    estimated_coffee_consumers
FROM city_metrics
ORDER BY 
    total_revenue DESC,
    revenue_to_rent_ratio DESC,
    total_customers DESC,
    estimated_coffee_consumers DESC;