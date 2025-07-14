# Sklep Internetowy – Baza Danych (MS SQL Server)

To repozytorium zawiera strukturę bazy danych dla sklepu internetowego, zaprojektowaną z myślą o pracy z **Microsoft SQL Server**. Projekt obejmuje definicje tabel, relacje, klucze obce oraz przykładowe dane.

## Zawartość repozytorium

- `sklep_internetowy.sql` – główny skrypt SQL do utworzenia bazy i jej struktury
- (Opcjonalnie) `diagram.png` – diagram ERD (jeśli dołączysz)
- (Opcjonalnie) `przykladowe_dane.sql` – dodatkowe dane testowe

## Struktura bazy danych

Baza składa się z następujących tabel:

| Tabela               | Opis                                            |
|----------------------|--------------------------------------------------|
| `Klienci`            | Dane klientów: imię, nazwisko, e-mail, telefon |
| `Produkty`           | Informacje o produktach: nazwa, cena, stan     |
| `Kategorie`          | Kategorie produktów                             |
| `Zamowienia`         | Historia zamówień klientów                      |
| `SzczegolyZamowienia`| Szczegóły pozycji w zamówieniu                  |
| `Platnosci`          | Informacje o płatnościach                       |
| `Dostawy`            | Dane dotyczące dostaw                          |

Relacje między tabelami są stworzone przy użyciu kluczy obcych (`FOREIGN KEY`).

## ⚙️ Wymagania

- **Microsoft SQL Server** (dowolna wersja, np. 2019+)
- **SQL Server Management Studio (SSMS)** lub inne IDE zgodne z T-SQL
- Konto z uprawnieniami do tworzenia baz danych i tabel
