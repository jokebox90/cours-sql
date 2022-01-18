
---------------------------------------------------------------------
---------------------------------------------------------------------
------------------ EXERCICES ----------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
-- 1 -- Afficher la profession de l'employé 547.
SELECT service FROM employes WHERE id_employes = 547;
-- +------------+
-- | service    |
-- +------------+
-- | commercial |
-- +------------+
-- 2 -- Afficher la date d'embauche d'Amandine.
SELECT date_embauche FROM employes WHERE prenom = 'Amandine';
-- +---------------+
-- | date_embauche |
-- +---------------+
-- | 2014-01-23    |
-- +---------------+
-- 3 -- Afficher le nom de famille de Guillaume
SELECT nom FROM employes WHERE prenom = 'Guillaume';
-- +--------+
-- | nom    |
-- +--------+
-- | Miller |
-- +--------+
-- 4 -- Afficher le nombre de personne ayant un n° id_employes commençant par le chiffre 5.
SELECT COUNT(*) FROM employes WHERE id_employes LIKE '5%';
-- +----------+
-- | COUNT(*) |
-- +----------+
-- |        3 |
-- +----------+
-- 5 -- Afficher le nombre de commerciaux.
SELECT COUNT(*) AS nombre FROM employes WHERE service = 'commercial';
-- +--------+
-- | nombre |
-- +--------+
-- |      6 |
-- +--------+
-- 6 -- Afficher le salaire moyen des informaticiens (+arrondie).
SELECT ROUND(AVG(salaire)) AS salaire_moyen FROM employes WHERE service = 'informatique';
-- +---------------+
-- | salaire_moyen |
-- +---------------+
-- |          2617 |
-- +---------------+
-- 7 -- Afficher les 5 premiers employés après avoir classé leur nom de famille par ordre alphabétique.
SELECT * FROM employes ORDER BY nom LIMIT 5;
-- +-------------+---------+----------+------+--------------+---------------+---------+
-- | id_employes | prenom  | nom      | sexe | service      | date_embauche | salaire |
-- +-------------+---------+----------+------+--------------+---------------+---------+
-- |         592 | Laura   | Blanchet | f    | direction    | 2012-05-09    |    4500 |
-- |         854 | Daniel  | Chevel   | m    | informatique | 2015-09-28    |    3100 |
-- |         547 | Melanie | Collier  | f    | commercial   | 2012-01-08    |    3100 |
-- |         699 | Julien  | Cottet   | m    | secretariat  | 2013-01-05    |    1390 |
-- |         739 | Thierry | Desprez  | m    | secretariat  | 2013-07-17    |    1500 |
-- +-------------+---------+----------+------+--------------+---------------+---------+
-- 8 -- Afficher le coût des commerciaux sur 1 année.
SELECT SUM(salaire * 12) FROM employes WHERE service = 'commercial';
-- +-------------------+
-- | SUM(salaire * 12) |
-- +-------------------+
-- |            184200 |
-- +-------------------+
-- 9 -- Afficher le salaire moyen par service. (service + salaire moyen)
SELECT service, ROUND(AVG(salaire)) FROM employes GROUP BY service;
-- +---------------+---------------------+
-- | service       | ROUND(AVG(salaire)) |
-- +---------------+---------------------+
-- | assistant     |                1775 |
-- | commercial    |                2558 |
-- | communication |                2100 |
-- | comptabilite  |                2900 |
-- | direction     |                4750 |
-- | informatique  |                2617 |
-- | juridique     |                3550 |
-- | production    |                2225 |
-- | secretariat   |                1497 |
-- +---------------+---------------------+
-- 10 -- Afficher le nombre de recrutement sur l'année 2010 (+alias).
SELECT COUNT(*) AS 'Nombre de recrutement' FROM employes WHERE date_embauche BETWEEN '2010-01-01' AND '2010-12-31';
SELECT COUNT(*) AS 'Nombre de recrutement' FROM employes WHERE date_embauche LIKE '2010%';
-- +-----------------------+
-- | Nombre de recrutement |
-- +-----------------------+
-- |                     2 |
-- +-----------------------+
-- 11 -- Afficher le salaire moyen appliqué lors des recrutements sur la période allant de 2015 a 2017
SELECT AVG(salaire) AS masse_salariale FROM employes WHERE date_embauche BETWEEN '2015-01-01' AND '2017-12-31';
-- +-----------------+
-- | masse_salariale |
-- +-----------------+
-- |            2555 |
-- +-----------------+
-- 12 -- Afficher le nombre de service différent
SELECT COUNT(DISTINCT service) FROM employes;
-- +-------------------------+
-- | COUNT(DISTINCT service) |
-- +-------------------------+
-- |                       9 |
-- +-------------------------+
-- 13 -- Afficher tous les employés (sauf ceux du service production et secrétariat)
SELECT * FROM employes WHERE service NOT IN ('production', 'secretariat');
SELECT * FROM employes WHERE service != 'production' AND service != 'secretariat';
-- +-------------+-------------+----------+------+---------------+---------------+---------+
-- | id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
-- +-------------+-------------+----------+------+---------------+---------------+---------+
-- |         350 | Jean-pierre | Laborde  | m    | direction     | 2010-12-09    |    5000 |
-- |         388 | Clement     | Gallet   | m    | commercial    | 2010-12-15    |    2300 |
-- |         415 | Thomas      | Winter   | m    | commercial    | 2011-05-03    |    3550 |
-- |         509 | Fabrice     | Grand    | m    | comptabilite  | 2011-12-30    |    2900 |
-- |         547 | Melanie     | Collier  | f    | commercial    | 2012-01-08    |    3100 |
-- |         592 | Laura       | Blanchet | f    | direction     | 2012-05-09    |    4500 |
-- |         627 | Guillaume   | Miller   | m    | commercial    | 2012-07-02    |    1900 |
-- |         655 | Celine      | Perrin   | f    | commercial    | 2012-09-10    |    2700 |
-- |         701 | Mathieu     | Vignal   | m    | informatique  | 2013-04-03    |    2500 |
-- |         780 | Amandine    | Thoyer   | f    | communication | 2014-01-23    |    2100 |
-- |         802 | Damien      | Durand   | m    | informatique  | 2014-07-05    |    2250 |
-- |         854 | Daniel      | Chevel   | m    | informatique  | 2015-09-28    |    3100 |
-- |         876 | Nathalie    | Martin   | f    | juridique     | 2016-01-12    |    3550 |
-- |         933 | Emilie      | Sennard  | f    | commercial    | 2017-01-11    |    1800 |
-- |         990 | Stephanie   | Lafaye   | f    | assistant     | 2017-03-01    |    1775 |
-- +-------------+-------------+----------+------+---------------+---------------+---------+
-- 14 -- Afficher conjointement le nombre d'homme et de femme dans l'entreprise
SELECT COUNT(*), sexe FROM employes GROUP BY sexe;
-- +----------+------+
-- | COUNT(*) | sexe |
-- +----------+------+
-- |       11 | m    |
-- |        9 | f    |
-- +----------+------+

-- 15 -- Afficher les commerciaux ayant été recrutés avant 2012 de sexe masculin et gagnant un salaire supérieur a 2500 €
SELECT * FROM employes
WHERE date_embauche < '2012-01-01'
AND sexe = 'm'
AND salaire > 2500
AND service = 'commercial';
-- +-------------+--------+--------+------+------------+---------------+---------+
-- | id_employes | prenom | nom    | sexe | service    | date_embauche | salaire |
-- +-------------+--------+--------+------+------------+---------------+---------+
-- |         415 | Thomas | Winter | m    | commercial | 2011-05-03    |    3550 |
-- +-------------+--------+--------+------+------------+---------------+---------+
-- 16 -- Qui a été embauché en dernier
SELECT * FROM employes WHERE date_embauche = (SELECT MAX(date_embauche) FROM employes);
SELECT * FROM employes ORDER BY date_embauche DESC LIMIT 1;
-- +-------------+-----------+--------+------+-----------+---------------+---------+
-- | id_employes | prenom    | nom    | sexe | service   | date_embauche | salaire |
-- +-------------+-----------+--------+------+-----------+---------------+---------+
-- |         990 | Stephanie | Lafaye | f    | assistant | 2017-03-01    |    1775 |
-- +-------------+-----------+--------+------+-----------+---------------+---------+

-- 17 -- Afficher les informations sur l'employé du service commercial gagnant le salaire le plus élevé
SELECT * FROM employes WHERE service = 'commercial' ORDER BY salaire DESC LIMIT 1;
-- +-------------+--------+--------+------+------------+---------------+---------+
-- | id_employes | prenom | nom    | sexe | service    | date_embauche | salaire |
-- +-------------+--------+--------+------+------------+---------------+---------+
-- |         415 | Thomas | Winter | m    | commercial | 2011-05-03    |    3550 |
-- +-------------+--------+--------+------+------------+---------------+---------+
-- 18 -- Afficher le prénom du comptable gagnant le meilleur salaire
SELECT prenom FROM employes WHERE service = 'comptabilite' ORDER BY salaire DESC LIMIT 1;
-- +---------+
-- | prenom  |
-- +---------+
-- | Fabrice |
-- +---------+
-- 19 -- Afficher le prénom de l'informaticien ayant été recruté en premier
SELECT prenom FROM employes WHERE service = 'informatique' ORDER BY date_embauche LIMIT 1;
-- +---------+
-- | prenom  |
-- +---------+
-- | Mathieu |
-- +---------+
-- 20 -- Augmenter chaque employé de 100 €
UPDATE employes SET salaire = salaire + 100;
-- 21 -- Supprimer les employés du service secrétariat
DELETE FROM employes WHERE service = 'secretariat';