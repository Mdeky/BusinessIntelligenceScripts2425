UPDATE dbo.FactSales
SET PersonID = PersonID / 10
WHERE PersonID % 10 = 0; -- Controleer of er een extra nul aan het einde is
