-- Data van RAW naar CLEANSED verplaatsen, ongeldige data naar ARCHIVE
BEGIN TRANSACTION
GO

CREATE PROCEDURE [dbo].[move_stateprovinces_data]
AS
BEGIN

    -- Tabel CLEANSED.StateProvinces leegmaken (niet droppen!)
    TRUNCATE TABLE CLEANSED.StateProvinces;

    -- Data invoegen in CLEANSED.StateProvinces, alleen records met geldige waarden
    INSERT INTO CLEANSED.StateProvinces 
    (
        StateProvinceID, 
        StateProvinceCode, 
        StateProvinceName, 
        SalesTerritory, 
        LatestRecordedPopulation
    )
    SELECT 
        StateProvinceID,
        StateProvinceCode,
        StateProvinceName,
        SalesTerritory,
        LatestRecordedPopulation
    FROM RAW.StateProvinces
    WHERE 
        TRY_CAST(StateProvinceID AS INT) IS NOT NULL
        AND TRY_CAST(StateProvinceCode AS nvarchar(10)) IS NOT NULL
        AND TRY_CAST(StateProvinceName AS nvarchar(50)) IS NOT NULL
        AND TRY_CAST(SalesTerritory AS nvarchar(300)) IS NOT NULL
        AND TRY_CAST(LatestRecordedPopulation AS INT) IS NOT NULL;

    -- Data die niet voldoet aan de voorwaarden naar ARCHIVE verplaatsen
    INSERT INTO ARCHIVE.StateProvinces 
    (
        StateProvinceID, 
        StateProvinceCode, 
        StateProvinceName, 
        SalesTerritory, 
        LatestRecordedPopulation
    )
    SELECT 
        StateProvinceID,
        StateProvinceCode,
        StateProvinceName,
        SalesTerritory,
        LatestRecordedPopulation
    FROM RAW.StateProvinces
    WHERE 
        TRY_CAST(StateProvinceID AS INT) IS NULL
        OR TRY_CAST(StateProvinceCode AS nvarchar(10)) IS NULL
        OR TRY_CAST(StateProvinceName AS nvarchar(50)) IS NULL
        OR TRY_CAST(SalesTerritory AS nvarchar(300)) IS NULL
        OR TRY_CAST(LatestRecordedPopulation AS INT) IS NULL;
END
GO
COMMIT

-- Procedure uitvoeren
BEGIN TRANSACTION
EXEC [dbo].[move_stateprovinces_data]
COMMIT
