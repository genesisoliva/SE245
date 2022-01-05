CREATE TABLE IF NOT EXISTS states (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    state VARCHAR(45) NOT NULL
);
INSERT INTO states VALUES
	(null, 'Slovenija'),
    (null, 'Avstrija'),
    (null, 'Hrvaška'),
    (null, 'Madžarska'),
    (null, 'Rusija');


CREATE TABLE IF NOT EXISTS postalcodes (
	postalcode INT NOT NULL PRIMARY KEY,
    name VARCHAR(45) NOT NULL
);
INSERT INTO postalcodes VALUES
	(1292, 'Ig'),
    (1000, 'Ljubljana'),
    (1355, 'Polhov Gradec'),
    (2000, 'Maribor'),
    (5000, 'Nova Gorica');


CREATE TABLE IF NOT EXISTS municipalities (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    municipality VARCHAR(45) NOT NULL
);
INSERT INTO municipalities VALUES
	(null, 'Ig'),
    (null, 'Ljubljana'),
    (null, 'Polhov Gradec'),
    (null, 'Maribor'),
    (null, 'Nova Gorica');

CREATE TABLE IF NOT EXISTS regions (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    region VARCHAR(45) NOT NULL,
    state_id INT NOT NULL,
    postalcode_id INT NOT NULL,
    municipality_id INT NOT NULL,

    CONSTRAINT fk_region_state FOREIGN KEY (state_id)
    REFERENCES states (id) ON DELETE NO ACTION ON UPDATE NO ACTION,

    CONSTRAINT fk_region_postalcode FOREIGN KEY (postalcode_id)
    REFERENCES postalcodes (postalcode) ON DELETE NO ACTION ON UPDATE NO ACTION,

    CONSTRAINT fk_region_municipality FOREIGN KEY (municipality_id)
    REFERENCES municipalities (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO regions VALUES
	(null, 'Ig', 1, 1292, 1),
    (null, 'Staje', 1, 1292, 1),
    (null, 'Kot', 1, 1292, 1),
    (null, 'Matena', 1, 1292, 1),
    (null, 'Golo', 1, 1292, 1),
    (null, 'Zapotok', 1, 1292, 1),
    (null, 'Tomišelj', 1, 1292, 1),
    (null, 'Iška vas', 1, 1292, 1),
    (null, 'Iška loka', 1, 1292, 1),
    (null, 'Dobravica', 1, 1292, 1);


CREATE TABLE IF NOT EXISTS addresses (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(45) NOT NULL,
    houseNumber VARCHAR(6) NOT NULL,
    region_id INT NOT NULL,

CONSTRAINT fk_address_region_ FOREIGN KEY (region_id)
REFERENCES regions (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO addresses VALUES
	(null, 'Banija', '5', 1),
    (null, 'Staje', '1a', 1),
    (null, 'Kot', '15', 1),
    (null, 'Matena', '36', 1),
    (null, 'Golo', '12', 1),
    (null, 'Zapotok', '33c', 1),
    (null, 'Tomišelj', '28', 1),
    (null, 'Iška vas', '56', 1),
    (null, 'Iška loka', '91', 1),
    (null, 'Dobravica', '2', 1);

CREATE TABLE IF NOT EXISTS insurancecompanies (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45),
    address_id INT NOT NULL,
CONSTRAINT fk_insurancecompany_address FOREIGN KEY (address_id)
REFERENCES addresses (id) ON DELETE NO ACTION ON UPDATE NO ACTION);
INSERT INTO insurancecompanies VALUES
	(null, 'Adriatic Slovenica zavarovalna družba d.d.', 1),
    (null, 'Generali zavarovalnica d.d.', 2),
    (null, 'Grawe zavarovalnica d.d.', 3),
    (null, 'NLB Vita d.d', 4),
    (null, 'Merkur zavarovalnica d.d.', 5),
    (null, 'Triglav zdravstvena zavarovalnica d.d.', 5),
    (null, 'Vzajemna zdravstvena zavarovalnica d.d.', 6),
    (null, 'Weiner Staedtische zavarovalnica d.d.', 7),
    (null, 'Zavarovalnica Tilia d.d.', 8),
    (null, 'SID - prva kreditna zavarovalnica d.d.', 9),
    (null, 'ZZZS', 10);

CREATE TABLE IF NOT EXISTS insurancetypes (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    insurancetype VARCHAR(45) NOT NULL
);
INSERT INTO insurancetypes (insurancetype) VALUES
	('Osnovno'),
    ('Dopolnilno'),
    ('V tujini');


CREATE TABLE IF NOT EXISTS insurances (
	stZavarovanje VARCHAR(9) NOT NULL PRIMARY KEY,
    zacetek DATE NOT NULL,
    konec DATE NOT NULL,
    imePodjetjeZavarovanje VARCHAR(45) NOT NULL,
    insurancecompany_id INT NOT NULL,
    insurancetype_id INT NOT NULL,

CONSTRAINT fk_insurance_insurancecompany FOREIGN KEY(insurancecompany_id)
REFERENCES insurancecompanies (id) ON DELETE NO ACTION ON UPDATE NO ACTION,

 CONSTRAINT fk_insurance_insurancetype FOREIGN KEY (insurancetype_id)
REFERENCES insurancetypes (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO insurances VALUES
	('042632359', '2018-01-01', '2019-12-31', 'MDK', 1, 2),
    ('042632358', '2018-01-01', '2019-12-31', 'MDK', 2, 2),
    ('042632357', '2018-01-01', '2019-12-31', 'MDK', 3, 2),
    ('042632356', '2018-01-01', '2019-12-31', 'MDK', 4, 2),
    ('042632355', '2018-01-01', '2019-12-31', 'MDK', 5, 2),
    ('042632354', '2018-01-01', '2019-12-31', 'MDK', 6, 2),
    ('042632353', '2018-01-01', '2019-12-31', 'MDK', 7, 2),
    ('042632352', '2018-01-01', '2019-12-31', 'MDK', 8, 2),
    ('042632351', '2018-01-01', '2019-12-31', 'FERI', 9, 2),
    ('042632350', '2018-01-01', '2019-12-31', 'ZZZS', 10, 1);

CREATE TABLE IF NOT EXISTS persons (
	EMSO CHAR(13) NOT NULL PRIMARY KEY,
    ime VARCHAR(45) NOT NULL,
    priimek VARCHAR(45),
    datRojstvo DATE NOT NULL,
    telefonskaStevilka VARCHAR(20),
    spol INT NOT NULL,
    jePacient TINYINT(1) NOT NULL,
    ePosta VARCHAR(45),
    insurance_id VARCHAR(9) NULL,

CONSTRAINT fk_person_insurance_id FOREIGN KEY (insurance_id)
REFERENCES insurances (stZavarovanje) ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO persons VALUES 
	('2909995500367', 'Neven', 'Jevtić', '1995-09-29', '041886970', 1, 1, 'neven.jevtic@student.um.si', '042632359'),
    ('2909995500123', 'Luka', 'Hrgarek', '1995-09-29', '041886970', 0, 0, null, '042632358'),
    ('2909995500321', 'Tatjana', 'Welzer', '1995-09-29', '041886970', 1, 0, null, '042632357'),
    ('2909995500111', 'Neven', 'Jevtić', '1995-09-29', '041886970', 0, 1, 'neven.jevtic@student.um.si', '042632350'),
    ('2909995500112', 'Neven', 'Jevtić', '1995-09-29', '041886970', 1, 1, 'neven.jevtic@student.um.si', '042632356'),
    ('2909995500113', 'Neven', 'Jevtić', '1995-09-29', '041886970', 1, 1, 'neven.jevtic@student.um.si', '042632355'),
    ('2909995500114', 'Neven', 'Jevtić', '1995-09-29', '041886970', 1, 1, 'neven.jevtic@student.um.si', '042632354'),
    ('2909995500115', 'Neven', 'Jevtić', '1995-09-29', '041886970', 1, 1, 'neven.jevtic@student.um.si', '042632353'),
    ('2909995500116', 'Neven', 'Jevtić', '1995-09-29', '041886970', 1, 1, 'neven.jevtic@student.um.si', '042632352'),
    ('2909995500117', 'Slavica', 'Kodrun', '1995-09-29', '041886970', 1, 1, 'neven.jevtic@student.um.si', '042632351');


CREATE TABLE IF NOT EXISTS treatments (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    person_EMSO CHAR(13) NOT NULL,

CONSTRAINT fk_treatment_person FOREIGN KEY (person_EMSO)
REFERENCES persons (EMSO) ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO treatments VALUES
	(null, '2909995500115'),
    (null, '2909995500115'),
    (null, '2909995500115'),
    (null, '2909995500115'),
    (null, '2909995500115'),
    (null, '2909995500115'),
    (null, '2909995500115'),
    (null, '2909995500115'),
    (null, '2909995500115'),
    (null, '2909995500115');


CREATE TABLE IF NOT EXISTS diseaseTypes (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(45) NOT NULL,
    nazivLatinski VARCHAR(45) NOT NULL
);
INSERT INTO diseaseTypes VALUES
	(null, 'Artereoskleroza', 'ASL'),
    (null, 'Srčna Kap', 'Heart Stroke'),
    (null, 'Pljučnica', 'Pneumonia'),
    (null, 'Sladkorna bolezen', 'Diabetus'),
    (null, 'Tuberkuloza', 'Tuberculosis');

CREATE TABLE IF NOT EXISTS diseases (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    zacetek DATETIME NOT NULL,
    konec DATETIME NULL,
    opomba VARCHAR(255),
    treatment_id INT NOT NULL,
    diseaseType_id INT NOT NULL,

 CONSTRAINT fk_disease_treatment FOREIGN KEY (treatment_id)
REFERENCES treatments (id) ON DELETE NO ACTION ON UPDATE NO ACTION,

 CONSTRAINT fk_disease_diseaseType FOREIGN KEY (diseaseType_id)
REFERENCES diseaseTypes (id) ON DELETE NO ACTION ON UPDATE NO ACTION

);
INSERT INTO diseases VALUES
	(null, '2018-09-06 22:12:33', '2018-11-06 00:00:00', null, 1, 1),
    (null, '2018-09-06 22:12:33', '2018-11-06 00:00:00', null, 2, 2),
    (null, '2018-09-06 22:12:33', '2018-11-06 00:00:00', null, 3, 3),
    (null, '2018-09-06 22:12:33', '2018-11-06 00:00:00', null, 4, 4),
    (null, '2018-09-06 22:12:33', '2018-11-06 00:00:00', null, 5, 5),
    (null, '2019-09-06 22:12:33', null, null, 1, 1),
    (null, '2019-09-06 22:12:33', null, null, 2, 2),
    (null, '2019-09-06 22:12:33', null, null, 3, 3),
    (null, '2019-09-06 22:12:33', null, null, 4, 4),
    (null, '2019-09-06 22:12:33', null, null, 5, 5);


CREATE TABLE IF NOT EXISTS departments (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(127) NOT NULL,
    nadstropje VARCHAR(45) NOT NULL,
    soba INT NOT NULL,
    address_id INT NOT NULL,

 CONSTRAINT fk_department_address FOREIGN KEY (address_id)
REFERENCES addresses (id) ON DELETE NO ACTION ON UPDATE NO ACTION

);
INSERT INTO departments VALUES 
	(null, 'Anesteziologija', 'Pritličje', 1, 1),
    (null, 'Kirurgija', 'Pritličje', 2, 1),
    (null, 'Psihiatrija', 'Pritličje', 3, 1),
    (null, 'Ambulanta', 'Pritličje', 4, 1),
    (null, 'Intenzivna nega', 'Pritličje', 5, 1),
    (null, 'Paradontologija', 'Pritličje', 6, 1),
    (null, 'Zobozdravstvena ambulanta', 'Pritličje', 7, 1),
    (null, 'Nevrokirurgija', 'Pritličje', 8, 1),
    (null, 'Maksiofacialna', 'Pritličje', 9, 1),
    (null, 'Oddelek za plastično kirurgijo I', 'Pritličje', 10, 1),
    (null, 'Interna', '2', 2, 1);

CREATE TABLE IF NOT EXISTS beds (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    department_id INT NOT NULL,

CONSTRAINT fk_bed_department FOREIGN KEY (department_id)
REFERENCES departments (id) ON DELETE NO ACTION ON UPDATE NO ACTION

);
INSERT INTO beds VALUES
	(NULL, 1),
    (NULL, 2),
    (NULL, 3),
    (NULL, 1),
	(NULL, 1),
    (NULL, 2),
    (NULL, 3),
    (NULL, 1),
    (NULL, 5),
    (NULL, 4),
    (NULL, 1),
    (null, 11),
	(null, 11),
	(null, 11),
	(null, 11),
	(null, 11),
	(null, 11),
	(null, 11),
	(null, 11),
	(null, 11),
	(null, 11),
    (null, 11);
CREATE TABLE IF NOT EXISTS treatment_bed (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    datumCasZacetek DATETIME NOT NULL,
    datumCasKonec DATETIME NULL,
    treatment_id INT NOT NULL,
    bed_id INT NOT NULL,

 CONSTRAINT fk_treatment_bed_treatment FOREIGN KEY (treatment_id)
REFERENCES treatments (id) ON DELETE NO ACTION ON UPDATE NO ACTION,

 CONSTRAINT fk_treatment_bed_bed FOREIGN KEY (bed_id)
REFERENCES beds (id) ON DELETE NO ACTION ON UPDATE NO ACTION

);
INSERT INTO treatment_bed VALUES
	(NULL, '2018-11-11 12:00:00', null, 1, 1),
    (NULL, '2018-11-11 12:00:00', null, 2, 2),
    (NULL, '2018-11-11 12:00:00', null, 3, 3),
    (NULL, '2018-11-11 12:00:00', null, 4, 4),
    (NULL, '2018-11-11 12:00:00', null, 5, 5),
    (NULL, '2018-11-11 12:00:00', null, 6, 6),
    (NULL, '2018-11-11 12:00:00', null, 7, 7),
    (NULL, '2018-11-11 12:00:00', null, 8, 8),
    (NULL, '2018-11-11 12:00:00', null, 9, 9),
    (NULL, '2018-11-11 12:00:00', null, 10, 10),
    (null, '2018-11-11 00:00:00', '2018-12-10 00:00:00', 1, 12),
	(null, '2018-11-11 00:00:00', '2018-12-10 00:00:00', 1, 13),
	(null, '2018-11-11 00:00:00', '2018-12-10 00:00:00', 1, 14),
	(null, '2018-11-11 00:00:00', '2018-12-10 00:00:00', 1, 15),
	(null, '2018-11-11 00:00:00', '2018-12-10 00:00:00', 1, 16),
	(null, '2018-11-11 00:00:00', '2018-12-10 00:00:00', 1, 17),
	(null, '2018-11-11 00:00:00', null, 1, 18),
	(null, '2018-11-11 00:00:00', null, 1, 19),
	(null, '2018-11-10 00:00:00', '2018-11-11 00:00:00', 1, 20),
	(null, '2018-11-10 00:00:00', '2018-11-11 00:00:00', 1, 21);

CREATE TABLE IF NOT EXISTS tipOsebje(
	idTipOsebje INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipOsebje VARCHAR(45) 
);
INSERT INTO tipOsebje VALUES
	(null, 'Zdravnik'),
    (null, 'Medicinska sestra'),
    (null, 'Bolničar'),
    (null, 'Kuhar'),
    (null, 'Snažilka');
    
CREATE TABLE IF NOT EXISTS specializacija(
	idSpecializacija INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(45)
);
INSERT INTO specializacija VALUES
	(null, 'Anesteziolog'),
    (null, 'Kardiolog'),
    (null, 'Internist'),
    (null, 'Kirurg'),
    (null, 'Psihiatrija');
CREATE TABLE IF NOT EXISTS osebje(
	idOsebje INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    department_id INT NOT NULL,
    tipOsebje_idTipOsebje INT NOT NULL,
    person_EMSO CHAR(13) NOT NULL,
    specializacija_idSpecializacija INT NULL,

CONSTRAINT fk_osebje_department FOREIGN KEY (department_id)
REFERENCES departments (id) ON DELETE NO ACTION ON UPDATE NO ACTION,

CONSTRAINT fk_osebje_tipOsebje FOREIGN KEY (tipOsebje_idTipOsebje)
REFERENCES tipOsebje (idTipOsebje) ON DELETE NO ACTION ON UPDATE NO ACTION,

CONSTRAINT fk_osebje_person FOREIGN KEY (person_EMSO)
REFERENCES persons (EMSO) ON DELETE NO ACTION ON UPDATE NO ACTION,

CONSTRAINT fk_osebje_specializacija FOREIGN KEY (specializacija_idSpecializacija)
REFERENCES specializacija (idSpecializacija) ON DELETE NO ACTION ON UPDATE NO ACTION

);
INSERT INTO osebje VALUES
	(null, 1, 1, '2909995500123', 1),
    (null, 1, 1, '2909995500321', 2),
    (null, 1, 2, '2909995500123', 1),
    (null, 1, 2, '2909995500123', 1),
    (null, 1, 3, '2909995500123', 1),
    (null, 1, 3, '2909995500123', 1),
    (null, 1, 4, '2909995500123', 1),
    (null, 1, 4, '2909995500123', 1),
    (null, 1, 3, '2909995500123', 1),
    (null, 1, 2, '2909995500117', null);
CREATE TABLE IF NOT EXISTS pregled(
	idPregled INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    casDatumPregled DATETIME NOT NULL,
    osebje_idOsebje INT NOT NULL,
    person_EMSO CHAR(13) NOT NULL,
 CONSTRAINT fk_pregled_osebje FOREIGN KEY (osebje_idOsebje)
REFERENCES osebje (idOsebje) ON DELETE NO ACTION ON UPDATE NO ACTION,

 CONSTRAINT fk_pregled_person FOREIGN KEY (person_EMSO)
REFERENCES persons (EMSO) ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO pregled VALUES 
	(null, '2018-11-15 11:45:00', 1, '2909995500367'),
    (null, '2018-10-15 11:45:00', 1, '2909995500367'),
    (null, '2018-11-14 11:45:00', 1, '2909995500367'),
    (null, '2018-11-13 11:45:00', 1, '2909995500367'),
    (null, '2018-11-12 11:45:00', 1, '2909995500367'),
    (null, '2018-11-11 11:45:00', 1, '2909995500367'),
    (null, '2018-11-10 11:45:00', 1, '2909995500367'),
    (null, '2018-11-09 11:45:00', 1, '2909995500367'),
    (null, '2018-11-08 11:45:00', 1, '2909995500123'),
    (null, '2018-11-07 11:45:00', 1, '2909995500123');

CREATE TABLE IF NOT EXISTS klinicniPrimer(
	idKlinicniPrimer INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    treatment_id INT NOT NULL,
    osebje_idOsebje INT,

CONSTRAINT fk_klinicniPrimer_treatment FOREIGN KEY (treatment_id)
REFERENCES treatments (id) ON DELETE NO ACTION ON UPDATE NO ACTION

);
INSERT INTO klinicniPrimer VALUES 
	(null, 1, 1),
    (null, 1, 2),
    (null, 1, 3),
    (null, 1, 4),
    (null, 1, 5),
    (null, 1, 6),
    (null, 1, 7),
    (null, 1, 8),
    (null, 1, 9),
    (null, 1, 10);
CREATE TABLE IF NOT EXISTS racun(
	idRacun CHAR(9) NOT NULL PRIMARY KEY,
    klinicniPrimer_idKlinicniPrimer INT NOT NULL,

CONSTRAINT fk_racun_klinicniPrimer FOREIGN KEY (klinicniPrimer_idKlinicniPrimer)
REFERENCES klinicniPrimer (idKlinicniPrimer) ON DELETE NO ACTION ON UPDATE NO ACTION

);
INSERT INTO racun VALUES
	('0000001', 1),
    ('0000002', 2),
    ('0000003', 3),
    ('0000004', 4),
    ('0000005', 5),
    ('0000006', 6),
    ('0000007', 7),
    ('0000008', 8),
    ('0000009', 9),
    ('0000010', 10);

CREATE TABLE IF NOT EXISTS storitev(
	idStoritev INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(45) NOT NULL
);
INSERT INTO storitev VALUES 
	(null, 'Pregled srca z ultrazvokom'),
    (null, 'Izdelava mavca'),
    (null, 'Operacija srca'),
    (null, 'Operacija kolena'),
    (null, 'Odstranitev ledvičnih kamnov');
CREATE TABLE IF NOT EXISTS opravljenaStoritev(
	idOpravljenaStoritev INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    datum DATE NOT NULL,
    storitev_idStoritev INT NOT NULL,
    osebje_idOsebje INT NOT NULL,
    racun_idRacun CHAR(9) NOT NULL,

 CONSTRAINT fk_opravljenaStoritev_racun FOREIGN KEY (racun_idRacun)
REFERENCES racun (idRacun) ON DELETE NO ACTION ON UPDATE NO ACTION,

 CONSTRAINT fk_opravljenaStoritev_storitev FOREIGN KEY (storitev_idStoritev)
REFERENCES storitev (idStoritev) ON DELETE NO ACTION ON UPDATE NO ACTION,

 CONSTRAINT fk_opravljenaStoritev_osebje FOREIGN KEY (osebje_idOsebje)
REFERENCES osebje (idOsebje) ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO opravljenaStoritev VALUES
	(null, '2010-01-01', 1, 1, '0000001'),
    (null, '2018-01-01', 1, 1, '0000001'),
    (null, '2018-01-01', 2, 2, '0000001'),
    (null, '2018-01-01', 2, 2, '0000001'),
    (null, '2018-01-01', 3, 2, '0000001'),
    (null, '2018-01-01', 3, 3, '0000001'),
    (null, '2018-01-01', 4, 4, '0000001'),
    (null, '2018-01-01', 4, 4, '0000001'),
    (null, '2018-01-01', 5, 4, '0000001'),
    (null, '2018-01-01', 5, 4, '0000001');
CREATE TABLE IF NOT EXISTS tipBivanje(
	idTipBivanje INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tip VARCHAR(45) NOT NULL
);
INSERT INTO tipBivanje (tip) VALUES
	('Stalno'),
    ('Zacasno');
CREATE TABLE IF NOT EXISTS bivanje (
	idBivanje INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    datumOd DATE NOT NULL,
    datumDo DATE NULL,
    address_id INT NOT NULL,
    tipBivanje_idTipBivanje INT NOT NULL,
    person_EMSO CHAR(13) NOT NULL,
    CONSTRAINT fk_bivanje_address FOREIGN KEY (address_id)
    REFERENCES addresses (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_bivanje_tipBivanje FOREIGN KEY (tipBivanje_idTipBivanje)
    REFERENCES tipBivanje (idTipBivanje) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_bivanje_person FOREIGN KEY (person_EMSO)
    REFERENCES persons (EMSO) ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO bivanje VALUES
	(null, '2018-01-01', null, 1, 1, '2909995500367'),
    (null, '2018-01-01', null, 1, 1, '2909995500123'),
    (null, '2018-01-01', null, 1, 1, '2909995500321'),
    (null, '2018-01-01', null, 1, 1, '2909995500111'),
    (null, '2018-01-01', null, 1, 1, '2909995500112'),
    (null, '2018-01-01', null, 1, 1, '2909995500114'),
    (null, '2018-01-01', null, 1, 1, '2909995500115'),
    (null, '2018-01-01', null, 1, 1, '2909995500116'),
    (null, '2018-01-01', null, 1, 1, '2909995500113'),
    (null, '2018-01-01', null, 1, 2, '2909995500117');

CREATE TABLE IF NOT EXISTS cena (
	idCena INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    datum DATE NOT NULL,
    cena DECIMAL(9,2),
    storitev_idStoritev INT NOT NULL,
    CONSTRAINT fk_cena_storitev FOREIGN KEY (storitev_idStoritev)
    REFERENCES storitev (idStoritev) ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO cena VALUES 
	(null, '2018-10-22', 20.55, 1),
    (null, '2018-10-22', 22.55, 1),
    (null, '2018-10-22', 222.55, 2),
    (null, '2018-10-22', 20, 2),
    (null, '2018-10-22', 99.00, 3),
	(null, '2018-10-22', 411, 3),
    (null, '2018-10-22', 99.99, 4),
    (null, '2018-10-22', 22.11, 4),
    (null, '2018-10-22', 29.65, 4),
    (null, '2018-10-22', 330.33, 4);
    
