# Installatiehandleiding voor WorldWideImporters Business Intelligence Project

## Inleiding

Dit project richt zich op het bouwen van een data pipeline en het maken van dynamische visualisaties in Power BI om belangrijke bedrijfsinzichten te bieden aan WorldWideImporters. Deze handleiding begeleidt je door het proces van data opschonen, transformeren, en visualiseren.

---

## Stap 1: Vereisten

### Software

- **SQL Server**: Voor databasebeheer.
- **Power BI**: Voor data-analyse en rapportage.
- **Visual Studio Code** of een andere text editor/IDE: Voor het schrijven en beheren van scripts.

### Voorbereiding

- Basiskennis van SQL, ETL-processen en ster-schemaontwerp is aanbevolen.
- Zorg dat je toegang hebt tot de vereiste datasets (CSV-bestanden) die overeenkomen met jouw groepsnummer.
- Garbage in = garbage out

---

## Stap 2: Database Initialiseren

1. **Start SQL Server**

   - Start jouw SQL Server-instance via SQL Server Management Studio.

2. **Maak databases aan**

   - Creëer twee databases genaamd `WWI_OLTP` (Online Transaction Processing) en `WWI_OLAP` (Online Analytical Processing).

3. **Laad ruwe data**
   - Download en importeer de CSV-bestanden in de `WWI_OLTP` database. Gebruik hierbij tools zoals de Import Wizard in SQL Server.

---

## Stap 3: Data Opschonen

1. **Creëer schema's**

   - Voer het script `Create Schemas.sql` uit om de juiste database-structuur op te zetten.

2. **Controleer en corrigeer data**

   - Gebruik de SQL-scripts in de folder `Data_cleansing`.
   - Ga elke map af, en voer de scripts in genummerde volgorde uit.

3. **Test**
   - Controleer de juistheid van de opgeschoonde data door steekproeven te nemen.

---

## Stap 4: Data Transformeren

1. **Dimensietabellen aanmaken**

   - Gebruik de SQL-scripts in de folder `Data_transforming`.
   - Ga elke map af, en voer de scripts in genummerde volgorde uit.

2. **Feitentabel bouwen**

   - Voer het `FactSales.sql` script om een feitentabel te maken.

3. **Valideer**
   - Controleer relaties en integriteit tussen dimensie- en feitentabellen.

---

## Stap 5: Visualisatie in Power BI

1. **Koppel Power BI aan de database**

   - Verbind Power BI met de `WWI_OLAP` database en laad de dimensie- en feitentabellen.

2. **Rapportage**

   - Maak dynamische rapporten met filters, zoals:
     - **Aantal verkochte items** (per leverancier, productcategorie, of tijdsperiode).
     - **Omzet per maand**.
     - **Kortingspercentages**.
     - **Topverkopers per regio**.
     - **Gemiddelde verwerkingstijd per leverancier**.

3. **Visualisatie**
   - Gebruik eventuele slicers in Power BI om dynamische inzichten te bieden.

---

## Stap 6: Probleemoplossing

1. **Duplicaten verwijderen**

   - Gebruik de `DISTINCT` functie in SQL-query's.

2. **Foutieve foreign keys**

   - Controleer of alle relaties tussen tabellen consistent zijn.

3. **Prestaties verbeteren**
   - Gebruik query-optimalisatie en indexen om vertragingen te voorkomen.

---

## Conclusie

Met deze handleiding kun je een volledig functionele data pipeline opzetten en interactieve dashboards maken in Power BI. Dit project biedt waardevolle inzichten in de bedrijfsvoering van WorldWideImporters en dient als basis voor toekomstige datamodellering en analyses.

---
