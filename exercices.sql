
 --
 -- INSTALLATION
 --

CREATE DATABASE entreprise_exo;
USE entreprise_exo;

CREATE TABLE employes (
    id_employes int(3) NOT NULL AUTO_INCREMENT,
    prenom varchar(20),
    nom varchar(20),
    sexe enum('m', 'f') NOT NULL,
    service varchar(30),
    date_embauche date,
    salaire float,
    PRIMARY KEY (id_employes)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO employes (id_employes, prenom, nom, sexe, service, date_embauche, salaire) VALUES
(350, 'Jean-pierre', 'Laborde', 'm', 'direction', '2010-12-09', 5000),
(388, 'Clement', 'Gallet', 'm', 'commercial', '2010-12-15', 2300),
(415, 'Thomas', 'Winter', 'm', 'commercial', '2011-05-03', 3550),
(417, 'Chloe', 'Dubar', 'f', 'production', '2011-09-05', 1900),
(491, 'Elodie', 'Fellier', 'f', 'secretariat', '2011-11-22', 1600),
(509, 'Fabrice', 'Grand', 'm', 'comptabilite', '2011-12-30', 2900),
(547, 'Melanie', 'Collier', 'f', 'commercial', '2012-01-08', 3100),
(592, 'Laura', 'Blanchet', 'f', 'direction', '2012-05-09', 4500),
(627, 'Guillaume', 'Miller', 'm', 'commercial', '2012-07-02', 1900),
(655, 'Celine', 'Perrin', 'f', 'commercial', '2012-09-10', 2700),
(699, 'Julien', 'Cottet', 'm', 'secretariat', '2013-01-05', 1390),
(701, 'Mathieu', 'Vignal', 'm', 'informatique', '2013-04-03', 2500),
(739, 'Thierry', 'Desprez', 'm', 'secretariat', '2013-07-17', 1500),
(780, 'Amandine', 'Thoyer', 'f', 'communication', '2014-01-23', 2100),
(802, 'Damien', 'Durand', 'm', 'informatique', '2014-07-05', 2250),
(854, 'Daniel', 'Chevel', 'm', 'informatique', '2015-09-28', 3100),
(876, 'Nathalie', 'Martin', 'f', 'juridique', '2016-01-12', 3550),
(900, 'Benoit', 'Lagarde', 'm', 'production', '2016-06-03', 2550),
(933, 'Emilie', 'Sennard', 'f', 'commercial', '2017-01-11', 1800),
(990, 'Stephanie', 'Lafaye', 'f', 'assistant', '2017-03-01', 1775);

 --
 -- EXERCICES
 --

 -- Reponse 1
SELECT
    id_employes AS 'Numero',
    service AS 'Profession'
FROM employes
WHERE id_employes=547;

 -- Reponse 2
SELECT
    date_embauche AS 'Amandine a ete embauchee le'
FROM employes
WHERE prenom = 'Amandine';

 -- Reponse 3
SELECT
    prenom AS 'Prenom',
    nom AS 'Nom de famille'
FROM employes
WHERE prenom = 'Guillaume';

 -- Reponse 4
SELECT nom
FROM employes
WHERE id_employes
LIKE '5%';

 -- Reponse 5
SELECT
    service AS 'Service',
    COUNT(*) AS 'Nombre de personnes'
FROM employes
WHERE service = 'commercial';

 -- Reponse 6
SELECT
    service AS 'Service',
    ROUND(AVG(salaire)) AS 'Moyenne de salaire'
FROM employes
WHERE service = 'informatique';

 -- Reponse 7
SELECT nom AS '5 employes par ordre alpha'
FROM employes
ORDER BY nom ASC
LIMIT 5;

 -- Reponse 8
SELECT
    SUM(salaire * 12) AS 'Salaires annuels du service commercial'
FROM employes
WHERE service = 'commercial';

 -- Reponse 9
SELECT
    service AS 'Service',
    ROUND(AVG(salaire)) AS 'Salaire moyen'
FROM employes
GROUP BY service;

 -- Reponse 10
SELECT
    COUNT(*) AS 'Personnes recrutees en 2010'
FROM employes
WHERE date_embauche
BETWEEN '2010-01-01' AND '2010-12-31';

 -- Reponse 11
SELECT
    ROUND(AVG(salaire)) AS 'Salaire moyen 2015/2017'
FROM employes
WHERE date_embauche
BETWEEN '2015-01-01' AND '2017-12-31';

 -- Reponse 12
SELECT
    COUNT(DISTINCT service) AS 'Nombres de services'
FROM employes;

 -- Reponse 13
SELECT *
FROM employes
WHERE service
NOT IN ('secretariat', 'production');

 -- Reponse 14
SELECT DISTINCT
    (SELECT COUNT(*) FROM employes WHERE sexe = "m") AS "Nombre d'hommes",
    (SELECT COUNT(*) FROM employes WHERE sexe = "f") AS "Nombre de femmes"
FROM employes;

 -- Reponse 15
SELECT
    CONCAT(nom, ' ', prenom) AS 'Commerciaux recrutes avant 2012'
FROM employes
WHERE service = 'commercial'
AND sexe = 'm'
AND date_embauche < '2012-01-01'
AND salaire > 2500;

 -- Reponse 16
SELECT
    CONCAT(nom, ' ', prenom) AS 'Dernier embauché'
FROM employes
ORDER BY date_embauche DESC
LIMIT 1;

 -- Reponse 17
SELECT *
FROM employes
WHERE service = 'commercial'
ORDER BY salaire DESC
LIMIT 1;

 -- Reponse 18
SELECT
    prenom AS 'Premier informaticien recrute'
FROM employes
WHERE service = 'comptabilite'
ORDER BY salaire DESC
LIMIT 1;

 -- Reponse 18
SELECT
    prenom AS 'Premier informaticien recrute'
FROM employes
WHERE service = 'informatique'
ORDER BY date_embauche ASC
LIMIT 1;

 -- Reponse 20
SELECT nom, prenom, salaire, (salaire + 100) AS 'Augmentation'
FROM employes;

 -- Reponse 21
DELETE WHERE service = 'secretariat';
 -- Vérification
SELECT *
FROM employes
WHERE service = 'secretariat';

DROP DATABASE entreprise_exo;
