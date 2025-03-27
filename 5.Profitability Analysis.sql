

-- Most Profitable Products

SELECT p.product_name, 
       SUM(oi.quantity * (p.price - p.cost)) AS total_profit
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_profit DESC;

 -- Profit by Product Category

SELECT p.category, 
       SUM(oi.quantity * (p.price - p.cost)) AS total_profit
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_profit DESC;