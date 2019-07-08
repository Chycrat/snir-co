#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: MADERA_CLIENT
#------------------------------------------------------------

CREATE TABLE MADERA_CLIENT(
        id_client   Int  Auto_increment  NOT NULL ,
        nom_client  Varchar (255) NOT NULL ,
        code_client Int NOT NULL ,
        mdp_client  Varchar (100) NOT NULL
	,CONSTRAINT MADERA_CLIENT_PK PRIMARY KEY (id_client)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_COMMANDE
#------------------------------------------------------------

CREATE TABLE MADERA_COMMANDE(
        id_commande   Int  Auto_increment  NOT NULL ,
        code_commande Int NOT NULL ,
        date_commande Datetime NOT NULL ,
        id_client     Int NOT NULL
	,CONSTRAINT MADERA_COMMANDE_PK PRIMARY KEY (id_commande)

	,CONSTRAINT MADERA_COMMANDE_MADERA_CLIENT_FK FOREIGN KEY (id_client) REFERENCES MADERA_CLIENT(id_client)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_DEVIS
#------------------------------------------------------------

CREATE TABLE MADERA_DEVIS(
        id_devis        Int  Auto_increment  NOT NULL ,
        code_devis      Varchar (255) NOT NULL ,
        date_devis      Datetime NOT NULL ,
        date_validation Datetime NOT NULL ,
        montant_devis   Int NOT NULL ,
        id_client       Int NOT NULL
	,CONSTRAINT MADERA_DEVIS_PK PRIMARY KEY (id_devis)

	,CONSTRAINT MADERA_DEVIS_MADERA_CLIENT_FK FOREIGN KEY (id_client) REFERENCES MADERA_CLIENT(id_client)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_ARTICLE
#------------------------------------------------------------

CREATE TABLE MADERA_ARTICLE(
        id_article   Int  Auto_increment  NOT NULL ,
        code_article Int NOT NULL ,
        nom_article  Varchar (255) NOT NULL ,
        prix_article Int NOT NULL ,
        id_client    Int NOT NULL ,
        id_devis     Int NOT NULL
	,CONSTRAINT MADERA_ARTICLE_PK PRIMARY KEY (id_article)

	,CONSTRAINT MADERA_ARTICLE_MADERA_CLIENT_FK FOREIGN KEY (id_client) REFERENCES MADERA_CLIENT(id_client)
	,CONSTRAINT MADERA_ARTICLE_MADERA_DEVIS0_FK FOREIGN KEY (id_devis) REFERENCES MADERA_DEVIS(id_devis)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MADERA_FACTURE
#------------------------------------------------------------

CREATE TABLE MADERA_FACTURE(
        id_facture   Int  Auto_increment  NOT NULL ,
        code_facture Int NOT NULL ,
        date_facture Datetime NOT NULL ,
        prix_facture Int NOT NULL ,
        id_client    Int NOT NULL ,
        id_devis     Int NOT NULL
	,CONSTRAINT MADERA_FACTURE_PK PRIMARY KEY (id_facture)

	,CONSTRAINT MADERA_FACTURE_MADERA_CLIENT_FK FOREIGN KEY (id_client) REFERENCES MADERA_CLIENT(id_client)
	,CONSTRAINT MADERA_FACTURE_MADERA_DEVIS0_FK FOREIGN KEY (id_devis) REFERENCES MADERA_DEVIS(id_devis)
)ENGINE=InnoDB;

