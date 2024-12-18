INSERT INTO dbo.DimProduct (
    ProductID, 
    ProductName, 
    TaxRate
)
SELECT 
    StockItemID AS ProductID, 
    StockItemName AS ProductName, 
    CAST(TaxRate AS DECIMAL(5, 2)) AS TaxRate
FROM 
    WWI_OLTP.CLEANSED.StockItems;
