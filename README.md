# Beknopte Installatiehandleiding

## Stap 1: Vereisten

### Software

- **SQL Server** ![image](https://github.com/user-attachments/assets/aae148e3-e8e0-423a-9e52-bb9d030f88a2)

- **Power BI**   ![image](https://github.com/user-attachments/assets/ec7007a3-c5c7-42bb-8bc6-c0816f857dc0)

- **Text Editor/IDE** zoals Visual Studio Code ![image](https://github.com/user-attachments/assets/93611e87-1895-4e57-949c-4f0bdb86b1cc)


### Voorbereiding

- Zorg dat je basiskennis hebt van SQL en ETL-processen.
- Keep in mind: Garbage in, Garbage out!

---

## Stap 2: Database Initialiseren

1. Start je SQL Server-instance.
2. Maak 2 nieuwe databases aan, genaamd WWI_OLTP en WWI_OLAP

---

## Stap 3: Data Cleansing

1. **Creëer schema's**:
   - Voer het script `Create Schemas.sql` uit in de database.
2. **Laad ruwe data**:
   - In alle mapjes onder `Data_cleansing` staan 4 scripts.
   - Elk sctipt is genummerd van 1 tot 4.
   - Voer eerst script-1 uit, dan 2, 3 en als laatste 4.
3. **Opschonen van data**:
   - Gebruik SQL-scripts om fouten zoals duplicaten en inconsistenties te corrigeren.

---

## Stap 4: Data Transformeren

1. **Dimensietabellen maken**:
   - Voer scripts uit zoals `DimCustomers` en `DimDate` om dimensietabellen aan te maken.
2. **Feitentabellen maken**:
   - Gebruik `FactSales` om een feitentabel op te zetten.
3. **Optimalisatie**:
   - Voeg indexen toe voor snellere query-prestaties.

---

## Stap 5: Visualisatie

1. Open Power BI en koppel deze aan je database.
2. Gebruik dimensie- en feitentabellen om sterdiagrammen en rapporten te bouwen.

---

## Probleemoplossing

- **Duplicaten verwijderen**:
  - Gebruik `DISTINCT` in je query's.
- **Fouten in foreign keys**:
  - Controleer dat alle koppelingen tussen tabellen correct zijn.

---

## Conclusie

Met deze stappen kun je snel een data pipeline opzetten en visualisaties maken in Power BI.
