CREATE TABLE drzava(
	idDrzava INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    imeDrzava VARCHAR(45) NOT NULL
);

CREATE TABLE posta(
	postnaStevilka INT NOT NULL PRIMARY KEY,
    imePosta VARCHAR(45) NOT NULL
);

CREATE TABLE obcina(
	idObcina INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    imeObcina VARCHAR(45) NOT NULL
);

CREATE TABLE kraj(
    idKraj INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    imeKraj VARCHAR(45) NOT NULL,
    drzava_idDrzava INT NOT NULL,
    posta_postnaStevilka INT NOT NULL,
    obcina_idObcina INT NOT NULL,

    CONSTRAINT fk_kraj_drzava FOREIGN KEY (drzava_idDrzava)
    REFERENCES drzava (idDrzava) ON DELETE NO ACTION ON UPDATE NO ACTION,

    CONSTRAINT fk_kraj_posta FOREIGN KEY (posta_postnaStevilka)
    REFERENCES posta (postnaStevilka) ON DELETE NO ACTION ON UPDATE NO ACTION,

    CONSTRAINT fk_kraj_obcina FOREIGN KEY (obcina_idObcina)
    REFERENCES obcina (idObcina) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE naslov(
	idNaslov INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ulica VARCHAR(45) NOT NULL,
    hisnaStevilka VARCHAR(6) NOT NULL,
    kraj_idKraj INT NOT NULL
);

ALTER TABLE naslov ADD CONSTRAINT fk_naslov_kraj FOREIGN KEY (kraj_idKraj)
REFERENCES kraj (idKraj) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE zavarovalnica(
	idZavarovalnica INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    imeZavarovalnica VARCHAR(45),
    naslov_idNaslov INT NOT NULL
);

ALTER TABLE zavarovalnica ADD CONSTRAINT fk_zavarovalnica_naslov FOREIGN KEY (naslov_idNaslov)
REFERENCES naslov (idNaslov) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE tipZavarovanje(
	idTipZavarovanje INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(45) NOT NULL
);

CREATE TABLE zavarovanje(
	stZavarovanje VARCHAR(9) NOT NULL PRIMARY KEY,
    zacetek DATE NOT NULL,
    konec DATE NOT NULL,
    imePodjetjeZavarovanje VARCHAR(45) NOT NULL,
    zavarovalnica_idZavarovalnica INT NOT NULL,
    tipZavarovanje_idTipZavarovanje INT NOT NULL
);

ALTER TABLE zavarovanje ADD CONSTRAINT fk_zavarovanje_zavarovalnica FOREIGN KEY(zavarovalnica_idZavarovalnica)
REFERENCES zavarovalnica (idZavarovalnica) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE zavarovanje ADD CONSTRAINT fk_zavarovanje_tipZavarovanje FOREIGN KEY (tipZavarovanje_idTipZavarovanje)
REFERENCES tipZavarovanje (idTipZavarovanje) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE oseba(
	EMSO CHAR(13) NOT NULL PRIMARY KEY,
    ime VARCHAR(45) NOT NULL,
    priimek VARCHAR(45),
    datRojstvo DATE NOT NULL,
    telefonskaStevilka VARCHAR(20),
    spol INT NOT NULL,
    jePacient TINYINT(1) NOT NULL,
    ePosta VARCHAR(45),
    zavarovanje_stZavarovanje VARCHAR(9) NULL
);

ALTER TABLE oseba ADD CONSTRAINT fk_oseba_zavarovanje FOREIGN KEY (zavarovanje_stZavarovanje)
REFERENCES zavarovanje(stZavarovanje) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE zdravljenje(
	idZdravljenje INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    oseba_EMSO CHAR(13) NOT NULL
);

ALTER TABLE zdravljenje ADD CONSTRAINT fk_zdravljenje_oseba FOREIGN KEY (oseba_EMSO)
REFERENCES oseba (EMSO) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE tipBolezen(
	idTipBolezen INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(45) NOT NULL,
    nazivLatinski VARCHAR(45) NOT NULL
);

CREATE TABLE bolezen(
	idBolezen INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    zacetek DATETIME NOT NULL,
    konec DATETIME NULL,
    opomba VARCHAR(255),
    zdravljenje_idZdravljenje INT NOT NULL,
    tipBolezen_idTipBolezen INT NOT NULL
);

ALTER TABLE bolezen ADD CONSTRAINT fk_bolezen_zdravljenje FOREIGN KEY (zdravljenje_idZdravljenje)
REFERENCES zdravljenje (idZdravljenje) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE bolezen ADD CONSTRAINT fk_bolezen_tipBolezen FOREIGN KEY (tipBolezen_idTipBolezen)
REFERENCES tipBolezen (idTipBolezen) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE oddelek(
	idOddelek INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    imeOddelek VARCHAR(127) NOT NULL,
    nadstropje VARCHAR(45) NOT NULL,
    soba INT NOT NULL,
    naslov_idNaslov INT NOT NULL
);

ALTER TABLE oddelek ADD CONSTRAINT fk_oddelek_naslov FOREIGN KEY (naslov_idNaslov)
REFERENCES naslov (idNaslov) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE postelja(
	idPostelja INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    oddelek_idOddelek INT NOT NULL
);

ALTER TABLE postelja ADD CONSTRAINT fk_postelja_oddelek FOREIGN KEY (oddelek_idOddelek)
REFERENCES oddelek (idOddelek) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE zdravljenje_postelja(
	idZdravljenje_postelja INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    datumCasZacetek DATETIME NOT NULL,
    datumCasKonec DATETIME NULL,
    zdravljenje_idZdravljenje INT NOT NULL,
    postelja_idPostelja INT NOT NULL
);

ALTER TABLE zdravljenje_postelja ADD CONSTRAINT fk_zdravljenje_postelja_zdravljenje FOREIGN KEY (zdravljenje_idZdravljenje)
REFERENCES zdravljenje (idZdravljenje) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE zdravljenje_postelja ADD CONSTRAINT fk_zdravljenje_postelja_postelja FOREIGN KEY (postelja_idPostelja)
REFERENCES postelja (idPostelja) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE tipOsebje(
	idTipOsebje INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipOsebje VARCHAR(45) 
);

CREATE TABLE specializacija(
	idSpecializacija INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(45)
);

CREATE TABLE osebje(
	idOsebje INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    oddelek_idOddelek INT NOT NULL,
    tipOsebje_idTipOsebje INT NOT NULL,
    oseba_EMSO CHAR(13) NOT NULL,
    specializacija_idSpecializacija INT NULL
);

CREATE TABLE pregled(
	idPregled INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    casDatumPregled DATETIME NOT NULL,
    osebje_idOsebje INT NOT NULL,
    oseba_EMSO CHAR(13) NOT NULL
);

ALTER TABLE pregled ADD CONSTRAINT fk_pregled_osebje FOREIGN KEY (osebje_idOsebje)
REFERENCES osebje (idOsebje) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE pregled ADD CONSTRAINT fk_pregled_oseba FOREIGN KEY (oseba_EMSO)
REFERENCES oseba (EMSO) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE osebje ADD CONSTRAINT fk_osebje_oddelek FOREIGN KEY (oddelek_idOddelek)
REFERENCES oddelek (idOddelek) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE osebje ADD CONSTRAINT fk_osebje_tipOsebje FOREIGN KEY (tipOsebje_idTipOsebje)
REFERENCES tipOsebje (idTipOsebje) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE osebje ADD CONSTRAINT fk_osebje_oseba FOREIGN KEY (oseba_EMSO)
REFERENCES oseba (EMSO) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE osebje ADD CONSTRAINT fk_osebje_specializacija FOREIGN KEY (specializacija_idSpecializacija)
REFERENCES specializacija (idSpecializacija) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE klinicniPrimer(
	idKlinicniPrimer INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    zdravljenje_idZdravljenje INT NOT NULL,
    osebje_idOsebje INT
);

ALTER TABLE klinicniPrimer ADD CONSTRAINT fk_klinicniPrimer_zdravljenje FOREIGN KEY (zdravljenje_idZdravljenje)
REFERENCES zdravljenje (idZdravljenje) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE racun(
	idRacun CHAR(9) NOT NULL PRIMARY KEY,
    klinicniPrimer_idKlinicniPrimer INT NOT NULL
);

ALTER TABLE racun ADD CONSTRAINT fk_racun_klinicniPrimer FOREIGN KEY (klinicniPrimer_idKlinicniPrimer)
REFERENCES klinicniPrimer (idKlinicniPrimer) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE storitev(
	idStoritev INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(45) NOT NULL
);

CREATE TABLE opravljenaStoritev(
	idOpravljenaStoritev INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    datum DATE NOT NULL,
    storitev_idStoritev INT NOT NULL,
    osebje_idOsebje INT NOT NULL,
    racun_idRacun CHAR(9) NOT NULL
);

ALTER TABLE opravljenaStoritev ADD CONSTRAINT fk_opravljenaStoritev_racun FOREIGN KEY (racun_idRacun)
REFERENCES racun (idRacun) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE opravljenaStoritev ADD CONSTRAINT fk_opravljenaStoritev_storitev FOREIGN KEY (storitev_idStoritev)
REFERENCES storitev (idStoritev) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE opravljenaStoritev ADD CONSTRAINT fk_opravljenaStoritev_osebje FOREIGN KEY (osebje_idOsebje)
REFERENCES osebje (idOsebje) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE tipBivanje(
	idTipBivanje INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tip VARCHAR(45) NOT NULL
);

CREATE TABLE bivanje(
	idBivanje INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    datumOd DATE NOT NULL,
    datumDo DATE NULL,
    naslov_idNaslov INT NOT NULL,
    tipBivanje_idTipBivanje INT NOT NULL,
    oseba_EMSO CHAR(13) NOT NULL
);

ALTER TABLE bivanje ADD CONSTRAINT fk_bivanje_naslov FOREIGN KEY (naslov_idNaslov)
REFERENCES naslov (idNaslov) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE bivanje ADD CONSTRAINT fk_bivanje_tipBivanje FOREIGN KEY (tipBivanje_idTipBivanje)
REFERENCES tipBivanje (idTipBivanje) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE bivanje ADD CONSTRAINT fk_bivanje_oseba FOREIGN KEY (oseba_EMSO)
REFERENCES oseba (EMSO) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE cena(
	idCena INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    datum DATE NOT NULL,
    cena DECIMAL(9,2),
    storitev_idStoritev INT NOT NULL
);

ALTER TABLE cena ADD CONSTRAINT fk_cena_storitev FOREIGN KEY (storitev_idStoritev)
REFERENCES storitev (idStoritev) ON DELETE NO ACTION ON UPDATE NO ACTION;
