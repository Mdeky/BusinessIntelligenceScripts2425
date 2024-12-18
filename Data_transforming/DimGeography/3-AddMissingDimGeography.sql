INSERT INTO dbo.DimGeography (GeographyID, CityName, StateProvinceName, CountryName, SalesTerritory)
SELECT DISTINCT 
    C.DeliveryCityID AS GeographyID,
    'Unknown' AS CityName,
    'Unknown' AS StateProvinceName,
    'Unknown' AS CountryName,
    'Unknown' AS SalesTerritory
FROM WWI_OLTP.CLEANSED.Customers C
LEFT JOIN dbo.DimGeography DG 
    ON C.DeliveryCityID = DG.GeographyID
WHERE DG.GeographyID IS NULL
AND C.DeliveryCityID IS NOT NULL;
