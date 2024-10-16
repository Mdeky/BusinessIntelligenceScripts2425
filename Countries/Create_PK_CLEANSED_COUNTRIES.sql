-- primary key op de tabel zetten
ALTER TABLE CLEANSED.Countries ADD CONSTRAINT
	PK_countries PRIMARY KEY CLUSTERED
	(
		[CountryID]
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

ALTER TABLE CLEANSED.Countries SET (LOCK_ESCALATION = TABLE)
GO