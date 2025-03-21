-- Tworzenie loginów w SQL Server
CREATE LOGIN admin WITH PASSWORD = 'Admin123!', CHECK_POLICY = ON;
CREATE LOGIN magazyn WITH PASSWORD = 'Magazyn123!', CHECK_POLICY = ON;
CREATE LOGIN obsluga WITH PASSWORD = 'Obsluga123!', CHECK_POLICY = ON;
CREATE LOGIN klient WITH PASSWORD = 'Klient123!', CHECK_POLICY = ON;

-- Przypisanie u¿ytkowników do bazy SklepInternetowy
USE SklepInternetowy;
CREATE USER admin FOR LOGIN admin;
CREATE USER magazyn FOR LOGIN magazyn;
CREATE USER obsluga FOR LOGIN obsluga;
CREATE USER klient FOR LOGIN klient;
