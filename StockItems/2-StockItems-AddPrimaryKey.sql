-- primary key op de tabel zetten
ALTER TABLE CLEANSED.StockItems ADD CONSTRAINT
	PK_stockItems PRIMARY KEY CLUSTERED
	(
		[StockItemID]
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

ALTER TABLE CLEANSED.StockItems SET (LOCK_ESCALATION = TABLE)
GO