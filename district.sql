/*Ecrire des requêtes d'interrogation de la base de données/*


/*1.Afficher la liste des commandes ( la liste doit faire apparaitre la date, les informations du client, le plat et le prix )*/
SELECT date_commande,nom_client,telephone_client,email_client,adresse_client,prix 
FROM commande
 INNER JOIN plat ON commande.id_plat = plat.id;
 /*2.Afficher la liste des plats en spécifiant la catégorie*/
 SELECT plat.libelle,categorie.libelle FROM plat
        INNER JOIN categorie ON 
        plat.id_categorie = categorie.id;
        /*3.Afficher les catégories et le nombre de plats actifs dans chaque catégorie*/
        SELECT categorie.libelle, COUNT(plat.id) FROM  categorie 
        INNER JOIN plat
        ON  plat.id_categorie = categorie.id WHERE plat.active = 'yes' 
        GROUP  BY categorie.libelle ;
        /*4.Liste des plats les plus vendus par ordre décroissant*/
        SELECT libelle,SUM(quantite ) AS quantites  FROM commande 
        INNER JOIN  plat ON commande.id_plat = plat.id GROUP BY libelle ORDER  BY SUM(quantite) DESC;
        /*5.Le plat le plus rémunérateur*/
        SELECT plat.libelle, SUM(commande.total) 
        FROM plat 
        JOIN commande ON commande.id_plat = plat.id 
        GROUP BY plat.id 
        ORDER BY SUM(commande.total) DESC 
        LIMIT 1;
        /*6.Liste des clients et le chiffre d'affaire généré par client (par ordre décroissant)*/
        SELECT nom_client, SUM(total) AS total FROM commande GROUP BY nom_client ORDER  BY  SUM(total)  DESC ;


        /*1.Ecrire des requêtes de modification de la base de données a revoir*/
        UPDATE FROM categorie 
WHERE ACTIVE LIKE NO ;
/*2.Ecrivez une requête permettant de supprimer les commandes avec le statut livré*/
DELETE 
FROM commande 
WHERE etat = 'livrée';
/* 3.Ecrivez un script sql permettant d'ajouter une nouvelle catégorie et un plat dans cette nouvelle catégorie.*/

/*Ecrivez une requête permettant d'augmenter de 10% le prix des plats de la catégorie 'Pizza' */
/*Utiliser un langage coté serveur*/
/*afficherCategoriesPopulaire*/
SELECT categorie.image, categorie.libelle, categorie.id FROM  categorie 
        INNER JOIN plat
        ON  plat.id_categorie = categorie.id WHERE plat.active = 'yes' GROUP  BY categorie.libelle ORDER BY COUNT(plat.id) desc limit 6;
        /*lesPlatsLesPlusVendus*/
        SELECT plat.id, plat.image, plat.libelle, SUM(quantite ) AS quantites  FROM commande 
        INNER JOIN  plat ON commande.id_plat = plat.id GROUP BY libelle ORDER  BY SUM(quantite) DESC LIMIT 3;

        