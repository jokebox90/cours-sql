
-- EXERCICE 1: Quels sont les prénoms des abonnés n'ayant pas rendu un livre à la bibliotheque.

SELECT *
FROM abonne
WHERE id_abonne IN (
    SELECT
        id_abonne
    FROM emprunt
    WHERE date_rendu IS NULL
);

-- EXERCICE 2 : Nous aimerions connaitre le(s) n° des livres empruntés par Chloé

SELECT id_livre
FROM emprunt
WHERE id_abonne = (
    SELECT id_abonne
    FROM abonne
    WHERE prenom = 'Chloe'
);

-- EXERCICE 3: Affichez les prénoms des abonnés ayant emprunté un livre le 07/12/2016.

SELECT prenom
FROM abonne
WHERE id_abonne IN (
    SELECT
        id_abonne
    FROM emprunt
    WHERE date_sortie = '2016-12-07'
);

-- EXERCICE 4: combien (count) de livre Guillaume a emprunté à la bibliotheque ?

SELECT COUNT(*) AS "Nb d'emprunts"
FROM emprunt
WHERE id_abonne IN (
    SELECT
        id_abonne
    FROM abonne
    WHERE prenom = 'Guillaume'
);

-- EXERCICE 5: Affichez la liste des abonnés ayant déjà emprunté un livre d'Alphonse Daudet

SELECT prenom
FROM abonne
WHERE id_abonne IN (
    SELECT id_abonne
    FROM emprunt
    WHERE id_livre IN (
        SELECT
            id_livre
        FROM livre
        WHERE auteur = 'ALPHONSE DAUDET'
    )
);

-- EXERCICE 6: Nous aimerions connaitre les titres des livres que Chloe a emprunté à la bibliotheque.

SELECT titre
FROM livre
WHERE id_livre IN (
    SELECT id_livre
    FROM emprunt
    WHERE id_abonne IN (
        SELECT
            id_abonne
        FROM abonne
        WHERE prenom = 'Chloe'
    )
);

-- EXERCICE 7: Nous aimerions connaitre les titres des livres que Chloe n'a pas emprunté à la bibliotheque.

SELECT titre
FROM livre
WHERE id_livre IN (
    SELECT id_livre
    FROM emprunt
    WHERE id_abonne
    NOT IN (
        SELECT
            id_abonne
        FROM abonne
        WHERE prenom = 'Chloe'
    )
);

-- EXERCICE 8: Exercice : Nous aimerions connaitre les titres des livres que Chloe a emprunté à la bibliotheque ET qui n'ont pas été rendu.

SELECT titre
FROM livre
WHERE id_livre IN (
    SELECT id_livre
    FROM emprunt
    WHERE date_rendu IS NULL
    AND id_abonne NOT IN (
        SELECT
            id_abonne
        FROM abonne
        WHERE prenom = 'Chloe'
    )
);

-- DEFI : (difficile) Qui a emprunté le plus de livre à la bibliotheque ?

