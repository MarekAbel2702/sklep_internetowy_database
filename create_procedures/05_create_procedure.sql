CREATE PROCEDURE sp_TopKlienci
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT TOP 10
        K.idKlienta,
        K.Imie,
        K.Nazwisko,
        COUNT(Z.idZamowienia) AS LiczbaZamowien,
        SUM(Z.WartoscZamowienia) AS WydanePieni�dze
    FROM Klienci K
    JOIN Zam�wienia Z ON K.idKlienta = Z.idKlienta
    GROUP BY K.idKlienta, K.Imie, K.Nazwisko
    ORDER BY SUM(Z.WartoscZamowienia) DESC;
END;
