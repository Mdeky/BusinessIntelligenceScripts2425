WITH MissingPersons AS (
    SELECT DISTINCT O.SalespersonPersonID AS PersonID
    FROM WWI_OLTP.CLEANSED.Orders O
    LEFT JOIN dbo.DimSalesPerson DSP
        ON O.SalespersonPersonID = DSP.PersonID
    WHERE DSP.PersonID IS NULL
    AND O.SalespersonPersonID IS NOT NULL
)
INSERT INTO dbo.DimSalesPerson (
    PersonID, 
    FullName, 
    PreferredName, 
    IsSalesperson, 
    EmailAddress, 
    PhoneNumber
)
SELECT 
    PersonID,
    'Unknown' AS FullName,
    'Unknown' AS PreferredName,
    1 AS IsSalesperson,
    'Unknown' AS EmailAddress,
    'Unknown' AS PhoneNumber
FROM MissingPersons;
