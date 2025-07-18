-- Rola administratora - pełne uprawnienia
CREATE ROLE RolaAdmin;
GRANT CONTROL ON DATABASE::SklepInternetowy TO RolaAdmin;
ALTER ROLE RolaAdmin ADD MEMBER admin;

-- Rola magazynu - może zarządzać produktami
CREATE ROLE RolaMagazyn;
GRANT SELECT, INSERT, UPDATE, DELETE ON Produkty TO RolaMagazyn;
ALTER ROLE RolaMagazyn ADD MEMBER magazyn;

-- Rola obsługi zamówień - może zarządzać zamówieniami, ale nie widzi klientów
CREATE ROLE RolaObsluga;
GRANT SELECT, UPDATE ON Zamówienia TO RolaObsluga;
GRANT SELECT ON SzczegółyZamówienia TO RolaObsluga;
ALTER ROLE RolaObsluga ADD MEMBER obsluga;

-- Rola klienta - może tylko przeglądać swoje zamówienia
CREATE ROLE RolaKlient;
GRANT SELECT ON Zamówienia TO RolaKlient;
GRANT SELECT ON SzczegółyZamówienia TO RolaKlient;
ALTER ROLE RolaKlient ADD MEMBER klient;
