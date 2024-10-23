BEGIN TRANSACTION
GO
--tabel aanmaken
CREATE TABLE ARCHIVE.Orders
	(
	--kolommen van Countries met juiste types
      [column1] VARCHAR(500),
      [OrderID]VARCHAR(500),
      [CustomerID]VARCHAR(500),
      [SalespersonPersonID]VARCHAR(500),
      [ContactPersonID]VARCHAR(500),
      [OrderDate]VARCHAR(500),
      [ExpectedDeliveryDate]VARCHAR(500),
      [PickingCompletedWhen]VARCHAR(500)
	) ON [PRIMARY]
COMMIT TRANSACTION