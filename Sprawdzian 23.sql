select * from klienci

SELECT * FROM OSOBISTE

--------------------------------------------
--Zadanie 1 - Działa
--wyswietl imie i nazwisko w jednej kolumnie oraz w drugiej Miasto, ulice, numer i kod miasta (tabela klienci)

select concat(IMIE, " ", Nazwisko) as Imie_Nazwisko, concat(MIASTO, " ", ULICA, " ", NUMER, " ", KOD) as Duzorzeczy from klienci;

-----------------------------------------------------------
--Zadanie 2 - 
---Z kolumny Imie wybierz tylko pierwsz� liter�, jak poni�ej  oraz wyswietl firm� pomi� puste pola(tabela klienci)

select concat(left(Imie,  1)," . ", Nazwisko) as Inicjal_Imienia, firma from klienci where firma != "NULL";

----------------------------------------------------------
--Zadanie 3
--Wy�wietl imiona pracownik�w z ma�ej litery, nazwiska z wielkich liter oraz podaj ile jest znak�w w nazwisku (tabela klienci)

select LOWER(IMIE) as male, UPPER(NAZWISKO) as wielkie, LENGTH(NAZWISKO) as Ilosc_znakow from klienci;

----------------------------------------------------------
--Zadanie 4
---Wyswietl nazwisko i im� oraz z kolumny NR_karty_kredyt zostaw tylko Litery (tabela klienci)

select nazwisko, imie ,left(NR_karty_kredyt, 2)as Litery_karty from klienci where NR_KARTY_KREDYT is not null;

----------------------------------------------------------
--Zadanie 5
---Wyswietl nazwisko i im� oraz z kolumny NR_karty_kredyt zostaw tylko liczby (tabela klienci)

select nazwisko, imie ,Nr_karty_kredyt, right(Nr_karty_kredyt, 8) as 'Numer karty' from klienci where NR_KARTY_KREDYT is not null;

----------------------------------------------------------
--Zadanie 6
---Wswietl tylko te osoby kt�re posiadaj� drugie imi� �acz�c imie pierwsze z drugim w kolumnie IMIONA oraz nazwisko tych os�b (tabela osobiste)

select UPPER(concat(IMIE, " ",  Drugie_imie)) as Imiona, UPPER(NAZWISKO) as Nazwisko from OSOBISTE where Drugie_imie != "NULL";	

----------------------------------------------------------
--Zadanie 7
--Wyswietl tylko te osoby Kt�re urodzi�y sie w czerwcu (tabela osobiste)

select UPPER(NAZWISKO) as nazwisko, UPPER(IMIE) as imie, Data_urodzenia as dzien_urodzin from OSOBISTE where MONTH(Data_urodzenia) = 6;

----------------------------------------------------------
--Zadanie 8
-- Wylicz ile dana osoba z imienia i nazwiska ma lat (tabela osobiste)

select imie, nazwisko, data_urodzenia, (YEAR(CURRENT_DATE()) - YEAR(data_urodzenia)) as 'liczba lat' from osobiste;

----------------------------------------------------------
--Zadanie 9
--Policz z ilu znak�w ska�da sie nazwisko i imiona danej osoby  pomi� warto�ci null (tabela osobiste)

select CONCAT(IMIE, " ", Drugie_imie, " ", NAZWISKO) as razem, LENGTH(CONCAT(IMIE, NAZWISKO, Drugie_imie)) as Ilosc_znakow from osobiste where IMIE is not null and NAZWISKO is not null and Drugie_imie is not null;

----------------------------------------------------------
--Zadanie 10

--Wyswietl tylko te osoby Kt�re urodzi�y sie  po 15 dniu danego miesiaca (tabela osobiste)

select NAZWISKO, IMIE, Data_urodzenia from osobiste where day(Data_urodzenia) > 15;

------------------------------------------------

--zadanie 11
--Wyswietl tylko te osoby , kt�re urodzi�y sie przed 1999 rokiem (tabela osobiste)

select NAZWISKO, IMIE, Data_urodzenia from osobiste where year(Data_urodzenia) < 1999;

---------------------------------------------

--Zadanie12

---Przypisz do Nr_karty_kredyrtowej rok urodzenia klienta  (tabela osobiste, klienci)

select klienci.nazwisko, klienci.imie, klienci.NR_karty_kredyt , osobiste.data_urodzenia 
from klienci join osobiste on klienci.nr_klienta=osobiste.nr_klienta where klienci.NR_karty_kredyt != "NULL";



select klienci.nazwisko, klienci.imie, klienci.NR_karty_kredyt , osobiste.data_urodzenia , concat(year(osobiste.data_urodzenia),' ',`NR_KARTY_KREDYT`) as 'ROK' 
from klienci join osobiste on klienci.nr_klienta=osobiste.nr_klienta where klienci.NR_karty_kredyt != "NULL";