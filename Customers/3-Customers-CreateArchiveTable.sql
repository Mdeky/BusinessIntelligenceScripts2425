BEGIN TRANSACTION
GO
--tabel aanmaken
CREATE TABLE ARCHIVE.Customers
    (
    --kolommen van cities met juiste types
      [CustomerID] nvarchar(500)
      ,[CustomerName] nvarchar(500)
      ,[CustomerCategoryID] nvarchar(500)
      ,[DeliveryMethodID] nvarchar(500)
      ,[DeliveryCityID] nvarchar(500)
      ,[DeliveryAddressLine1] nvarchar(500)
      ,[DeliveryAddressLine2] nvarchar(500)
      ,[DeliveryPostalCode] nvarchar(500)
    ) ON [PRIMARY]