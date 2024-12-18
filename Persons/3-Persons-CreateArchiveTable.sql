BEGIN TRANSACTION
GO
--tabel aanmaken
CREATE TABLE ARCHIVE.Persons
	(
	--kolommen van Countries met juiste types
      [PersonID] nvarchar(500)
      ,[FullName] nvarchar(500)
      ,[PreferredName] nvarchar(500)
      ,[LogonName] nvarchar(500)
      ,[IsEmployee] nvarchar(500)
      ,[IsSalesperson] nvarchar(500)
      ,[PhoneNumber] nvarchar(500)
      ,[EmailAddress] nvarchar(500)
      ,[OtherLanguages] nvarchar(500)
	) ON [PRIMARY];
COMMIT;