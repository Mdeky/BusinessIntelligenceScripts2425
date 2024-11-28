BEGIN TRANSACTION
GO
--tabel aanmaken
CREATE TABLE CLEANSED.StateProvinces
	(
	--kolommen van Countries met juiste types
		[StateProvinceID] INT NOT NULL
      ,[StateProvinceCode] nvarchar(10) NOT NULL
      ,[StateProvinceName] nvarchar(50) NOT NULL
      ,[SalesTerritory] nvarchar(300) NOT NULL
	  ,[LatestRecordedPopulation] BIGINT NOT NULL
	) ON [PRIMARY]