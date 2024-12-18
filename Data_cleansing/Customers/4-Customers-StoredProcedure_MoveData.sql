-- Data van RAW naar CLEANSED verplaatsen, ongeldige data naar ARCHIVE
BEGIN TRANSACTION
GO

CREATE PROCEDURE [dbo].[move_customers_data]
AS
BEGIN

    -- Tabel CLEANSED.Customers leegmaken (niet droppen!)
    TRUNCATE TABLE CLEANSED.Customers;

    -- Data invoegen in CLEANSED.Customers, alleen records met geldige waarden
    INSERT INTO CLEANSED.Customers 
    (
        CustomerID, 
        CustomerName, 
        CustomerCategoryID, 
        DeliveryMethodID, 
        DeliveryCityID, 
        DeliveryAddressLine1, 
        DeliveryAddressLine2, 
        DeliveryPostalCode
    )
    SELECT 
        CustomerID,
        CustomerName,
        CustomerCategoryID,
        DeliveryMethodID,
        DeliveryCityID,
        DeliveryAddressLine1,
        DeliveryAddressLine2,
        DeliveryPostalCode
    FROM RAW.Customers
    WHERE 
        TRY_CAST(CustomerID AS nvarchar(50)) IS NOT NULL
        AND TRY_CAST(CustomerName AS nvarchar(50)) IS NOT NULL
        AND TRY_CAST(CustomerCategoryID AS nvarchar(50)) IS NOT NULL
        AND TRY_CAST(DeliveryMethodID AS nvarchar(50)) IS NOT NULL
        AND TRY_CAST(DeliveryCityID AS nvarchar(50)) IS NOT NULL
        AND TRY_CAST(DeliveryAddressLine1 AS nvarchar(50)) IS NOT NULL
        AND TRY_CAST(DeliveryPostalCode AS nvarchar(50)) IS NOT NULL;

    -- Data die niet voldoet aan de voorwaarden naar ARCHIVE verplaatsen
    INSERT INTO ARCHIVE.Customers 
    (
        CustomerID, 
        CustomerName, 
        CustomerCategoryID, 
        DeliveryMethodID, 
        DeliveryCityID, 
        DeliveryAddressLine1, 
        DeliveryAddressLine2, 
        DeliveryPostalCode
    )
    SELECT 
        CustomerID,
        CustomerName,
        CustomerCategoryID,
        DeliveryMethodID,
        DeliveryCityID,
        DeliveryAddressLine1,
        DeliveryAddressLine2,
        DeliveryPostalCode
    FROM RAW.Customers
    WHERE 
        TRY_CAST(CustomerID AS nvarchar(50)) IS NULL
        OR TRY_CAST(CustomerName AS nvarchar(50)) IS NULL
        OR TRY_CAST(CustomerCategoryID AS nvarchar(50)) IS NULL
        OR TRY_CAST(DeliveryMethodID AS nvarchar(50)) IS NULL
        OR TRY_CAST(DeliveryCityID AS nvarchar(50)) IS NULL
        OR TRY_CAST(DeliveryAddressLine1 AS nvarchar(50)) IS NULL
        OR TRY_CAST(DeliveryPostalCode AS nvarchar(50)) IS NULL;
END
GO
COMMIT

-- Procedure uitvoeren
BEGIN TRANSACTION
EXEC [dbo].[move_customers_data]
COMMIT
