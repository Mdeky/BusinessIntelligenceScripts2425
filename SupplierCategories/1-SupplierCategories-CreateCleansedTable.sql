BEGIN TRANSACTION
GO
--tabel aanmaken
CREATE TABLE CLEANSED.SupplierCategories
	(
	--kolommen van cities met juiste types
		[SupplierCategoryID] int NOT NULL,
		[SupplierCategoryName] varchar(50) NOT NULL,
		[LastEditedBy] int NOT NULL
	) ON [PRIMARY]

COMMIT TRANSACTION