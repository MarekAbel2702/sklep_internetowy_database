CREATE TABLE HistoriaProduktow (
    idHist INT IDENTITY(1,1) PRIMARY KEY,
    idProduktu INT,
    DataZmiany DATETIME DEFAULT GETDATE(),
    U¿ytkownik NVARCHAR(100),
    StaraCena DECIMAL(10,2),
    NowaCena DECIMAL(10,2)
);