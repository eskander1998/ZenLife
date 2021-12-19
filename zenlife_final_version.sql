-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 19 déc. 2021 à 11:35
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `zenlifefinal`
--

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `ID_Commande` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Panier` int(11) DEFAULT NULL,
  `ID_Produit` int(11) DEFAULT NULL,
  `Quantitee` int(11) DEFAULT NULL,
  `Prix_U` double DEFAULT NULL,
  PRIMARY KEY (`ID_Commande`),
  KEY `fk_pan_com` (`ID_Panier`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`ID_Commande`, `ID_Panier`, `ID_Produit`, `Quantitee`, `Prix_U`) VALUES
(43, 27, 44, 2, 100),
(44, 28, 1, 2, 10),
(47, 30, 44, 2, 100),
(50, 78, 1, 24, 12),
(52, 12, 12, 11, 1),
(54, 4, 12, 1, 12),
(59, 34, 1, 1, 10),
(61, 34, 1, 1, 10),
(62, 34, 1, 5, 10),
(63, 34, 1, 3, 10),
(64, 34, 44, 3, 100),
(65, 34, 44, 2, 100),
(68, 36, 1, 4, 10),
(69, 36, 44, 2, 100),
(74, 37, 3, 1, 8),
(76, 37, 44, 3, 100),
(77, 38, 3, 2, 8),
(79, 38, 1, 3, 10),
(80, 39, 1, 2, 10),
(81, 40, 1, 3, 10),
(82, 41, 44, 3, 100),
(83, 42, 3, 1, 8),
(84, 42, 1, 1, 10),
(85, 43, 55, 3, 789),
(86, 43, 1, 1, 10),
(87, 43, 1, 2, 10),
(89, 44, 1, 8, 10),
(90, 45, 3, 2, 8),
(91, 46, 55, 4, 789),
(92, 46, 1, 2, 10),
(93, 47, 1, 2, 10),
(97, 48, 1, 3, 10),
(98, 49, 1, 3, 10),
(99, 50, 1, 3, 10);

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iduser_id` int(11) DEFAULT NULL,
  `idreco_id` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9474526C786A81FB` (`iduser_id`),
  KEY `IDX_9474526C45712411` (`idreco_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `consultation`
--

DROP TABLE IF EXISTS `consultation`;
CREATE TABLE IF NOT EXISTS `consultation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtherapeute` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `emplacement` varchar(255) NOT NULL,
  `prix` double NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `heuredeb` varchar(250) DEFAULT NULL,
  `heurefin` varchar(250) DEFAULT NULL,
  `etat` varchar(250) DEFAULT 'Disponible',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `consultation`
--

INSERT INTO `consultation` (`id`, `idtherapeute`, `titre`, `description`, `emplacement`, `prix`, `image`, `date`, `heuredeb`, `heurefin`, `etat`) VALUES
(20, 11, 'aa', 'ff', 'Tunis,ariana,Rue Abdelhafidh El Mekki', 50, 'a5395e0472bbbffd25365725273661aa.jpeg', '2021-04-30', '11:33:00', '11:45:00', 'Reservé'),
(29, 24, 'therapeute', 'un pro thérapeute', 'Tunis,hay el zouhour 4rue de nakhla', 65, '927346d6f898cfa062b42d938cf91357.jpeg', '2021-04-18', '23:06:00', '23:08:00', 'Reservé'),
(32, 78546523, 'Dr walid', 'thépraute adssad', 'Tunis,rue de manga', 62, '0b2d19388d9c379c57c2df63b55a58d1.jpeg', '2021-04-18', '03:17:00', '04:15:00', 'Reservé'),
(63, 12, 'Mrsmonya', 'Therapete', 'montfleury tunis', 48, 'bc09c47eef814f4b6d8cccedc9adbabe.jpeg', '2021-04-20', '11:15:00', '12:30:00', 'Reservé'),
(64, 9, 'ff', 'dddd', '4', 56, '42131f44e753419dce4956ed08d27f2e.jpeg', '2021-04-18', '01:18:00', '00:15:00', 'Reservé'),
(66, 2, '2', 'dddd', '6', 63, '512b68e66b18e75fde40938c25653109.jpeg', '2021-04-26', '00:46:00', '02:50:00', 'Reservé'),
(67, 11, 'aa', 'dddd', 'Sfax', 56, 'd732ff0ef959f7cc07281cab4a1a9044.jpeg', '2021-04-26', '03:10:00', '03:19:00', 'Reservé'),
(68, 3, '3', 'dddd', 'sdafa', 46, 'c67a972faf4748e0a5b12392762b9485.jpeg', '2021-04-18', '03:25:00', '05:23:00', 'Reservé'),
(70, 3, 'iiiiii', 'fffff', 'radess', 57, '11bc8ffea9989cb6b125511ea62eb081.jpeg', '2021-04-24', '13:05:00', '15:05:00', 'Reservé'),
(72, 2, 'fff', 'gg', 'Tunis,centre', 80, '31e7bf43d62569d3e1e3e0dcaf40808f.jpeg', '2021-04-20', '14:49:00', '16:49:00', 'Reservé'),
(76, 12, 'Therapeute', 'davai', 'messi', 59, 'bb4c86d4d844f4a5e70e55aae6b560ac.jpeg', '2021-04-25', '03:02:00', '04:06:00', 'Disponible');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210409221042', '2021-04-09 22:15:59', 2578),
('DoctrineMigrations\\Version20210409221955', '2021-04-09 22:20:05', 357),
('DoctrineMigrations\\Version20210409224512', '2021-04-09 22:45:35', 319);

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

DROP TABLE IF EXISTS `evenement`;
CREATE TABLE IF NOT EXISTS `evenement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_organisateur` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL,
  `lieu` varchar(100) NOT NULL,
  `date_event` date NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `tarif` float NOT NULL,
  `capacite` int(11) NOT NULL,
  `nb_reservation` int(11) DEFAULT NULL,
  `etat` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=209 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`id`, `id_organisateur`, `type`, `titre`, `description`, `lieu`, `date_event`, `image`, `tarif`, `capacite`, `nb_reservation`, `etat`) VALUES
(123, 23362, 'Conférence', 'conference  bien-être', 'Lorem ipsum dolor sit amet, consectetur \r\nadipiscing elit, sed do eiusmod tempor \r\nincididunt ut labore et dolore magna aliqua.', 'Tunis', '2021-05-23', 'ff6af9b456d1d515ebe98df4decb697e.jpeg', 30, 55, 52, 'effectue'),
(124, 12, 'Randonnée', 'Sortie Ain Drahem', 'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit, sed do eiusmod tempor \nincididunt ut labore et dolore magna aliqua.\n', 'Ain Drahem', '2021-04-29', '1084c6c4bebfc10d5f26d7be3b006065.jpeg', 15, 30, 8, 'effectue'),
(140, 12, 'Méditation', 'dfgdfg', 'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit, sed do eiusmod tempor \nincididunt ut labore et dolore magna aliqua.\n', 'dfgdfg', '2021-04-18', '1084c6c4bebfc10d5f26d7be3b006065.jpeg', 15, 20, 1, 'effectue'),
(192, 55, 'Méditation', 'Seance de yoga', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Tunis', '2022-12-19', 'c75ce9c1d107d672920ec8031f386d70.jpeg', 12, 20, 17, 'en cours'),
(193, 12, 'Randonnée', 'Promenade', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'marsa', '2021-05-20', '7e13ec6a77995d9ece54e402db250882.jpeg', 15, 60, 46, 'effectue'),
(194, 12, 'Randonnée', 'Sortie en montagne', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Tunis', '2021-04-30', '28e12ecf3eb61d8d3b3a4a6a48ee6acc.jpeg', 20, 20, 11, 'effectue'),
(195, 12, 'Sport et fitness', 'Seance de fitness', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Marsa', '2021-04-30', '34413799173d8a5144d3bf75442a0831.jpeg', 10, 20, 6, 'effectue'),
(196, 1, 'Méditation', 'Validation Web', 'Validation web', 'Tunis', '2021-04-20', 'd1ed7f1a2c0f1622933b010f243565a0.jpeg', 10, 30, 0, 'effectue'),
(197, 12, 'Conférence', 'Amine', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Tunis', '2021-04-23', 'ed91aca81bd2a9f9e7ebb812653c828c.jpeg', 10, 35, 4, 'effectue'),
(198, 12, 'Conférence', 'yassine', 'yassine test', 'tunis', '2021-04-25', '92c7390c01bf7d13e5271c55109e7d46.jpeg', 10, 10, 1, 'effectue'),
(199, 12, 'Conférence', 'csc', 'sc', 'csc', '2021-04-30', '259cb96fd4694764d2b93a5d8890499e.jpeg', 12, 12, 0, 'effectue'),
(200, 12, 'Conférence', 'bcvb', 'cvb', 'Tunis', '2021-04-29', '187229aa37ab93076edeada59e9d9426.jpeg', 12, 12, 0, 'effectue'),
(208, 1, 'sport', 'mobile', 'testmobile', 'ennasr', '2021-05-03', '187229aa37ab93076edeada59e9d9426.jpeg', 10, 98, 0, 'effectue');

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etat` varchar(50) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `motif` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `notifications`
--

INSERT INTO `notifications` (`id`, `etat`, `date`, `motif`) VALUES
(1, 'lu', '2021-04-08 19:57:08', 'Salem louled'),
(2, 'lu', '2021-04-08 20:02:45', 'aa skan '),
(3, 'lu', '2021-04-08 20:02:52', 'aywaa'),
(4, 'lu', '2021-04-19 14:35:12', 'Vous avez une nouvelle réservation pour l\'événement '),
(5, 'lu', '2021-04-19 14:36:21', 'Vous avez une nouvelle réservation pour l\'événement Promenade'),
(6, 'lu', '2021-04-19 14:49:37', 'Un client a annulé sa réservation pour l\'événement Promenade'),
(7, 'lu', '2021-04-19 16:02:15', 'Un client a modifié sa réservation pour l\'événement Promenade'),
(8, 'lu', '2021-04-19 16:02:35', 'Un client a modifié sa réservation pour l\'événement Promenade'),
(9, 'lu', '2021-04-19 16:03:17', 'Un client a modifié sa réservation pour l\'événement Promenade'),
(10, 'lu', '2021-04-19 16:03:27', 'Un client a modifié sa réservation pour l\'événement jkn'),
(11, 'lu', '2021-04-19 16:03:34', 'Un client a modifié sa réservation pour l\'événement jkn'),
(12, 'lu', '2021-04-19 16:06:28', 'Un client a modifié sa réservation pour l\'événement jkn'),
(13, 'lu', '2021-04-19 22:22:27', 'Vous avez une nouvelle réservation pour l\'événement Promenade'),
(14, 'non lu', '2021-04-19 22:26:29', 'Un client a annulé sa réservation pour l\'événement jkn'),
(15, 'lu', '2021-04-20 10:15:43', 'Vous avez une nouvelle réservation pour l\'événement conference  bien-être'),
(16, 'lu', '2021-04-20 13:34:29', 'Vous avez une nouvelle réservation pour l\'événement Sortie Ain Drahem'),
(17, 'non lu', '2021-04-20 13:36:25', 'Un client a modifié sa réservation pour l\'événement Sortie Ain Drahem'),
(18, 'lu', '2021-04-20 13:37:10', 'Un client a annulé sa réservation pour l\'événement Sortie Ain Drahem'),
(19, 'non lu', '2021-04-21 13:08:49', 'Vous avez une nouvelle réservation pour l\'événement Amine'),
(20, 'non lu', '2021-04-21 21:16:48', 'Vous avez une nouvelle réservation pour l\'événement conference  bien-être'),
(21, 'non lu', '2021-04-21 21:18:54', 'Vous avez une nouvelle réservation pour l\'événement conference  bien-être'),
(22, 'non lu', '2021-04-21 21:19:36', 'Vous avez une nouvelle réservation pour l\'événement conference  bien-être'),
(23, 'non lu', '2021-04-21 21:19:49', 'Vous avez une nouvelle réservation pour l\'événement conference  bien-être'),
(24, 'non lu', '2021-04-21 21:28:31', 'Vous avez une nouvelle réservation pour l\'événement conference  bien-être'),
(25, 'non lu', '2021-04-21 21:32:46', 'Vous avez une nouvelle réservation pour l\'événement conference  bien-être'),
(26, 'non lu', '2021-04-21 21:35:11', 'Vous avez une nouvelle réservation pour l\'événement conference  bien-être'),
(27, 'non lu', '2021-04-21 21:40:43', 'Vous avez une nouvelle réservation pour l\'événement conference  bien-être'),
(28, 'non lu', '2021-04-21 21:52:18', 'Vous avez une nouvelle réservation pour l\'événement conference  bien-être'),
(29, 'non lu', '2021-04-22 14:08:44', 'Vous avez une nouvelle réservation pour l\'événement Seance de yoga'),
(30, 'non lu', '2021-04-22 14:12:55', 'Vous avez une nouvelle réservation pour l\'événement Seance de yoga'),
(31, 'non lu', '2021-04-22 14:14:08', 'Vous avez une nouvelle réservation pour l\'événement Seance de yoga'),
(32, 'non lu', '2021-04-22 14:15:04', 'Vous avez une nouvelle réservation pour l\'événement Seance de yoga'),
(33, 'non lu', '2021-04-22 14:16:01', 'Vous avez une nouvelle réservation pour l\'événement Seance de yoga'),
(34, 'non lu', '2021-04-22 14:17:39', 'Vous avez une nouvelle réservation pour l\'événement Sortie en montagne'),
(35, 'non lu', '2021-04-22 14:22:42', 'Vous avez une nouvelle réservation pour l\'événement Amine'),
(36, 'non lu', '2021-04-22 14:24:53', 'Vous avez une nouvelle réservation pour l\'événement Seance de yoga'),
(37, 'non lu', '2021-04-22 14:25:07', 'Vous avez une nouvelle réservation pour l\'événement Seance de yoga'),
(38, 'non lu', '2021-04-22 14:27:17', 'Vous avez une nouvelle réservation pour l\'événement Seance de yoga'),
(39, 'non lu', '2021-04-22 14:27:23', 'Vous avez une nouvelle réservation pour l\'événement Seance de yoga'),
(40, 'non lu', '2021-04-22 14:27:53', 'Vous avez une nouvelle réservation pour l\'événement Seance de yoga'),
(41, 'non lu', '2021-04-22 14:30:12', 'Vous avez une nouvelle réservation pour l\'événement Seance de yoga'),
(42, 'non lu', '2021-04-22 14:32:39', 'Vous avez une nouvelle réservation pour l\'événement Seance de yoga'),
(43, 'non lu', '2021-04-22 14:36:53', 'Vous avez une nouvelle réservation pour l\'événement Seance de yoga'),
(44, 'non lu', '2021-04-22 14:37:47', 'Vous avez une nouvelle réservation pour l\'événement Seance de fitness'),
(45, 'non lu', '2021-04-22 14:41:24', 'Vous avez une nouvelle réservation pour l\'événement Promenade'),
(46, 'non lu', '2021-04-22 14:42:48', 'Vous avez une nouvelle réservation pour l\'événement Sortie en montagne'),
(47, 'non lu', '2021-04-22 14:45:25', 'Vous avez une nouvelle réservation pour l\'événement Promenade'),
(48, 'lu', '2021-04-23 17:03:46', 'Vous avez une nouvelle réservation pour l\'événement Seance de fitness'),
(49, 'non lu', '2021-04-23 21:30:01', 'Vous avez une nouvelle réservation pour l\'événement conference  bien-être'),
(50, 'lu', '2021-04-24 00:55:48', 'Vous avez une nouvelle réservation pour l\'événement conference  bien-être'),
(51, 'non lu', '2021-04-25 05:01:23', 'Vous avez une nouvelle réservation pour l\'événement conference  bien-être'),
(52, 'non lu', '2021-04-25 05:40:21', 'Vous avez une nouvelle réservation pour l\'événement Sortie Ain Drahem'),
(53, 'non lu', '2021-04-25 05:40:46', 'Vous avez une nouvelle réservation pour l\'événement Sortie Ain Drahem'),
(54, 'non lu', '2021-04-25 05:41:34', 'Vous avez une nouvelle réservation pour l\'événement Seance de yoga'),
(55, 'non lu', '2021-04-26 12:51:45', 'Vous avez une nouvelle réservation pour l\'événement Seance de yoga'),
(56, 'non lu', '2021-04-26 23:52:47', 'Une promotion a expiré'),
(57, 'non lu', '2021-04-26 23:53:12', 'Une promotion a expiré'),
(58, 'non lu', '2021-04-26 23:55:47', 'Une promotion a expiré'),
(59, 'non lu', '2021-04-26 23:57:56', 'Une promotion a expiré'),
(60, 'non lu', '2021-04-27 00:00:57', 'Une promotion a expiré'),
(61, 'non lu', '2021-04-27 00:01:01', 'Une promotion a expiré'),
(62, 'non lu', '2021-04-27 00:01:25', 'Une promotion a expiré'),
(63, 'non lu', '2021-05-14 18:22:57', 'Vous avez une nouvelle réservation pour l\'événement Sortie Ain Drahem'),
(64, 'non lu', '2021-05-14 18:26:32', 'Vous avez une nouvelle réservation pour l\'événement conference  bien-être'),
(65, 'non lu', '2021-05-14 18:27:53', 'Vous avez une nouvelle réservation pour l\'événement Seance de yoga'),
(66, 'non lu', '2021-05-14 20:06:16', 'Vous avez une nouvelle réservation pour l\'événement Seance de yoga'),
(67, 'non lu', '2021-05-14 20:07:00', 'Vous avez une nouvelle réservation pour l\'événement yassine'),
(68, 'non lu', '2021-05-15 01:22:32', 'Vous avez une nouvelle réservation pour l\'événement Promenade'),
(69, 'non lu', '2021-05-17 13:57:41', 'Un client a modifié sa réservation pour l\'événement Promenade'),
(70, 'non lu', '2021-05-17 14:03:18', 'Un client a modifié sa réservation pour l\'événement {titreEvent'),
(71, 'non lu', '2021-05-17 14:05:24', 'Un client a modifié sa réservation pour l\'événement Seance de yoga'),
(72, 'non lu', '2021-05-17 14:07:43', 'Un client a modifié sa réservation pour l\'événement Promenade');

-- --------------------------------------------------------

--
-- Structure de la table `paniers`
--

DROP TABLE IF EXISTS `paniers`;
CREATE TABLE IF NOT EXISTS `paniers` (
  `ID_Panier` int(11) NOT NULL AUTO_INCREMENT,
  `cin` int(11) DEFAULT NULL,
  `Date_C` date DEFAULT NULL,
  `Date_U` date DEFAULT NULL,
  `Status_panier` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_Panier`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `paniers`
--

INSERT INTO `paniers` (`ID_Panier`, `cin`, `Date_C`, `Date_U`, `Status_panier`) VALUES
(25, 26548945, '2021-03-29', '2021-03-29', 'Livrer'),
(26, 26548945, '2021-03-30', '2021-03-30', 'Payer'),
(27, 26548945, '2021-03-30', '2021-03-30', 'Livrer'),
(28, 26548945, '2021-03-30', '2021-03-30', 'Livrer'),
(30, 26548945, '2021-03-31', '2021-04-09', 'Liverer'),
(34, 123456789, '2021-04-12', '2021-04-12', 'Abondonner'),
(36, 45645612, '2021-04-20', '2021-04-20', 'En cours'),
(37, 111111, '2021-04-23', '2021-04-23', 'Payer'),
(38, 111111, '2021-04-24', '2021-04-25', 'Payer'),
(39, 111111, '2021-04-25', '2021-04-25', 'Payer'),
(40, 111111, '2021-04-25', '2021-04-25', 'Payer'),
(41, 111111, '2021-04-25', '2021-04-25', 'Payer'),
(42, 111111, '2021-04-25', '2021-04-25', 'Payer'),
(43, 111111, '2021-04-25', '2021-04-25', 'Payer'),
(44, 111111, '2021-04-25', '2021-04-25', 'Payer'),
(45, 111111, '2021-04-25', '2021-04-25', 'Payer'),
(46, 111111, '2021-04-26', '2021-04-26', 'Payer'),
(47, 111111, '2021-04-26', '2021-04-26', 'Payer'),
(48, 111111, '2021-04-26', '2021-04-26', 'Payer'),
(49, 111111, '2021-04-26', '2021-04-26', 'Payer'),
(50, 12343214, '2021-04-26', '2021-04-26', 'Payer');

-- --------------------------------------------------------

--
-- Structure de la table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `ID_Payment` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Panier` int(11) DEFAULT NULL,
  `Prix_F` double DEFAULT NULL,
  `Mode_payment` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_Payment`),
  KEY `fk_pan_pay` (`ID_Panier`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `payments`
--

INSERT INTO `payments` (`ID_Payment`, `ID_Panier`, `Prix_F`, `Mode_payment`) VALUES
(15, 25, 24, 'Carte'),
(16, 26, 20, 'Espèce'),
(18, 28, 20, 'Carte'),
(20, 30, 210, 'Espèce'),
(23, 37, 308, 'Espèce'),
(24, 38, 46, 'Espèce'),
(25, 39, 20, 'Espèce'),
(26, 40, 30, 'Espèce'),
(27, 41, 300, 'Espèce'),
(28, 42, 18, 'Espèce'),
(29, 43, 2397, 'Espèce'),
(30, 44, 80, 'Espèce'),
(31, 45, 16, 'Espèce'),
(32, 46, 3176, 'Espèce'),
(33, 47, 20, 'Espèce'),
(34, 47, 20, 'Espèce'),
(35, 48, 30, 'Espèce'),
(36, 49, 30, 'Espèce'),
(37, 50, 30, 'Espèce');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `ID_Produit` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(20) NOT NULL,
  `Quantitee` int(11) NOT NULL,
  `Type` varchar(225) DEFAULT NULL,
  `Image` varchar(225) DEFAULT NULL,
  `Prix` double NOT NULL,
  PRIMARY KEY (`ID_Produit`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`ID_Produit`, `Nom`, `Quantitee`, `Type`, `Image`, `Prix`) VALUES
(1, 'Cosmetique', 87, 'cosmo', 'gamme.jpg', 10),
(3, 'Anti-stressant', 10, 'null', 'gamme.jpg', 8),
(44, 'parfum', 49, 'cosmotique', 'gamme.jpg', 100),
(55, 'hjyh', 212, 'hhg', 'gamme.jpg', 789),
(99, 'gel', 100, 'cosmetique', 'gamme.jpg', 25),
(100, 'vuvuhv', 1, 'null', 'produit.jpg', 12),
(101, 'gvvhiv', 2, 'guvguv', 'produit.jpg', 1),
(102, 'hvhivhiv', 2, 'hibhibhijb', 'gamme.jpg', 12),
(104, 'jngjon', 4, 'oignojn', 'gamme.jpg', 45),
(107, 'ff', 2, 'ff', 'product_02.png', 12),
(111, 'parfum', 3, 'mm', 'product_06.png', 30);

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
CREATE TABLE IF NOT EXISTS `promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idP` int(11) NOT NULL,
  `valP` int(11) NOT NULL,
  `dateD` date NOT NULL,
  `dateF` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `promotion`
--

INSERT INTO `promotion` (`id`, `idP`, `valP`, `dateD`, `dateF`) VALUES
(1, 44, 55, '2021-03-17', '2021-03-25'),
(2, 55, 55, '2021-05-15', '2021-05-30'),
(3, 77, 55, '2021-04-27', '2021-04-27'),
(4, 88, 77, '2021-03-09', '2021-03-19'),
(5, 99, 20, '2021-03-25', '2021-03-28'),
(6, 100, 85, '2021-06-05', '2021-06-06'),
(11, 107, 10, '2021-04-21', '2021-04-25'),
(12, 102, 30, '2021-04-20', '2021-05-01');

-- --------------------------------------------------------

--
-- Structure de la table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rating`
--

INSERT INTO `rating` (`id`, `email`, `rating`) VALUES
(5, 'yassine.benouaghrem@esprit.tn', 1),
(7, 'mohamed@esprit.tn', 1);

-- --------------------------------------------------------

--
-- Structure de la table `reco`
--

DROP TABLE IF EXISTS `reco`;
CREATE TABLE IF NOT EXISTS `reco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ecrivain` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reco`
--

INSERT INTO `reco` (`id`, `titre`, `description`, `ecrivain`, `image`, `type`) VALUES
(4, 'Les soins', 'Livre ecrit en 2008', 'Victor Hugo', '7e8a8cf5dbc0e74313f51cf4a279df90.jpeg', 'Livre');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `idreservation` int(11) NOT NULL AUTO_INCREMENT,
  `idconsultation` int(11) DEFAULT NULL,
  `cintherapeute` varchar(250) DEFAULT NULL,
  `idclient` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `type` varchar(255) NOT NULL,
  `heure` varchar(250) NOT NULL,
  `heurefin` varchar(250) DEFAULT NULL,
  `etat` varchar(250) DEFAULT 'En attente de confirmation',
  `image` varchar(250) DEFAULT NULL,
  `message` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idreservation`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`idreservation`, `idconsultation`, `cintherapeute`, `idclient`, `date`, `type`, `heure`, `heurefin`, `etat`, `image`, `message`) VALUES
(285, 20, '13412313', 7, '2021-04-30', 'a domicile', '11:33:00', '11:45:00', 'En attente de confirmation', 'a5395e0472bbbffd25365725273661aa.jpeg', 'faaaa'),
(287, 29, '78546523', 12, '2021-04-18', 'a domicile', '23:06:00', '23:08:00', 'Confirmé', '927346d6f898cfa062b42d938cf91357.jpeg', 'dahara2'),
(288, 46, '11', 12, '2021-04-26', 'en ligne', '05:42:00', '07:42:00', 'Confirmé', '2a258aa610601f03cd2b9d2e05b22ee0.jpeg', 'daaa'),
(289, 68, '3', 12, '2021-04-18', 'a domicile', '03:25:00', '05:23:00', 'En attente de confirmation', 'c67a972faf4748e0a5b12392762b9485.jpeg', 'jhuihui'),
(290, 65, '2', 12, '2021-04-20', 'en ligne', '10:19:00', '12:19:00', 'Confirmé', '817cf1a95cf1e8accbc95b6df79deba9.jpeg', 'kkkkkk'),
(291, 63, '2', 12, '2021-04-20', 'en ligne', '11:15:00', '12:30:00', 'Confirmé', 'bc09c47eef814f4b6d8cccedc9adbabe.jpeg', 'hhhh'),
(292, 64, '1', 24, '2021-04-18', 'a domicile', '01:18:00', '00:15:00', 'Confirmé', '42131f44e753419dce4956ed08d27f2e.jpeg', 'dahr'),
(293, 71, '3', 24, '2021-04-27', 'en ligne', '10:33:00', '12:33:00', 'Confirmé', '7cfe5907d77ab2eb74f8eb51902046af.jpeg', 'ffff'),
(294, 32, '12', 12, '2021-04-18', 'a domicile', '03:17:00', '04:15:00', 'En attente de confirmation', '0b2d19388d9c379c57c2df63b55a58d1.jpeg', 'fffff'),
(295, 66, '2', 12, '2021-04-20', 'a domicile', '00:46:00', '02:50:00', 'En attente de confirmation', '512b68e66b18e75fde40938c25653109.jpeg', 'lolo'),
(296, 70, '3', 24, '2021-04-24', 'a domicile', '13:05:00', '15:05:00', 'En attente de confirmation', '11bc8ffea9989cb6b125511ea62eb081.jpeg', 'lolo'),
(297, 72, '2', 24, '2021-04-20', 'en ligne', '14:49:00', '16:49:00', 'En attente de confirmation', '31e7bf43d62569d3e1e3e0dcaf40808f.jpeg', 'ffff'),
(298, 67, '11', 24, '2021-04-21', 'en ligne', '03:10:00', '03:19:00', 'En attente de confirmation', 'd732ff0ef959f7cc07281cab4a1a9044.jpeg', 'lolo');

-- --------------------------------------------------------

--
-- Structure de la table `reservation_event`
--

DROP TABLE IF EXISTS `reservation_event`;
CREATE TABLE IF NOT EXISTS `reservation_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_organisateur` int(11) DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_event` int(11) DEFAULT NULL,
  `nb_place` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `mode_paiement` varchar(50) DEFAULT NULL,
  `etat` varchar(50) DEFAULT NULL,
  `imageEvent` varchar(200) DEFAULT NULL,
  `titreEvent` varchar(200) DEFAULT NULL,
  `date_event` date DEFAULT NULL,
  `qrcode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=156 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reservation_event`
--

INSERT INTO `reservation_event` (`id`, `id_organisateur`, `id_client`, `id_event`, `nb_place`, `total`, `mode_paiement`, `etat`, `imageEvent`, `titreEvent`, `date_event`, `qrcode`) VALUES
(73, 12, 1, 193, 10, 150, 'Sur place', 'effectue', '1d01400a8cc8d37df63ec987f0c69554.jpeg', 'Promenade', '2021-05-20', NULL),
(152, 23362, 899, 123, 1, 30, 'sur place', 'effectue', 'ff6af9b456d1d515ebe98df4decb697e.jpeg', 'conference  bien-être', '2021-05-03', '60a3d0a19bb59.png'),
(153, 23362, 1, 123, 1, 30, 'sur place', 'effectue', 'ff6af9b456d1d515ebe98df4decb697e.jpeg', 'conference  bien-être', '2021-05-18', '60a3eb3f672c5.png'),
(154, 12, 1, 193, 2, 30, 'sur place', 'effectue', '7e13ec6a77995d9ece54e402db250882.jpeg', 'Promenade', '2021-05-20', '60a3ebf0a1623.png'),
(155, 12, 98, 193, 13, 195, 'sur place', 'effectue', '7e13ec6a77995d9ece54e402db250882.jpeg', 'Promenade', '2021-05-20', '60a3ec1c4aa3f.png'),
(83, 23362, 98, 123, 12, 360, 'Sur place', 'effectue', 'ff6af9b456d1d515ebe98df4decb697e.jpeg', 'conference  bien-être', '2021-04-30', '60809e92dbdbd.png'),
(84, 55, 1, 192, 10, 120, 'Sur place', 'en cours', 'c75ce9c1d107d672920ec8031f386d70.jpeg', 'Seance de yoga', '2022-12-19', '6081852199f76.png'),
(87, 55, 1, 192, 1, 12, 'Sur place', 'en cours', 'c75ce9c1d107d672920ec8031f386d70.jpeg', 'Seance de yoga', '2022-12-19', '608187e926b28.png'),
(88, 55, 1, 192, 1, 12, 'Sur place', 'en cours', 'c75ce9c1d107d672920ec8031f386d70.jpeg', 'Seance de yoga', '2022-12-19', '608188745b5a7.png'),
(89, 55, 1, 192, 2, 24, 'Sur place', 'en cours', 'c75ce9c1d107d672920ec8031f386d70.jpeg', 'Seance de yoga', '2022-12-19', '60818a05e0863.png'),
(90, 12, 1, 195, 1, 10, 'Sur place', 'effectue', '34413799173d8a5144d3bf75442a0831.jpeg', 'Seance de fitness', '2021-04-30', '60818a3b8fc08.png'),
(91, 12, 1, 193, 1, 15, 'Sur place', 'effectue', '7e13ec6a77995d9ece54e402db250882.jpeg', 'Promenade', '2021-05-20', '60818b145cf7e.png'),
(92, 12, 1, 194, 1, 20, 'Sur place', 'effectue', '28e12ecf3eb61d8d3b3a4a6a48ee6acc.jpeg', 'Sortie en montagne', '2021-04-30', '60818b68e1c4a.png'),
(93, 12, 1, 193, 1, 15, 'Sur place', 'effectue', '7e13ec6a77995d9ece54e402db250882.jpeg', 'Promenade', '2021-05-20', '60818c0561f89.png'),
(94, 12, 1, 195, 5, 50, 'Sur place', 'effectue', '34413799173d8a5144d3bf75442a0831.jpeg', 'Seance de fitness', '2021-04-30', '6082fdf263bbf.png'),
(95, 23362, 1, 123, 1, 30, 'En ligne', 'effectue', 'ff6af9b456d1d515ebe98df4decb697e.jpeg', 'conference  bien-être', '2021-04-30', '60833c5948bad.png'),
(96, 23362, 1, 123, 2, 60, 'Sur place', 'effectue', 'ff6af9b456d1d515ebe98df4decb697e.jpeg', 'conference  bien-être', '2021-05-23', '60836c9490dec.png'),
(97, 23362, 1, 123, 10, 300, 'Sur place', 'effectue', 'ff6af9b456d1d515ebe98df4decb697e.jpeg', 'conference  bien-être', '2021-05-23', '6084f7a3b3e28.png'),
(98, 12, 24, 124, 1, 15, 'en ligne', 'effectue', '1084c6c4bebfc10d5f26d7be3b006065.jpeg', 'Sortie Ain Drahem', '2021-04-29', '608500c6912d1.png'),
(99, 12, 24, 124, 1, 15, 'sur place', 'effectue', '1084c6c4bebfc10d5f26d7be3b006065.jpeg', 'Sortie Ain Drahem', '2021-04-29', '608500deb5f86.png'),
(100, 55, 24, 192, 1, 12, 'Sur place', 'en cours', 'c75ce9c1d107d672920ec8031f386d70.jpeg', 'Seance de yoga', '2022-12-19', '6085010ea0163.png'),
(101, 55, 24, 192, 1, 12, 'Sur place', 'en cours', 'c75ce9c1d107d672920ec8031f386d70.jpeg', 'Seance de yoga', '2022-12-19', '6086b761b8925.png'),
(149, 12, 26, 193, 5, 75, 'Sur place', 'effectue', '7e13ec6a77995d9ece54e402db250882.jpeg', 'Promenade', '2021-05-20', '609f22585ee4b.png'),
(146, 23362, 11, 123, 1, 30, 'sur place', 'effectue', 'ff6af9b456d1d515ebe98df4decb697e.jpeg', 'conference  bien-être', '2021-05-03', '609f0f2bbbccd.png'),
(143, 99, 1, 193, 1, 1, '1', 'effectue', 'dsd', 'az', '2021-05-03', NULL),
(142, 99, 1, 193, 1, 1, '1', 'effectue', 'dsd', 'az', '2021-05-03', NULL),
(141, 12, 1, 198, 1, 10, 'Sur place', 'effectue', '92c7390c01bf7d13e5271c55109e7d46.jpeg', 'yassine', '2021-04-25', '609ed8643a230.png'),
(140, 55, 1, 192, 1, 36, 'Sur place', 'en cours', 'c75ce9c1d107d672920ec8031f386d70.jpeg', 'Seance de yoga', '2022-12-19', '609ec129d5e1d.png'),
(139, 23362, 1, 123, 2, 60, 'Sur place', 'effectue', 'ff6af9b456d1d515ebe98df4decb697e.jpeg', 'conference  bien-être', '2021-05-23', '609ec0d841ce2.png'),
(138, 12, 1, 124, 5, 75, 'Sur place', 'effectue', '1084c6c4bebfc10d5f26d7be3b006065.jpeg', 'Sortie Ain Drahem', '2021-04-29', '609ec0022a75f.png'),
(137, 23362, 1, 123, 2, 60, 'sur place', 'effectue', 'ff6af9b456d1d515ebe98df4decb697e.jpeg', 'conference  bien-être', '2021-05-03', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `therapeute`
--

DROP TABLE IF EXISTS `therapeute`;
CREATE TABLE IF NOT EXISTS `therapeute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cin` int(11) NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etat` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numtel` int(11) DEFAULT NULL,
  `adresse` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `therapeute`
--

INSERT INTO `therapeute` (`id`, `cin`, `email`, `nom`, `prenom`, `password`, `type`, `etat`, `numtel`, `adresse`, `image`, `lat`, `lng`) VALUES
(9, 77777777, 'azerty@gmail.com', 'aaa', 'aa', '493f890f399d382ea642e382ba77a242', 'therapeute', NULL, 12345678, 'Sousse', '036f03ab28eb387d7cd315d49110b330.jpeg', 35.8293, 10.6406),
(10, 77777777, 'azerty@gmail.com', 'aa', 'aa', '493f890f399d382ea642e382ba77a242', 'therapeute', NULL, 12345678, 'Nabeul, Nabeul', '1e871dc295975776a038316efd18a5c9.jpeg', 36.4518, 10.7352),
(11, 12345678, 'fourat.anane@esprit.tn', 'aaaaaaaaaa', 'bbbbbbbbbbbb', '456c3816494a33a4b404583cc54ffcb7', 'therapeute', NULL, 29431248, 'Rue Hannibal', '7aedbde804afd6fe7166bb431fa42134.jpeg', 36.8823, 10.2718),
(12, 12345674, 'azerty2@gmail.com', 'mohamed', 'amine', '456c3816494a33a4b404583cc54ffcb7', 'therapeute', NULL, 12345678, 'Rue Hannibal', '3b3fbaa7429db9373799c023af5b479e.jpeg', 36.8823, 10.2718);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cin` int(11) NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etat` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `cin`, `email`, `nom`, `prenom`, `password`, `type`, `etat`) VALUES
(1, 12343214, 'yassine.benouaghrem@esprit.tn', 'ben ouaghrem', 'yassine', '456c3816494a33a4b404583cc54ffcb7', 'client', 'inscrit'),
(5, 28653254, 'zenlifezenlife02@gmail.com', 'zenlife', 'zenlife', '456c3816494a33a4b404583cc54ffcb7', 'admin', 'banne'),
(7, 23147898, 'mohamed@esprit.tn', 'mohamed ', 'belkhouja', '456c3816494a33a4b404583cc54ffcb7', 'client', 'inscrit'),
(12, 12345677, 'mohamed@esprit.tn', 'mohamed', 'amin', '25f9e794323b453885f5181f1b624d0b', 'client', 'inscrit'),
(25, 12457800, 'yassine.clubiste1@hotmail.fr', 'ben ouaghrem', 'yassine', '456c3816494a33a4b404583cc54ffcb7', 'client', 'attente'),
(26, 14768321, 'eskanderjguirim@yahoo.fr', 'jguirim', 'adam', '3e7b522b9756d2578d3a86d8f366be6e', 'client', 'inscrit');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C45712411` FOREIGN KEY (`idreco_id`) REFERENCES `reco` (`id`),
  ADD CONSTRAINT `FK_9474526C786A81FB` FOREIGN KEY (`iduser_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
