USE WWI_OLAP;
GO

CREATE TABLE dbo.DimGeography (
    GeographyID INT PRIMARY KEY,
    CityName NVARCHAR(50),
    StateProvinceName NVARCHAR(50),
    CountryName NVARCHAR(50),
    SalesTerritory NVARCHAR(50)
);
