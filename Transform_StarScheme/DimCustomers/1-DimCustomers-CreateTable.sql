USE WWI_OLAP;
GO

CREATE TABLE dbo.DimCustomers (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(100),
    CustomerCategoryID INT,
    DeliveryMethodID INT,
    DeliveryCityID INT,
    DeliveryAddress1 NVARCHAR(100),
    DeliveryPostalCode NVARCHAR(20)
);
