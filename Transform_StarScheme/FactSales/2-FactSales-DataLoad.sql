INSERT INTO dbo.FactSales (
    SalesID, 
    QuantitySold, 
    Revenue, 
    Discount, 
    TaxRate, 
    CustomerID, 
    SupplierID, 
    ProductID, 
    DateID, 
    GeographyID, 
    PersonID
)
SELECT 
    OL.OrderLineID AS SalesID,
    OL.Quantity AS QuantitySold,
    OL.Quantity * OL.UnitPrice AS Revenue,
    0 AS Discount,
    CAST(OL.TaxRate AS DECIMAL(5, 2)) AS TaxRate,
    O.CustomerID AS CustomerID,
    SI.SupplierID AS SupplierID,
    SI.StockItemID AS ProductID,
    CAST(FORMAT(O.OrderDate, 'yyyyMMdd') AS INT) AS DateID,
    C.DeliveryCityID AS GeographyID,
    O.SalespersonPersonID AS PersonID
FROM 
    WWI_OLTP.CLEANSED.OrderLines OL
    INNER JOIN WWI_OLTP.CLEANSED.Orders O 
        ON OL.OrderID = O.OrderID
    INNER JOIN WWI_OLTP.CLEANSED.StockItems SI 
        ON OL.StockItemID = SI.StockItemID
    INNER JOIN WWI_OLTP.CLEANSED.Customers C 
        ON O.CustomerID = C.CustomerID;
