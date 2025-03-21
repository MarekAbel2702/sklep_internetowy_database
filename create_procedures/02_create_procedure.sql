CREATE PROCEDURE sp_ZmienStatusZamowienia
    @idZamowienia INT,
    @NowyStatus NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    IF NOT EXISTS (SELECT 1 FROM Zam�wienia WHERE idZamowienia = @idZamowienia)
    BEGIN
        RAISERROR ('Zam�wienie o podanym ID nie istnieje', 16, 1);
        RETURN;
    END

    UPDATE Zam�wienia
    SET Status = @NowyStatus
    WHERE idZamowienia = @idZamowienia;
    
    PRINT 'Status zam�wienia zosta� zaktualizowany';
END;
