-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Paź 26, 2025 at 05:20 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `warsztat_samochodowy`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `czas_pracy`
--

CREATE TABLE `czas_pracy` (
  `id_czasu` int(11) NOT NULL,
  `id_pracownika` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `godz_rozpoczecia` time DEFAULT NULL,
  `godz_zakonczenia` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `czesci`
--

CREATE TABLE `czesci` (
  `id_czesci` int(11) NOT NULL,
  `nazwa` varchar(100) DEFAULT NULL,
  `producent` varchar(100) DEFAULT NULL,
  `cena_netto` decimal(10,2) DEFAULT NULL,
  `stan_magazynowy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `czesci`
--

INSERT INTO `czesci` (`id_czesci`, `nazwa`, `producent`, `cena_netto`, `stan_magazynowy`) VALUES
(1, 'Filtr oleju', 'Bosch', 45.00, 20),
(2, 'Klocki hamulcowe', 'ATE', 150.00, 30),
(3, 'Amortyzator przód', 'Monroe', 220.00, 12),
(4, 'Żarówka H7', 'Philips', 25.00, 40),
(5, 'Uszczelka głowicy', 'Elring', 110.00, 10),
(6, 'Filtr powietrza', 'Mann', 55.00, 25),
(7, 'Świeca zapłonowa', 'NGK', 30.00, 35),
(8, 'Tarcze hamulcowe', 'Zimmermann', 200.00, 15),
(9, 'Płyn chłodniczy 5L', 'Prestone', 60.00, 18),
(10, 'Wydech końcowy', 'Walker', 340.00, 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `czesci_naprawy`
--

CREATE TABLE `czesci_naprawy` (
  `id_naprawy` int(11) NOT NULL,
  `id_czesci` int(11) NOT NULL,
  `ilosc` int(11) DEFAULT NULL,
  `cena_sprzedazy` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `czesci_zakupy`
--

CREATE TABLE `czesci_zakupy` (
  `id_faktury_zakupu` int(11) NOT NULL,
  `id_czesci` int(11) NOT NULL,
  `ilosc` int(11) DEFAULT NULL,
  `cena_zakupu` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dostawcy`
--

CREATE TABLE `dostawcy` (
  `id_dostawcy` int(11) NOT NULL,
  `nazwa` varchar(100) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `adres` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `faktury`
--

CREATE TABLE `faktury` (
  `id_faktury` int(11) NOT NULL,
  `id_klienta` int(11) DEFAULT NULL,
  `data_wystawienia` date DEFAULT NULL,
  `typ_dokumentu` enum('Faktura VAT','Paragon') DEFAULT NULL,
  `kwota_brutto` decimal(10,2) DEFAULT NULL,
  `kwota_vat` decimal(10,2) DEFAULT NULL,
  `forma_platnosci` enum('Gotówka','Karta','Przelew') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faktury`
--

INSERT INTO `faktury` (`id_faktury`, `id_klienta`, `data_wystawienia`, `typ_dokumentu`, `kwota_brutto`, `kwota_vat`, `forma_platnosci`) VALUES
(1, 1, '2024-07-12', 'Faktura VAT', 530.00, 122.00, 'Karta'),
(2, 2, '2024-07-15', 'Faktura VAT', 860.00, 198.00, 'Gotówka'),
(3, 3, '2024-07-18', 'Paragon', 210.00, 48.00, 'Gotówka'),
(4, 4, '2024-07-20', 'Faktura VAT', 1250.00, 287.00, 'Przelew'),
(5, 5, '2024-07-25', 'Paragon', 340.00, 78.00, 'Gotówka'),
(6, 6, '2024-07-26', 'Faktura VAT', 760.00, 175.00, 'Karta'),
(7, 7, '2024-07-28', 'Faktura VAT', 650.00, 149.00, 'Gotówka'),
(8, 8, '2024-07-30', 'Paragon', 190.00, 43.00, 'Gotówka');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `faktury_zakupowe`
--

CREATE TABLE `faktury_zakupowe` (
  `id_faktury_zakupu` int(11) NOT NULL,
  `id_dostawcy` int(11) DEFAULT NULL,
  `data_zakupu` date DEFAULT NULL,
  `kwota_brutto` decimal(10,2) DEFAULT NULL,
  `kwota_vat` decimal(10,2) DEFAULT NULL,
  `forma_platnosci` enum('Gotówka','Karta','Przelew') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kampanie_reklamowe`
--

CREATE TABLE `kampanie_reklamowe` (
  `id_kampanii` int(11) NOT NULL,
  `nazwa` varchar(100) DEFAULT NULL,
  `typ` enum('E-mail','SMS') DEFAULT NULL,
  `data_rozpoczecia` date DEFAULT NULL,
  `data_zakonczenia` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id_klienta` int(11) NOT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `adres` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`id_klienta`, `imie`, `nazwisko`, `telefon`, `email`, `adres`) VALUES
(1, 'Jan', 'Kowalski', '501234567', 'jan.kowalski@gmail.com', 'Poznań, ul. Polna 3'),
(2, 'Anna', 'Nowak', '602111222', 'anna.nowak@wp.pl', 'Warszawa, ul. Słoneczna 12'),
(3, 'Paweł', 'Zieliński', '507888999', 'pawelz@onet.pl', 'Gdańsk, ul. Długa 22'),
(4, 'Karolina', 'Wiśniewska', '606444333', 'karolina.wisniewska@gmail.com', 'Kraków, ul. Lipowa 8'),
(5, 'Marek', 'Kaczmarek', '509555666', 'marek.kaczmarek@interia.pl', 'Łódź, ul. Kopernika 5'),
(6, 'Monika', 'Lewandowska', '608777444', 'monika.lew@wp.pl', 'Wrocław, ul. Odrzańska 7'),
(7, 'Tomasz', 'Wójcik', '501222111', 'tomasz.wojcik@gmail.com', 'Lublin, ul. Piaskowa 10'),
(8, 'Ewa', 'Szymańska', '604999888', 'ewa.szymanska@onet.pl', 'Szczecin, ul. Różana 11');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci_kampanie`
--

CREATE TABLE `klienci_kampanie` (
  `id_klienta` int(11) NOT NULL,
  `id_kampanii` int(11) NOT NULL,
  `data_wyslania` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `naprawy`
--

CREATE TABLE `naprawy` (
  `id_naprawy` int(11) NOT NULL,
  `id_samochodu` int(11) DEFAULT NULL,
  `id_pracownika` int(11) DEFAULT NULL,
  `id_faktury` int(11) DEFAULT NULL,
  `data_rozpoczecia` date DEFAULT NULL,
  `data_zakonczenia` date DEFAULT NULL,
  `opis_usterki` varchar(255) DEFAULT NULL,
  `opis_naprawy` varchar(255) DEFAULT NULL,
  `koszt_robocizny` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `naprawy`
--

INSERT INTO `naprawy` (`id_naprawy`, `id_samochodu`, `id_pracownika`, `id_faktury`, `data_rozpoczecia`, `data_zakonczenia`, `opis_usterki`, `opis_naprawy`, `koszt_robocizny`) VALUES
(1, 1, 1, 1, '2024-07-10', '2024-07-12', 'Wyciek oleju spod silnika', 'Wymiana filtra i uszczelki', 200.00),
(2, 2, 4, 2, '2024-07-13', '2024-07-15', 'Hałas przy hamowaniu', 'Wymiana klocków i tarcz hamulcowych', 300.00),
(3, 3, 2, 3, '2024-07-16', '2024-07-18', 'Brak świateł mijania', 'Wymiana żarówek H7', 80.00),
(4, 4, 1, 4, '2024-07-18', '2024-07-20', 'Nieszczelność układu chłodzenia', 'Wymiana uszczelki głowicy', 500.00),
(5, 5, 7, 5, '2024-07-22', '2024-07-25', 'Wymiana amortyzatorów', 'Przód i tył', 250.00),
(6, 6, 5, 6, '2024-07-24', '2024-07-26', 'Problem z rozruchem', 'Wymiana świec i filtra paliwa', 180.00),
(7, 7, 1, 7, '2024-07-27', '2024-07-28', 'Hałas w zawieszeniu', 'Wymiana tulei i smarowanie', 220.00),
(8, 8, 8, 8, '2024-07-29', '2024-07-30', 'Mycie zewnętrzne + wnętrze', 'Kompleksowa usługa myjni', 100.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `id_pracownika` int(11) NOT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `stanowisko` varchar(50) DEFAULT NULL,
  `data_zatrudnienia` date DEFAULT NULL,
  `wynagrodzenie` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pracownicy`
--

INSERT INTO `pracownicy` (`id_pracownika`, `imie`, `nazwisko`, `stanowisko`, `data_zatrudnienia`, `wynagrodzenie`) VALUES
(1, 'Piotr', 'Lis', 'Mechanik', '2021-05-10', 5200.00),
(2, 'Adam', 'Mazur', 'Elektryk samochodowy', '2020-03-15', 4800.00),
(3, 'Katarzyna', 'Kowalczyk', 'Recepcjonistka', '2022-01-20', 4200.00),
(4, 'Michał', 'Witkowski', 'Diagnosta', '2019-10-01', 5500.00),
(5, 'Patryk', 'Grabowski', 'Lakiernik', '2021-07-18', 5000.00),
(6, 'Natalia', 'Pawlak', 'Księgowa', '2020-02-05', 4600.00),
(7, 'Jakub', 'Michalski', 'Mechanik', '2021-06-14', 5100.00),
(8, 'Agnieszka', 'Król', 'Myjnia', '2022-03-10', 4000.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `raporty_kasowe`
--

CREATE TABLE `raporty_kasowe` (
  `id_raportu` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `suma_sprzedazy` decimal(10,2) DEFAULT NULL,
  `liczba_paragonow` int(11) DEFAULT NULL,
  `liczba_faktur` int(11) DEFAULT NULL,
  `utworzyl` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samochody`
--

CREATE TABLE `samochody` (
  `id_samochodu` int(11) NOT NULL,
  `id_klienta` int(11) DEFAULT NULL,
  `marka` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `rok_produkcji` year(4) DEFAULT NULL,
  `nr_rejestracyjny` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `samochody`
--

INSERT INTO `samochody` (`id_samochodu`, `id_klienta`, `marka`, `model`, `rok_produkcji`, `nr_rejestracyjny`) VALUES
(1, 1, 'Opel', 'Astra', '2015', 'PO12345'),
(2, 2, 'Toyota', 'Corolla', '2018', 'WA67890'),
(3, 3, 'Volkswagen', 'Golf', '2017', 'GD11111'),
(4, 4, 'Renault', 'Clio', '2019', 'KR54321'),
(5, 5, 'Ford', 'Focus', '2016', 'EL33333'),
(6, 6, 'Skoda', 'Octavia', '2020', 'DW44444'),
(7, 7, 'Fiat', 'Tipo', '2019', 'LU22222'),
(8, 8, 'Hyundai', 'i30', '2021', 'ZS55555');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `czas_pracy`
--
ALTER TABLE `czas_pracy`
  ADD PRIMARY KEY (`id_czasu`),
  ADD KEY `id_pracownika` (`id_pracownika`);

--
-- Indeksy dla tabeli `czesci`
--
ALTER TABLE `czesci`
  ADD PRIMARY KEY (`id_czesci`);

--
-- Indeksy dla tabeli `czesci_naprawy`
--
ALTER TABLE `czesci_naprawy`
  ADD PRIMARY KEY (`id_naprawy`,`id_czesci`),
  ADD KEY `id_czesci` (`id_czesci`);

--
-- Indeksy dla tabeli `czesci_zakupy`
--
ALTER TABLE `czesci_zakupy`
  ADD PRIMARY KEY (`id_faktury_zakupu`,`id_czesci`),
  ADD KEY `id_czesci` (`id_czesci`);

--
-- Indeksy dla tabeli `dostawcy`
--
ALTER TABLE `dostawcy`
  ADD PRIMARY KEY (`id_dostawcy`);

--
-- Indeksy dla tabeli `faktury`
--
ALTER TABLE `faktury`
  ADD PRIMARY KEY (`id_faktury`),
  ADD KEY `id_klienta` (`id_klienta`);

--
-- Indeksy dla tabeli `faktury_zakupowe`
--
ALTER TABLE `faktury_zakupowe`
  ADD PRIMARY KEY (`id_faktury_zakupu`),
  ADD KEY `id_dostawcy` (`id_dostawcy`);

--
-- Indeksy dla tabeli `kampanie_reklamowe`
--
ALTER TABLE `kampanie_reklamowe`
  ADD PRIMARY KEY (`id_kampanii`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id_klienta`);

--
-- Indeksy dla tabeli `klienci_kampanie`
--
ALTER TABLE `klienci_kampanie`
  ADD PRIMARY KEY (`id_klienta`,`id_kampanii`),
  ADD KEY `id_kampanii` (`id_kampanii`);

--
-- Indeksy dla tabeli `naprawy`
--
ALTER TABLE `naprawy`
  ADD PRIMARY KEY (`id_naprawy`),
  ADD KEY `id_samochodu` (`id_samochodu`),
  ADD KEY `id_pracownika` (`id_pracownika`),
  ADD KEY `id_faktury` (`id_faktury`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`id_pracownika`);

--
-- Indeksy dla tabeli `raporty_kasowe`
--
ALTER TABLE `raporty_kasowe`
  ADD PRIMARY KEY (`id_raportu`),
  ADD KEY `utworzyl` (`utworzyl`);

--
-- Indeksy dla tabeli `samochody`
--
ALTER TABLE `samochody`
  ADD PRIMARY KEY (`id_samochodu`),
  ADD KEY `id_klienta` (`id_klienta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `czas_pracy`
--
ALTER TABLE `czas_pracy`
  MODIFY `id_czasu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `czesci`
--
ALTER TABLE `czesci`
  MODIFY `id_czesci` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dostawcy`
--
ALTER TABLE `dostawcy`
  MODIFY `id_dostawcy` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faktury`
--
ALTER TABLE `faktury`
  MODIFY `id_faktury` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `faktury_zakupowe`
--
ALTER TABLE `faktury_zakupowe`
  MODIFY `id_faktury_zakupu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kampanie_reklamowe`
--
ALTER TABLE `kampanie_reklamowe`
  MODIFY `id_kampanii` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id_klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `naprawy`
--
ALTER TABLE `naprawy`
  MODIFY `id_naprawy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `id_pracownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `raporty_kasowe`
--
ALTER TABLE `raporty_kasowe`
  MODIFY `id_raportu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `samochody`
--
ALTER TABLE `samochody`
  MODIFY `id_samochodu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `czas_pracy`
--
ALTER TABLE `czas_pracy`
  ADD CONSTRAINT `czas_pracy_ibfk_1` FOREIGN KEY (`id_pracownika`) REFERENCES `pracownicy` (`id_pracownika`);

--
-- Constraints for table `czesci_naprawy`
--
ALTER TABLE `czesci_naprawy`
  ADD CONSTRAINT `czesci_naprawy_ibfk_1` FOREIGN KEY (`id_naprawy`) REFERENCES `naprawy` (`id_naprawy`),
  ADD CONSTRAINT `czesci_naprawy_ibfk_2` FOREIGN KEY (`id_czesci`) REFERENCES `czesci` (`id_czesci`);

--
-- Constraints for table `czesci_zakupy`
--
ALTER TABLE `czesci_zakupy`
  ADD CONSTRAINT `czesci_zakupy_ibfk_1` FOREIGN KEY (`id_faktury_zakupu`) REFERENCES `faktury_zakupowe` (`id_faktury_zakupu`),
  ADD CONSTRAINT `czesci_zakupy_ibfk_2` FOREIGN KEY (`id_czesci`) REFERENCES `czesci` (`id_czesci`);

--
-- Constraints for table `faktury`
--
ALTER TABLE `faktury`
  ADD CONSTRAINT `faktury_ibfk_1` FOREIGN KEY (`id_klienta`) REFERENCES `klienci` (`id_klienta`);

--
-- Constraints for table `faktury_zakupowe`
--
ALTER TABLE `faktury_zakupowe`
  ADD CONSTRAINT `faktury_zakupowe_ibfk_1` FOREIGN KEY (`id_dostawcy`) REFERENCES `dostawcy` (`id_dostawcy`);

--
-- Constraints for table `klienci_kampanie`
--
ALTER TABLE `klienci_kampanie`
  ADD CONSTRAINT `klienci_kampanie_ibfk_1` FOREIGN KEY (`id_klienta`) REFERENCES `klienci` (`id_klienta`),
  ADD CONSTRAINT `klienci_kampanie_ibfk_2` FOREIGN KEY (`id_kampanii`) REFERENCES `kampanie_reklamowe` (`id_kampanii`);

--
-- Constraints for table `naprawy`
--
ALTER TABLE `naprawy`
  ADD CONSTRAINT `naprawy_ibfk_1` FOREIGN KEY (`id_samochodu`) REFERENCES `samochody` (`id_samochodu`),
  ADD CONSTRAINT `naprawy_ibfk_2` FOREIGN KEY (`id_pracownika`) REFERENCES `pracownicy` (`id_pracownika`),
  ADD CONSTRAINT `naprawy_ibfk_3` FOREIGN KEY (`id_faktury`) REFERENCES `faktury` (`id_faktury`);

--
-- Constraints for table `raporty_kasowe`
--
ALTER TABLE `raporty_kasowe`
  ADD CONSTRAINT `raporty_kasowe_ibfk_1` FOREIGN KEY (`utworzyl`) REFERENCES `pracownicy` (`id_pracownika`);

--
-- Constraints for table `samochody`
--
ALTER TABLE `samochody`
  ADD CONSTRAINT `samochody_ibfk_1` FOREIGN KEY (`id_klienta`) REFERENCES `klienci` (`id_klienta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
