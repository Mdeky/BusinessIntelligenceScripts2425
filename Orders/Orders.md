# Probleemstelling orders

1. orderID mag dus niet NULL zijn in de CLEANSED tabel, deze records mogen uit tbl CLEANSED.ORDERS verwijdert worden.
2. Orders waar de orderID niet correspondeert met een veld in tabel orderlines mogen ook verwijderd worden.
3. Moest er één van de volgende velden ontbreken: customerID, SalespersonPersonID, ContactPersonID, OrderDate, ExpectedDeliveryDate en pickingCompletedWhen. Dan moet dat veld vervangen worden door -1, indien het gaat over een datum best 00:00:00:00 of iets anders standaard.
