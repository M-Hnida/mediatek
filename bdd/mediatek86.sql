-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 31 mai 2026 à 10:00
-- Version du serveur : 8.0.45
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bdmediatek86`
--
CREATE DATABASE IF NOT EXISTS `bdmediatek86` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'adminmediatek'@'localhost' IDENTIFIED BY 'mediatek86';
GRANT ALL PRIVILEGES ON `bdmediatek86`.* TO 'adminmediatek'@'localhost';
USE `bdmediatek86`;

SET FOREIGN_KEY_CHECKS = 0;

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `idservice` int NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`idservice`, `nom`) VALUES
(1, 'administratif'),
(2, 'médiation culturelle'),
(3, 'prêt');

-- --------------------------------------------------------

--
-- Structure de la table `motif`
--

DROP TABLE IF EXISTS `motif`;
CREATE TABLE `motif` (
  `idmotif` int NOT NULL,
  `libelle` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `motif`
--

INSERT INTO `motif` (`idmotif`, `libelle`) VALUES
(1, 'vacances'),
(2, 'maladie'),
(3, 'motif familial'),
(4, 'congé parental');

-- --------------------------------------------------------

--
-- Structure de la table `responsable`
--

DROP TABLE IF EXISTS `responsable`;
CREATE TABLE `responsable` (
  `login` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pwd` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `responsable`
--

INSERT INTO `responsable` (`login`, `pwd`) VALUES
('admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
CREATE TABLE `personnel` (
  `idpersonnel` int NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idservice` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personnel`
--

INSERT INTO `personnel` (`idpersonnel`, `nom`, `prenom`, `tel`, `mail`, `idservice`) VALUES
(1, 'Flores', 'Anthony', '0612345001', 'anthony.flores@yahoo.fr', 1),
(2, 'Kemp', 'Aspen', '0612345002', 'aspen.kemp@aol.fr', 2),
(3, 'Giles', 'Keaton', '0612345003', 'keaton.giles@google.fr', 1),
(4, 'Burris', 'Lila', '0612345004', 'lila.burris@google.fr', 2),
(5, 'Crawford', 'Ethan', '0612345005', 'ethan.crawford@google.fr', 3),
(6, 'Dominguez', 'Fallon', '0612345006', 'fallon.dominguez@aol.fr', 3),
(7, 'Cummings', 'Claudia', '0612345007', 'claudia.cummings@aol.fr', 3),
(8, 'Herman', 'Halla', '0612345008', 'halla.herman@hotmail.fr', 1),
(9, 'Haney', 'Burke', '0612345009', 'burke.haney@protonmail.fr', 1),
(10, 'Rutledge', 'Reece', '0612345010', 'reece.rutledge@yahoo.fr', 2);

-- --------------------------------------------------------

--
-- Structure de la table `absence`
--

DROP TABLE IF EXISTS `absence`;
CREATE TABLE `absence` (
  `idpersonnel` int NOT NULL,
  `datedebut` datetime NOT NULL,
  `datefin` datetime DEFAULT NULL,
  `idmotif` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `absence`
--

INSERT INTO `absence` (`idpersonnel`, `datedebut`, `datefin`, `idmotif`) VALUES
(1, '2024-01-15 00:00:00', '2024-01-22 00:00:00', 1),
(1, '2024-03-04 00:00:00', '2024-03-06 00:00:00', 2),
(1, '2024-07-22 00:00:00', '2024-08-12 00:00:00', 1),
(1, '2024-11-18 00:00:00', '2024-11-20 00:00:00', 3),
(1, '2025-02-10 00:00:00', '2025-02-14 00:00:00', 1),
(2, '2024-02-05 00:00:00', '2024-02-09 00:00:00', 2),
(2, '2024-05-13 00:00:00', '2024-05-17 00:00:00', 1),
(2, '2024-09-02 00:00:00', '2024-09-13 00:00:00', 1),
(2, '2025-01-06 00:00:00', '2025-01-08 00:00:00', 3),
(2, '2025-04-21 00:00:00', '2025-04-25 00:00:00', 1),
(3, '2024-01-29 00:00:00', '2024-02-02 00:00:00', 1),
(3, '2024-06-10 00:00:00', '2024-06-14 00:00:00', 2),
(3, '2024-10-07 00:00:00', '2024-10-25 00:00:00', 4),
(3, '2025-03-17 00:00:00', '2025-03-19 00:00:00', 3),
(3, '2025-07-14 00:00:00', '2025-08-01 00:00:00', 1),
(4, '2024-02-19 00:00:00', '2024-02-23 00:00:00', 1),
(4, '2024-05-27 00:00:00', '2024-05-31 00:00:00', 2),
(4, '2024-09-16 00:00:00', '2024-09-20 00:00:00', 1),
(4, '2025-02-24 00:00:00', '2025-02-28 00:00:00', 3),
(4, '2025-06-09 00:00:00', '2025-06-13 00:00:00', 1),
(5, '2024-03-11 00:00:00', '2024-03-15 00:00:00', 2),
(5, '2024-08-05 00:00:00', '2024-08-16 00:00:00', 1),
(5, '2024-12-23 00:00:00', '2024-12-27 00:00:00', 1),
(5, '2025-04-07 00:00:00', '2025-04-11 00:00:00', 3),
(5, '2025-09-22 00:00:00', '2025-09-26 00:00:00', 2),
(6, '2024-04-08 00:00:00', '2024-04-12 00:00:00', 1),
(6, '2024-07-15 00:00:00', '2024-07-26 00:00:00', 1),
(6, '2024-11-04 00:00:00', '2024-11-08 00:00:00', 2),
(6, '2025-03-03 00:00:00', '2025-03-07 00:00:00', 1),
(6, '2025-08-18 00:00:00', '2025-08-29 00:00:00', 1),
(7, '2024-02-26 00:00:00', '2024-03-01 00:00:00', 3),
(7, '2024-06-17 00:00:00', '2024-06-21 00:00:00', 1),
(7, '2024-10-14 00:00:00', '2024-10-18 00:00:00', 2),
(7, '2025-05-12 00:00:00', '2025-05-16 00:00:00', 1),
(7, '2025-10-06 00:00:00', '2025-10-10 00:00:00', 4),
(8, '2024-01-08 00:00:00', '2024-01-12 00:00:00', 2),
(8, '2024-04-22 00:00:00', '2024-04-26 00:00:00', 1),
(8, '2024-08-26 00:00:00', '2024-09-06 00:00:00', 1),
(8, '2025-01-20 00:00:00', '2025-01-24 00:00:00', 3),
(8, '2025-06-23 00:00:00', '2025-07-04 00:00:00', 1),
(9, '2024-03-25 00:00:00', '2024-03-29 00:00:00', 1),
(9, '2024-07-01 00:00:00', '2024-07-12 00:00:00', 1),
(9, '2024-11-25 00:00:00', '2024-11-29 00:00:00', 2),
(9, '2025-04-14 00:00:00', '2025-04-18 00:00:00', 3),
(9, '2025-09-08 00:00:00', '2025-09-19 00:00:00', 1),
(10, '2024-05-06 00:00:00', '2024-05-10 00:00:00', 1),
(10, '2024-09-23 00:00:00', '2024-09-27 00:00:00', 2),
(10, '2024-12-09 00:00:00', '2024-12-13 00:00:00', 3),
(10, '2025-05-19 00:00:00', '2025-05-30 00:00:00', 1),
(10, '2025-10-13 00:00:00', '2025-10-17 00:00:00', 4);

-- --------------------------------------------------------

--
-- Index pour les tables déchargées
--

ALTER TABLE `service`
  ADD PRIMARY KEY (`idservice`);

ALTER TABLE `motif`
  ADD PRIMARY KEY (`idmotif`);

ALTER TABLE `personnel`
  ADD PRIMARY KEY (`idpersonnel`),
  ADD KEY `idservice` (`idservice`);

ALTER TABLE `absence`
  ADD PRIMARY KEY (`idpersonnel`,`datedebut`),
  ADD KEY `idmotif` (`idmotif`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

ALTER TABLE `service`
  MODIFY `idservice` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `motif`
  MODIFY `idmotif` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `personnel`
  MODIFY `idpersonnel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

ALTER TABLE `personnel`
  ADD CONSTRAINT `personnel_ibfk_1` FOREIGN KEY (`idservice`) REFERENCES `service` (`idservice`);

ALTER TABLE `absence`
  ADD CONSTRAINT `absence_ibfk_1` FOREIGN KEY (`idpersonnel`) REFERENCES `personnel` (`idpersonnel`),
  ADD CONSTRAINT `absence_ibfk_2` FOREIGN KEY (`idmotif`) REFERENCES `motif` (`idmotif`);

SET FOREIGN_KEY_CHECKS = 1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;