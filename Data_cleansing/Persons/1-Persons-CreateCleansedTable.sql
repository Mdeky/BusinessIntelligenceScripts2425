BEGIN TRANSACTION
GO
--tabel aanmaken
CREATE TABLE CLEANSED.Persons
	(
	--kolommen van Countries met juiste types
      [PersonID] INT NOT NULL
      ,[FullName] nvarchar(50) NOT NULL
      ,[PreferredName] nvarchar(50) NOT NULL
      ,[LogonName] nvarchar(50) NOT NULL
      ,[IsEmployee] bit NOT NULL
      ,[IsSalesperson] bit NOT NULL
      ,[PhoneNumber] nvarchar(50) NOT NULL
      ,[EmailAddress] nvarchar(50) NOT NULL
	) ON [PRIMARY];
COMMIT;