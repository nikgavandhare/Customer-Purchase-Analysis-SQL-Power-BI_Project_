--  ******************************************   Customer Behavior Analysis  **************************************************************************
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Order_Items;
SELECT * FROM Returns_table;

-- #1 Retention Analysis ( Active vs. Inactive Customers )
WITH LastOrder AS (
    SELECT customer_id, MAX(order_date) AS last_order_date
    FROM Orders
    GROUP BY customer_id
)
SELECT c.customer_id, c.name, l.last_order_date,
       CASE 
           WHEN l.last_order_date < CURDATE() - INTERVAL 6 MONTH THEN 'Inactive Customers'
           ELSE 'Active Customers'
       END AS customer_status
FROM Customers c
LEFT JOIN LastOrder l ON c.customer_id = l.customer_id;

-- #2 Customer Lifetime Value (CLV
SELECT c.customer_id, c.name, 
       SUM(o.total_amount) AS total_spent,
       COUNT(o.order_id) AS total_orders,
       SUM(o.total_amount) / COUNT(o.order_id) AS avg_order_value
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

	