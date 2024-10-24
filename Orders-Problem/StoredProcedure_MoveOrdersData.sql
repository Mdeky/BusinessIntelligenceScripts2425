-- Data van RAW naar CLEANSED verplaatsen, ongeldige data naar ARCHIVE
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
        AND TRY_CAST(PickingCompletedWhen AS DATETIME) IS NOT NULL;

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
        TRY_CAST(OrderID AS INT) IS NULL
        OR TRY_CAST(CustomerID AS INT) IS NULL
        OR TRY_CAST(SalespersonPersonID AS INT) IS NULL
        OR TRY_CAST(ContactPersonID AS INT) IS NULL
        OR TRY_CAST(OrderDate AS DATE) IS NULL
        OR TRY_CAST(ExpectedDeliveryDate AS DATE) IS NULL
        OR TRY_CAST(PickingCompletedWhen AS DATETIME) IS NULL;
END
GO
COMMIT

-- Procedure uitvoeren
BEGIN TRANSACTION
EXEC [dbo].[move_orders_data]
COMMIT
