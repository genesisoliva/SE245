INSERT INTO drzava VALUES
	(null, 'Slovenija'),
    (null, 'Avstrija'),
    (null, 'Hrvaška'),
    (null, 'Madžarska'),
    (null, 'Rusija');


INSERT INTO posta VALUES
	(1292, 'Ig'),
    (1000, 'Ljubljana'),
    (1355, 'Polhov Gradec'),
    (2000, 'Maribor'),
    (5000, 'Nova Gorica');

INSERT INTO obcina VALUES
	(null, 'Ig'),
    (null, 'Ljubljana'),
    (null, 'Polhov Gradec'),
    (null, 'Maribor'),
    (null, 'Nova Gorica');

INSERT INTO kraj VALUES
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

INSERT INTO naslov VALUES
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

INSERT INTO tipZavarovanje (naziv) VALUES
	('Osnovno'),
    ('Dopolnilno'),
    ('V tujini');
    
INSERT INTO zavarovalnica VALUES
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

INSERT INTO zavarovanje VALUES
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

INSERT INTO oseba VALUES 
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

INSERT INTO tipBivanje (tip) VALUES
	('Stalno'),
    ('Zacasno');
    
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
    
INSERT INTO zdravljenje VALUES
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
    
INSERT INTO tipBolezen VALUES
	(null, 'Artereoskleroza', 'ASL'),
    (null, 'Srčna Kap', 'Heart Stroke'),
    (null, 'Pljučnica', 'Pneumonia'),
    (null, 'Sladkorna bolezen', 'Diabetus'),
    (null, 'Tuberkuloza', 'Tuberculosis');
    
INSERT INTO bolezen VALUES
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
    
INSERT INTO tipOsebje VALUES
	(null, 'Zdravnik'),
    (null, 'Medicinska sestra'),
    (null, 'Bolničar'),
    (null, 'Kuhar'),
    (null, 'Snažilka');
    
INSERT INTO specializacija VALUES
	(null, 'Anesteziolog'),
    (null, 'Kardiolog'),
    (null, 'Internist'),
    (null, 'Kirurg'),
    (null, 'Psihiatrija');

INSERT INTO oddelek VALUES 
	(null, 'Anesteziologija', 'Pritličje', 1, 1),
    (null, 'Kirurgija', 'Pritličje', 2, 1),
    (null, 'Psihiatrija', 'Pritličje', 3, 1),
    (null, 'Ambulanta', 'Pritličje', 4, 1),
    (null, 'Intenzivna nega', 'Pritličje', 5, 1),
    (null, 'Paradontologija', 'Pritličje', 6, 1),
    (null, 'Zobozdravstvena ambulanta', 'Pritličje', 7, 1),
    (null, 'Nevrokirurgija', 'Pritličje', 8, 1),
    (null, 'Maksiofacialna', 'Pritličje', 9, 1),
    (null, 'Oddelek za plastično kirurgijo I', 'Pritličje', 10, 1);

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
    
    
INSERT INTO storitev VALUES 
	(null, 'Pregled srca z ultrazvokom'),
    (null, 'Izdelava mavca'),
    (null, 'Operacija srca'),
    (null, 'Operacija kolena'),
    (null, 'Odstranitev ledvičnih kamnov');
    
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
    
INSERT INTO postelja VALUES
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
    (NULL, 1);
    
INSERT INTO zdravljenje_postelja VALUES
	(NULL, '2018-11-11 12:00:00', null, 1, 1),
    (NULL, '2018-11-11 12:00:00', null, 2, 2),
    (NULL, '2018-11-11 12:00:00', null, 3, 3),
    (NULL, '2018-11-11 12:00:00', null, 4, 4),
    (NULL, '2018-11-11 12:00:00', null, 5, 5),
    (NULL, '2018-11-11 12:00:00', null, 6, 6),
    (NULL, '2018-11-11 12:00:00', null, 7, 7),
    (NULL, '2018-11-11 12:00:00', null, 8, 8),
    (NULL, '2018-11-11 12:00:00', null, 9, 9),
    (NULL, '2018-11-11 12:00:00', null, 10, 10);
    
### KONEC DODAJANJA PODATKOV ###bivanje

INSERT INTO oddelek VALUES (null, 'Interna', '2', 2, 1);
INSERT INTO postelja VALUES 
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
                        
INSERT INTO zdravljenje_postelja VALUES
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
