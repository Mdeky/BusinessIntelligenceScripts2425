USE WWI_OLAP;
GO

CREATE TABLE dbo.DimProduct (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    TaxRate DECIMAL(5, 2)
);
