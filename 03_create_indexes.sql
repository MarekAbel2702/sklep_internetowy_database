CREATE INDEX IX_Zamowienia_Klient ON Zamówienia(idKlienta);
CREATE INDEX IX_SzczegolyZamowienia_Zamowienia ON SzczegółyZamówienia(idZamowienia);
CREATE INDEX IX_SzczegolyZamowienia_Produkt ON SzczegółyZamówienia(idProduktu);
CREATE INDEX IX_Platnosci_Zamowienia ON Płatności(idZamowienia);
CREATE INDEX IX_Dostawy_Zamowienia ON Dostawy(idZamowienia);
CREATE INDEX IX_Produkty_Kategorie ON Produkty(KategoriaID)