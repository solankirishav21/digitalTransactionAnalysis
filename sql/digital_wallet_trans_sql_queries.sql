-- Check total records
SELECT COUNT(*) FROM transaction_table;

-- Check for NULLs in critical columns
SELECT 
  COUNT(*) FILTER (WHERE transaction_id IS NULL) AS null_txn_id,
  COUNT(*) FILTER (WHERE transaction_date IS NULL) AS null_date,
  COUNT(*) FILTER (WHERE product_amount IS NULL) AS null_amount
FROM transaction_table;

-- Check Distinct Values in Key Columns
SELECT 
  COUNT(DISTINCT user_id) AS unique_users,
  COUNT(DISTINCT merchant_name) AS unique_merchants,
  COUNT(DISTINCT product_category) AS product_categories,
  COUNT(DISTINCT payment_method) AS payment_methods
FROM transaction_table;

-- Transaction Status Breakdown
SELECT 
  transaction_status,
  COUNT(*) AS txn_count
FROM transaction_table
GROUP BY transaction_status;

-- Total successful transactions, revenue, and average transaction value
SELECT 
  COUNT(*) AS total_transactions,
  SUM(product_amount + transaction_fee) AS total_revenue,
  ROUND(AVG(product_amount), 2) AS avg_transaction_value
FROM transaction_table
WHERE transaction_status = 'Successful';
-- SELECT DISTINCT transaction_status FROM transaction_table;

-- Monthly trend of transactions and revenue
SELECT 
  TO_CHAR(transaction_date, 'YYYY-MM') AS month,
  COUNT(*) AS txn_count,
  SUM(product_amount) AS total_revenue
FROM transaction_table
WHERE transaction_status = 'Successful'
GROUP BY month
ORDER BY month;

-- Top Product Categories by Revenue
SELECT 
  product_category,
  COUNT(*) AS total_txns,
  SUM(product_amount) AS total_spent
FROM transaction_table
WHERE transaction_status = 'Successful'
GROUP BY product_category
ORDER BY total_spent DESC;

-- Top Merchants by Revenue
SELECT 
  merchant_name,
  COUNT(*) AS total_transactions,
  SUM(product_amount) AS total_revenue
FROM transaction_table
WHERE transaction_status = 'Successful'
GROUP BY merchant_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Cashback & Loyalty Trend
SELECT 
   TO_CHAR(transaction_date, 'YYYY-MM') AS month,
  SUM(cashback) AS total_cashback,
  SUM(loyalty_points) AS total_loyalty_points
FROM transaction_table
WHERE transaction_status = 'Successful'
GROUP BY month
ORDER BY month;

-- Device Type Usage
SELECT 
  device_type,
  COUNT(*) AS total_transactions,
  SUM(product_amount) AS total_spent
FROM transaction_table
WHERE transaction_status = 'Successful'
GROUP BY device_type
ORDER BY total_spent DESC;

-- Payment Method Distribution
SELECT 
  payment_method,
  COUNT(*) AS txn_count,
  SUM(product_amount) AS total_amount
FROM transaction_table
WHERE transaction_status = 'Successful'
GROUP BY payment_method
ORDER BY total_amount DESC;

-- Failed Transactions Analysis
SELECT 
  transaction_status,
  COUNT(*) AS txn_count,
  SUM(product_amount) AS failed_amount
FROM transaction_table
WHERE transaction_status != 'Successful'
GROUP BY transaction_status;

-- Revenue by Location
SELECT 
  location,
  COUNT(*) AS txn_count,
  SUM(product_amount) AS total_revenue
FROM transaction_table
WHERE transaction_status = 'Successful'
GROUP BY location
ORDER BY total_revenue DESC;

-- Different Views for POWER BI

-- Monthly Revenue View
CREATE OR REPLACE VIEW revenue_by_month AS
SELECT 
  DATE_TRUNC('month', transaction_date) AS month,
  SUM(product_amount + transaction_fee) AS revenue,
  COUNT(*) AS transaction_count
FROM transaction_table
WHERE transaction_status = 'Successful'
GROUP BY month;
SELECT * FROM revenue_by_month LIMIT 10;

-- Top Product Categories View
CREATE OR REPLACE VIEW category_revenue AS
SELECT 
  product_category,
  COUNT(*) AS total_txns,
  SUM(product_amount) AS total_revenue
FROM transaction_table
WHERE transaction_status = 'Successful'
GROUP BY product_category;
SELECT * FROM category_revenue LIMIT 10;

-- Top Merchants View
CREATE OR REPLACE VIEW merchant_performance AS
SELECT 
  merchant_name,
  COUNT(*) AS total_transactions,
  SUM(product_amount) AS total_revenue,
  AVG(cashback) AS avg_cashback
FROM transaction_table
WHERE transaction_status = 'Successful'
GROUP BY merchant_name;
SELECT * FROM merchant_performance LIMIT 10;

-- Cashback & Loyalty Trend View
CREATE OR REPLACE VIEW cashback_loyalty_monthly AS
SELECT 
  DATE_TRUNC('month', transaction_date) AS month,
  SUM(cashback) AS total_cashback,
  SUM(loyalty_points) AS total_loyalty_points
FROM transaction_table
WHERE transaction_status = 'Successful'
GROUP BY month;
SELECT * FROM cashback_loyalty_monthly LIMIT 10;

-- Device Usage View
CREATE OR REPLACE VIEW device_usage_summary AS
SELECT 
  device_type,
  COUNT(*) AS total_transactions,
  SUM(product_amount) AS total_spent
FROM transaction_table
WHERE transaction_status = 'Successful'
GROUP BY device_type;
SELECT * FROM device_usage_summary LIMIT 10;

-- Payment Method Distribution View
CREATE OR REPLACE VIEW payment_method_summary AS
SELECT 
  payment_method,
  COUNT(*) AS txn_count,
  SUM(product_amount) AS total_amount
FROM transaction_table
WHERE transaction_status = 'Successful'
GROUP BY payment_method;
SELECT * FROM payment_method_summary LIMIT 10;

-- Failed Transactions Summary View
CREATE OR REPLACE VIEW failed_transactions_summary AS
SELECT 
  transaction_status,
  COUNT(*) AS txn_count,
  SUM(product_amount) AS failed_amount
FROM transaction_table
WHERE transaction_status != 'Successful'
GROUP BY transaction_status;
SELECT * FROM failed_transactions_summary LIMIT 10;

-- Location-wise Revenue View
CREATE OR REPLACE VIEW location_revenue AS
SELECT 
  location,
  COUNT(*) AS txn_count,
  SUM(product_amount) AS total_revenue
FROM transaction_table
WHERE transaction_status = 'Successful'
GROUP BY location;
SELECT * FROM location_revenue LIMIT 10;