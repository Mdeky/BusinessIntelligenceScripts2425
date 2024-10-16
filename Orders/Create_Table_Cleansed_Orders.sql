BEGIN TRANSACTION
GO
--tabel aanmaken
CREATE TABLE CLEANSED.Orders
	(
	--kolommen van cities met juiste types
		[OrderID] int NOT NULL,
		[CustomerID] int NOT NULL,
		[SalespersonID] int NOT NULL,
		[ContactPersonID] int NOT NULL,
		[OrderDate] DATE,
		[ExpectedDeliveryDate] DATE,
		[PickingCompletedWhen] DATETIME
	) ON [PRIMARY]

COMMIT TRANSACTION