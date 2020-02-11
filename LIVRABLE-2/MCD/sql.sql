#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: MADERA_CLIENT
#------------------------------------------------------------

CREATE TABLE MADERA_CLIENT(
        id_client    Int  Auto_increment  NOT NULL ,
        nom          Varchar (255) NOT NULL ,
        prenom       Varchar (50) NOT NULL ,
        mdp          Varchar (100) NOT NULL ,
        telephone    Varchar (15) NOT NULL ,
        adresse      Varchar (255) NOT NULL ,
        email_client Varchar (255) NOT NULL
	,CONSTRAINT MADERA_CLIENT_PK PRIMARY KEY (id_client)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_COMPOSANT
#------------------------------------------------------------

CREATE TABLE MADERA_COMPOSANT(
        id_composant      Int  Auto_increment  NOT NULL ,
        nom               Varchar (255) NOT NULL ,
        prix              Float NOT NULL ,
        quantite_restante Int NOT NULL ,
        nature_composant  Varchar (50) NOT NULL
	,CONSTRAINT MADERA_COMPOSANT_PK PRIMARY KEY (id_composant)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_MODULE
#------------------------------------------------------------

CREATE TABLE MADERA_MODULE(
        id_module          Int  Auto_increment  NOT NULL ,
        nom                Varchar (255) NOT NULL ,
        prix_HT            Int NOT NULL ,
        quantite_restante  Int NOT NULL ,
        coordonnee_X_debut Int NOT NULL ,
        coordonnee_X_fin   Int NOT NULL ,
        coordonnee_Y_debut Int NOT NULL ,
        coordonnee_Y_fin   Int NOT NULL ,
        largeur            Int NOT NULL ,
        longueur           Int NOT NULL ,
        nb_composant       Int NOT NULL ,
        gamme              Varchar (50) NOT NULL
	,CONSTRAINT MADERA_MODULE_PK PRIMARY KEY (id_module)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_SOL
#------------------------------------------------------------

CREATE TABLE MADERA_SOL(
        id_sol  Int  Auto_increment  NOT NULL ,
        nom     Varchar (50) NOT NULL ,
        prix_HT Float NOT NULL
	,CONSTRAINT MADERA_SOL_PK PRIMARY KEY (id_sol)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_TOIT
#------------------------------------------------------------

CREATE TABLE MADERA_TOIT(
        id_toit Int  Auto_increment  NOT NULL ,
        nom     Varchar (50) NOT NULL ,
        prix_HT Float NOT NULL
	,CONSTRAINT MADERA_TOIT_PK PRIMARY KEY (id_toit)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_GAMME
#------------------------------------------------------------

CREATE TABLE MADERA_GAMME(
        id_gamme          Int  Auto_increment  NOT NULL ,
        type_isolant      Varchar (50) NOT NULL ,
        type_couverture   Varchar (50) NOT NULL ,
        qualite_huisserie Varchar (50) NOT NULL
	,CONSTRAINT MADERA_GAMME_PK PRIMARY KEY (id_gamme)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_COUPE
#------------------------------------------------------------

CREATE TABLE MADERA_COUPE(
        id_coupe       Int  Auto_increment  NOT NULL ,
        longueur_coupe Int NOT NULL ,
        largeur_coupe  Int NOT NULL
	,CONSTRAINT MADERA_COUPE_PK PRIMARY KEY (id_coupe)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_PROJET
#------------------------------------------------------------

CREATE TABLE MADERA_PROJET(
        id_projet         Int  Auto_increment  NOT NULL ,
        nom               Varchar (100) NOT NULL ,
        date_creation     Date NOT NULL ,
        date_modification Date ,
        id_client         Int NOT NULL
	,CONSTRAINT MADERA_PROJET_PK PRIMARY KEY (id_projet)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_COMMERCIAL
#------------------------------------------------------------

CREATE TABLE MADERA_COMMERCIAL(
        id_commercial Int  Auto_increment  NOT NULL ,
        prenom        Varchar (50) NOT NULL ,
        nom           Varchar (50) NOT NULL ,
        mdp           Varchar (50) NOT NULL
	,CONSTRAINT MADERA_COMMERCIAL_PK PRIMARY KEY (id_commercial)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: COMPOSANT_MODULE
#------------------------------------------------------------

CREATE TABLE COMPOSANT_MODULE(
        id_composant Int NOT NULL ,
        id_module    Int NOT NULL
	,CONSTRAINT COMPOSANT_MODULE_PK PRIMARY KEY (id_composant,id_module)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PROJET_COMMERCIAL
#------------------------------------------------------------

CREATE TABLE PROJET_COMMERCIAL(
        id_commercial Int NOT NULL ,
        id_projet     Int NOT NULL
	,CONSTRAINT PROJET_COMMERCIAL_PK PRIMARY KEY (id_commercial,id_projet)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_DEVIS
#------------------------------------------------------------

CREATE TABLE MADERA_DEVIS(
        id_devis         Int  Auto_increment  NOT NULL ,
        date_commande    Datetime NOT NULL ,
        date_validation  Datetime ,
        montant_HT       Float NOT NULL ,
        montant_TTC      Float NOT NULL ,
        marge_commercial Int NOT NULL ,
        marge_entreprise Int NOT NULL ,
        id_plan          Int NOT NULL
	,CONSTRAINT MADERA_DEVIS_PK PRIMARY KEY (id_devis)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_PLAN
#------------------------------------------------------------

CREATE TABLE MADERA_PLAN(
        id_plan           Int  Auto_increment  NOT NULL ,
        date_creation     Date NOT NULL ,
        date_modification Date ,
        largeur           Int NOT NULL ,
        longueur          Int NOT NULL ,
        prix_total_HT     Float NOT NULL ,
        prix_total_TTC    Float NOT NULL ,
        id_devis          Int NOT NULL ,
        id_projet         Int NOT NULL
	,CONSTRAINT MADERA_PLAN_PK PRIMARY KEY (id_plan)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PLAN_MODULE
#------------------------------------------------------------

CREATE TABLE PLAN_MODULE(
        id_plan   Int NOT NULL ,
        id_module Int NOT NULL
	,CONSTRAINT PLAN_MODULE_PK PRIMARY KEY (id_plan,id_module)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PLAN_SOL
#------------------------------------------------------------

CREATE TABLE PLAN_SOL(
        id_sol  Int NOT NULL ,
        id_plan Int NOT NULL
	,CONSTRAINT PLAN_SOL_PK PRIMARY KEY (id_sol,id_plan)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PLAN_TOIT
#------------------------------------------------------------

CREATE TABLE PLAN_TOIT(
        id_plan Int NOT NULL ,
        id_toit Int NOT NULL
	,CONSTRAINT PLAN_TOIT_PK PRIMARY KEY (id_plan,id_toit)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PLAN_GAMME
#------------------------------------------------------------

CREATE TABLE PLAN_GAMME(
        id_plan  Int NOT NULL ,
        id_gamme Int NOT NULL
	,CONSTRAINT PLAN_GAMME_PK PRIMARY KEY (id_plan,id_gamme)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PLAN_COUPE
#------------------------------------------------------------

CREATE TABLE PLAN_COUPE(
        id_plan  Int NOT NULL ,
        id_coupe Int NOT NULL
	,CONSTRAINT PLAN_COUPE_PK PRIMARY KEY (id_plan,id_coupe)
)ENGINE=InnoDB;




ALTER TABLE MADERA_PROJET
	ADD CONSTRAINT MADERA_PROJET_MADERA_CLIENT0_FK
	FOREIGN KEY (id_client)
	REFERENCES MADERA_CLIENT(id_client);

ALTER TABLE COMPOSANT_MODULE
	ADD CONSTRAINT COMPOSANT_MODULE_MADERA_COMPOSANT0_FK
	FOREIGN KEY (id_composant)
	REFERENCES MADERA_COMPOSANT(id_composant);

ALTER TABLE COMPOSANT_MODULE
	ADD CONSTRAINT COMPOSANT_MODULE_MADERA_MODULE1_FK
	FOREIGN KEY (id_module)
	REFERENCES MADERA_MODULE(id_module);

ALTER TABLE PROJET_COMMERCIAL
	ADD CONSTRAINT PROJET_COMMERCIAL_MADERA_COMMERCIAL0_FK
	FOREIGN KEY (id_commercial)
	REFERENCES MADERA_COMMERCIAL(id_commercial);

ALTER TABLE PROJET_COMMERCIAL
	ADD CONSTRAINT PROJET_COMMERCIAL_MADERA_PROJET1_FK
	FOREIGN KEY (id_projet)
	REFERENCES MADERA_PROJET(id_projet);

ALTER TABLE MADERA_DEVIS
	ADD CONSTRAINT MADERA_DEVIS_MADERA_PLAN0_FK
	FOREIGN KEY (id_plan)
	REFERENCES MADERA_PLAN(id_plan);

ALTER TABLE MADERA_DEVIS 
	ADD CONSTRAINT MADERA_DEVIS_MADERA_PLAN0_AK 
	UNIQUE (id_plan);

ALTER TABLE MADERA_PLAN
	ADD CONSTRAINT MADERA_PLAN_MADERA_DEVIS0_FK
	FOREIGN KEY (id_devis)
	REFERENCES MADERA_DEVIS(id_devis);

ALTER TABLE MADERA_PLAN
	ADD CONSTRAINT MADERA_PLAN_MADERA_PROJET1_FK
	FOREIGN KEY (id_projet)
	REFERENCES MADERA_PROJET(id_projet);

ALTER TABLE MADERA_PLAN 
	ADD CONSTRAINT MADERA_PLAN_MADERA_DEVIS0_AK 
	UNIQUE (id_devis);

ALTER TABLE PLAN_MODULE
	ADD CONSTRAINT PLAN_MODULE_MADERA_PLAN0_FK
	FOREIGN KEY (id_plan)
	REFERENCES MADERA_PLAN(id_plan);

ALTER TABLE PLAN_MODULE
	ADD CONSTRAINT PLAN_MODULE_MADERA_MODULE1_FK
	FOREIGN KEY (id_module)
	REFERENCES MADERA_MODULE(id_module);

ALTER TABLE PLAN_SOL
	ADD CONSTRAINT PLAN_SOL_MADERA_SOL0_FK
	FOREIGN KEY (id_sol)
	REFERENCES MADERA_SOL(id_sol);

ALTER TABLE PLAN_SOL
	ADD CONSTRAINT PLAN_SOL_MADERA_PLAN1_FK
	FOREIGN KEY (id_plan)
	REFERENCES MADERA_PLAN(id_plan);

ALTER TABLE PLAN_TOIT
	ADD CONSTRAINT PLAN_TOIT_MADERA_PLAN0_FK
	FOREIGN KEY (id_plan)
	REFERENCES MADERA_PLAN(id_plan);

ALTER TABLE PLAN_TOIT
	ADD CONSTRAINT PLAN_TOIT_MADERA_TOIT1_FK
	FOREIGN KEY (id_toit)
	REFERENCES MADERA_TOIT(id_toit);

ALTER TABLE PLAN_GAMME
	ADD CONSTRAINT PLAN_GAMME_MADERA_PLAN0_FK
	FOREIGN KEY (id_plan)
	REFERENCES MADERA_PLAN(id_plan);

ALTER TABLE PLAN_GAMME
	ADD CONSTRAINT PLAN_GAMME_MADERA_GAMME1_FK
	FOREIGN KEY (id_gamme)
	REFERENCES MADERA_GAMME(id_gamme);

ALTER TABLE PLAN_COUPE
	ADD CONSTRAINT PLAN_COUPE_MADERA_PLAN0_FK
	FOREIGN KEY (id_plan)
	REFERENCES MADERA_PLAN(id_plan);

ALTER TABLE PLAN_COUPE
	ADD CONSTRAINT PLAN_COUPE_MADERA_COUPE1_FK
	FOREIGN KEY (id_coupe)
	REFERENCES MADERA_COUPE(id_coupe);
