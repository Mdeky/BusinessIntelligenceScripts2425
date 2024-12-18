BEGIN TRANSACTION
GO
--tabel aanmaken
CREATE TABLE CLEANSED.Orders
	(
	--kolommen van cities met juiste types
		[OrderID] int NOT NULL,
		[CustomerID] int NOT NULL,
		[SalespersonPersonID] int NOT NULL,
		[ContactPersonID] int NOT NULL,
		[OrderDate] DATE,
		[ExpectedDeliveryDate] DATE,
		[PickingCompletedWhen] DATETIME2
	) ON [PRIMARY];
COMMIT;