INSERT INTO dbo.DimCustomers (
    CustomerID, 
    CustomerName, 
    CustomerCategoryID, 
    DeliveryMethodID, 
    DeliveryCityID, 
    DeliveryAddress1, 
    DeliveryPostalCode
)
SELECT 
    CAST(CustomerID AS INT) AS CustomerID, 
    CustomerName, 
    CAST(CustomerCategoryID AS INT) AS CustomerCategoryID, 
    CAST(DeliveryMethodID AS INT) AS DeliveryMethodID, 
    CAST(DeliveryCityID AS INT) AS DeliveryCityID, 
    DeliveryAddressLine1 AS DeliveryAddress1, 
    DeliveryPostalCode
FROM 
    WWI_OLTP.CLEANSED.Customers;
