CREATE PROCEDURE sp_ObslugaDostawy
    @idZamowienia INT,
    @MetodaDostawy NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    IF NOT EXISTS (SELECT 1 FROM Zam�wienia WHERE idZamowienia = @idZamowienia AND Status != 'Anulowane')
    BEGIN
        RAISERROR ('Zam�wienie nie istnieje lub zosta�o anulowane', 16, 1);
        RETURN;
    END
    
    INSERT INTO Dostawy (idZamowienia, MetodaDostawy, StatusDostawy, DataWyslania)
    VALUES (@idZamowienia, @MetodaDostawy, 'Wys�ana', GETDATE());

    PRINT 'Dostawa zosta�a dodana';
END;
