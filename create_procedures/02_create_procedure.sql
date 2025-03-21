CREATE PROCEDURE sp_ZmienStatusZamowienia
    @idZamowienia INT,
    @NowyStatus NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    IF NOT EXISTS (SELECT 1 FROM Zamówienia WHERE idZamowienia = @idZamowienia)
    BEGIN
        RAISERROR ('Zamówienie o podanym ID nie istnieje', 16, 1);
        RETURN;
    END

    UPDATE Zamówienia
    SET Status = @NowyStatus
    WHERE idZamowienia = @idZamowienia;
    
    PRINT 'Status zamówienia zosta³ zaktualizowany';
END;
