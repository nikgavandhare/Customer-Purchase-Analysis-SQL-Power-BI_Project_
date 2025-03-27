

-- Automate Customer Segmentation


DELIMITER $$
CREATE PROCEDURE SegmentCustomers()
BEGIN
    SELECT c.customer_id, c.name,
           CASE 
               WHEN SUM(o.total_amount) > 5000 THEN 'VIP'
               WHEN SUM(o.total_amount) BETWEEN 2000 AND 5000 THEN 'Regular'
               ELSE 'New'
           END AS segment
    FROM Orders o
    JOIN Customers c ON o.customer_id = c.customer_id
    GROUP BY c.customer_id, c.name;
END $$
DELIMITER ;

-- run the procedure
CALL SegmentCustomers();








-- Average Time Between Orders (Repeat Purchase Rate)

WITH OrderGaps AS (
    SELECT customer_id, 
           order_date,
           LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS prev_order_date
    FROM Orders
)
SELECT AVG(DATEDIFF(order_date, prev_order_date)) AS avg_days_between_orders
FROM OrderGaps
WHERE prev_order_date IS NOT NULL;
