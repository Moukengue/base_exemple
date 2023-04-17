/*1. Afficher toutes les informations concernant les employés.*/
SELECT * FROM employe;
/*2. Afficher toutes les informations concernant les départements.*/
SELECT nodept,nom,noregion FROM dept;
/*3. Afficher le nom, la date d'embauche, le numéro du supérieur, le
numéro de département et le salaire de tous les employés-*/
SELECT nom,dateemb,nosup,nodep,salaire FROM employe;
/*4. Afficher le titre de tous les employés.*/
SELECT titre FROM employe;
/*5. Afficher les différentes valeurs des titres des employés*/
SELECT DISTINCT titre FROM employe;
/*6. Afficher le nom, le numéro d'employé et le numéro du*/
département des employés dont le titre est « Secrétaire ».-->
SELECT nom,noemp,nodep FROM employe 
WHERE titre = 'secretaire';

/*7. Afficher le nom et le numéro de département dont le numéro de*/
département est supérieur à 40.-->
SELECT nom,nodep FROM employe 
WHERE  nodep > 40;
/*.8 Afficher le nom et le prénom des employés dont le nom est*/
alphabétiquement antérieur au prénom.-->
SELECT nom, prenom FROM employe 
ORDER BY nom<prenom ;

/*9. Afficher le nom, le salaire et le numéro du département des employés
dont le titre est « Représentant », le numéro de département est 35 et
le salaire est supérieur à 20000*/
SELECT nom, salaire,nodep FROM employe 
WHERE nodep = '35' AND salaire > 20000;
/*10.Afficher le nom, le titre et le salaire des employés dont le titre est
« Représentant » ou dont le titre est « Président ».*/
SELECT nom,titre,salaire FROM employe
WHERE titre = 'Représentant'; 

SELECT nom,titre,salaire FROM employe
WHERE titre = 'Président';

/*11.Afficher le nom, le titre, le numéro de département, le salaire des
employés du département 34, dont le titre est « Représentant » ou
« Secrétaire ».*/
SELECT nom,titre,nodep, salaire FROM employe
WHERE nodep  = 34 AND (titre = 'Représentant' OR  titre = 'Secrétaire') ;
/*12.Afficher le nom, le titre, le numéro de département, le salaire des
employés dont le titre est Représentant, ou dont le titre est Secrétaire
dans le département numéro 34.*/
SELECT nom,titre, nodep,salaire FROM employe 
WHERE nodep = 34 AND titre = 'Secrétaire' OR  titre = 'Représentant';
/*13.Afficher le nom, et le salaire des employés dont le salaire est compris
entre 20000 et 30000.*/SELECT nom, salaire FROM employe
WHERE  salaire > 20000 AND  salaire < 30000;
/*15.Afficher le nom des employés commençant par la lettre « H ».*/
SELECT nom FROM employe 
WHERE nom LIKE 'h%';
/*16.Afficher le nom des employés se terminant par la lettre « n ».*/
SELECT nom FROM employe 
WHERE nom LIKE '%n';
/*17.Afficher le nom des employés contenant la lettre « u » en 3ème
position*/
SELECT nom FROM employe 
WHERE  SUBSTR(nom,3 ,1) = 'u';
/*18.Afficher le salaire et le nom des employés du service 41 classés par
salaire croissant.*/
SELECT salaire,nom,nodep FROM employe
WHERE nodep = 41 ORDER BY salaire ASC ;Changer le nom du départe
ORDER BY titre ASC,salaire DESC ;
/*21.Afficher le taux de commission, le salaire et le nom des employés
classés par taux de commission croissante.*/
SELECT tauxcom,salaire,nom FROM employe
ORDER BY tauxcom ASC;
/*22.Afficher le nom, le salaire, le taux de commission et le titre des
employés dont le taux de commission n'est pas renseigné*/
SELECT nom, salaire,tauxcom,titre FROM employe 
WHERE tauxcom IS  NULL ;
/*23.Afficher le nom, le salaire, le taux de commission et le titre des
employés dont le taux de commission est renseigné*/
SELECT nom, salaire,tauxcom,titre FROM employe 
WHERE tauxcom IS NOT   NULL ;
/*24.Afficher le nom, le salaire, le taux de commission, le titre des
employés dont le taux de commission est inférieur à 15.*/
SELECT nom, salaire,tauxcom,titre FROM employe 
WHERE tauxcom < 15;
/*25. Afficher le nom, le salaire, le taux de commission, le titre des
employés dont le taux de commission est supérieur à 15.*/

SELECT nom, salaire,tauxcom,titre FROM employe 
WHERE tauxcom > 15;
/*26.Afficher le nom, le salaire, le taux de commission et la commission des
employés dont le taux de commission n'est pas nul. (la commission
est calculée en multipliant le salaire par le taux de commission)*/
SELECT nom,salaire,tauxcom, salaire*tauxcom FROM employe
WHERE  tauxcom IS NOT NULL;
/*27. Afficher le nom, le salaire, le taux de commission, la commission des
employés dont le taux de commission n'est pas nul, classé par taux de
commission croissant*/
SELECT nom,salaire,tauxcom FROM employe
WHERE  tauxcom IS NOT NULL
ORDER BY tauxcom ASC ;
/*28. Afficher le nom et le prénom (concaténés) des employés. Renommer
les colonnes*/
SELECT CONCAT(nom, " ", prenom) AS concatenes FROM employe;
/*29. Afficher les 5 premières lettres du nom des employés*/
SELECT substr(nom,1,5) FROM employe;
/*30. Afficher le nom et le rang de la lettre « r » dans le nom des
employés*/
SELECT nom,LOCATE( 'r',nom) AS locate_nom FROM employe;
/*31. Afficher le nom, le nom en majuscule et le nom en minuscule de
l'employé dont le nom est Vrante.*/
SELECT nom,UPPER(nom),LOWER(nom) FROM employe 
WHERE nom ='Vrante';
/*32. Afficher le nom et le nombre de caractères du nom des employés*/
SELECT nom, LENGTH(nom) AS nom_length FROM employe;




/*exo2*/

/*Rechercher le prénom des employés et le numéro de la région de leur
département.*/
SELECT prenom,noregion FROM employe
INNER JOIN dept ON nodep = nodept;

/*Rechercher le numéro du département, le nom du département, le
nom des employés classés par numéro de département (renommer les
tables utilisées)*/
SELECT nodep,dept.nom,employe.nom FROM employe
INNER JOIN dept 
ON nodep = nodept;



1. Calculer le nombre d'employés de chaque titre*/
SELECT COUNT(noemp),titre FROM employe 
GROUP BY titre;
/*2. Calculer la moyenne des salaires et leur somme, par région*/
SELECT AVG(salaire),nodep FROM employe 
GROUP BY nodep;
/*3. Afficher les numéros des départements ayant au moins 3 employés*/
SELECT nodep FROM employe 
GROUP BY nodep
HAVING COUNT(nodep)<3
/*4. Afficher les lettres qui sont l'initiale d'au moins trois employés.*/
SELECT SUBSTR(nom,1,1),COUNT(nom) FROM employe
GROUP BY SUBSTR(nom,1,1)
HAVING COUNT(nom)>=3;
/*5. Rechercher le salaire maximum et le salaire minimum parmi tous les
salariés et l'écart entre les deux.*/
SELECT MAX(salaire), MIN(salaire),MAX(salaire)-MIN(salaire) FROM employe;
/*6. Rechercher le nombre de titres différents.*/
SELECT COUNT(distinct titre) FROM employe;Changer le nom du départe
SELECT titre,AVG(salaire) FROM employe
GROUP BY titre
HAVING  AVG(salaire) > (SELECT AVG(salaire) FROM employe WHERE titre LIKE  'représentant');
/*9. Rechercher le nombre de salaires renseignés et le nombre de taux de
commission renseignés.*/
SELECT COUNT(salaire), COUNT(tauxcom) FROM employe;


/*Manipuler une base de données*/
/*Insert */
INSERT INTO employe(noemp,nom,prenom,dateemb,nosup,titre,nodep,salaire,tauxcom)
VALUES ('26','Macosso','Ervine','2019-06-13 00:00:00','4','Développeur web','50',1800,NULL)
       ('28','Moukengue','Aline','2019-06-13 00:00:00','5','Data Sciencientist','50',1800,NULL);
       ('29','Moukengue','Claraline','2020-08-13 00:00:00','5','Développeur Full stackt','50',1800,NULL);

       /*Ajouter un département*/
       INSERT INTO dept (nodept,nom,noregion)
        VALUES('80','La Somme','6')
              ('70','Pas-de-calais','7')
              ('60','Oise','8');

       /*Update*/
       /*Augmenter de 10% le salaire de l'employe 17*/
UPDATE employe
SET salaire = salaire*1.1
WHERE noemp = 17;
/*Changer le nom du département 45 en 'Logistique'*/
UPDATE dept
SET nom = 'logistique'
WHERE nodept = 45;
/*delete*/
/*Supprimer le dernier des employés que vous avez insérés précédemment.*/
DELETE 
FROM employe WHERE noemp = 28;