-- Data van RAW naar CLEANSED verplaatsen, ongeldige data naar ARCHIVE
BEGIN TRANSACTION
GO

CREATE PROCEDURE [dbo].[move_cities_data]
AS
BEGIN

    -- Tabel CLEANSED.Cities leegmaken (niet droppen!)
    TRUNCATE TABLE CLEANSED.Cities;

    -- Data invoegen in CLEANSED.Cities, alleen records met geldige waarden
    INSERT INTO CLEANSED.Cities (CityID, CityName, StateProvinceID)
    SELECT 
        CityID,
        CityName,
        StateProvinceID
    FROM RAW.Cities
    WHERE 
        TRY_CAST(CityID AS INT) IS NOT NULL
        AND TRY_CAST(CityName AS varchar(255)) IS NOT NULL
        AND TRY_CAST(StateProvinceID AS INT) IS NOT NULL;


    -- Data die niet voldoen aan de voorwaarden naar ARCHIVE verplaatsen
    INSERT INTO ARCHIVE.Cities (CityID, CityName, StateProvinceID)
    SELECT 
        CityID,
        CityName,
        StateProvinceID
    FROM RAW.Cities
    WHERE 
        TRY_CAST(CityID AS INT) IS NULL
        OR TRY_CAST(StateProvinceID AS INT) IS NULL
        OR TRY_CAST(CityName AS varchar(255)) IS NULL;
END
GO
COMMIT

-- Procedure uitvoeren
BEGIN TRANSACTION
EXEC [dbo].[move_cities_data]
COMMIT