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
    
    -- Berekening van Revenue
    OL.Quantity * OL.UnitPrice AS Revenue,

    -- Berekening van Discount
    CASE 
        WHEN OL.Quantity > 100 THEN (OL.Quantity * OL.UnitPrice) * 0.05
        ELSE 0 
    END 
    + CASE 
        WHEN OL.Quantity * OL.UnitPrice > 1500 THEN (OL.Quantity * OL.UnitPrice) * 0.02
        ELSE 0 
    END AS Discount,

    -- Bestaande TaxRate
    CAST(OL.TaxRate AS DECIMAL(5, 2)) AS TaxRate,

    -- Verwijzingen naar dimensies
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
