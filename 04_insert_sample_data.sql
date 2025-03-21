USE SklepInternetowy;
GO

-- Dodawanie przyk³adowych kategorii
INSERT INTO Kategorie (Nazwa, Opis) VALUES
('Elektronika', 'Smartfony, laptopy, tablety'),
('Odzie¿', 'Ubrania dla kobiet, mê¿czyzn i dzieci'),
('Ksi¹¿ki', 'Ksi¹¿ki drukowane i e-booki'),
('AGD', 'Sprzêt AGD: lodówki, pralki, zmywarki');

-- Dodawanie przyk³adowych klientów
INSERT INTO Klienci (Imie, Nazwisko, Email, Telefon, Adres, Miasto, KodPocztowy, PunktyLojalnosciowe) VALUES
('Jan', 'Kowalski', 'jan.kowalski@gmail.com', '501502503', 'ul. Warszawska 10', 'Warszawa', '00-001', 100),
('Anna', 'Nowak', 'anna.nowak@gmail.com', '601602603', 'ul. Krakowska 12', 'Kraków', '30-001', 200);

-- Dodawanie przyk³adowych produktów
INSERT INTO Produkty (Nazwa, Opis, CenaNetto, StawkaVAT, StanMagazynowy, KategoriaID) VALUES
('iPhone 15', 'Smartfon Apple 256GB', 4500.00, 23, 30, 1),
('Samsung Galaxy S23', 'Flagowy smartfon Samsung', 3800.00, 23, 25, 1),
('Laptop Dell XPS 15', 'Laptop do pracy i gier', 7200.00, 23, 15, 1),
('Nike Air Max', 'Sportowe buty Nike', 450.00, 23, 50, 2);

-- Dodawanie przyk³adowych zamówieñ
INSERT INTO Zamówienia (idKlienta, Status, WartoscZamowienia)
VALUES (1, 'Nowe', 4500.00), (2, 'Zrealizowane', 3800.00);

-- Dodawanie szczegó³ów zamówieñ
INSERT INTO Szczegó³yZamówienia (idZamowienia, idProduktu, Ilosc, CenaJednostkowa)
VALUES (1, 1, 1, 4500.00), (2, 2, 1, 3800.00);

-- Dodawanie przyk³adowych p³atnoœci
INSERT INTO P³atnoœci (idZamowienia, Kwota, MetodaPlatnosci, StatusPlatnosci, DataPlatnosci)
VALUES (1, 4500.00, 'Karta', 'Zrealizowana', '2024-03-10');

-- Dodawanie przyk³adowych dostaw
INSERT INTO Dostawy (idZamowienia, MetodaDostawy, StatusDostawy, DataWyslania, DataDoreczenia)
VALUES (1, 'Kurier', 'Dostarczona', '2024-03-11', '2024-03-12');
