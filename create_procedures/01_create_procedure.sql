CREATE PROCEDURE sp_DodajZamowienie
    @idKlienta INT,
    @ProduktyZamowione NVARCHAR(MAX) -- JSON format, np. '[{"idProduktu":1, "Ilosc":2},{"idProduktu":3, "Ilosc":1}]'
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- 1. Tworzenie nowego zam�wienia
        INSERT INTO Zam�wienia (DataZamowienia, Status, idKlienta, WartoscZamowienia)
        VALUES (GETDATE(), 'Nowe', @idKlienta, 0);

        DECLARE @idZamowienia INT = SCOPE_IDENTITY();

        -- 2. Dodanie szczeg��w zam�wienia
        INSERT INTO Szczeg�yZam�wienia (idZamowienia, idProduktu, Ilosc, CenaJednostkowa)
        SELECT 
            @idZamowienia, 
            J.idProduktu, 
            J.Ilosc, 
            P.CenaNetto
        FROM OPENJSON(@ProduktyZamowione) 
        WITH (idProduktu INT, Ilosc INT) AS J
        INNER JOIN Produkty P ON P.idProduktu = J.idProduktu
        WHERE P.StanMagazynowy >= J.Ilosc; -- Zabezpieczenie przed ujemnym stanem magazynowym

        -- 3. Aktualizacja warto�ci zam�wienia
        UPDATE Zam�wienia
        SET WartoscZamowienia = (
            SELECT SUM(Ilosc * CenaJednostkowa) 
            FROM Szczeg�yZam�wienia 
            WHERE idZamowienia = @idZamowienia
        ) 
        WHERE idZamowienia = @idZamowienia;

        -- 4. Aktualizacja stan�w magazynowych
        UPDATE P
        SET P.StanMagazynowy = P.StanMagazynowy - J.Ilosc
        FROM Produkty P
        JOIN OPENJSON(@ProduktyZamowione) 
        WITH (idProduktu INT, Ilosc INT) AS J 
        ON P.idProduktu = J.idProduktu
        WHERE P.StanMagazynowy >= J.Ilosc; -- Dodatkowe zabezpieczenie

        COMMIT TRANSACTION;
        SELECT @idZamowienia AS NoweZamowienieID;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
