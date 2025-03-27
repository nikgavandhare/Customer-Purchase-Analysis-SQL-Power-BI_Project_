

-- Most Returned Products

SELECT p.product_name, COUNT(r.return_id) AS total_returns
FROM Returns_table r
JOIN Products p ON r.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_returns DESC;

--  Common Return Reasons

SELECT return_reason, COUNT(*) AS total_occurrences
FROM Returns_table
GROUP BY return_reason
ORDER BY total_occurrences DESC;


-- Detecting High Return Rate Products
SELECT p.product_name, 
       COUNT(r.return_id) AS return_count,
       COUNT(oi.order_id) AS total_sales,
       (COUNT(r.return_id) / COUNT(oi.order_id)) * 100 AS return_rate
FROM Products p
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
LEFT JOIN Returns r ON p.product_id = r.product_id
GROUP BY p.product_name
ORDER BY return_rate DESC;
