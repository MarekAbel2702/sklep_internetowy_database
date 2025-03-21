CREATE PROCEDURE sp_ObslugaDostawy
    @idZamowienia INT,
    @MetodaDostawy NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    IF NOT EXISTS (SELECT 1 FROM Zamówienia WHERE idZamowienia = @idZamowienia AND Status != 'Anulowane')
    BEGIN
        RAISERROR ('Zamówienie nie istnieje lub zosta³o anulowane', 16, 1);
        RETURN;
    END
    
    INSERT INTO Dostawy (idZamowienia, MetodaDostawy, StatusDostawy, DataWyslania)
    VALUES (@idZamowienia, @MetodaDostawy, 'Wys³ana', GETDATE());

    PRINT 'Dostawa zosta³a dodana';
END;
