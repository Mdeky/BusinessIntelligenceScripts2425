-- Data van RAW naar CLEANSED verplaatsen, ongeldige data naar ARCHIVE
BEGIN TRANSACTION
GO

CREATE PROCEDURE [dbo].[move_countries_data]
AS
BEGIN

    -- Tabel CLEANSED.Countries leegmaken (niet droppen!)
    TRUNCATE TABLE CLEANSED.Countries;

    -- Data invoegen in CLEANSED.Countries, alleen records met geldige waarden
    INSERT INTO CLEANSED.Countries 
    (
        CountryID, 
        CountryName, 
        FormalName, 
        IsoAlpha3Code, 
        IsoNumericCode, 
        CountryType, 
        LatestRecordedPopulation, 
        Continent, 
        Region, 
        Subregion, 
        LastEditedBy
    )
    SELECT 
        CountryID,
        CountryName,
        FormalName,
        IsoAlpha3Code,
        IsoNumericCode,
        CountryType,
        LatestRecordedPopulation,
        Continent,
        Region,
        Subregion,
        LastEditedBy
    FROM RAW.Countries
    WHERE 
        TRY_CAST(CountryID AS varchar(50)) IS NOT NULL
        AND TRY_CAST(CountryName AS varchar(50)) IS NOT NULL
        AND TRY_CAST(FormalName AS varchar(100)) IS NOT NULL
        AND TRY_CAST(IsoAlpha3Code AS varchar(50)) IS NOT NULL
        AND TRY_CAST(IsoNumericCode AS varchar(50)) IS NOT NULL
        AND TRY_CAST(CountryType AS varchar(50)) IS NOT NULL
        AND TRY_CAST(LatestRecordedPopulation AS varchar(50)) IS NOT NULL
        AND TRY_CAST(Continent AS varchar(50)) IS NOT NULL
        AND TRY_CAST(Region AS varchar(50)) IS NOT NULL
        AND TRY_CAST(Subregion AS varchar(50)) IS NOT NULL
        AND TRY_CAST(LastEditedBy AS varchar(50)) IS NOT NULL;

    -- Data die niet voldoet aan de voorwaarden naar ARCHIVE verplaatsen
    INSERT INTO ARCHIVE.Countries 
    (
        CountryID, 
        CountryName, 
        FormalName, 
        IsoAlpha3Code, 
        IsoNumericCode, 
        CountryType, 
        LatestRecordedPopulation, 
        Continent, 
        Region, 
        Subregion, 
        LastEditedBy,
        Border
    )
    SELECT 
        CountryID,
        CountryName,
        FormalName,
        IsoAlpha3Code,
        IsoNumericCode,
        CountryType,
        LatestRecordedPopulation,
        Continent,
        Region,
        Subregion,
        LastEditedBy,
        Border
    FROM RAW.Countries
    WHERE 
        TRY_CAST(CountryID AS varchar(50)) IS NULL
        OR TRY_CAST(CountryName AS varchar(50)) IS NULL
        OR TRY_CAST(FormalName AS varchar(100)) IS NULL
        OR TRY_CAST(IsoAlpha3Code AS varchar(50)) IS NULL
        OR TRY_CAST(IsoNumericCode AS varchar(50)) IS NULL
        OR TRY_CAST(CountryType AS varchar(50)) IS NULL
        OR TRY_CAST(LatestRecordedPopulation AS varchar(50)) IS NULL
        OR TRY_CAST(Continent AS varchar(50)) IS NULL
        OR TRY_CAST(Region AS varchar(50)) IS NULL
        OR TRY_CAST(Subregion AS varchar(50)) IS NULL
        OR TRY_CAST(LastEditedBy AS varchar(50)) IS NULL;
END
GO
COMMIT

-- Procedure uitvoeren
BEGIN TRANSACTION
EXEC [dbo].[move_countries_data]
COMMIT
