BEGIN TRANSACTION
GO
CREATE TABLE ARCHIVE.Cities
    (
    --kolommen van cities met juiste types
        [CityID] nvarchar(500) ,
        [CityName] nvarchar(500),
        [StateProvinceID] nvarchar(500)
    ) ON [PRIMARY]