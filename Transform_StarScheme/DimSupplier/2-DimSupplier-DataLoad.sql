INSERT INTO dbo.DimSupplier (
    SupplierID, 
    SupplierName, 
    SupplierCategoryID, 
    BankAccountName, 
    BankAccountNumber, 
    DeliveryCityID, 
    DeliveryAddress1, 
    DeliveryAddress2, 
    DeliveryPostalCode
)
SELECT 
    SupplierID, 
    SupplierName, 
    SupplierCategoryID, 
    BankAccountName, 
    BankAccountNumber, 
    CAST(DeliveryCityID AS INT) AS DeliveryCityID, 
    DeliveryAddressLine1 AS DeliveryAddress1, 
    DeliveryAddressLine2 AS DeliveryAddress2, 
    DeliveryPostalCode
FROM 
    WWI_OLTP.CLEANSED.Suppliers;
