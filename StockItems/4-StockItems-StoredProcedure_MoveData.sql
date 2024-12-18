BEGIN TRANSACTION
GO

CREATE PROCEDURE [dbo].[move_stockitems_data]
AS
BEGIN
    
    TRUNCATE TABLE CLEANSED.StockItems;


    INSERT INTO CLEANSED.StockItems (
        StockItemID,
        StockItemName,
        SupplierID,
        ColorID,
        Brand,
        Size,
        Taxrate,
        Unitprice,
        RecommendedRetailPrice
    )
    SELECT 
        StockItemID,
        StockItemName,
        SupplierID,
        ISNULL(ColorID, -1) AS ColorID,
        ISNULL(Brand, 'unknown') AS Brand,
        ISNULL(Size, 'unknown') AS Size,
        ISNULL(Taxrate, -1) AS Taxrate,
        ISNULL(Unitprice, -1) AS Unitprice,
        ISNULL(RecommendedRetailPrice, -1) AS RecommendedRetailPrice
    FROM RAW.StockItems
    WHERE 
        TRY_CAST(StockItemID AS INT) IS NOT NULL
        AND TRY_CAST(StockItemName AS varchar(100)) IS NOT NULL
        AND TRY_CAST(SupplierID AS INT) IS NOT NULL;

    -- Data die geen StockItemID, StockItemName of SupplierID hebben naar ARCHIVE verplaatsen
    INSERT INTO ARCHIVE.SupplierCategories (
        StockItemID,
        StockItemName,
        SupplierID,
        ColorID,
        Brand,
        Size,
        Taxrate,
        Unitprice,
        RecommendedRetailPrice
    )
    SELECT 
        StockItemID,
        StockItemName,
        SupplierID,
        ISNULL(ColorID, -1) AS ColorID,
        ISNULL(Brand, 'unknown') AS Brand,
        ISNULL(Size, 'unknown') AS Size,
        ISNULL(Taxrate, -1) AS Taxrate,
        ISNULL(Unitprice, -1) AS Unitprice,
        ISNULL(RecommendedRetailPrice, -1) AS RecommendedRetailPrice
    FROM RAW.StockItems
    WHERE 
        TRY_CAST(StockItemID AS INT) IS NULL
        OR TRY_CAST(StockItemName AS varchar(100)) IS NULL
        OR TRY_CAST(SupplierID AS INT) IS NULL;
END
GO
COMMIT;

-- Procedure uitvoeren
BEGIN TRANSACTION
EXEC [dbo].[move_stockitems_data];
COMMIT;
