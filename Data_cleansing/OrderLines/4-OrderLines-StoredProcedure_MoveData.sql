BEGIN TRANSACTION
GO

CREATE PROCEDURE [dbo].[move_orderlines_data]
AS
BEGIN
    -- Tabel CLEANSED.OrderLines leegmaken (niet droppen!)
    TRUNCATE TABLE CLEANSED.OrderLines;

    -- Data invoegen in CLEANSED.OrderLines, alleen records met geldige waarden
    INSERT INTO CLEANSED.OrderLines (
        OrderLineID,
        OrderID,
        StockItemID,
        Description,
        Quantity,
        UnitPrice,
        TaxRate,
        PickingCompletedWhen
    )
    SELECT 
        TRY_CAST(OrderLineID AS INT),
        TRY_CAST(OrderID AS INT),
        TRY_CAST(StockItemID AS INT),
        Description,  -- Mag leeg zijn
        TRY_CAST(Quantity AS INT),
        TRY_CAST(UnitPrice AS FLOAT),
        TRY_CAST(TRY_CAST(TaxRate AS FLOAT) AS INT),
        COALESCE(TRY_CAST(PickingCompletedWhen AS DATETIME2), '1900-01-01 00:00:00.000')  -- Standaardwaarde als NULL
    FROM RAW.OrderLines
    WHERE 
        TRY_CAST(OrderLineID AS INT) IS NOT NULL
        AND TRY_CAST(OrderID AS INT) IS NOT NULL
        AND TRY_CAST(StockItemID AS INT) IS NOT NULL
        AND TRY_CAST(Quantity AS INT) IS NOT NULL
        AND TRY_CAST(UnitPrice AS FLOAT) IS NOT NULL
        AND TRY_CAST(TRY_CAST(TaxRate AS FLOAT) AS INT) IS NOT NULL;

    -- Data die niet voldoen aan de voorwaarden naar ARCHIVE verplaatsen
    INSERT INTO ARCHIVE.OrderLines (
        OrderLineID,
        OrderID,
        StockItemID,
        Description,
        Quantity,
        UnitPrice,
        TaxRate,
        PickingCompletedWhen
    )
    SELECT 
        OrderLineID,
        OrderID,
        StockItemID,
        Description,  -- Mag leeg zijn
        Quantity,
        UnitPrice,
        TaxRate,
        PickingCompletedWhen
    FROM RAW.OrderLines
    WHERE 
        TRY_CAST(OrderLineID AS INT) IS NULL
        OR TRY_CAST(OrderID AS INT) IS NULL
        OR TRY_CAST(StockItemID AS INT) IS NULL
        OR TRY_CAST(Quantity AS INT) IS NULL
        OR TRY_CAST(UnitPrice AS FLOAT) IS NULL
        OR TRY_CAST(TRY_CAST(TaxRate AS FLOAT) AS INT) IS NULL;

END
GO
COMMIT

-- Procedure uitvoeren
BEGIN TRANSACTION
EXEC [dbo].[move_orderlines_data]
COMMIT
