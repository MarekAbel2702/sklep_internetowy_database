-- Rola administratora - pe�ne uprawnienia
CREATE ROLE RolaAdmin;
GRANT CONTROL ON DATABASE::SklepInternetowy TO RolaAdmin;
ALTER ROLE RolaAdmin ADD MEMBER admin;

-- Rola magazynu - mo�e zarz�dza� produktami
CREATE ROLE RolaMagazyn;
GRANT SELECT, INSERT, UPDATE, DELETE ON Produkty TO RolaMagazyn;
ALTER ROLE RolaMagazyn ADD MEMBER magazyn;

-- Rola obs�ugi zam�wie� - mo�e zarz�dza� zam�wieniami, ale nie widzi klient�w
CREATE ROLE RolaObsluga;
GRANT SELECT, UPDATE ON Zam�wienia TO RolaObsluga;
GRANT SELECT ON Szczeg�yZam�wienia TO RolaObsluga;
ALTER ROLE RolaObsluga ADD MEMBER obsluga;

-- Rola klienta - mo�e tylko przegl�da� swoje zam�wienia
CREATE ROLE RolaKlient;
GRANT SELECT ON Zam�wienia TO RolaKlient;
GRANT SELECT ON Szczeg�yZam�wienia TO RolaKlient;
ALTER ROLE RolaKlient ADD MEMBER klient;
