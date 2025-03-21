CREATE TRIGGER trg_LogowanieZmianProduktow
ON Produkty
AFTER UPDATE
AS
BEGIN
    INSERT INTO HistoriaProduktow (idProduktu, U¿ytkownik, StaraCena, NowaCena)
    SELECT i.idProduktu, SUSER_NAME(), d.CenaNetto, i.CenaNetto
    FROM inserted i
    JOIN deleted d ON i.idProduktu = d.idProduktu
    WHERE i.CenaNetto <> d.CenaNetto;
END;