
-- Optimizing Queries (Indexing)
--  Speed up customer & product lookups:


-- Index on customer_id in Orders table (to speed up order lookups for a customer)
CREATE INDEX idx_customer_orders ON Orders(customer_id);

-- Index on product_id in Order_Items table (to speed up product-related queries)
CREATE INDEX idx_product_sales ON Order_Items(product_id);

-- Index on order_date in Orders table (for fast date range searches)
CREATE INDEX idx_order_date ON Orders(order_date);



