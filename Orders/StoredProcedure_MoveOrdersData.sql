BEGIN TRANSACTION
GO

CREATE PROCEDURE [dbo].[move_orders_data]
AS
BEGIN
    -- Tabel CLEANSED.Orders leegmaken (niet droppen!)
    TRUNCATE TABLE CLEANSED.Orders;

    -- Geldige data invoegen in CLEANSED.Orders
    INSERT INTO CLEANSED.Orders (OrderID, CustomerID, SalespersonPersonID, ContactPersonID, OrderDate, ExpectedDeliveryDate, PickingCompletedWhen)
    SELECT 
        TRY_CAST(TRY_CAST( OrderID AS FLOAT) AS INT) AS OrderID,
        COALESCE(TRY_CAST(TRY_CAST(CustomerID AS FLOAT) AS INT), -1) AS CustomerID,
        COALESCE(TRY_CAST(TRY_CAST(SalespersonPersonID AS FLOAT) AS INT), -1) AS SalespersonPersonID,
        COALESCE(TRY_CAST(TRY_CAST(ContactPersonID AS FLOAT) AS INT), -1) AS ContactPersonID,
        COALESCE(TRY_CAST(OrderDate AS DATE), '1900-01-01') AS OrderDate,
        COALESCE(TRY_CAST(ExpectedDeliveryDate AS DATE), '1900-01-01') AS ExpectedDeliveryDate,
        COALESCE(TRY_CAST(PickingCompletedWhen AS DATETIME2), '1900-01-01 00:00:00.000') AS PickingCompletedWhen
    FROM RAW.Orders
    WHERE 
		TRY_CAST(TRY_CAST( OrderID AS FLOAT) AS INT) IS NOT NULL AND
        TRY_CAST(TRY_CAST( OrderID AS FLOAT) AS INT) IN (SELECT DISTINCT OrderID FROM CLEANSED.OrderLines); -- Controleer of OrderID in OrderLines zit

   -- Ongeldige data naar ARCHIVE.Orders verplaatsen
    INSERT INTO ARCHIVE.Orders (OrderID, CustomerID, SalespersonPersonID, ContactPersonID, OrderDate, ExpectedDeliveryDate, PickingCompletedWhen)
    SELECT 
        OrderID,
        CustomerID,
        SalespersonPersonID,
        ContactPersonID,
        OrderDate,
        ExpectedDeliveryDate,
        PickingCompletedWhen
    FROM RAW.Orders
    WHERE 
        TRY_CAST(TRY_CAST( OrderID AS FLOAT) AS INT) IS NULL OR
        TRY_CAST(TRY_CAST( OrderID AS FLOAT) AS INT) NOT IN (SELECT DISTINCT OrderID FROM CLEANSED.OrderLines); -- Controleer of OrderID in OrderLines zit
END
GO
COMMIT

-- Procedure uitvoeren
BEGIN TRANSACTION
EXEC [dbo].[move_orders_data]
COMMIT
