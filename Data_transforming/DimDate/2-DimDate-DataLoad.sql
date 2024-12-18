INSERT INTO dbo.DimDate (DateID, FullDate, Year, Month, Week)
SELECT DISTINCT 
    CAST(FORMAT(OrderDate, 'yyyyMMdd') AS INT) AS DateID,
    OrderDate AS FullDate,
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    DATEPART(WEEK, OrderDate) AS Week
FROM WWI_OLTP.CLEANSED.Orders
WHERE OrderDate IS NOT NULL;
