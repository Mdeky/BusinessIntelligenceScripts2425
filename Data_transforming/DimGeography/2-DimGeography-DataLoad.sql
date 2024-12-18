USE WWI_OLAP;
GO

INSERT INTO dbo.DimGeography (GeographyID, CityName, StateProvinceName, CountryName, SalesTerritory)
SELECT 
    C.CityID AS GeographyID,
    C.CityName,
    SP.StateProvinceName,
    CO.CountryName,
    SP.SalesTerritory
FROM 
    WWI_OLTP.CLEANSED.Cities C
    INNER JOIN WWI_OLTP.CLEANSED.StateProvinces SP 
        ON C.StateProvinceID = SP.StateProvinceID
    INNER JOIN WWI_OLTP.CLEANSED.Countries CO 
        ON SP.StateProvinceID = CO.CountryID;
