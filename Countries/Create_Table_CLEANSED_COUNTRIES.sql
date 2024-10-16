BEGIN TRANSACTION
GO
--tabel aanmaken
CREATE TABLE CLEANSED.Countries
	(
	--kolommen van Countries met juiste types
		[CountryID] varchar(50) NOT NULL
      ,[CountryName] varchar(50) NOT NULL
      ,[FormalName] varchar(100) NOT NULL
      ,[IsoAlpha3Code] varchar(50) NOT NULL
      ,[IsoNumericCode] varchar(50) NOT NULL
      ,[CountryType] varchar(50) NOT NULL
      ,[LatestRecordedPopulation] varchar(50) NOT NULL
      ,[Continent] varchar(50) NOT NULL
      ,[Region] varchar(50) NOT NULL
      ,[Subregion] varchar(50) NOT NULL
      ,[LastEditedBy] varchar(50) NOT NULL
	) ON [PRIMARY]