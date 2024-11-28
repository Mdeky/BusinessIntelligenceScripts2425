BEGIN TRANSACTION
GO
--tabel aanmaken
CREATE TABLE CLEANSED.Cities
	(
	--kolommen van cities met juiste types
		[CityID] int NOT NULL,
		[CityName] varchar(255) NOT NULL,
		[StateProvinceID] int NOT NULL
	) ON [PRIMARY]