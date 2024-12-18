USE WWI_OLAP;
GO

CREATE TABLE dbo.DimSalesPerson (
    PersonID INT PRIMARY KEY,
    FullName NVARCHAR(50),
    PreferredName NVARCHAR(50),
    IsSalesperson BIT,
    EmailAddress NVARCHAR(50),
    PhoneNumber NVARCHAR(20)
);
