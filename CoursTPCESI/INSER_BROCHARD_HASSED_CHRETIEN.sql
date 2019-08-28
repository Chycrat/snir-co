INSERT INTO ENTREPRISE(nom,nb_Apprenant)
Values ('Vinci Energies', 4),
('Super U', 2),
('Auchan', 5),
('SushiShop', 2),
('CESI', 2),
('McDo', 8),
('Le Kebab du coin', 10),
('orange bleu', 1),
('Muligans', 5),
('La Couscoussière', 6);

INSERT INTO APPRENANT (nom, prenom, date_Naissance, adresse, id_Entreprise)
VALUE 
("Michel","forever",curdate(),"je suis le veilleur", 1),
("François","deathmetal",curdate(),"1 rue de la vergonne", 2),
("JeanLouis","together",curdate(),"quelque part en france", 3),
("Brochard","Allan",curdate(),"2 rue du CESI", 4),
("Chretien","Romain",curdate(),"3 rue du CESI", 5),
("Crétain","Chycrat",curdate(),"4 rue du CESI", 6),
("Hassed","Ulrich",curdate(),"5 rue du CESI", 7),
("The","Kabyle",curdate(),"le galion du coin", 8),
("Chef","Chef",curdate(),"Le kebab du coin",9),
("Leblanc","Juste",curdate(),"Il sappelle juste leblanc", 10);

INSERT INTO BON_COMMANDE(date_reserv,id_Entreprise)
Values(CURDATE(),1),
(CURDATE(),2),
(CURDATE(),3),
(CURDATE(),4),
(CURDATE(),5),
(CURDATE(),6),
(CURDATE(),7),
(CURDATE(),8),
(CURDATE(),9),
(CURDATE(),10);

INSERT INTO TARIF (tarif_Formateur, tarif_Module)
VALUE
(2000, 6000),
(90, 150),
(150, 500),
(200, 384),
(300, 786),
(400, 434),
(500, 535),
(100, 375),
(600, 453),
(700, 123);

INSERT INTO VAUT (id_Tarif, id_Reservation)
VALUE
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

INSERT INTO FORMATEUR(nom, prenom, societe)
Values('LEPEN','Jeanne','FN'),
('SARKOZY','Francois','UMP'),
('KANTE','Ngolo','Chelsea'),
('PAVARD','Benjamin','Defenseur'),
('BROCHARD','Allan','Ikea');

INSERT INTO COUTE (id_Formateur, id_Tarif)
VALUE
(5,1),
(2,2),
(3,3),
(4,4),
(1,5),
(1,6),
(2,7),
(3,8),
(4,9),
(5,10);

INSERT INTO MODULE(libelle, description, nb_Heure, date_Module, id_Tarif)
Values ('Word','Office 365',10,CURDATE(),2),
('Excel','Office 365',20,CURDATE(),3),
('Bureautique','Windows',5,CURDATE(),4),
('Java','Eclispe',35,CURDATE(),5),
('C','QT Creator',35,CURDATE(),1),
('C++','QT Creator',35,CURDATE(),6),
('PHP','Notepad++',35,CURDATE(),7),
('HTML','Notepad++',20,CURDATE(),8),
('CSS','Notepad++',35,CURDATE(),9),
('Swift','Eclipse',70,CURDATE(),10);

INSERT INTO SELECTIONNE (id_Module, id_Reservation)
VALUE
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

INSERT INTO ENSEIGNE (id_Module, id_Formateur)
VALUE
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,1),
(7,2),
(8,3),
(9,4),
(10,5);

INSERT INTO NOTE_FORMATEUR (note_Eloquence, note_Pertinence, note_Methode_Travail, commentaire,id_Apprenant, id_Formateur, id_Module)
VALUE
(0,0,0,"nul",1,1,1),
(2,2,2,"pas bon",2,2,2),
(0,1,5,"parle trop",3,3,3),
(1,3,2,"EUUUUHHHH",4,4,4),
(20,20,20,"le meilleur prof EVER",5,5,5),
(9,8,11,"Bon ça peut passer",6,1,6),
(20,01,11,"Il est très formateur",7,2,7),
(13,15,20,"très bonne méthodologie",8,3,8),
(10,10,10,"peut mieux faire",9,4,9),
(18,17,19,"Jadore ce prof",10,5,10);

INSERT INTO NOTE_APPRENANT(note_Niveau_Necessaires, note_Epreuve, resultat, id_Apprenant, id_Formateur, id_Module)
Values (12,16,1,1,1,5),
(13,14,1,2,1,5),
(12,15,1,3,2,1),
(9,8,0,4,2,1),
(1,3,0,5,3,2),
(17,16,1,6,3,2),
(14,18,1,7,4,3),
(12,11,1,8,4,3),
(11,10,1,9,5,4),
(19,15,1,10,5,4);
