-- primary key op de tabel zetten
ALTER TABLE CLEANSED.Cities ADD CONSTRAINT
	PK_cities PRIMARY KEY CLUSTERED
	(
		[CityId]
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

ALTER TABLE CLEANSED.Cities SET (LOCK_ESCALATION = TABLE)
GO