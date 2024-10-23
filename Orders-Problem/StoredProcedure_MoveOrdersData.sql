-- TODO, Het probleem ligt bij het casten van de ID's volgens mij aangezien ze ,0 zijn en in formaat NVARCHAR(50) zitten kunnen ze niet gecast worden naar een INT to be solved dus
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
        SalespersonPersonID, 
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
        TRY_CAST(FLOOR (OrderID) AS INT) IS NOT NULL
        AND TRY_CAST(FLOOR (CustomerID) AS INT) IS NOT NULL
        AND TRY_CAST(FLOOR (SalespersonPersonID) AS INT) IS NOT NULL
        AND TRY_CAST(FLOOR (ContactPersonID) AS INT) IS NOT NULL
        AND TRY_CAST(OrderDate AS DATE) IS NOT NULL
        AND TRY_CAST(ExpectedDeliveryDate AS DATE) IS NOT NULL
        AND TRY_CAST(PickingCompletedWhen AS DATETIME) IS NOT NULL

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
        *
    FROM RAW.Orders
    WHERE 
        TRY_CAST(FLOOR (column1) AS INT) IS NULL
        OR TRY_CAST(FLOOR (OrderID) AS INT) IS NULL
        OR TRY_CAST(FLOOR (CustomerID) AS INT) IS NULL
        OR TRY_CAST(FLOOR (SalespersonPersonID) AS INT) IS NULL
        OR TRY_CAST(FLOOR (ContactPersonID) AS INT) IS NULL
        OR TRY_CAST(OrderDate AS DATE) IS NULL
        OR TRY_CAST(ExpectedDeliveryDate AS DATE) IS NULL
        OR TRY_CAST(PickingCompletedWhen AS DATETIME) IS NULL;
END;
GO

-- Execute the stored procedure within a transaction
BEGIN TRANSACTION;
    EXEC [dbo].[move_orders_data];
COMMIT;
