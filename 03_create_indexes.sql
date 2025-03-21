CREATE INDEX IX_Zamowienia_Klient ON Zamówienia(idKlienta);
CREATE INDEX IX_SzczegolyZamowienia_Zamowienia ON Szczegó³yZamówienia(idZamowienia);
CREATE INDEX IX_SzczegolyZamowienia_Produkt ON Szczegó³yZamówienia(idProduktu);
CREATE INDEX IX_Platnosci_Zamowienia ON P³atnoœci(idZamowienia);
CREATE INDEX IX_Dostawy_Zamowienia ON Dostawy(idZamowienia);
CREATE INDEX IX_Produkty_Kategorie ON Produkty(KategoriaID)