-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 18 nov. 2026 à 15:52
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `it_manager`
--

-- --------------------------------------------------------

--
-- Structure de la table `affecter`
--

CREATE TABLE `affecter` (
  `date_attribution` date NOT NULL,
  `date_restitution` date DEFAULT NULL,
  `id_matricule` int(11) NOT NULL,
  `num_serie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `CATEGORIES`
--

CREATE TABLE `CATEGORIES` (
  `id_categorie` int(11) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `duree_amortissement_ans` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `COLLABORATEUR`
--

CREATE TABLE `COLLABORATEUR` (
  `id_matricule` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `num_tel_int` varchar(50) NOT NULL,
  `date_embauche` int(11) NOT NULL,
  `code_site` int(50) NOT NULL,
  `code_service` int(11) NOT NULL,
  `num_serie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `declarer`
--

CREATE TABLE `declarer` (
  `num_ticket` int(11) NOT NULL,
  `id_matricule` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `EQUIPEMENTS`
--

CREATE TABLE `EQUIPEMENTS` (
  `num_serie` int(11) NOT NULL,
  `marque` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `date_achat` date NOT NULL,
  `prix_achat` int(11) NOT NULL,
  `date_fin_garantie` date NOT NULL,
  `etat` varchar(25) NOT NULL,
  `num_ticket` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `id_fournisseur` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `FOURNISSEURS`
--

CREATE TABLE `FOURNISSEURS` (
  `id_fournisseur` int(50) NOT NULL,
  `raison_sociale` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `delai_livraison_jour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `LOGICIELS_INSTALLES`
--

CREATE TABLE `LOGICIELS_INSTALLES` (
  `id_logiciel` int(11) NOT NULL,
  `nom_logiciel` varchar(50) NOT NULL,
  `editeur` varchar(50) NOT NULL,
  `version` varchar(50) NOT NULL,
  `type_licence` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `posseder`
--

CREATE TABLE `posseder` (
  `num_serie` int(11) NOT NULL,
  `id_logiciel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `SERVICES`
--

CREATE TABLE `SERVICES` (
  `code_service` int(11) NOT NULL,
  `nom_service` varchar(50) NOT NULL,
  `budget_annuel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `SITES`
--

CREATE TABLE `SITES` (
  `code_site` int(50) NOT NULL,
  `nom_site` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `code_service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `TICKETS_INCIDENT`
--

CREATE TABLE `TICKETS_INCIDENT` (
  `num_ticket` int(11) NOT NULL,
  `date_ouverture` date NOT NULL,
  `description` varchar(50) NOT NULL,
  `panne` varchar(50) NOT NULL,
  `niveau_urgence` varchar(25) NOT NULL,
  `statut` varchar(25) NOT NULL,
  `date_cloture` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `affecter`
--
ALTER TABLE `affecter`
  ADD KEY `id_matricule` (`id_matricule`),
  ADD KEY `num_serie` (`num_serie`);

--
-- Index pour la table `CATEGORIES`
--
ALTER TABLE `CATEGORIES`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `COLLABORATEUR`
--
ALTER TABLE `COLLABORATEUR`
  ADD PRIMARY KEY (`id_matricule`),
  ADD KEY `code_site` (`code_site`),
  ADD KEY `code_service` (`code_service`),
  ADD KEY `num_serie` (`num_serie`);

--
-- Index pour la table `declarer`
--
ALTER TABLE `declarer`
  ADD KEY `id_matricule` (`id_matricule`),
  ADD KEY `num_ticket` (`num_ticket`);

--
-- Index pour la table `EQUIPEMENTS`
--
ALTER TABLE `EQUIPEMENTS`
  ADD PRIMARY KEY (`num_serie`),
  ADD KEY `num_ticket` (`num_ticket`),
  ADD KEY `id_categorie` (`id_categorie`),
  ADD KEY `id_fournisseur` (`id_fournisseur`);

--
-- Index pour la table `FOURNISSEURS`
--
ALTER TABLE `FOURNISSEURS`
  ADD PRIMARY KEY (`id_fournisseur`);

--
-- Index pour la table `LOGICIELS_INSTALLES`
--
ALTER TABLE `LOGICIELS_INSTALLES`
  ADD PRIMARY KEY (`id_logiciel`);

--
-- Index pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD KEY `num_serie` (`num_serie`),
  ADD KEY `id_logiciel` (`id_logiciel`);

--
-- Index pour la table `SERVICES`
--
ALTER TABLE `SERVICES`
  ADD PRIMARY KEY (`code_service`);

--
-- Index pour la table `SITES`
--
ALTER TABLE `SITES`
  ADD PRIMARY KEY (`code_site`),
  ADD KEY `code_service` (`code_service`);

--
-- Index pour la table `TICKETS_INCIDENT`
--
ALTER TABLE `TICKETS_INCIDENT`
  ADD PRIMARY KEY (`num_ticket`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `affecter`
--
ALTER TABLE `affecter`
  ADD CONSTRAINT `affecter_ibfk_1` FOREIGN KEY (`id_matricule`) REFERENCES `COLLABORATEUR` (`id_matricule`),
  ADD CONSTRAINT `affecter_ibfk_2` FOREIGN KEY (`num_serie`) REFERENCES `EQUIPEMENTS` (`num_serie`);

--
-- Contraintes pour la table `COLLABORATEUR`
--
ALTER TABLE `COLLABORATEUR`
  ADD CONSTRAINT `collaborateur_ibfk_1` FOREIGN KEY (`code_site`) REFERENCES `SITES` (`code_site`),
  ADD CONSTRAINT `collaborateur_ibfk_2` FOREIGN KEY (`code_service`) REFERENCES `SERVICES` (`code_service`),
  ADD CONSTRAINT `collaborateur_ibfk_3` FOREIGN KEY (`num_serie`) REFERENCES `EQUIPEMENTS` (`num_serie`);

--
-- Contraintes pour la table `declarer`
--
ALTER TABLE `declarer`
  ADD CONSTRAINT `declarer_ibfk_1` FOREIGN KEY (`id_matricule`) REFERENCES `COLLABORATEUR` (`id_matricule`),
  ADD CONSTRAINT `declarer_ibfk_2` FOREIGN KEY (`num_ticket`) REFERENCES `TICKETS_INCIDENT` (`num_ticket`);

--
-- Contraintes pour la table `EQUIPEMENTS`
--
ALTER TABLE `EQUIPEMENTS`
  ADD CONSTRAINT `equipements_ibfk_1` FOREIGN KEY (`num_ticket`) REFERENCES `TICKETS_INCIDENT` (`num_ticket`),
  ADD CONSTRAINT `equipements_ibfk_2` FOREIGN KEY (`id_categorie`) REFERENCES `CATEGORIES` (`id_categorie`),
  ADD CONSTRAINT `equipements_ibfk_3` FOREIGN KEY (`id_fournisseur`) REFERENCES `FOURNISSEURS` (`id_fournisseur`);

--
-- Contraintes pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD CONSTRAINT `posseder_ibfk_1` FOREIGN KEY (`num_serie`) REFERENCES `EQUIPEMENTS` (`num_serie`),
  ADD CONSTRAINT `posseder_ibfk_2` FOREIGN KEY (`id_logiciel`) REFERENCES `LOGICIELS_INSTALLES` (`id_logiciel`);

--
-- Contraintes pour la table `SITES`
--
ALTER TABLE `SITES`
  ADD CONSTRAINT `sites_ibfk_1` FOREIGN KEY (`code_service`) REFERENCES `SERVICES` (`code_service`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
