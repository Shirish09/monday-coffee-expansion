USE monday_coffee;

-- =====================================================
-- MONDAY COFFEE EXPANSION ANALYSIS
-- Phase 1: Core KPI & City-Level Performance Analysis
-- =====================================================


-- -----------------------------------------------------
-- 1. Overall Business KPIs
-- -----------------------------------------------------

-- 1.1 Total Revenue
SELECT 
    SUM(total) AS total_revenue
FROM sales;


-- 1.2 Total Unique Customers
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers
FROM sales;


-- 1.3 Average Revenue Per Customer
SELECT 
    ROUND(SUM(total) / COUNT(DISTINCT customer_id), 2) AS avg_revenue_per_customer
FROM sales;



-- -----------------------------------------------------
-- 2. City-Level Revenue Analysis
-- -----------------------------------------------------

-- 2.1 Total Revenue Per City
SELECT 
    ci.city_name,
    SUM(s.total) AS city_revenue
FROM sales s
JOIN customers c 
    ON s.customer_id = c.customer_id
JOIN city ci 
    ON c.city_id = ci.city_id
GROUP BY ci.city_name
ORDER BY city_revenue DESC;


-- 2.2 Average Revenue Per Customer (Per City)
SELECT 
    ci.city_name,
    ROUND(SUM(s.total) / COUNT(DISTINCT s.customer_id), 2) AS avg_revenue_per_customer
FROM sales s
JOIN customers c 
    ON s.customer_id = c.customer_id
JOIN city ci 
    ON c.city_id = ci.city_id
GROUP BY ci.city_name
ORDER BY avg_revenue_per_customer DESC;



-- -----------------------------------------------------
-- 3. Cost Efficiency Analysis
-- -----------------------------------------------------

-- 3.1 Revenue to Rent Ratio (Location Efficiency)
SELECT 
    ci.city_name,
    SUM(s.total) AS total_revenue,
    ci.estimated_rent,
    ROUND(SUM(s.total) / ci.estimated_rent, 2) AS revenue_to_rent_ratio
FROM sales s
JOIN customers c 
    ON s.customer_id = c.customer_id
JOIN city ci 
    ON c.city_id = ci.city_id
GROUP BY ci.city_name, ci.estimated_rent
ORDER BY revenue_to_rent_ratio DESC;



-- -----------------------------------------------------
-- 4. Market Potential Estimation
-- -----------------------------------------------------

-- 4.1 Estimated Coffee Consumers (25% of Population)
SELECT 
    city_name,
    population,
    ROUND(population * 0.25) AS estimated_coffee_consumers
FROM city
ORDER BY estimated_coffee_consumers DESC;



-- -----------------------------------------------------
-- 5. Consolidated City Performance Summary
-- -----------------------------------------------------

-- 5.1 Combined View: Revenue, Customers, Rent, Market Size
SELECT 
    ci.city_name,
    SUM(s.total) AS total_revenue,
    COUNT(DISTINCT s.customer_id) AS total_customers,
    ci.estimated_rent,
    ROUND(ci.population * 0.25) AS estimated_coffee_consumers
FROM sales s
JOIN customers c 
    ON s.customer_id = c.customer_id
JOIN city ci 
    ON c.city_id = ci.city_id
GROUP BY ci.city_name, ci.estimated_rent, ci.population
ORDER BY total_revenue DESC;