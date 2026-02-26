# Monday Coffee Expansion Strategy  
## SQL-Based Market & Expansion Analysis

---

## Project Overview

**Monday Coffee** has been operating as an online coffee retailer since January 2023.  
With consistent growth and increasing customer engagement, the company is now considering opening physical coffee shop locations in India.

This project analyzes historical sales, customer, product, and city-level data using SQL to identify the top three cities for expansion based on:

- Financial performance
- Operational efficiency
- Customer engagement
- Market potential

The goal is to balance short-term profitability with long-term growth opportunities.

---

## Business Objectives

The analysis was designed to answer the following key business questions:

1. Which cities generate the highest revenue?
2. Where is operational efficiency strongest (Revenue-to-Rent ratio)?
3. Which cities show strong customer engagement?
4. How large is the untapped coffee-consuming population?
5. What products drive revenue in each city?
6. Is growth seasonal or sustained?

---

## Dataset Overview

The database contains:

- 14 Cities
- 497 Unique Customers
- 28 Products
- 10,388 Sales Transactions

### Tables Used:

- `city`
- `customers`
- `products`
- `sales`

---

## Key Business KPIs

- **Total Revenue:** ₹6,070,190  
- **Total Customers:** 497  
- **Average Revenue per Customer:** ₹12,214  
- **Q4 2023 Revenue Contribution:** ₹1.96M (~32% of total revenue)

Strong Q4 performance indicates seasonality and growing momentum toward year-end.

---

## Growth & Seasonality Analysis

- Revenue showed stable performance during early 2023.
- September and October 2023 experienced significant growth spikes (+169% and +59%).
- Post-Q4 correction occurred, but revenue baseline remained higher than early 2023.

This suggests structural growth rather than temporary spikes.

---

## City-Level Insights

### Pune – Strongest Immediate Expansion Candidate

- Highest total revenue  
- Highest revenue-to-rent ratio  
- Strong average revenue per customer  
- High demand for Cold Brew and Espresso products  

Pune demonstrates proven financial performance and operational efficiency, making it the lowest-risk expansion option.

---

### Delhi – Strategic Long-Term Growth Market

- Largest estimated coffee-consuming population (~7.75 million)  
- High customer base  
- Strong traditional coffee demand  

Delhi offers significant long-term market opportunity despite moderate efficiency.

---

### Jaipur – Cost-Efficient Emerging Market

- Strong customer engagement  
- Very low estimated rent  
- Healthy revenue-to-rent efficiency  

Jaipur represents a capital-efficient expansion opportunity.

---

## Product Performance Insights

### Top Revenue Drivers:

1. Cold Brew Coffee Pack  
2. Coffee Beans (500g)  
3. Coffee Gift Hamper  

### City-Level Demand Differences:

- Pune → Modern premium coffee focus  
- Delhi → Traditional home-brew products  
- Jaipur → Balanced mix  

Expansion strategy should tailor product focus by city.

---

## Final Recommendation

Based on structured business prioritization:

1. Pune – Immediate expansion city  
2. Delhi – High-potential strategic market  
3. Jaipur – Efficient and low-risk expansion  

This recommendation balances proven performance with scalable market opportunity.

---

## Technical Implementation

The analysis was performed using:

- MySQL
- Joins & Aggregations
- Window Functions (`RANK`, `LAG`)
- CTEs
- KPI Modeling
- Market Potential Estimation

SQL scripts are modularized into:

- `schema.sql`
- `data_validation.sql`
- `analysis.sql`
- `growth_analysis.sql`
- `product_analysis.sql`
- `final_scoring.sql`

---

## Conclusion

This project demonstrates an end-to-end analytical workflow:

Data Validation → KPI Extraction → Growth Analysis → Product Insights → Strategic Decision Modeling

The final expansion shortlist is supported by both quantitative metrics and structured business reasoning.