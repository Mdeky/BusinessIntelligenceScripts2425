
BEGIN TRANSACTION
GO

CREATE PROCEDURE [dbo].[move_supplier_data]
AS
BEGIN
    -- Tabel CLEANSED.Suppliers leegmaken (niet droppen!)
    TRUNCATE TABLE CLEANSED.Suppliers;

    -- Data invoegen in CLEANSED.Suppliers, alleen records met geldige waarden
    INSERT INTO CLEANSED.Suppliers (
        SupplierID,
        SupplierName,
        SupplierCategoryID,
        BankAccountName,
        BankAccountNumber,
        BankInternationalCode,
        DeliveryCityID,
        DeliveryAddressLine1,
        DeliveryAddressLine2,
        DeliveryPostalCode
    )
    SELECT 
        SupplierID,
        SupplierName,
        SupplierCategoryID,
        BankAccountName,
        BankAccountNumber,
        BankInternationalCode,
        DeliveryCityID,
        DeliveryAddressLine1,
        DeliveryAddressLine2,
        DeliveryPostalCode
    FROM RAW.Suppliers
    WHERE 
        TRY_CAST(SupplierID AS INT) IS NOT NULL
        AND TRY_CAST(SupplierName AS varchar(50)) IS NOT NULL
        AND TRY_CAST(SupplierCategoryID AS INT) IS NOT NULL
        AND TRY_CAST(BankAccountName AS varchar(50)) IS NOT NULL
        AND TRY_CAST(BankAccountNumber AS varchar(12)) IS NOT NULL
        AND TRY_CAST(BankInternationalCode AS varchar(5)) IS NOT NULL
        AND TRY_CAST(DeliveryCityID AS varchar(5)) IS NOT NULL
        AND TRY_CAST(DeliveryAddressLine1 AS varchar(20)) IS NOT NULL OR DeliveryAddressLine1 IS NULL
        AND TRY_CAST(DeliveryAddressLine2 AS varchar(100)) IS NOT NULL OR DeliveryAddressLine2 IS NULL
        AND TRY_CAST(DeliveryPostalCode AS varchar(5)) IS NOT NULL;

    -- Data die niet voldoen aan de voorwaarden naar ARCHIVE verplaatsen
    INSERT INTO ARCHIVE.Suppliers (
        SupplierID,
        SupplierName,
        SupplierCategoryID,
        BankAccountName,
        BankAccountNumber,
        BankInternationalCode,
        DeliveryCityID,
        DeliveryAddressLine1,
        DeliveryAddressLine2,
        DeliveryPostalCode
    )
    SELECT 
        SupplierID,
        SupplierName,
        SupplierCategoryID,
        BankAccountName,
        BankAccountNumber,
        BankInternationalCode,
        DeliveryCityID,
        DeliveryAddressLine1,
        DeliveryAddressLine2,
        DeliveryPostalCode
    FROM RAW.Suppliers
    WHERE 
        TRY_CAST(SupplierID AS INT) IS NULL
        OR TRY_CAST(SupplierName AS varchar(50)) IS NULL
        OR TRY_CAST(SupplierCategoryID AS INT) IS NULL
        OR TRY_CAST(BankAccountName AS varchar(50)) IS NULL
        OR TRY_CAST(BankAccountNumber AS varchar(12)) IS NULL
        OR TRY_CAST(BankInternationalCode AS varchar(5)) IS NULL
        OR TRY_CAST(DeliveryCityID AS varchar(5)) IS NULL
        OR TRY_CAST(DeliveryAddressLine1 AS varchar(20)) IS NULL
        OR TRY_CAST(DeliveryAddressLine2 AS varchar(100)) IS NULL
        OR TRY_CAST(DeliveryPostalCode AS varchar(5)) IS NULL;
END
GO
COMMIT

-- Procedure uitvoeren
BEGIN TRANSACTION
EXEC [dbo].[move_supplier_data]
COMMIT
