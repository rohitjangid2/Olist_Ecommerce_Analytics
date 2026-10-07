-- ============================================================
-- OLIST E-COMMERCE SQL BUSINESS ANALYSIS
-- ============================================================


-- ============================================================
-- 1. OVERALL BUSINESS PERFORMANCE
-- ============================================================

-- 1. Total Orders
SELECT 
    COUNT(*) AS total_orders
FROM orders_processed;


-- 2. Total Revenue
SELECT 
    ROUND(SUM(order_total_value)::numeric, 2) AS total_revenue
FROM orders_processed;


-- 3. Average Order Value (AOV)
SELECT 
    ROUND(AVG(order_total_value)::numeric, 2) AS average_order_value
FROM orders_processed;


-- ============================================================
-- 2. ORDER & REVENUE ANALYSIS
-- ============================================================

-- 4. Orders by Status
SELECT 
    order_status,
    COUNT(*) AS order_count
FROM orders_processed
GROUP BY order_status
ORDER BY order_count DESC;


-- 5. Monthly Revenue
SELECT
    order_year,
    order_month,
    ROUND(SUM(order_total_value)::numeric, 2) AS monthly_revenue
FROM orders_processed
GROUP BY order_year, order_month
ORDER BY order_year, order_month;


-- 6. Orders and Revenue by Day of Week
SELECT
    order_day_of_week,
    COUNT(*) AS order_count,
    ROUND(SUM(order_total_value)::numeric, 2) AS total_revenue,
    ROUND(AVG(order_total_value)::numeric, 2) AS average_order_value
FROM orders_processed
GROUP BY order_day_of_week
ORDER BY order_count DESC;


-- ============================================================
-- 3. CUSTOMER ANALYSIS
-- ============================================================

-- 7. One-time vs Repeat Customers
SELECT
    CASE
        WHEN total_orders = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS customer_count
FROM customer_analysis
GROUP BY
    CASE
        WHEN total_orders = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END
ORDER BY customer_count DESC;


-- 8. Spending: One-time vs Repeat Customers
SELECT
    CASE
        WHEN total_orders = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS customer_count,
    ROUND(AVG(total_spent)::numeric, 2) AS average_spending,
    ROUND(SUM(total_spent)::numeric, 2) AS total_revenue
FROM customer_analysis
GROUP BY
    CASE
        WHEN total_orders = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END
ORDER BY average_spending DESC;


-- ============================================================
-- 4. CATEGORY & PRODUCT ANALYSIS
-- ============================================================

-- 9. Top 10 Categories by Revenue
SELECT
    product_category_name AS category,
    total_items_sold,
    ROUND(total_sales::numeric, 2) AS total_revenue,
    ROUND(average_product_price::numeric, 2) AS average_price
FROM category_analysis
ORDER BY total_sales DESC
LIMIT 10;


-- 10. Top 10 Sellers by Revenue
SELECT
    seller_id,
    total_items_sold,
    total_orders,
    ROUND(total_sales::numeric, 2) AS total_revenue,
    ROUND(average_order_value::numeric, 2) AS average_order_value
FROM seller_analysis
ORDER BY total_sales DESC
LIMIT 10;


-- ============================================================
-- 5. DELIVERY & REVIEW ANALYSIS
-- ============================================================

-- 11. Delivery Status Distribution
SELECT
    delivery_status,
    COUNT(*) AS order_count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM orders_processed
GROUP BY delivery_status
ORDER BY order_count DESC;


-- 12. Review Score Distribution
SELECT
    review_score,
    COUNT(*) AS review_count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM delivery_review
GROUP BY review_score
ORDER BY review_score;


-- 13. Delivery Time vs Review Score
SELECT
    CASE
        WHEN delivery_days <= 5 THEN '0-5 days'
        WHEN delivery_days <= 10 THEN '6-10 days'
        WHEN delivery_days <= 15 THEN '11-15 days'
        WHEN delivery_days <= 30 THEN '16-30 days'
        ELSE '30+ days'
    END AS delivery_range,
    COUNT(*) AS order_count,
    ROUND(AVG(review_score)::numeric, 2) AS average_review_score
FROM delivery_review
GROUP BY
    CASE
        WHEN delivery_days <= 5 THEN '0-5 days'
        WHEN delivery_days <= 10 THEN '6-10 days'
        WHEN delivery_days <= 15 THEN '11-15 days'
        WHEN delivery_days <= 30 THEN '16-30 days'
        ELSE '30+ days'
    END
ORDER BY MIN(delivery_days);


-- ============================================================
-- 6. GEOGRAPHIC ANALYSIS
-- ============================================================

-- 14. Top 10 States by Revenue
SELECT
    customer_state,
    COUNT(*) AS order_count,
    ROUND(SUM(order_total_value)::numeric, 2) AS total_revenue,
    ROUND(AVG(order_total_value)::numeric, 2) AS average_order_value
FROM orders_with_state
GROUP BY customer_state
ORDER BY total_revenue DESC
LIMIT 10;


-- ============================================================
-- 7. HIGH-VALUE ORDER ANALYSIS
-- ============================================================

-- 15. High-Value Orders
-- High-value threshold = 349.41
SELECT
    COUNT(*) AS high_value_orders,
    ROUND(SUM(order_total_value)::numeric, 2) AS high_value_revenue,
    ROUND(AVG(order_total_value)::numeric, 2) AS average_high_value_order
FROM orders_processed
WHERE order_total_value > 349.41;


-- ============================================================
-- END OF OLIST SQL ANALYSIS
-- ============================================================