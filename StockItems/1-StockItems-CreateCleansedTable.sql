BEGIN TRANSACTION
GO
--tabel aanmaken
CREATE TABLE CLEANSED.StockItems
	(
		
		[StockItemID] int NOT NULL,
		[StockItemName] varchar(100) NOT NULL,
		[SupplierID] int NOT NULL,
		[ColorID] int NOT NULL,
		[Brand] int NOT NULL,
		[Size] varchar(10) NOT NULL,
		[TaxRate] int NOT NULL,
		[UnitPrice] int NOT NULL,
		[RecommendedRetailPrice] int NOT NULL
	) ON [PRIMARY]

COMMIT TRANSACTION