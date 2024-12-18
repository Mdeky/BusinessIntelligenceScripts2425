USE WWI_OLAP;
GO

CREATE TABLE dbo.DimDate (
    DateID INT PRIMARY KEY,
    FullDate DATE,
    Year INT,
    Month INT,
    Week INT
);
