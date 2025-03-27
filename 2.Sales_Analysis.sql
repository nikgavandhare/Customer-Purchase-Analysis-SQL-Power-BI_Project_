--   ******************  Basic Sales Analysis  **********************************************


SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Order_Items;
SELECT * FROM Returns_table;

-- #1 lets find the Total Sales & Revenue
SELECT SUM(total_amount) AS total_revenue,
	  COUNT(order_id) AS total_orders
FROM Orders;

-- Average order Value 
SELECT SUM(total_amount) / COUNT(order_id)  AS avg_order_value
FROM Orders;

--  Top 5 Customers by Spending
-- lets join order and customer table to find top 5 spending customers
SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_spent
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 5;

--  Top 5 Best-Selling Products
-- lets join order_item and product table to find best selling product
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 5;


