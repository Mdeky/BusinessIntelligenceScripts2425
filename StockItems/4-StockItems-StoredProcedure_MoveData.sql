BEGIN TRANSACTION
GO

CREATE PROCEDURE [dbo].[move_stockitems_data]
AS
BEGIN
    -- Tabel CLEANSED.StockItem leegmaken (niet droppen!)
    TRUNCATE TABLE CLEANSED.StockItems;

    -- Data invoegen in CLEANSED.StockItem, alleen records met geldige waarden
    INSERT INTO CLEANSED.StockItems (
        StockItemID,
        StockItemName,
        SupplierID,
        ColorID,
        Brand,
        Size,
        TaxRate,
        UnitPrice,
        RecommendedRetailPrice
    )
    SELECT 
        TRY_CAST(StockItemID AS INT) AS StockItemID,
        StockItemName,
        TRY_CAST(SupplierID AS INT) AS SupplierID,
        ISNULL(TRY_CAST(ColorID AS INT), -1) AS ColorID,
        ISNULL(Brand, 'unknown') AS Brand,
        ISNULL(Size, 'unknown') AS Size,
        ISNULL(TaxRate, -1) AS TaxRate,
        ISNULL(UnitPrice, -1) AS UnitPrice,
        ISNULL(RecommendedRetailPrice, -1) AS RecommendedRetailPrice
    FROM RAW.StockItems
    WHERE 
        TRY_CAST(StockItemID AS INT) IS NOT NULL
        AND TRY_CAST(StockItemName AS varchar(100)) IS NOT NULL
        AND TRY_CAST(SupplierID AS INT) IS NOT NULL;

    -- Data die geen StockItemID, StockItemName of SupplierID hebben naar ARCHIVE verplaatsen
    INSERT INTO ARCHIVE.StockItems (
        StockItemID,
        StockItemName,
        SupplierID,
        ColorID,
        Brand,
        Size,
        TaxRate,
        UnitPrice,
        RecommendedRetailPrice
    )
    SELECT 
        TRY_CAST(StockItemID AS INT) AS StockItemID,
        StockItemName,
        TRY_CAST(SupplierID AS INT) AS SupplierID,
        ISNULL(TRY_CAST(ColorID AS INT), -1) AS ColorID,
        ISNULL(Brand, 'unknown') AS Brand,
        ISNULL(Size, 'unknown') AS Size,
        ISNULL(TaxRate, -1) AS TaxRate,
        ISNULL(UnitPrice, -1) AS UnitPrice,
        ISNULL(RecommendedRetailPrice, -1) AS RecommendedRetailPrice
    FROM RAW.StockItems
    WHERE 
        TRY_CAST(StockItemID AS INT) IS NULL
        OR TRY_CAST(StockItemName AS varchar(100)) IS NULL
        OR TRY_CAST(SupplierID AS INT) IS NULL;
END
GO
COMMIT;

BEGIN TRANSACTION
EXEC [dbo].[move_stockitems_data]
COMMIT
