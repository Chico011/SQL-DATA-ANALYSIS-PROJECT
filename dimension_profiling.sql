/*
===============================================================================
Dimensions Profiling
===============================================================================
Purpose:
    - Dig into the dimension tables to understand the unique values and 
      categories they contain.

SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/

-- Find all the distinct countries represented in the customer records
SELECT DISTINCT 
    country 
FROM gold.dim_customers
ORDER BY country;

-- Break down the product catalog by category, subcategory, and product name
SELECT DISTINCT 
    category, 
    subcategory, 
    product_name 
FROM gold.dim_products
ORDER BY category, subcategory, product_name;
