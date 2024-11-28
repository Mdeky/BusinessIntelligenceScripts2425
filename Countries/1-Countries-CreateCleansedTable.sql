BEGIN TRANSACTION
GO
--tabel aanmaken
CREATE TABLE CLEANSED.Countries
	(
	--kolommen van Countries met de juiste datatypes
		[CountryID] INT NOT NULL,
		[CountryName] NVARCHAR(50) NOT NULL,
		[FormalName] NVARCHAR(100) NOT NULL,
		[IsoAlpha3Code] CHAR(3) NOT NULL,
		[IsoNumericCode] INT NOT NULL,
		[CountryType] NVARCHAR(50) NOT NULL,
		[LatestRecordedPopulation] BIGINT NOT NULL,
		[Continent] NVARCHAR(50) NOT NULL,
		[Region] NVARCHAR(50) NOT NULL,
		[Subregion] NVARCHAR(50) NOT NULL,
		[LastEditedBy] INT NOT NULL
	) ON [PRIMARY]
