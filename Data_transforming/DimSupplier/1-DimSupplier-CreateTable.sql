USE WWI_OLAP;
GO

CREATE TABLE dbo.DimSupplier (
    SupplierID INT PRIMARY KEY,
    SupplierName NVARCHAR(50),
    SupplierCategoryID INT,
    BankAccountName NVARCHAR(50),
    BankAccountNumber NVARCHAR(20),
    DeliveryCityID INT,
    DeliveryAddress1 NVARCHAR(100),
    DeliveryAddress2 NVARCHAR(100),
    DeliveryPostalCode NVARCHAR(20)
);
