BEGIN TRANSACTION

GO
-- Table creation
CREATE TABLE ARCHIVE.OrderLines
(
    [OrderLineID] NVARCHAR(500),
    [OrderID] NVARCHAR(500),
    [StockItemID] NVARCHAR(500),
    [Description] NVARCHAR(500),
    [Quantity] NVARCHAR(500),
    [UnitPrice] NVARCHAR(500),
    [TaxRate] NVARCHAR(500),
    [PickingCompletedWhen] NVARCHAR(500)
) ON [PRIMARY]
GO
COMMIT TRANSACTION
