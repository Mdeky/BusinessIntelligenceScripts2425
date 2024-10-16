-- Nog te controleren probleem ligt hoogstwaarschijnlijk bij de trycast van de datums
CREATE PROCEDURE [dbo].[move_orders_data]
AS
BEGIN
    -- Clear existing records in CLEANSED.Orders
    TRUNCATE TABLE CLEANSED.Orders;

    -- Insert valid records into CLEANSED.Orders
    INSERT INTO CLEANSED.Orders 
    (
        OrderID, 
        CustomerID, 
        SalespersonID, 
        ContactPersonID, 
        OrderDate, 
        ExpectedDeliveryDate, 
        PickingCompletedWhen
    )
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
        TRY_CAST(OrderID AS INT) IS NOT NULL
        AND TRY_CAST(CustomerID AS INT) IS NOT NULL
        AND TRY_CAST(SalespersonPersonID AS INT) IS NOT NULL
        AND TRY_CAST(ContactPersonID AS INT) IS NOT NULL
        AND TRY_CAST(OrderDate AS DATE) IS NOT NULL
        AND TRY_CAST(ExpectedDeliveryDate AS DATE) IS NOT NULL
        AND TRY_CAST(PickingCompletedWhen AS DATETIME) IS NOT NULL
        AND OrderID NOT IN (SELECT OrderID FROM CLEANSED.Orders); -- Avoid duplicates

    -- Archive invalid records
    INSERT INTO ARCHIVE.Orders 
    (
        column1,
        OrderID, 
        CustomerID, 
        SalespersonPersonID, 
        ContactPersonID, 
        OrderDate, 
        ExpectedDeliveryDate, 
        PickingCompletedWhen
    )
    SELECT 
        column1,
        OrderID,
        CustomerID,
        SalespersonPersonID,
        ContactPersonID,
        OrderDate,
        ExpectedDeliveryDate,
        PickingCompletedWhen
    FROM RAW.Orders
    WHERE 
        TRY_CAST(column1 AS INT) IS NULL
        OR TRY_CAST(OrderID AS INT) IS NULL
        OR TRY_CAST(CustomerID AS INT) IS NULL
        OR TRY_CAST(SalespersonPersonID AS INT) IS NULL
        OR TRY_CAST(ContactPersonID AS INT) IS NULL
        OR TRY_CAST(OrderDate AS DATE) IS NULL
        OR TRY_CAST(ExpectedDeliveryDate AS DATE) IS NULL
        OR TRY_CAST(PickingCompletedWhen AS DATETIME) IS NULL;
END;
GO

-- Execute the stored procedure within a transaction
BEGIN TRANSACTION;
    EXEC [dbo].[move_orders_data];
COMMIT;
