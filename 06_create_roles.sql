-- Rola administratora - pe³ne uprawnienia
CREATE ROLE RolaAdmin;
GRANT CONTROL ON DATABASE::SklepInternetowy TO RolaAdmin;
ALTER ROLE RolaAdmin ADD MEMBER admin;

-- Rola magazynu - mo¿e zarz¹dzaæ produktami
CREATE ROLE RolaMagazyn;
GRANT SELECT, INSERT, UPDATE, DELETE ON Produkty TO RolaMagazyn;
ALTER ROLE RolaMagazyn ADD MEMBER magazyn;

-- Rola obs³ugi zamówieñ - mo¿e zarz¹dzaæ zamówieniami, ale nie widzi klientów
CREATE ROLE RolaObsluga;
GRANT SELECT, UPDATE ON Zamówienia TO RolaObsluga;
GRANT SELECT ON Szczegó³yZamówienia TO RolaObsluga;
ALTER ROLE RolaObsluga ADD MEMBER obsluga;

-- Rola klienta - mo¿e tylko przegl¹daæ swoje zamówienia
CREATE ROLE RolaKlient;
GRANT SELECT ON Zamówienia TO RolaKlient;
GRANT SELECT ON Szczegó³yZamówienia TO RolaKlient;
ALTER ROLE RolaKlient ADD MEMBER klient;
