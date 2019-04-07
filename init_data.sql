CREATE TABLE investment 
(
    id                          SERIAL primary key,
    codeuai                     varchar(8) not null,
    titreoperation              varchar(255),
    entreprise                  varchar(255),
    annee_de_livraison          integer,
    ville                       varchar(255),
    mandataire                  varchar(255),
    ppi                         varchar(255),
    lycee                       varchar(255),
    notification_du_marche      date, 
    latitude                    float8,
    longitude                   float8,
    etat_d_avancement           varchar(255),
    montant_des_ap_votes_en_meu float,
    cao_attribution             date,
    maitrise_d_oeuvre           varchar(255),
    mode_de_devolution          varchar(255),
    annee_d_individualisation   integer,
    enveloppe_prev_en_meu       float 
);

-- We create a table containing the json data
CREATE unlogged TABLE investment_import (doc json);
\COPY investment_import FROM '/tmp/psql_data/data.json';

-- We insert in the database the investment info
INSERT INTO investment (codeuai, titreoperation, entreprise, annee_de_livraison, ville, mandataire, ppi, lycee, notification_du_marche, latitude, longitude, etat_d_avancement, montant_des_ap_votes_en_meu, cao_attribution, maitrise_d_oeuvre, mode_de_devolution, annee_d_individualisation, enveloppe_prev_en_meu)
SELECT p.codeuai, p.titreoperation, p.entreprise, p.annee_de_livraison, p.ville, p.mandataire, p.ppi, p.lycee, p.notification_du_marche, p.latitude, p.longitude, p.etat_d_avancement, p.montant_des_ap_votes_en_meu, p.cao_attribution, p.maitrise_d_oeuvre, p.mode_de_devolution, p.annee_d_individualisation, p.enveloppe_prev_en_meu
FROM investment_import l
  CROSS JOIN lateral json_populate_recordset(null::investment, doc) as p;