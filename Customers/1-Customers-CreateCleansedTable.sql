BEGIN TRANSACTION
GO
--tabel aanmaken
CREATE TABLE CLEANSED.Customers
	(
	--kolommen van Countries met juiste types
		[CustomerID] nvarchar(50) NOT NULL
      ,[CustomerName] nvarchar(50) NOT NULL
      ,[CustomerCategoryID] nvarchar(50) NOT NULL
      ,[DeliveryMethodID] nvarchar(50) NOT NULL
      ,[DeliveryCityID] nvarchar(50) NOT NULL
      ,[DeliveryAddressLine1] nvarchar(50) NOT NULL
      ,[DeliveryAddressLine2] nvarchar(50) NOT NULL
      ,[DeliveryPostalCode] nvarchar(50) NOT NULL
	) ON [PRIMARY];
COMMIT;