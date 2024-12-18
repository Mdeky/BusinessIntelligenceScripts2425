BEGIN TRANSACTION
GO
--tabel aanmaken
CREATE TABLE ARCHIVE.StockItems
	(
      [StockItemID] nvarchar(500)
       ,[StockItemName] nvarchar(500)
       ,[SupplierID] nvarchar(500)
       ,[ColorID] nvarchar(500)
       ,[Brand] nvarchar(500)
       ,[Size] nvarchar(500)
       ,[TaxRate] nvarchar(500)
       ,[UnitPrice] nvarchar(500)
       ,[RecommendedRetailPrice] nvarchar(500)

	) ON [PRIMARY] 

COMMIT TRANSACTION