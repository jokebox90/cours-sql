


-- Ceci est un commentaire jusqu'à la fin de la ligne
/* Ceci est un commentaire uniquement entre les deux indicateurs */

-- On évite de mettre des commentaires en SQL, on les mettra plutôt dans le PHP

-- Lien utile, la documentation SQL : https://sql.sh/

-- Les requetes ne sont pas sensibles à la casse, en revanche, une convention d'écriture nous demande d'écrire les mots clés en majuscule
-- SELECT prenom FROM abonnes;

-- Chaque instruction doit se terminer par un ;

-- Pour se connecter à la console MySQL :

-- Pour lancer la console mysql depuis xampp
-- Bouton Shell à droite du panneau de controle et ensuite écrire : mysql -u root -p  puis faire entrée deux fois
-- Pour lancer la console mysql depuis mamp
-- Ouvrir le terminal de Mac Os et écrire la ligne ci-dessous (installation par défaut)
-- /Applications/MAMP/Library/bin/mysql -u root -p
-- Enter password:     (il faut écrire root pour mamp)

CREATE DATABASE ma_bdd;
CREATE DATABASE entreprise; -- CREATE DATABASE permet de créer une BDD

SHOW DATABASES; -- Pour voir la liste des BDD sur le serveur
SHOW TABLES; -- Pour voir la liste des tables d'une BDD
SHOW WARNINGS; -- Les warnings de la derniere requete exécutée

USE ma_bdd; -- Pour se positionner sur une BDD afin de pouvoir travailler dessus, on utilise USE
USE entreprise;

DROP DATABASE ma_bdd; -- Pour supprimer une BDD
DROP TABLE nom_de_la_table; -- Pour supprimer une table

TRUNCATE nom_de_la_table; -- Pour vider les données d'une table, mais garder sa structure

DESC nom_de_la_table; -- Pour avoir un affichage de la structure de la table

CREATE DATABASE entreprise;
USE entreprise;

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

--------------------------------------------------------------------------
--------------------------------------------------------------------------
---   REQUETES DE SELECTION (On questionne la BDD) -----------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------

-- Affichage complet des données de la table (dans l'ordre de la structure de la table)
SELECT * FROM employes;

-- Selection de simplement quelques champs de la table
SELECT nom, prenom FROM employes;

-- Affichage complet des données de la table dans l'ordre souhaité (l'ordre d'écriture de notre requete)
SELECT id_employes, nom, prenom, sexe, service, date_embauche, salaire FROM employes;

-- EXERCICE : Affichez la liste des différents services de la table employes
SELECT service FROM employes;
-- Pour éviter les doublons, on utilise DISTINCT
SELECT DISTINCT service FROM employes;

-- CONDITION WHERE
-- Affichage des employes du service informatique
SELECT * FROM employes WHERE service = 'informatique'; -- Pour les chaines de caractères : '' ou ""
SELECT * FROM employes WHERE service = "informatique";
-- +-------------+---------+--------+------+--------------+---------------+---------+
-- | id_employes | prenom  | nom    | sexe | service      | date_embauche | salaire |
-- +-------------+---------+--------+------+--------------+---------------+---------+
-- |         701 | Mathieu | Vignal | m    | informatique | 2013-04-03    |    2500 |
-- |         802 | Damien  | Durand | m    | informatique | 2014-07-05    |    2250 |
-- |         854 | Daniel  | Chevel | m    | informatique | 2015-09-28    |    3100 |
-- +-------------+---------+--------+------+--------------+---------------+---------+

-- BETWEEN
-- Affichage des employes ayant été embauché entre 2015 et aujourd'hui
SELECT * FROM employes WHERE date_embauche BETWEEN '2015-01-01' AND '2022-01-17';
-- +-------------+-----------+---------+------+--------------+---------------+---------+
-- | id_employes | prenom    | nom     | sexe | service      | date_embauche | salaire |
-- +-------------+-----------+---------+------+--------------+---------------+---------+
-- |         854 | Daniel    | Chevel  | m    | informatique | 2015-09-28    |    3100 |
-- |         876 | Nathalie  | Martin  | f    | juridique    | 2016-01-12    |    3550 |
-- |         900 | Benoit    | Lagarde | m    | production   | 2016-06-03    |    2550 |
-- |         933 | Emilie    | Sennard | f    | commercial   | 2017-01-11    |    1800 |
-- |         990 | Stephanie | Lafaye  | f    | assistant    | 2017-03-01    |    1775 |
-- +-------------+-----------+---------+------+--------------+---------------+---------+

SELECT CURDATE(); -- Nous renvoie la date du jour
-- Avec MySQL les parenthèses d'une fonction doivent être collées à la fonction
SELECT * FROM employes WHERE date_embauche BETWEEN '2015-01-01' AND CURDATE(); -- Pour avoir la date du jour courant en dynamique

-- LIKE la valeur approchante
-- Like nous permet de rechercher une information sans l'écrire completement / à partir d'une saisie partielle
-- Affichage des prenoms commençant par la lettre "s"
SELECT prenom FROM employes WHERE prenom LIKE 's%';
-- % : signifie : "peu importe la suite"
-- +-----------+
-- | prenom    |
-- +-----------+
-- | Stephanie |
-- +-----------+

-- Affichage des prénoms finissant par les lettres "ie"
SELECT prenom FROM employes WHERE prenom LIKE '%ie';
-- +-----------+
-- | prenom    |
-- +-----------+
-- | Elodie    |
-- | Melanie   |
-- | Nathalie  |
-- | Emilie    |
-- | Stephanie |
-- +-----------+

-- Affichage des prénoms contenant les lettres "ie" (début, fin, milieu)
SELECT prenom FROM employes WHERE prenom LIKE '%ie%';
-- +-------------+
-- | prenom      |
-- +-------------+
-- | Jean-pierre |
-- | Elodie      |
-- | Melanie     |
-- | Julien      |
-- | Mathieu     |
-- | Thierry     |
-- | Damien      |
-- | Daniel      |
-- | Nathalie    |
-- | Emilie      |
-- | Stephanie   |
-- +-------------+

-- Exemple :
-- BDD d'une agence immobilière

-- id    -- type    -- cp
-----------------------------------
-- 10    -- appart  -- 34000
-- 11    -- maison  -- 69000
-- 12    -- appart  -- 75000
-- 13    -- appart  -- 34400

-- Dans le formulaire de recherche, l'utilisateur cherche le code postal, en utilisant LIKE 34%  il aura les deux appart id 10 et 13
-- SELECT * FROM table WHERE cp LIKE '34%';

-- EXCLUSION
-- Tous les employes d'un service, sauf un, par exemple, on va exclure le service commercial
SELECT * FROM employes WHERE service != 'commercial';
-- +-------------+-------------+----------+------+---------------+---------------+---------+
-- | id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
-- +-------------+-------------+----------+------+---------------+---------------+---------+
-- |         350 | Jean-pierre | Laborde  | m    | direction     | 2010-12-09    |    5000 |
-- |         417 | Chloe       | Dubar    | f    | production    | 2011-09-05    |    1900 |
-- |         491 | Elodie      | Fellier  | f    | secretariat   | 2011-11-22    |    1600 |
-- |         509 | Fabrice     | Grand    | m    | comptabilite  | 2011-12-30    |    2900 |
-- |         592 | Laura       | Blanchet | f    | direction     | 2012-05-09    |    4500 |
-- |         699 | Julien      | Cottet   | m    | secretariat   | 2013-01-05    |    1390 |
-- |         701 | Mathieu     | Vignal   | m    | informatique  | 2013-04-03    |    2500 |
-- |         739 | Thierry     | Desprez  | m    | secretariat   | 2013-07-17    |    1500 |
-- |         780 | Amandine    | Thoyer   | f    | communication | 2014-01-23    |    2100 |
-- |         802 | Damien      | Durand   | m    | informatique  | 2014-07-05    |    2250 |
-- |         854 | Daniel      | Chevel   | m    | informatique  | 2015-09-28    |    3100 |
-- |         876 | Nathalie    | Martin   | f    | juridique     | 2016-01-12    |    3550 |
-- |         900 | Benoit      | Lagarde  | m    | production    | 2016-06-03    |    2550 |
-- |         990 | Stephanie   | Lafaye   | f    | assistant     | 2017-03-01    |    1775 |
-- +-------------+-------------+----------+------+---------------+---------------+---------+

-- Les opérateurs de comparaison :
--  =  est égal à
--  != est différent de
--  >  strictement supérieur
--  >= supérieur ou égal
--  < strictement inférieur
--  <= inférieur ou égal

-- Les employes ayant un salaire supérieur à 3000
SELECT nom, prenom, service, salaire FROM employes WHERE salaire >= 3000; -- valeur numérique les guillemets ne sont pas obligatoires, les mettre est possible malgré tout
-- +----------+-------------+--------------+---------+
-- | nom      | prenom      | service      | salaire |
-- +----------+-------------+--------------+---------+
-- | Laborde  | Jean-pierre | direction    |    5000 |
-- | Winter   | Thomas      | commercial   |    3550 |
-- | Collier  | Melanie     | commercial   |    3100 |
-- | Blanchet | Laura       | direction    |    4500 |
-- | Chevel   | Daniel      | informatique |    3100 |
-- | Martin   | Nathalie    | juridique    |    3550 |
-- +----------+-------------+--------------+---------+

-- ORDER BY pour ordonner les résultats
-- Affichage des employes dans l'ordre alphabétique
SELECT * FROM employes ORDER BY nom;
SELECT * FROM employes ORDER BY nom ASC; -- ASC pour ascendant (cas par défaut si non précisé dans la requete)
-- Ordre inversé : DESC pour descendant
SELECT * FROM employes ORDER BY nom DESC;
-- Il est possible d'ordonner sur plusieurs champs. Si le premier order by a des valeurs similaires, on se basera sur les order by suivants
-- Ordonner selon le service puis le nom
SELECT service, nom, prenom FROM employes ORDER BY service;
SELECT service, nom, prenom FROM employes ORDER BY service, nom ASC;

-- LIMIT pour limiter le nombre de résultat (par exemple, pour une pagination)
-- Affichage des employés 3 par 3
SELECT * FROM employes LIMIT 0, 3; -- LIMITE position_de_depart, nb_de_ligne
-- +-------------+-------------+---------+------+------------+---------------+---------+
-- | id_employes | prenom      | nom     | sexe | service    | date_embauche | salaire |
-- +-------------+-------------+---------+------+------------+---------------+---------+
-- |         350 | Jean-pierre | Laborde | m    | direction  | 2010-12-09    |    5000 |
-- |         388 | Clement     | Gallet  | m    | commercial | 2010-12-15    |    2300 |
-- |         415 | Thomas      | Winter  | m    | commercial | 2011-05-03    |    3550 |
-- +-------------+-------------+---------+------+------------+---------------+---------+
SELECT * FROM employes LIMIT 3, 3;
-- +-------------+---------+---------+------+--------------+---------------+---------+
-- | id_employes | prenom  | nom     | sexe | service      | date_embauche | salaire |
-- +-------------+---------+---------+------+--------------+---------------+---------+
-- |         417 | Chloe   | Dubar   | f    | production   | 2011-09-05    |    1900 |
-- |         491 | Elodie  | Fellier | f    | secretariat  | 2011-11-22    |    1600 |
-- |         509 | Fabrice | Grand   | m    | comptabilite | 2011-12-30    |    2900 |
-- +-------------+---------+---------+------+--------------+---------------+---------+
SELECT * FROM employes LIMIT 6, 3;
-- +-------------+-----------+----------+------+------------+---------------+---------+
-- | id_employes | prenom    | nom      | sexe | service    | date_embauche | salaire |
-- +-------------+-----------+----------+------+------------+---------------+---------+
-- |         547 | Melanie   | Collier  | f    | commercial | 2012-01-08    |    3100 |
-- |         592 | Laura     | Blanchet | f    | direction  | 2012-05-09    |    4500 |
-- |         627 | Guillaume | Miller   | m    | commercial | 2012-07-02    |    1900 |
-- +-------------+-----------+----------+------+------------+---------------+---------+

-- Il est possible de ne donner qu'un seul argument à LIMIT, dans ce cas la position de départ sera toujours l'élément numéro 0 du résultat de la requete, et l'argument renseigné représentera le nombre de ligne à récupérer
SELECT * FROM employes LIMIT 3;
-- +-------------+-------------+---------+------+------------+---------------+---------+
-- | id_employes | prenom      | nom     | sexe | service    | date_embauche | salaire |
-- +-------------+-------------+---------+------+------------+---------------+---------+
-- |         350 | Jean-pierre | Laborde | m    | direction  | 2010-12-09    |    5000 |
-- |         388 | Clement     | Gallet  | m    | commercial | 2010-12-15    |    2300 |
-- |         415 | Thomas      | Winter  | m    | commercial | 2011-05-03    |    3550 |
-- +-------------+-------------+---------+------+------------+---------------+---------+

-- Affichage des employes avec leur salaire annuel
SELECT nom, prenom, service, salaire * 12 FROM employes;
-- La même requete avec un alias (surnom) sur la colonne du calcul
SELECT nom, prenom, service, salaire * 12 AS 'Salaire annuel' FROM employes;
-- AS nous permet de donner un surnom à la colonne lors de la récupération. Ici on mets des guillemets ou quote pour gérer l'espace
-- On pourrait s'en passer, en mettant à la place un _
SELECT nom, prenom, service, salaire * 12 AS salaire_annuel FROM employes;

-- SUM() pour avoir la somme
-- La masse salariale annuelle de l'entreprise
SELECT SUM(salaire * 12) AS masse_salariale FROM employes;
-- +-----------------+
-- | masse_salariale |
-- +-----------------+
-- |          623580 |
-- +-----------------+
SELECT SUM(salaire) * 12 AS masse_salariale FROM employes;

-- AVG() la moyenne
-- Affichage du salaire moyen de l'entreprise
SELECT AVG(salaire) AS salaire_moyen FROM employes;

-- ROUND() pour arrondir
-- ROUND(valeur) => arrondi à l'entier
-- ROUND(valeur, 1) => arrondi avec une décimale
SELECT ROUND(AVG(salaire)) AS salaire_moyen FROM employes; -- à l'entier
SELECT ROUND(AVG(salaire), 1) AS salaire_moyen FROM employes; -- avec une décimale

-- COUNT() permet de compter le nombre de ligne d'une requete
-- Le nombre d'employés dans l'entreprise :
SELECT COUNT(*) AS nombre FROM employes; -- COUNT() va faire +1 pour chaque ligne correspondant à la requete et nous renvoie le total
-- +--------+
-- | nombre |
-- +--------+
-- |     20 |
-- +--------+
-- On doit préciser un champ de la table ou sinon il est possible de mettre *
-- Si on met un champ dans les (), COUNT() ne rajoutera pas une ligne si la valeur de ce champ est NULL
-- Avec * on est sûr de compter toutes les lignes sans exception

SELECT COUNT(*) AS nombre FROM employes WHERE service = 'commercial';
-- +--------+
-- | nombre |
-- +--------+
-- |      6 |
-- +--------+

-- MIN() & MAX()
-- salaire minimum
SELECT MIN(salaire) AS mini FROM employes;
-- +------+
-- | mini |
-- +------+
-- | 1390 |
-- +------+
-- salaire maximum
SELECT MAX(salaire) AS max FROM employes;
-- +------+
-- | max  |
-- +------+
-- | 5000 |
-- +------+

-- EXERCICE : affichez le salaire minimum ainsi que le prenom de l'employes ayant ce salaire. VERIFIEZ BIEN le résultat
SELECT prenom, MIN(salaire) FROM employes; -- Pas d'erreur, ceci dit le résultat est FAUX
-- Comme MIN() ne peut renvoyer qu'un seul résultat, la requete a une reponse qui est incohérente
-- On récupère le premier prénom de la table puis le MIN() renvoie le salaire minimum et la requete est terminée, donc le prenom ne correspond pas.

-- 2 solutions

-- 1 - Avec un order by et un limit
SELECT nom, prenom, salaire FROM employes ORDER BY salaire ASC LIMIT 0, 1;
SELECT nom, prenom, salaire FROM employes ORDER BY salaire LIMIT 1;

-- 2 - requete imbriquée
SELECT nom, prenom, salaire FROM employes WHERE salaire = (SELECT MIN(salaire) FROM employes);

-- IN & NOT IN pour tester plusieurs valeurs
-- Affichage des employes des services commercial et comptabilite
SELECT * FROM employes WHERE service = 'commercial' OR service = 'comptabilite';
SELECT * FROM employes WHERE service IN ('commercial', 'comptabilite');
-- +-------------+-----------+---------+------+--------------+---------------+---------+
-- | id_employes | prenom    | nom     | sexe | service      | date_embauche | salaire |
-- +-------------+-----------+---------+------+--------------+---------------+---------+
-- |         388 | Clement   | Gallet  | m    | commercial   | 2010-12-15    |    2300 |
-- |         415 | Thomas    | Winter  | m    | commercial   | 2011-05-03    |    3550 |
-- |         509 | Fabrice   | Grand   | m    | comptabilite | 2011-12-30    |    2900 |
-- |         547 | Melanie   | Collier | f    | commercial   | 2012-01-08    |    3100 |
-- |         627 | Guillaume | Miller  | m    | commercial   | 2012-07-02    |    1900 |
-- |         655 | Celine    | Perrin  | f    | commercial   | 2012-09-10    |    2700 |
-- |         933 | Emilie    | Sennard | f    | commercial   | 2017-01-11    |    1800 |
-- +-------------+-----------+---------+------+--------------+---------------+---------+
SELECT * FROM employes WHERE service NOT IN ('commercial', 'comptabilite');
-- +-------------+-------------+----------+------+---------------+---------------+---------+
-- | id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
-- +-------------+-------------+----------+------+---------------+---------------+---------+
-- |         350 | Jean-pierre | Laborde  | m    | direction     | 2010-12-09    |    5000 |
-- |         417 | Chloe       | Dubar    | f    | production    | 2011-09-05    |    1900 |
-- |         491 | Elodie      | Fellier  | f    | secretariat   | 2011-11-22    |    1600 |
-- |         592 | Laura       | Blanchet | f    | direction     | 2012-05-09    |    4500 |
-- |         699 | Julien      | Cottet   | m    | secretariat   | 2013-01-05    |    1390 |
-- |         701 | Mathieu     | Vignal   | m    | informatique  | 2013-04-03    |    2500 |
-- |         739 | Thierry     | Desprez  | m    | secretariat   | 2013-07-17    |    1500 |
-- |         780 | Amandine    | Thoyer   | f    | communication | 2014-01-23    |    2100 |
-- |         802 | Damien      | Durand   | m    | informatique  | 2014-07-05    |    2250 |
-- |         854 | Daniel      | Chevel   | m    | informatique  | 2015-09-28    |    3100 |
-- |         876 | Nathalie    | Martin   | f    | juridique     | 2016-01-12    |    3550 |
-- |         900 | Benoit      | Lagarde  | m    | production    | 2016-06-03    |    2550 |
-- |         990 | Stephanie   | Lafaye   | f    | assistant     | 2017-03-01    |    1775 |
-- +-------------+-------------+----------+------+---------------+---------------+---------+

-- Plusieurs conditions : AND
-- On veut un employé du service commercial ayant un salaire inférieur ou égal à 2000
SELECT * FROM employes WHERE service = 'commercial' AND salaire <= 2000;

-- Dans le cas de multiples conditions, il est plus lisible (à votre convenance) de passer une ligne, SQL attendra de toute façon un ; pour terminer la requete
SELECT *                            -- Première ligne pour savoir ce que l'on souhaite obtenir
FROM employes                       -- Deuxième ligne pour selectionner la table que l'on veut manipuler
WHERE service = 'commercial'        -- Puis les conditions
AND salaire <= 2000;                -- Et encore une condition etc...
-- +-------------+-----------+---------+------+------------+---------------+---------+
-- | id_employes | prenom    | nom     | sexe | service    | date_embauche | salaire |
-- +-------------+-----------+---------+------+------------+---------------+---------+
-- |         627 | Guillaume | Miller  | m    | commercial | 2012-07-02    |    1900 |
-- |         933 | Emilie    | Sennard | f    | commercial | 2017-01-11    |    1800 |
-- +-------------+-----------+---------+------+------------+---------------+---------+

-- L'un ou l'autre d'un semble de conditions : OR
-- EXERCICE : Affichez les employes du service production ayant un salaire égal à 1900 ou 2300,   VERIFIER VOS RESULTATS
SELECT * FROM employes WHERE service = 'production' AND salaire = 1900 OR salaire = 2300;
-- Résultat incorrect car on comprends (production + 1900)     OU    (2300)


SELECT * FROM employes WHERE service = 'production' AND salaire = 1900 OR service = 'production' AND salaire = 2300;
SELECT * FROM employes WHERE service = 'production' AND (salaire = 1900 OR salaire = 2300);
SELECT * FROM employes WHERE service = 'production' AND salaire IN (1900,2300);
-- +-------------+--------+-------+------+------------+---------------+---------+
-- | id_employes | prenom | nom   | sexe | service    | date_embauche | salaire |
-- +-------------+--------+-------+------+------------+---------------+---------+
-- |         417 | Chloe  | Dubar | f    | production | 2011-09-05    |    1900 |
-- +-------------+--------+-------+------+------------+---------------+---------+

-- GROUP BY pour regrouper selon un ou des champs
-- Nombre d'employes par service
SELECT COUNT(*), service FROM employes; -- Résultat Incorrect ! Du fait du COUNT() qui ne renvoie qu'un seul résultat
-- Avec GROUP BY il est possible de demander de nous renvoyer le COUNT() en regroupant par service
SELECT COUNT(*) AS nombre, service FROM employes GROUP BY service;

-- Il est possible de mettre une condition sur un GROUP BY => HAVING (ayant)
-- Nombre d'employes par service, pour les services ayant plus de 2 employés
SELECT COUNT(*), service FROM employes GROUP BY service HAVING COUNT(*) > 2;
-- +----------+--------------+
-- | COUNT(*) | service      |
-- +----------+--------------+
-- |        6 | commercial   |
-- |        3 | informatique |
-- |        3 | secretariat  |
-- +----------+--------------+

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
------ REQUETES D'INSERTION (Action : enregistrement) -------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- id_employes étant la clé primaire en auto increment, ne peut pas etre vide, mais si on renseigne NULL, le sgbd la gère automatiquement avec un +1 par rapport au dernier enregistrement
INSERT INTO employes (id_employes, prenom, nom, salaire, sexe, service, date_embauche) VALUES (NULL, 'Pierre-Alex', 'Lacaze', 2000, 'm', 'Web', CURDATE() );
-- Vérif résultat de l'insertion
SELECT * FROM employes;
-- +-------------+-------------+----------+------+---------------+---------------+---------+
-- | id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
-- +-------------+-------------+----------+------+---------------+---------------+---------+
-- |         350 | Jean-Pierre | Laborde  | m    | direction     | 2010-12-09    |    5000 |
-- |         388 | Clement     | Gallet   | m    | commercial    | 2010-12-15    |    2300 |
-- |         415 | Thomas      | Winter   | m    | commercial    | 2011-05-03    |    3550 |
-- |         417 | Chloe       | Dubar    | f    | production    | 2011-09-05    |    1900 |
-- |         491 | Elodie      | Fellier  | f    | secretariat   | 2011-11-22    |    1600 |
-- |         509 | Fabrice     | Grand    | m    | comptabilite  | 2011-12-30    |    2900 |
-- |         547 | Melanie     | Collier  | f    | commercial    | 2012-01-08    |    3100 |
-- |         592 | Laura       | Blanchet | f    | direction     | 2012-05-09    |    4500 |
-- |         627 | Guillaume   | Miller   | m    | commercial    | 2012-07-02    |    1900 |
-- |         655 | Celine      | Perrin   | f    | commercial    | 2012-09-10    |    2700 |
-- |         699 | Julien      | Cottet   | m    | secretariat   | 2013-01-05    |    1390 |
-- |         701 | Mathieu     | Vignal   | m    | informatique  | 2013-04-03    |    2500 |
-- |         739 | Thierry     | Desprez  | m    | secretariat   | 2013-07-17    |    1500 |
-- |         780 | Amandine    | Thoyer   | f    | communication | 2014-01-23    |    2100 |
-- |         802 | Damien      | Durand   | m    | informatique  | 2014-07-05    |    2250 |
-- |         854 | Daniel      | Chevel   | m    | informatique  | 2015-09-28    |    3100 |
-- |         876 | Nathalie    | Martin   | f    | juridique     | 2016-01-12    |    3550 |
-- |         900 | Benoit      | Lagarde  | m    | production    | 2016-06-03    |    2550 |
-- |         933 | Emilie      | Sennard  | f    | commercial    | 2017-01-11    |    1800 |
-- |         990 | Stephanie   | Lafaye   | f    | assistant     | 2017-03-01    |    1775 |
-- |         991 | Pierre-Alex | Lacaze   | m    | Web           | 2022-01-18    |    2000 |
-- +-------------+-------------+----------+------+---------------+---------------+---------+

-- Il est possible de ne pas renseigner la clé primaire, elle s'incrémentera toute seule quoi qu'il en soit
INSERT INTO employes (prenom, nom, salaire, sexe, service, date_embauche) VALUES ('Pieral', 'Lac', 2500, 'm', 'Web', CURDATE());


-- Il est possible de ne pas préciser les champs. De ce fait, on est obligé de donner autant de valeur qu'il y a de champs dans la table et dans le même ordre que la structure de la table
INSERT INTO employes VALUES (NULL, 'Pierol', 'Loc', 'm', 'Web', CURDATE(), 2000);

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
------ REQUETES DE MODIFICATION (Action : modification) -----------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- On modifie le salaire d'un employe
UPDATE employes SET salaire = 2100 WHERE id_employes = 991;
-- plusieurs modifications sont possible en une seule fois
UPDATE employes SET salaire = 3000, service = 'informatique' WHERE id_employes = 992;

-- REPLACE
-- Dans le cas d'une nouvelle valeur, le REPLACE se comporte comme un INSERT INTO
REPLACE INTO employes VALUES (994, 'Paul', 'Dupont', 'm', 'Web', '2021-10-10', 4000);


-- Dans le cas où il y aurait une correspondance, le REPLACE supprime la ligne trouvée et réinsère une nouvelle ligne à la place
REPLACE INTO employes VALUES (994, 'Paula', 'Durand', 'f', 'Web', '2021-10-10', 5000);
-- ATTENTION DANS LE CAS DE CONTRAINTES D'INTEGRITE sur votre BDD, ne surtout pas utiliser replace, sinon grave risque de supression via les réglages en cascade

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
------ REQUETES DE SUPPRESSION (Action : supprimer) ---------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

DELETE FROM employes; -- Cette requete supprime toutes les données de la table (équivalent à TRUNCATE)
DELETE FROM employes WHERE id_employes = 994;
-- Suppression des entrées de la table lorsque l'id est supérieur à 990
DELETE FROM employes WHERE id_employes > 990;

-- On supprime tous les informaticiens sauf celui qui possede l'id 701
DELETE FROM employes WHERE service = 'informatique' AND id_employes != 701;

-- Suppression de 2 employés qui n'ont pas de point commun
DELETE FROM employes WHERE id_employes = 701 OR id_employes = 669;
-- Ici, il s'agit d'un OR et non pas d'un AND car 1 employé ne peut pas avoir 2 id à la fois

---------------------------------------------------------------------
---------------------------------------------------------------------
------------------ EXERCICES ----------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
-- 1 -- Afficher la profession de l'employé 547.
-- 2 -- Afficher la date d'embauche d'Amandine.
-- 3 -- Afficher le nom de famille de Guillaume
-- 4 -- Afficher le nombre de personne ayant un n° id_employes commençant par le chiffre 5.
-- 5 -- Afficher le nombre de commerciaux.
-- 6 -- Afficher le salaire moyen des informaticiens (+arrondie).
-- 7 -- Afficher les 5 premiers employés après avoir classé leur nom de famille par ordre alphabétique.
-- 8 -- Afficher le coût des commerciaux sur 1 année.
-- 9 -- Afficher le salaire moyen par service. (service + salaire moyen)
-- 10 -- Afficher le nombre de recrutement sur l'année 2010 (+alias).
-- 11 -- Afficher le salaire moyen appliqué lors des recrutements sur la période allant de 2015 a 2017
-- 12 -- Afficher le nombre de service différent
-- 13 -- Afficher tous les employés (sauf ceux du service production et secrétariat)
-- 14 -- Afficher conjointement le nombre d'homme et de femme dans l'entreprise
-- 15 -- Afficher les commerciaux ayant été recrutés avant 2012 de sexe masculin et gagnant un salaire supérieur a 2500 €
-- 16 -- Qui a été embauché en dernier
-- 17 -- Afficher les informations sur l'employé du service commercial gagnant le salaire le plus élevé
-- 18 -- Afficher le prénom du comptable gagnant le meilleur salaire
-- 19 -- Afficher le prénom de l'informaticien ayant été recruté en premier
-- 20 -- Augmenter chaque employé de 100 €
-- 21 -- Supprimer les employés du service secrétariat