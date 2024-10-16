-- Data van RAW naar CLEANSED verplaatsen, ongeldige data naar ARCHIVE
BEGIN TRANSACTION
GO

CREATE PROCEDURE [dbo].[move_persons_data]
AS
BEGIN

    -- Tabel CLEANSED.Persons leegmaken (niet droppen!)
    TRUNCATE TABLE CLEANSED.Persons;

    -- Data invoegen in CLEANSED.Persons, alleen records met geldige waarden en zonder duplicaten
    INSERT INTO CLEANSED.Persons 
    (
        PersonID, 
        FullName, 
        PreferredName, 
        LogonName, 
        IsEmployee, 
        IsSalesperson, 
        PhoneNumber, 
        EmailAddress
    )
    SELECT DISTINCT
        PersonID,
        FullName,
        PreferredName,
        LogonName,
        IsEmployee,
        IsSalesperson,
        PhoneNumber,
        EmailAddress
    FROM RAW.Persons
    WHERE 
        TRY_CAST(PersonID AS INT) IS NOT NULL
        AND TRY_CAST(FullName AS nvarchar(50)) IS NOT NULL
        AND TRY_CAST(PreferredName AS nvarchar(50)) IS NOT NULL
        AND TRY_CAST(LogonName AS nvarchar(50)) IS NOT NULL
        AND TRY_CAST(IsEmployee AS bit) IS NOT NULL
        AND TRY_CAST(IsSalesperson AS bit) IS NOT NULL
        AND TRY_CAST(PhoneNumber AS nvarchar(50)) IS NOT NULL
        AND TRY_CAST(EmailAddress AS nvarchar(50)) IS NOT NULL
        AND PersonID NOT IN (SELECT PersonID FROM CLEANSED.Persons); -- Dit zorgt ervoor dat er geen duplicaten worden ingevoegd.

    -- Data die niet voldoet aan de voorwaarden naar ARCHIVE verplaatsen (inclusief 'OtherLanguages')
    INSERT INTO ARCHIVE.Persons 
    (
        PersonID, 
        FullName, 
        PreferredName, 
        LogonName, 
        IsEmployee, 
        IsSalesperson, 
        PhoneNumber, 
        EmailAddress,
        OtherLanguages
    )
    SELECT 
        PersonID,
        FullName,
        PreferredName,
        LogonName,
        IsEmployee,
        IsSalesperson,
        PhoneNumber,
        EmailAddress,
        OtherLanguages
    FROM RAW.Persons
    WHERE 
        TRY_CAST(PersonID AS INT) IS NULL
        OR TRY_CAST(FullName AS nvarchar(50)) IS NULL
        OR TRY_CAST(PreferredName AS nvarchar(50)) IS NULL
        OR TRY_CAST(LogonName AS nvarchar(50)) IS NULL
        OR TRY_CAST(IsEmployee AS bit) IS NULL
        OR TRY_CAST(IsSalesperson AS bit) IS NULL
        OR TRY_CAST(PhoneNumber AS nvarchar(50)) IS NULL
        OR TRY_CAST(EmailAddress AS nvarchar(50)) IS NULL;
END
GO
COMMIT

-- Procedure uitvoeren
BEGIN TRANSACTION
EXEC [dbo].[move_persons_data]
COMMIT
