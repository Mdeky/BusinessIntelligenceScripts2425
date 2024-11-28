BEGIN TRANSACTION
GO
--tabel aanmaken
CREATE TABLE ARCHIVE.SupplierCategories
	(
	--kolommen van Countries met juiste types
      [column1] nvarchar(500)
      ,[SupplierCategoryID] nvarchar(500)
      ,[SupplierCategoryName] nvarchar(500)
      ,[LastEditedBy] nvarchar(500)
	) ON [PRIMARY] 

COMMIT TRANSACTION