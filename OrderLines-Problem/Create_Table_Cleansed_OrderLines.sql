BEGIN TRANSACTION
GO

-- Tabel aanmaken voor CLEANSED.OrderLines
CREATE TABLE CLEANSED.OrderLines (
    OrderLineID INT NOT NULL,
    OrderID INT NOT NULL,
    StockItemID INT NOT NULL,
    Description VARCHAR(255) NULL,
    Quantity INT NOT NULL,
    UnitPrice FLOAT NOT NULL,
    TaxRate INT NOT NULL,
    PickingCompletedWhen DATETIME NULL
) ON [PRIMARY];

COMMIT;
GO
