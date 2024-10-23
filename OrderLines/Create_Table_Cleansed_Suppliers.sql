BEGIN TRANSACTION
GO
--tabel aanmaken
CREATE TABLE CLEANSED.OrderLines
	(
	--kolommen van order lines met juiste types
	[OrderLineID] int NOT NULL
      ,[OrderID] int NOT NULL
      ,[StockItemID] int NOT NULL
      ,[Description] nvarchar(100) 
      ,[Quantity] int not NULL
      ,[UnitPrice] 
      ,[TaxRate]
      ,[PickingCompletedWhen]
	) ON [PRIMARY]