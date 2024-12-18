USE WWI_OLAP;
GO

CREATE TABLE dbo.FactSales (
    SalesID INT PRIMARY KEY,
    QuantitySold INT,
    Revenue DECIMAL(18, 2),
    Discount DECIMAL(18, 2),
    TaxRate DECIMAL(5, 2),
    CustomerID INT FOREIGN KEY REFERENCES dbo.DimCustomers(CustomerID),
    SupplierID INT FOREIGN KEY REFERENCES dbo.DimSupplier(SupplierID),
    ProductID INT FOREIGN KEY REFERENCES dbo.DimProduct(ProductID),
    DateID INT FOREIGN KEY REFERENCES dbo.DimDate(DateID),
    GeographyID INT FOREIGN KEY REFERENCES dbo.DimGeography(GeographyID),
    PersonID INT FOREIGN KEY REFERENCES dbo.DimSalesPerson(PersonID)
);
