BEGIN TRANSACTION
GO

CREATE PROCEDURE [dbo].[move_supplier_category_data]
AS
BEGIN
    -- Tabel CLEANSED.SupplierCategories leegmaken (niet droppen!)
    TRUNCATE TABLE CLEANSED.SupplierCategories;

    -- Data invoegen in CLEANSED.SupplierCategories, alleen records met geldige waarden
    INSERT INTO CLEANSED.SupplierCategories (
        SupplierCategoryID,
        SupplierCategoryName,
        LastEditedBy
    )
    SELECT 
        SupplierCategoryID,
        SupplierCategoryName,
        LastEditedBy
    FROM RAW.SupplierCategories
    WHERE 
        TRY_CAST(SupplierCategoryID AS INT) IS NOT NULL
        AND TRY_CAST(SupplierCategoryName AS varchar(50)) IS NOT NULL
        AND TRY_CAST(LastEditedBy AS INT) IS NOT NULL;

    -- Data die niet voldoen aan de voorwaarden naar ARCHIVE verplaatsen
    INSERT INTO ARCHIVE.SupplierCategories (
        column1,
        SupplierCategoryID,
        SupplierCategoryName,
        LastEditedBy
    )
    SELECT 
        column1,
        SupplierCategoryID,
        SupplierCategoryName,
        LastEditedBy
    FROM RAW.SupplierCategories
    WHERE
        TRY_CAST(column1 AS INT) IS NULL
        OR TRY_CAST(SupplierCategoryID AS INT) IS NULL
        OR TRY_CAST(SupplierCategoryName AS varchar(50)) IS NULL
        OR TRY_CAST(LastEditedBy AS INT) IS NULL;
END
GO
COMMIT

-- Procedure uitvoeren
BEGIN TRANSACTION
EXEC [dbo].[move_supplier_category_data]
COMMIT
