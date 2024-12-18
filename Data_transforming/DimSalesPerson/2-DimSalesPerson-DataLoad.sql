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
    FullName, 
    PreferredName, 
    IsSalesperson, 
    EmailAddress, 
    PhoneNumber
FROM 
    WWI_OLTP.CLEANSED.Persons

