ALTER TABLE Klienci
ALTER COLUMN Email ADD MASKED WITH (FUNCTION = 'email()');

ALTER TABLE Klienci
ALTER COLUMN Telefon ADD MASKED WITH (FUNCTION = 'partial(2,"XXX-XXX",2)');

-- Testowanie ukrywania danych
SELECT * FROM Klienci;
