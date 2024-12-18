BEGIN TRANSACTION
GO
--tabel aanmaken
CREATE TABLE ARCHIVE.Countries
    (
    --kolommen van cities met juiste types
      [CountryID] nvarchar(500)
      ,[CountryName] nvarchar(500)
      ,[FormalName] nvarchar(500)
      ,[IsoAlpha3Code] nvarchar(500)
      ,[IsoNumericCode] nvarchar(500)
      ,[CountryType] nvarchar(500)
      ,[LatestRecordedPopulation] nvarchar(500)
      ,[Continent] nvarchar(500)
      ,[Region] nvarchar(500)
      ,[Subregion] nvarchar(500)
      ,[Border] nvarchar(500)
      ,[LastEditedBy] nvarchar(500)
    ) ON [PRIMARY]

    COMMIT TRANSACTION