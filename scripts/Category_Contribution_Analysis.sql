/*
===============================================================================
Category Contribution Analysis
===============================================================================
Objective:
    - Evaluate how each category contributes to overall sales performance.
    - Identify dominant categories and their relative impact.
    - Support decision-making for resource allocation and strategy focus.

Techniques Used:
    - Aggregation (SUM)
    - Window functions (SUM() OVER())
    - Percentage calculations

Summary:
    This query breaks down total sales by category and calculates each
    category’s share of the overall revenue to highlight performance weight.
===============================================================================
*/

WITH category_sales AS (
    SELECT
        p.category,
        SUM(f.sales_amount) AS total_sales
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON p.product_key = f.product_key
    GROUP BY p.category
)
SELECT
    category,
    total_sales,
    SUM(total_sales) OVER () AS overall_sales,
    ROUND((CAST(total_sales AS FLOAT) / SUM(total_sales) OVER ()) * 100, 2) AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC;
