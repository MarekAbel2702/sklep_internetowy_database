CREATE INDEX IX_Zamowienia_Klient ON Zam�wienia(idKlienta);
CREATE INDEX IX_SzczegolyZamowienia_Zamowienia ON Szczeg�yZam�wienia(idZamowienia);
CREATE INDEX IX_SzczegolyZamowienia_Produkt ON Szczeg�yZam�wienia(idProduktu);
CREATE INDEX IX_Platnosci_Zamowienia ON P�atno�ci(idZamowienia);
CREATE INDEX IX_Dostawy_Zamowienia ON Dostawy(idZamowienia);
CREATE INDEX IX_Produkty_Kategorie ON Produkty(KategoriaID)