
-- Monthly Revenue Trend
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(total_amount) AS revenue
FROM Orders
GROUP BY month
ORDER BY month;


-- Monthly Revenue Growth (Window Function)

WITH MonthlySales AS (
    SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
           SUM(total_amount) AS revenue
    FROM Orders
    GROUP BY month
)
SELECT month, revenue,
       LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
       (revenue - LAG(revenue) OVER (ORDER BY month)) / LAG(revenue) OVER (ORDER BY month) * 100 AS revenue_growth
FROM MonthlySales;


-- Seasonal Trends in Sales

SELECT MONTH(order_date) AS month, 
       SUM(total_amount) AS revenue
FROM Orders
GROUP BY month
ORDER BY month;