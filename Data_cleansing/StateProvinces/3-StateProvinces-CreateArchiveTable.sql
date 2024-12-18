BEGIN TRANSACTION
GO
--tabel aanmaken
CREATE TABLE ARCHIVE.StateProvinces
	(
	--kolommen van Countries met juiste types
      [StateProvinceID] nvarchar(500)
      ,[StateProvinceCode] nvarchar(500)
      ,[StateProvinceName] nvarchar(500)
      ,[SalesTerritory] nvarchar(500)
      ,[LatestRecordedPopulation] nvarchar(500)
	) ON [PRIMARY];
COMMIT; 