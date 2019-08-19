#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: MADERA_COMPOSANT
#------------------------------------------------------------

CREATE TABLE MADERA_COMPOSANT(
        id_composant                Int  Auto_increment  NOT NULL ,
        code_composant              Int NOT NULL ,
        nom_composant               Varchar (255) NOT NULL ,
        prix_composant              Float NOT NULL ,
        quantite_restante_composant Int NOT NULL ,
        nature_composant            Varchar (50) NOT NULL
	,CONSTRAINT MADERA_COMPOSANT_PK PRIMARY KEY (id_composant)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_DEVIS
#------------------------------------------------------------

CREATE TABLE MADERA_DEVIS(
        id_devis                Int  Auto_increment  NOT NULL ,
        code_devis              Varchar (255) NOT NULL ,
        date_devis              Datetime NOT NULL ,
        date_validation         Datetime NOT NULL ,
        montant_HT_devis        Float NOT NULL ,
        montant_TTC_devis       Float NOT NULL ,
        marge_commericaux_devis Int NOT NULL ,
        marge_entreprise_devis  Int NOT NULL ,
        client_devis            Int NOT NULL
	,CONSTRAINT MADERA_DEVIS_AK UNIQUE (client_devis)
	,CONSTRAINT MADERA_DEVIS_PK PRIMARY KEY (id_devis)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_FACTURE
#------------------------------------------------------------

CREATE TABLE MADERA_FACTURE(
        id_facture   Int  Auto_increment  NOT NULL ,
        code_facture Int NOT NULL ,
        date_facture Datetime NOT NULL ,
        prix_facture Int NOT NULL ,
        id_devis     Int NOT NULL
	,CONSTRAINT MADERA_FACTURE_PK PRIMARY KEY (id_facture)

	,CONSTRAINT MADERA_FACTURE_MADERA_DEVIS_FK FOREIGN KEY (id_devis) REFERENCES MADERA_DEVIS(id_devis)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_PLAN
#------------------------------------------------------------

CREATE TABLE MADERA_PLAN(
        id_plan                    Int  Auto_increment  NOT NULL ,
        date_creation              Date NOT NULL ,
        date_derniere_modification Date NOT NULL ,
        Largeur_plan               Int NOT NULL ,
        Longueur_plan              Int NOT NULL ,
        prix_total_HT_plan         Float NOT NULL ,
        prix_total_TTC_plan        Float NOT NULL ,
        id_devis                   Int NOT NULL
	,CONSTRAINT MADERA_PLAN_PK PRIMARY KEY (id_plan)

	,CONSTRAINT MADERA_PLAN_MADERA_DEVIS_FK FOREIGN KEY (id_devis) REFERENCES MADERA_DEVIS(id_devis)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_MODULE
#------------------------------------------------------------

CREATE TABLE MADERA_MODULE(
        id_module                 Int  Auto_increment  NOT NULL ,
        nom_module                Varchar (255) NOT NULL ,
        prix_HT_module            Int NOT NULL ,
        quantite_restante_module  Int NOT NULL ,
        coordonnee_X_debut_module Int NOT NULL ,
        coordonnee_X_fin_module   Int NOT NULL ,
        coordonnee_Y_debut_module Int NOT NULL ,
        coordonnee_Y_fin_module   Int NOT NULL ,
        largeur_module            Int NOT NULL ,
        longueur_module           Int NOT NULL ,
        nb_composant_module       Int NOT NULL ,
        gamme_module              Varchar (50) NOT NULL ,
        id_plan                   Int NOT NULL
	,CONSTRAINT MADERA_MODULE_PK PRIMARY KEY (id_module)

	,CONSTRAINT MADERA_MODULE_MADERA_PLAN_FK FOREIGN KEY (id_plan) REFERENCES MADERA_PLAN(id_plan)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_SOL
#------------------------------------------------------------

CREATE TABLE MADERA_SOL(
        id_sol      Int  Auto_increment  NOT NULL ,
        prix_HT_SOL Float NOT NULL ,
        id_plan     Int NOT NULL
	,CONSTRAINT MADERA_SOL_PK PRIMARY KEY (id_sol)

	,CONSTRAINT MADERA_SOL_MADERA_PLAN_FK FOREIGN KEY (id_plan) REFERENCES MADERA_PLAN(id_plan)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_TOIT
#------------------------------------------------------------

CREATE TABLE MADERA_TOIT(
        id_toit      Int  Auto_increment  NOT NULL ,
        prix_HT_toit Float NOT NULL ,
        id_plan      Int NOT NULL
	,CONSTRAINT MADERA_TOIT_PK PRIMARY KEY (id_toit)

	,CONSTRAINT MADERA_TOIT_MADERA_PLAN_FK FOREIGN KEY (id_plan) REFERENCES MADERA_PLAN(id_plan)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_GAMME
#------------------------------------------------------------

CREATE TABLE MADERA_GAMME(
        id_gamme          Int  Auto_increment  NOT NULL ,
        Type_isolant      Varchar (50) NOT NULL ,
        type_couverture   Varchar (50) NOT NULL ,
        qualite_huisserie Varchar (50) NOT NULL ,
        id_plan           Int NOT NULL
	,CONSTRAINT MADERA_GAMME_PK PRIMARY KEY (id_gamme)

	,CONSTRAINT MADERA_GAMME_MADERA_PLAN_FK FOREIGN KEY (id_plan) REFERENCES MADERA_PLAN(id_plan)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_COUPE
#------------------------------------------------------------

CREATE TABLE MADERA_COUPE(
        id_coupe       Int  Auto_increment  NOT NULL ,
        Longueur_coupe Int NOT NULL ,
        largeur_coupe  Int NOT NULL ,
        id_plan        Int NOT NULL
	,CONSTRAINT MADERA_COUPE_PK PRIMARY KEY (id_coupe)

	,CONSTRAINT MADERA_COUPE_MADERA_PLAN_FK FOREIGN KEY (id_plan) REFERENCES MADERA_PLAN(id_plan)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_PROJET
#------------------------------------------------------------

CREATE TABLE MADERA_PROJET(
        id_projet                Int  Auto_increment  NOT NULL ,
        nom_projet               Varchar (100) NOT NULL ,
        date_creation_projet     Date NOT NULL ,
        date_modification_projet Date NOT NULL ,
        id_plan                  Int NOT NULL
	,CONSTRAINT MADERA_PROJET_PK PRIMARY KEY (id_projet)

	,CONSTRAINT MADERA_PROJET_MADERA_PLAN_FK FOREIGN KEY (id_plan) REFERENCES MADERA_PLAN(id_plan)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_CLIENT
#------------------------------------------------------------

CREATE TABLE MADERA_CLIENT(
        id_client        Int  Auto_increment  NOT NULL ,
        nom_client       Varchar (255) NOT NULL ,
        code_client      Int NOT NULL ,
        mdp_client       Varchar (100) NOT NULL ,
        telephone_client Int NOT NULL ,
        adresse_client   Varchar (255) NOT NULL ,
        email_client     Varchar (255) NOT NULL ,
        id_projet        Int NOT NULL
	,CONSTRAINT MADERA_CLIENT_PK PRIMARY KEY (id_client)

	,CONSTRAINT MADERA_CLIENT_MADERA_PROJET_FK FOREIGN KEY (id_projet) REFERENCES MADERA_PROJET(id_projet)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_COMMERCIAL
#------------------------------------------------------------

CREATE TABLE MADERA_COMMERCIAL(
        id_commercial           Int  Auto_increment  NOT NULL ,
        prenom_commercial       Varchar (50) NOT NULL ,
        nom_commercial          Varchar (50) NOT NULL ,
        mot_de_passe_commerical Varchar (50) NOT NULL ,
        id_projet               Int NOT NULL
	,CONSTRAINT MADERA_COMMERCIAL_PK PRIMARY KEY (id_commercial)

	,CONSTRAINT MADERA_COMMERCIAL_MADERA_PROJET_FK FOREIGN KEY (id_projet) REFERENCES MADERA_PROJET(id_projet)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: COMPOSANT_MODULE
#------------------------------------------------------------

CREATE TABLE COMPOSANT_MODULE(
        id_composant Int NOT NULL ,
        id_module    Int NOT NULL
	,CONSTRAINT COMPOSANT_MODULE_PK PRIMARY KEY (id_composant,id_module)

	,CONSTRAINT COMPOSANT_MODULE_MADERA_COMPOSANT_FK FOREIGN KEY (id_composant) REFERENCES MADERA_COMPOSANT(id_composant)
	,CONSTRAINT COMPOSANT_MODULE_MADERA_MODULE0_FK FOREIGN KEY (id_module) REFERENCES MADERA_MODULE(id_module)
)ENGINE=InnoDB;

