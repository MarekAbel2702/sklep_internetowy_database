CREATE PROCEDURE sp_RaportSprzedazy
    @Rok INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        YEAR(DataZamowienia) AS Rok,
        MONTH(DataZamowienia) AS Miesi¹c,
        COUNT(idZamowienia) AS LiczbaZamowien,
        SUM(WartoscZamowienia) AS Sprzedaz
    FROM Zamówienia
    WHERE YEAR(DataZamowienia) = @Rok
    GROUP BY YEAR(DataZamowienia), MONTH(DataZamowienia)
    ORDER BY YEAR(DataZamowienia), MONTH(DataZamowienia);
END;
