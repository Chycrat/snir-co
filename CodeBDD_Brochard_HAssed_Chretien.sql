#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: FORMATEUR
#------------------------------------------------------------

CREATE TABLE FORMATEUR(
        id_Formateur    Int  Auto_increment  NOT NULL ,
        nom             Varchar (100) NOT NULL ,
        prenom          Varchar (100) NOT NULL ,
        societe         Varchar (100) ,
        prix_Prestation Int NOT NULL
	,CONSTRAINT FORMATEUR_PK PRIMARY KEY (id_Formateur)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: TARIF
#------------------------------------------------------------

CREATE TABLE TARIF(
        id_Tarif        Int  Auto_increment  NOT NULL ,
        tarif_Formateur Int ,
        tarif_Module    Int
	,CONSTRAINT TARIF_PK PRIMARY KEY (id_Tarif)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MODULE
#------------------------------------------------------------

CREATE TABLE MODULE(
        id_Module   Int  Auto_increment  NOT NULL ,
        libelle     Varchar (255) NOT NULL ,
        description Varchar (100) ,
        nb_Heure    Int NOT NULL ,
        date_Module Datetime NOT NULL ,
        id_Tarif    Int NOT NULL
	,CONSTRAINT MODULE_PK PRIMARY KEY (id_Module)

	,CONSTRAINT MODULE_TARIF_FK FOREIGN KEY (id_Tarif) REFERENCES TARIF(id_Tarif)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ENTREPRISE
#------------------------------------------------------------

CREATE TABLE ENTREPRISE(
        id_Entreprise Int  Auto_increment  NOT NULL ,
        nom           Varchar (255) NOT NULL ,
        nb_Apprenant  Int NOT NULL
	,CONSTRAINT ENTREPRISE_PK PRIMARY KEY (id_Entreprise)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: BON_COMMANDE
#------------------------------------------------------------

CREATE TABLE BON_COMMANDE(
        id_Reservation Int  Auto_increment  NOT NULL ,
        date_reserv    Datetime NOT NULL ,
        id_Entreprise  Int NOT NULL
	,CONSTRAINT BON_COMMANDE_PK PRIMARY KEY (id_Reservation)

	,CONSTRAINT BON_COMMANDE_ENTREPRISE_FK FOREIGN KEY (id_Entreprise) REFERENCES ENTREPRISE(id_Entreprise)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: APPRENANT
#------------------------------------------------------------

CREATE TABLE APPRENANT(
        id_Apprenant   Int  Auto_increment  NOT NULL ,
        nom            Varchar (255) NOT NULL ,
        prenom         Varchar (255) NOT NULL ,
        date_Naissance Datetime NOT NULL ,
        adresse        Varchar (255) NOT NULL ,
        id_Entreprise  Int NOT NULL
	,CONSTRAINT APPRENANT_PK PRIMARY KEY (id_Apprenant)

	,CONSTRAINT APPRENANT_ENTREPRISE_FK FOREIGN KEY (id_Entreprise) REFERENCES ENTREPRISE(id_Entreprise)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: NOTE_FORMATEUR
#------------------------------------------------------------

CREATE TABLE NOTE_FORMATEUR(
        id_Note_Formateur    Int  Auto_increment  NOT NULL ,
        note_Eloquence       Int NOT NULL ,
        note_Pertinence      Int NOT NULL ,
        note_Methode_Travail Int NOT NULL ,
        commentaire          Varchar (500) NOT NULL ,
        id_Apprenant         Int NOT NULL ,
        id_Formateur         Int NOT NULL ,
        id_Module            Int NOT NULL
	,CONSTRAINT NOTE_FORMATEUR_PK PRIMARY KEY (id_Note_Formateur)

	,CONSTRAINT NOTE_FORMATEUR_APPRENANT_FK FOREIGN KEY (id_Apprenant) REFERENCES APPRENANT(id_Apprenant)
	,CONSTRAINT NOTE_FORMATEUR_FORMATEUR0_FK FOREIGN KEY (id_Formateur) REFERENCES FORMATEUR(id_Formateur)
	,CONSTRAINT NOTE_FORMATEUR_MODULE1_FK FOREIGN KEY (id_Module) REFERENCES MODULE(id_Module)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: NOTE_APPRENANT
#------------------------------------------------------------

CREATE TABLE NOTE_APPRENANT(
        id_Note_Apprenti        Int  Auto_increment  NOT NULL ,
        note_Niveau_Necessaires Int NOT NULL ,
        note_Epreuve            Int NOT NULL ,
        resultat                Bool NOT NULL ,
        id_Apprenant            Int NOT NULL ,
        id_Formateur            Int NOT NULL ,
        id_Module               Int NOT NULL
	,CONSTRAINT NOTE_APPRENANT_PK PRIMARY KEY (id_Note_Apprenti)

	,CONSTRAINT NOTE_APPRENANT_APPRENANT_FK FOREIGN KEY (id_Apprenant) REFERENCES APPRENANT(id_Apprenant)
	,CONSTRAINT NOTE_APPRENANT_FORMATEUR0_FK FOREIGN KEY (id_Formateur) REFERENCES FORMATEUR(id_Formateur)
	,CONSTRAINT NOTE_APPRENANT_MODULE1_FK FOREIGN KEY (id_Module) REFERENCES MODULE(id_Module)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: SELECTIONNE
#------------------------------------------------------------

CREATE TABLE SELECTIONNE(
        id_Module      Int NOT NULL ,
        id_Reservation Int NOT NULL
	,CONSTRAINT SELECTIONNE_PK PRIMARY KEY (id_Module,id_Reservation)

	,CONSTRAINT SELECTIONNE_MODULE_FK FOREIGN KEY (id_Module) REFERENCES MODULE(id_Module)
	,CONSTRAINT SELECTIONNE_BON_COMMANDE0_FK FOREIGN KEY (id_Reservation) REFERENCES BON_COMMANDE(id_Reservation)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: VAUT
#------------------------------------------------------------

CREATE TABLE VAUT(
        id_Tarif       Int NOT NULL ,
        id_Reservation Int NOT NULL
	,CONSTRAINT VAUT_PK PRIMARY KEY (id_Tarif,id_Reservation)

	,CONSTRAINT VAUT_TARIF_FK FOREIGN KEY (id_Tarif) REFERENCES TARIF(id_Tarif)
	,CONSTRAINT VAUT_BON_COMMANDE0_FK FOREIGN KEY (id_Reservation) REFERENCES BON_COMMANDE(id_Reservation)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ENSEIGNE
#------------------------------------------------------------

CREATE TABLE ENSEIGNE(
        id_Formateur Int NOT NULL ,
        id_Module    Int NOT NULL
	,CONSTRAINT ENSEIGNE_PK PRIMARY KEY (id_Formateur,id_Module)

	,CONSTRAINT ENSEIGNE_FORMATEUR_FK FOREIGN KEY (id_Formateur) REFERENCES FORMATEUR(id_Formateur)
	,CONSTRAINT ENSEIGNE_MODULE0_FK FOREIGN KEY (id_Module) REFERENCES MODULE(id_Module)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: COUTE
#------------------------------------------------------------

CREATE TABLE COUTE(
        id_Formateur Int NOT NULL ,
        id_Tarif     Int NOT NULL
	,CONSTRAINT COUTE_PK PRIMARY KEY (id_Formateur,id_Tarif)

	,CONSTRAINT COUTE_FORMATEUR_FK FOREIGN KEY (id_Formateur) REFERENCES FORMATEUR(id_Formateur)
	,CONSTRAINT COUTE_TARIF0_FK FOREIGN KEY (id_Tarif) REFERENCES TARIF(id_Tarif)
)ENGINE=InnoDB;

