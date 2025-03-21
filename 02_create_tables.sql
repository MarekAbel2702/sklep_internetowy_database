-- Tabela Klienci
CREATE TABLE Klienci (
    idKlienta INT IDENTITY(1,1) PRIMARY KEY,
    Imie NVARCHAR(50) NOT NULL,
    Nazwisko NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Telefon NVARCHAR(20),
    Adres NVARCHAR(150),
    Miasto NVARCHAR(50),
    KodPocztowy NVARCHAR(10),
    PunktyLojalnosciowe INT DEFAULT 0
);

-- Tabela Kategorie
CREATE TABLE Kategorie (
    idKategorii INT IDENTITY(1,1) PRIMARY KEY,
    Nazwa NVARCHAR(100) NOT NULL UNIQUE,
    Opis NVARCHAR(MAX)
);

-- Tabela Produkty
CREATE TABLE Produkty (
    idProduktu INT IDENTITY(1,1) PRIMARY KEY,
    Nazwa NVARCHAR(150) NOT NULL,
    Opis NVARCHAR(MAX),
    CenaNetto DECIMAL(10,2) NOT NULL,
    StawkaVAT DECIMAL(4,2) NOT NULL,
    StanMagazynowy INT NOT NULL,
    KategoriaID INT NOT NULL,
    FOREIGN KEY (KategoriaID) REFERENCES Kategorie(idKategorii)
);

-- Tabela Zam�wienia
CREATE TABLE Zam�wienia (
    idZamowienia INT IDENTITY(1,1) PRIMARY KEY,
    DataZamowienia DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(50) NOT NULL CHECK (Status IN ('Nowe', 'W trakcie', 'Zrealizowane', 'Anulowane')),
    idKlienta INT NOT NULL,
    WartoscZamowienia DECIMAL(12,2) DEFAULT 0,
    FOREIGN KEY (idKlienta) REFERENCES Klienci(idKlienta)
);

-- Tabela Szczeg�yZam�wienia
CREATE TABLE Szczeg�yZam�wienia (
    idSzczegolu INT IDENTITY(1,1) PRIMARY KEY,
    idZamowienia INT NOT NULL,
    idProduktu INT NOT NULL,
    Ilosc INT NOT NULL,
    CenaJednostkowa DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (idZamowienia) REFERENCES Zam�wienia(idZamowienia),
    FOREIGN KEY (idProduktu) REFERENCES Produkty(idProduktu)
);

-- Tabela P�atno�ci
CREATE TABLE P�atno�ci (
    idPlatnosci INT IDENTITY(1,1) PRIMARY KEY,
    idZamowienia INT NOT NULL,
    Kwota DECIMAL(12,2) NOT NULL,
    MetodaPlatnosci NVARCHAR(50) CHECK (MetodaPlatnosci IN ('Karta', 'Przelew', 'BLIK', 'Got�wka')),
    StatusPlatnosci NVARCHAR(50) CHECK (StatusPlatnosci IN ('Zrealizowana', 'Oczekuje', 'Anulowana')),
    DataPlatnosci DATETIME NULL,
    FOREIGN KEY (idZamowienia) REFERENCES Zam�wienia(idZamowienia)
);

-- Tabela Dostawy
CREATE TABLE Dostawy (
    idDostawy INT IDENTITY(1,1) PRIMARY KEY,
    idZamowienia INT NOT NULL,
    MetodaDostawy NVARCHAR(50) CHECK (MetodaDostawy IN ('Kurier', 'Paczkomat', 'Odbi�r osobisty')),
    StatusDostawy NVARCHAR(50) CHECK (StatusDostawy IN ('Dostarczona', 'Wys�ana', 'Oczekuje')),
    DataWyslania DATETIME NULL,
    DataDoreczenia DATETIME NULL,
    FOREIGN KEY (idZamowienia) REFERENCES Zam�wienia(idZamowienia)
);
