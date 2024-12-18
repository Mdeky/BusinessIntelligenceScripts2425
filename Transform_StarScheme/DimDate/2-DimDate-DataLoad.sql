WITH DateSeries AS (
    SELECT CAST('2020-01-01' AS DATE) AS FullDate
    UNION ALL
    SELECT DATEADD(DAY, 1, FullDate)
    FROM DateSeries
    WHERE FullDate < '2030-12-31'
)
INSERT INTO dbo.DimDate (DateID, FullDate, Year, Month, Week)
SELECT 
    CAST(FORMAT(FullDate, 'yyyyMMdd') AS INT) AS DateID,
    FullDate,
    YEAR(FullDate) AS Year,
    MONTH(FullDate) AS Month,
    DATEPART(WEEK, FullDate) AS Week
FROM 
    DateSeries
OPTION (MAXRECURSION 12000);
