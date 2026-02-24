-- Total revenue
SELECT SUM(Quantity * UnitPrice) AS revenue
FROM retail
WHERE Quantity > 0
AND InvoiceNo NOT LIKE 'C%';

-- Revenue by country
SELECT Country,
       SUM(Quantity * UnitPrice) AS revenue
FROM retail
GROUP BY Country
ORDER BY revenue DESC;

-- Customer frequency
SELECT CustomerID,
       COUNT(DISTINCT InvoiceNo) AS orders
FROM retail
GROUP BY CustomerID
ORDER BY orders DESC;

-- Avg order value
SELECT AVG(order_total)
FROM (
    SELECT InvoiceNo,
           SUM(Quantity * UnitPrice) AS order_total
    FROM retail
    GROUP BY InvoiceNo
) t;
