-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2024 at 01:27 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baza_danych`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(2, 'Klienci'),
(1, 'Pracownicy');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(2, 'pbkdf2_sha256$720000$0RCjJ990i2aQhfX72lwK4C$JU3tRpUV0pECfRufdwVqAx5K9YZRGwht+Gj/Azj2B08=', '2024-05-19 19:20:05.374840', 1, 'Marcin', '', '', 'a@gmail.com', 1, 1, '2024-05-18 12:15:45.091633'),
(4, 'pbkdf2_sha256$720000$6ZtopnPpTyzDMP7hySUPew$156D4GeI+EMh7MM5Njs7QFAybQb33j5UUT+4vHTM/X4=', NULL, 0, 'AdamŁoś@12', 'Adam', 'Łoś', '', 0, 1, '2024-05-19 12:54:50.090985'),
(5, 'pbkdf2_sha256$720000$85q85G9TWEagyYt2Ri8Cwn$h8J1cErlQa+KzsFrAXECtF04tPMrYr5cy0bf4egqi2U=', '2024-05-19 12:56:47.893325', 0, 'AgataKowalska@12', 'Agata', 'Kowalska', '', 0, 1, '2024-05-19 12:56:47.198779'),
(6, 'pbkdf2_sha256$720000$bxaZFLr81stGkw9eAKE5SE$9KGQ8HacJgsZFjx27z5C856uE8MwXlUQA/pqRUXctGs=', '2024-05-19 18:26:43.788342', 0, 'TomaszKot@11', 'Tomasz', 'Kot', '', 0, 1, '2024-05-19 13:01:34.247833');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 4, 1),
(2, 5, 1),
(3, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-05-19 17:43:04.262393', '1', 'Pracownicy', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'Lombard', 'pracownik'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-04-30 18:21:09.318816'),
(2, 'auth', '0001_initial', '2024-04-30 18:21:09.719745'),
(3, 'admin', '0001_initial', '2024-04-30 18:21:09.831788'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-04-30 18:21:09.838769'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-30 18:21:09.847458'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-04-30 18:21:09.893391'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-04-30 18:21:09.943775'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-04-30 18:21:09.955742'),
(9, 'auth', '0004_alter_user_username_opts', '2024-04-30 18:21:09.962725'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-04-30 18:21:10.005828'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-04-30 18:21:10.007821'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-04-30 18:21:10.016797'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-04-30 18:21:10.028686'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-04-30 18:21:10.038658'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-04-30 18:21:10.051010'),
(16, 'auth', '0011_update_proxy_permissions', '2024-04-30 18:21:10.057807'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-04-30 18:21:10.069230'),
(18, 'sessions', '0001_initial', '2024-04-30 18:21:10.096603');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('8d5pnqt3rfgq50lj07vndogskohopogy', '.eJxVjLEOAiEQRP-F2lwQvD3WTmsL_4DsyhKIgTPgVcZ_90yM0XLevJmH8rTck1-6NJ-D2iujNr-M6XKV-i5Oc2FqYbhJK7n3PNc-HELJ9fwFx4_895Cop3UuYizSyOImtmRl1IAmEGpHvFtTiMi8dQAmRm2cIDhAkOg0QJwsqucLad44uw:1s919p:exEZQgpQMMVmV_MTkgYfLZvCOOQ08-9oNKoSHRQF2Ww', '2024-06-03 11:26:21.561719');

-- --------------------------------------------------------

--
-- Table structure for table `eksperci`
--

CREATE TABLE `eksperci` (
  `id_eskperta` int(11) NOT NULL,
  `imie` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `specjalizacja` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ekspertyza`
--

CREATE TABLE `ekspertyza` (
  `id_eskpertyzy` int(11) NOT NULL,
  `ekspert` varchar(255) NOT NULL,
  `przedmiot` varchar(255) NOT NULL,
  `wynik` varchar(255) NOT NULL,
  `uwaga` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategorie`
--

CREATE TABLE `kategorie` (
  `id_kategorii` int(11) NOT NULL,
  `nazwa_kategorii` varchar(255) NOT NULL,
  `id_kategorii_nadrzednej` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategorie`
--

INSERT INTO `kategorie` (`id_kategorii`, `nazwa_kategorii`, `id_kategorii_nadrzednej`) VALUES
(1, 'Wszystko', 0),
(2, 'Elektronika', 1),
(3, 'Telefony', 2),
(4, 'Sport', 1),
(5, 'Dom i Ogród', 1),
(6, 'Motoryzacja', 1),
(7, 'Biżuteria', 1),
(8, 'Komputery i laptopy', 2),
(9, 'Telewizory i monitory', 2),
(10, 'Dom', 5),
(11, 'Ogród', 5),
(12, 'Złoto', 7),
(13, 'Narzędzia', 5),
(14, 'Srebro', 7),
(15, 'Dodatki samochodowe', 6),
(16, 'Odżywki i suplementy', 4),
(17, 'Gry ', 1),
(18, 'Zegarki', 7);

-- --------------------------------------------------------

--
-- Table structure for table `klienci`
--

CREATE TABLE `klienci` (
  `id_klienta` int(11) NOT NULL,
  `imie` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `nr_telefonu` varchar(255) NOT NULL,
  `ulica_i_nr` varchar(255) NOT NULL,
  `miasto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`id_klienta`, `imie`, `nazwisko`, `nr_telefonu`, `ulica_i_nr`, `miasto`) VALUES
(1, 'Jan', 'Kowalski', '123456789', 'Długa 3/4', '02-304 Warszawa'),
(2, 'Tomasz', 'Kot', '123123123', 'Krótka 1/1', '58-309 Wałbrzych');

-- --------------------------------------------------------

--
-- Table structure for table `koszyk_sprzedazy`
--

CREATE TABLE `koszyk_sprzedazy` (
  `id_koszyka` int(11) NOT NULL,
  `przedmiot1` varchar(255) NOT NULL,
  `cena1` varchar(255) NOT NULL,
  `przedmiot2` varchar(255) NOT NULL,
  `cena2` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `koszyk_zakupu`
--

CREATE TABLE `koszyk_zakupu` (
  `id_koszyka` int(11) NOT NULL,
  `przedmiot1` varchar(255) NOT NULL,
  `cena1` varchar(255) NOT NULL,
  `przedmiot2` varchar(255) NOT NULL,
  `cena2` varchar(255) NOT NULL,
  `id_klienta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `koszyk_zakupu`
--

INSERT INTO `koszyk_zakupu` (`id_koszyka`, `przedmiot1`, `cena1`, `przedmiot2`, `cena2`, `id_klienta`) VALUES
(5, '', '', '', '', '1'),
(6, '', '', '', '', '3'),
(7, '', '', '', '', '6'),
(8, '', '', '', '', '2');

-- --------------------------------------------------------

--
-- Table structure for table `koszyk_zastawu`
--

CREATE TABLE `koszyk_zastawu` (
  `id_koszyka` int(11) NOT NULL,
  `przedmiot1` varchar(255) NOT NULL,
  `cena1` varchar(255) NOT NULL,
  `przedmiot2` varchar(255) NOT NULL,
  `cena2` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pozycja_koszyka`
--

CREATE TABLE `pozycja_koszyka` (
  `id` int(11) NOT NULL,
  `koszyk_id` varchar(255) NOT NULL,
  `przedmiot_id` varchar(255) NOT NULL,
  `ilosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pozycja_koszyka`
--

INSERT INTO `pozycja_koszyka` (`id`, `koszyk_id`, `przedmiot_id`, `ilosc`) VALUES
(9, '5', '13', 2),
(11, '5', '11', 1),
(12, '5', '16', 1),
(13, '5', '12', 1),
(15, '6', '12', 1),
(18, '7', '14', 1),
(19, '7', '16', 1),
(21, '8', '19', 1),
(22, '8', '20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pracownicy`
--

CREATE TABLE `pracownicy` (
  `id_pracownika` int(11) NOT NULL,
  `imie` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `nr_telefonu` varchar(255) NOT NULL,
  `funkcja` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pracownicy`
--

INSERT INTO `pracownicy` (`id_pracownika`, `imie`, `nazwisko`, `nr_telefonu`, `funkcja`) VALUES
(1, 'Marcin', 'Wiśniewski', '12345678945', 'pracownik'),
(2, 'Adam', 'Łoś', '123123123', 'starszy pracownik'),
(3, 'Agata', 'Kowalska', '333222111', 'pracownik');

-- --------------------------------------------------------

--
-- Table structure for table `przedmioty`
--

CREATE TABLE `przedmioty` (
  `id_przedmiotu` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `kategoria_id` varchar(255) NOT NULL,
  `opis` varchar(255) NOT NULL,
  `stan` varchar(255) NOT NULL,
  `jak_pozyskany` varchar(255) NOT NULL,
  `cena` varchar(255) NOT NULL,
  `ekspertyza` varchar(255) NOT NULL,
  `zdjecie` varchar(255) NOT NULL,
  `ilosc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `przedmioty`
--

INSERT INTO `przedmioty` (`id_przedmiotu`, `nazwa`, `kategoria_id`, `opis`, `stan`, `jak_pozyskany`, `cena`, `ekspertyza`, `zdjecie`, `ilosc`) VALUES
(11, 'Złoty Łancuch', 'Biżuteria', '', 'Używane', '', '399', '', 'https://static.loombard.pl/library/2021/1/18/17/thumb_7QBXW3GtAS3moBCEcGEgSKt0AjRMY2NryXBvgYrx.jpg', '1'),
(12, 'Maszynka trymer Remington 4', 'Elektronika', '', 'Używane', '', '149', '', 'https://static.loombard.pl/library/2024/5/18/18/thumb_Tpm06g9aUtuGYzXeaqHownJCI8a7pO0kyPpTjYrw.webp', '1'),
(13, 'Laptop Hp 15 cali', 'Elektronika', '', 'Nowe', '', '1499', '', 'https://static.loombard.pl/library/2024/5/13/14/thumb_iwclsLZ0cIDrTgzZ3Aw4HQpSP74WJQGhOu3UlHsW.webp', '1'),
(14, 'Komputer MAC', 'Elektronika', '', 'Używane', '', '1499', '', 'https://static.loombard.pl/library/2019/12/16/16/thumb_VeVwdjf3lsoVZqGCy79TygTjnrvSBciu1fYEOWQo.jpg', '1'),
(15, 'Rower dziecięcy', 'Sport', '', 'Uzywane', '', '39', '', 'https://static.loombard.pl/library/2023/10/24/13/thumb_9Coc9koJQhREhvIdEDtkP71EeWDxdxu9gQx0ba51.webp', '1'),
(16, 'Białko WPC 80', 'Sport', '', 'Nowe', '', '89', '', 'https://static.loombard.pl/library/2024/3/11/16/thumb_C2iyRMSsA5j6vivQJIJbCOoV9QM4BDZ8r2lLr7es.webp', '2'),
(17, 'Szlifierka kątowa makita', 'domiogrod', 'Witam,  posiadamy na sprzedaż SZLIFIERKĘ KĄTOWĄ YATO YT82110. Szlifierka w stanie bardzo dobrym, w pełni sprawna, posiada ślady użytkowania typowe dla tego rodzaju sprzętu.  Charakterystyka:  moc 2800Wprędkość obrotowa 6600 obr/minśrednica tarczy 230 mmwy', 'Używane', '', '399', '', 'https://static.loombard.pl/library/2023/7/31/10/thumb_lVdNt7d13kbCtavNQCNtx0M8IIzJORu1BjjhpUDs.webp', '1'),
(18, 'Mop parowy silvercrest', 'domiogrod', 'SILVERCREST MOP PAROWY 1500  Urządzenie sprawne technicznie  Stan wizualny jak na załączonych zdjęciach  POLECAM I ZAPRASZAM DO ZAKUPU!  Na płatność za wylicytowany przedmiot czekamy do 7 dni.  NIE WYSYŁAMY TOWARU ZA POBRANIEM  WYSYŁKI REALIZUJEMY WYŁĄCZN', 'Nowe', '', '99', '', 'https://static.loombard.pl/library/2024/3/1/8/thumb_mlwQYkANQPSHuYuIsWv5nxoj66fWEVus5o4HkeBi.webp', '2'),
(19, 'Ładowarka samochodowa', 'motoryzacja', 'Ładowarka samochodowa', 'nowy', '', '15', '', 'https://static.loombard.pl/library/2022/1/21/19/thumb_mgjyiFw8QjhDQMa3lElnEQw3NUpmQSSBcXc2O5hb.jpg', '5'),
(20, 'Laptop ASUS cośtam', 'elektronika', 'Witamy serdecznie!  Przedmiotem sprzedaży są: LAPTOP LAPTOP HP 15S-EQ2023NW  W zestawie:  *laptop  * ładowarka  Dane techniczne:  Procesor amd ryzen 3 5300u ram 8 gb Stan wizualny : dobry, wyłamane kawałek obudowy  ZDJĘCIA PRZEDSTAWIAJĄ SPRZEDAWANY PRZEDM', 'Używane', '', '999', '', 'https://static.loombard.pl/library/2024/3/30/8/thumb_y1EP469Uhc6q9pAMmk8q9gcWS6Y4DmLApN5SaIIq.webp', '1'),
(21, 'Wkrętarka AVD 4', 'domiogrod', 'Towar w pełni sprawny technicznie.  Brak widocznych śladów użytkowania.  Sprzęt nigdy nieużywany.Samo body w sprzedaży.', 'Używane', '', '149', '', 'https://static.loombard.pl/library/2024/5/19/18/thumb_VD6EeO726gP4tigCDO2WzxpzjXtAuuqXmWneLmGf.webp', '1'),
(22, 'Klocki Lego', 'Zabawki', 'KLOCKI LEGO SUPER HEROES 76224 BATMOBIL: POŚCIG BATMANA  Produkt powystawowy.  Więcej informacji na stronie producenta.', 'Nowe', '', '399', '', 'https://static.loombard.pl/library/2024/5/19/19/thumb_13kkpwN87eDCCKj273UAcHhpvzxytk7bIk7QCvjb.webp', '1'),
(23, 'Zegarek timex s2', 'Zegarki', 'Zegarek Timex bez śladów użytkowania', 'Używane', '', '200', '', 'https://static.loombard.pl/library/2019/6/5/thumb_tdE9pePTSyafcoMmu53PHYhGtUymNXL5bZCNGCi2.jpg', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tranzakcje_sprzedaży`
--

CREATE TABLE `tranzakcje_sprzedaży` (
  `id_tranzakcji` int(11) NOT NULL,
  `koszyk` int(11) NOT NULL,
  `pracownik` int(11) NOT NULL,
  `cena_sprzedaży` int(11) NOT NULL,
  `data_tranzakcji` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tranzakcje_zakupu`
--

CREATE TABLE `tranzakcje_zakupu` (
  `id_tranzakcji` int(11) NOT NULL,
  `klient` varchar(255) NOT NULL,
  `pracownik` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL,
  `koszyk` varchar(255) NOT NULL,
  `cena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warunki_zastawu`
--

CREATE TABLE `warunki_zastawu` (
  `id_warunku` int(11) NOT NULL,
  `data_zastawu` varchar(255) NOT NULL,
  `data_końca_zastawu` varchar(255) NOT NULL,
  `długość_zastawu` varchar(255) NOT NULL,
  `kwota_pożyczki` varchar(255) NOT NULL,
  `kwota_wykupu` varchar(255) NOT NULL,
  `prowizja` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zastawy`
--

CREATE TABLE `zastawy` (
  `id_zastawu` int(11) NOT NULL,
  `pracownik` varchar(255) NOT NULL,
  `klient` varchar(255) NOT NULL,
  `warunki_zastawu` varchar(255) NOT NULL,
  `kosz_zastawu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `eksperci`
--
ALTER TABLE `eksperci`
  ADD PRIMARY KEY (`id_eskperta`);

--
-- Indexes for table `ekspertyza`
--
ALTER TABLE `ekspertyza`
  ADD PRIMARY KEY (`id_eskpertyzy`);

--
-- Indexes for table `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id_kategorii`);

--
-- Indexes for table `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id_klienta`);

--
-- Indexes for table `koszyk_sprzedazy`
--
ALTER TABLE `koszyk_sprzedazy`
  ADD PRIMARY KEY (`id_koszyka`);

--
-- Indexes for table `koszyk_zakupu`
--
ALTER TABLE `koszyk_zakupu`
  ADD PRIMARY KEY (`id_koszyka`);

--
-- Indexes for table `koszyk_zastawu`
--
ALTER TABLE `koszyk_zastawu`
  ADD PRIMARY KEY (`id_koszyka`);

--
-- Indexes for table `pozycja_koszyka`
--
ALTER TABLE `pozycja_koszyka`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`id_pracownika`);

--
-- Indexes for table `przedmioty`
--
ALTER TABLE `przedmioty`
  ADD PRIMARY KEY (`id_przedmiotu`);

--
-- Indexes for table `tranzakcje_zakupu`
--
ALTER TABLE `tranzakcje_zakupu`
  ADD PRIMARY KEY (`id_tranzakcji`);

--
-- Indexes for table `warunki_zastawu`
--
ALTER TABLE `warunki_zastawu`
  ADD PRIMARY KEY (`id_warunku`);

--
-- Indexes for table `zastawy`
--
ALTER TABLE `zastawy`
  ADD PRIMARY KEY (`id_zastawu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `eksperci`
--
ALTER TABLE `eksperci`
  MODIFY `id_eskperta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ekspertyza`
--
ALTER TABLE `ekspertyza`
  MODIFY `id_eskpertyzy` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id_kategorii` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id_klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `koszyk_sprzedazy`
--
ALTER TABLE `koszyk_sprzedazy`
  MODIFY `id_koszyka` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `koszyk_zakupu`
--
ALTER TABLE `koszyk_zakupu`
  MODIFY `id_koszyka` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `koszyk_zastawu`
--
ALTER TABLE `koszyk_zastawu`
  MODIFY `id_koszyka` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pozycja_koszyka`
--
ALTER TABLE `pozycja_koszyka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `id_pracownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `przedmioty`
--
ALTER TABLE `przedmioty`
  MODIFY `id_przedmiotu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tranzakcje_zakupu`
--
ALTER TABLE `tranzakcje_zakupu`
  MODIFY `id_tranzakcji` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warunki_zastawu`
--
ALTER TABLE `warunki_zastawu`
  MODIFY `id_warunku` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zastawy`
--
ALTER TABLE `zastawy`
  MODIFY `id_zastawu` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
