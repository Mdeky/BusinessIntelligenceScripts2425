BEGIN TRANSACTION

GO
-- Table creation
CREATE TABLE ARCHIVE.Suppliers
(
    [column1] NVARCHAR(500),
    [SupplierID] NVARCHAR(500),
    [SupplierName] NVARCHAR(500),
    [SupplierCategoryID] NVARCHAR(500),
    [DeliveryMethodID] NVARCHAR(500),
    [BankAccountName] NVARCHAR(500),
    [BankAccountNumber] NVARCHAR(500),
    [BankInternationalCode] NVARCHAR(500),
    [DeliveryCityID] NVARCHAR(500),
    [DeliveryAddressLine1] NVARCHAR(500),
    [DeliveryAddressLine2] NVARCHAR(500),
    [DeliveryPostalCode] NVARCHAR(500)
) ON [PRIMARY]
GO
COMMIT TRANSACTION
