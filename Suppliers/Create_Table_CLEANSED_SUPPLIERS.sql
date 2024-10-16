BEGIN TRANSACTION
GO
--tabel aanmaken
CREATE TABLE CLEANSED.Suppliers
	(
	--kolommen van cities met juiste types
		[SupplierID] int NOT NULL,
		[SupplierName] varchar(50) NOT NULL,
		[SupplierCategoryID] int NOT NULL,
		[BankAccountName] varchar(50) NOT NULL,
		[BankAccountNumber] varchar(12) NOT NULL,
		[BankInternationalCode] varchar(5) NOT NULL,
		[DeliveryCityID] varchar(5) NOT NULL,
		[DeliveryAddressLine1] varchar (20),
		[DeliveryAddressLine2] varchar (100),
		[DeliveryPostalCode] varchar (5)
	) ON [PRIMARY]