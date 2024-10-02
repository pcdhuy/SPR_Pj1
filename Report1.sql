-- Table Information
SELECT * FROM data_table;

-- -- Information about order status
SELECT DISTINCT(order_status) AS 'Order Status' FROM data_table;

SELECT COUNT(order_status) FROM data_table;

WITH total_count AS (
  SELECT COUNT(order_status) AS total_count
  FROM data_table
)
SELECT
  DISTINCT order_status AS 'Order Status',
  COUNT(*) AS order_count,
  ROUND(COUNT(*) * 100.00 / (SELECT total_count FROM total_count), 4) AS 'Percentile'
FROM data_table
GROUP BY order_status
ORDER BY order_count DESC;

-- -- Information about customers

SELECT COUNT(DISTINCT customer) AS 'All customers' FROM data_table;

-- -- Information about order date

SELECT strftime('%Y', order_date) AS Years,
COUNT(order_status) AS 'Number of Orders'
FROM data_table
GROUP BY Years;

SELECT SUM(sales) AS Sales,
    COUNT(order_status) AS 'Number of Orders'
FROM data_table;
-- Information about order quantity.

SELECT 
    SUM(order_quantity) AS 'Total Quantity',
    MIN(order_quantity) AS 'Min Quantity',
    MAX(order_quantity) AS 'Max Quantity',
    AVG(order_quantity) AS 'Average Quantity'
FROM data_table;

SELECT
    CASE
        WHEN order_quantity BETWEEN 1 AND 10 THEN '1-10'
        WHEN order_quantity BETWEEN 11 AND 20 THEN '11-20'
        WHEN order_quantity BETWEEN 21 AND 30 THEN '21-30'
        WHEN order_quantity BETWEEN 31 AND 40 THEN '31-40'
        WHEN order_quantity BETWEEN 41 AND 50 THEN '41-50'
    END AS Quantity,
    COUNT(*) AS Count
FROM data_table
GROUP BY Quantity;

-- Information about sales

SELECT 
    SUM(sales) AS 'Total Sales',
    MIN(sales) AS 'Min Sales',
    MAX(sales) AS 'Max Sales',
    AVG(sales) AS 'Average Sales'
FROM data_table
WHERE order_status = 'Order Finished';

-- Information about discount

SELECT 
    MIN(discount) AS 'Min Discount',
    MAX(discount) AS 'Max Discount',
    AVG(discount) AS 'Average Discount'
FROM data_table;

-- Information about discount value

SELECT 
    SUM(discount_value) AS 'Total Discount Value',
    MIN(discount_value) AS 'Min Discount Value',
    MAX(discount_value) AS 'Max Discount Value',
    AVG(discount_value) AS 'Average Discount Value'
FROM data_table
WHERE order_status = 'Order Finished';


-- Promotion Effectiveness and Efficiency by Years

SELECT strftime('%Y',order_date) AS years,
    SUM(sales) AS Sales,
    COUNT(order_status) AS 'Number of Orders'
FROM data_table
WHERE order_status = 'Order Finished'
GROUP BY 1;

-- Overall Performance by Sub Category

SELECT
  product_sub_category,
  strftime('%Y', order_date) AS 'Order Year',
  SUM(sales) AS Sales
FROM data_table
WHERE strftime('%Y', order_date) BETWEEN '2009' AND '2012' AND order_status = 'Order Finished'
GROUP BY product_sub_category, 2;

  WITH product_sub_category AS (
    SELECT 
      product_sub_category, SUM(sales) AS Sales,
      SUM(CASE WHEN strftime('%Y', order_date) = '2009' THEN Sales ELSE 0 END) AS Sales2009 ,
      SUM(CASE WHEN strftime('%Y', order_date) = '2010' THEN Sales ELSE 0 END) AS Sales2010 ,
      SUM(CASE WHEN strftime('%Y', order_date) = '2011' THEN Sales ELSE 0 END) AS Sales2011 ,
      SUM(CASE WHEN strftime('%Y', order_date) = '2012' THEN Sales ELSE 0 END) AS Sales2012 
    FROM data_table
    WHERE order_status = 'Order Finished'
    GROUP BY product_sub_category
  )
  SELECT *,
    ROUND((Sales2010 - Sales2009) * 100.0 / Sales2010, 2) AS 'Sales Growth 2009-2010 (%)',
    ROUND((Sales2011 - Sales2010) * 100.0 / Sales2011, 2) AS 'Sales Growth 2010-2011 (%)',
    ROUND((Sales2012 - Sales2011) * 100.0 / Sales2012, 2) AS 'Sales Growth 2011-2012 (%)'
  FROM product_sub_category
  ORDER BY Sales ASC;

-- Promotion Effectiveness and Efficiency by Years
-- Burn rate (%) = (total_discount / total_sale) * 100

SELECT strftime('%Y',order_date) AS Years,
 SUM(sales) AS Total_Sales,
 SUM(discount_value) AS Total_Discount,
 ROUND(SUM(discount_value) * 100.000 / SUM(sales) , 3) AS 'Burn Rate (%)'
FROM data_table
WHERE order_status = 'Order Finished'
GROUP BY Years;

-- Promotion Effectiveness and Efficiency by using Product Sub Category

SELECT strftime('%Y',order_date) AS Years,
        product_sub_category,
        SUM(sales) AS Total_Sales,
        SUM(discount_value) AS Total_Discount,
        ROUND(SUM(discount_value)*100.00/SUM(sales), 3) AS 'Burn Rate (%)'
 FROM data_table
 WHERE strftime('%Y',order_date) BETWEEN '2009' AND '2012'
       AND order_status = 'Order Finished'
 GROUP BY 2,1;

-- Customers Transactions per Year

SELECT COUNT(DISTINCT customer) AS 'All customers' FROM data_table;

SELECT COUNT(DISTINCT customer) AS 'All customers made successful transactions' FROM data_table
WHERE order_status = 'Order Finished';

SELECT COUNT(DISTINCT customer) AS 'All customers made unsuccessful transactions'
FROM data_table
WHERE order_status = 'Order Returned';

SELECT 
  strftime('%Y',order_date) AS Years,
  COUNT(DISTINCT customer) AS 'Number of customers'
FROM data_table
-- WHERE order_status = 'Order Finished'
GROUP BY Years;

-- New Customer Over the Years

WITH first_orders AS (
  SELECT customer, MIN(order_date) AS first_order
  FROM data_table
 --WHERE order_status = 'Order Finished'
  GROUP BY 1
)
SELECT
  strftime('%Y', first_order) AS Years,
  COUNT(first_order) AS 'New Customer'
FROM first_orders
GROUP BY Years;
