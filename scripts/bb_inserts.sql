INSERT into bb.lab values (01, 1, 'EAST');
INSERT into bb.lab values (02, 1, 'WEST');
INSERT into bb.lab values (03, 1, 'NORTHEAST');
INSERT into bb.lab values (04, 1, 'NORTHWEST');
INSERT into bb.lab values (05, 1, 'SOUTHEAST');
INSERT into bb.lab values (06, 1, 'SOUTHWEST');
INSERT into bb.lab values (07, 1, 'CENTER');
INSERT into bb.lab values (08, 0, 'LAUNDRY');
INSERT into bb.lab values (09, 1, 'MEXICO');
INSERT into bb.lab values (10, 0, 'HIDDEN');

INSERT INTO bb.cook VALUES (01, 'WALTER WHITE', '3828 Piermont Dr, Albuquerque, NM', 30, 96, 01);
INSERT INTO bb.cook VALUES (02, 'JESSIE PINKMAN', '325 Terrace St SE, Albuquerque, NM 87106', 60, 75, 01);
INSERT INTO bb.cook VALUES (03, 'Todd Alquist', '317 Palomas Drive NE, Albuquerque', 0, 65, 03);
INSERT INTO bb.cook VALUES (04, 'Gale Boetticher', '6353 Juan Tabo Boulevard', 100, 85, 01);

INSERT INTO bb.hardware VALUES (134987, 08, 1);
INSERT INTO bb.hardware VALUES (8396, 08, 1);
INSERT INTO bb.hardware VALUES (9780329, 08, 0);
INSERT INTO bb.hardware VALUES (11927, 01, 0);
INSERT INTO bb.hardware VALUES (999276, 09, 0);
INSERT INTO bb.hardware VALUES (241334780, 08, 0);
INSERT INTO bb.hardware VALUES (90437524, 01, 0);
INSERT INTO bb.hardware VALUES (134560789, 10, 0);

INSERT INTO bb.product VALUES (09, 71, 1);
INSERT INTO bb.product VALUES (08, 70, 2);
INSERT INTO bb.product VALUES (09, 69, 3);
INSERT INTO bb.product VALUES (08, 70, 4);
INSERT INTO bb.product VALUES (01, 70, 5);
INSERT INTO bb.product VALUES (01, 70, 6);

INSERT INTO bb.depot VALUES (1, '1617 Candelaria Rd NE', 1, 500);
INSERT INTO bb.depot VALUES (2, '1617 Candelaria Rd NE', 2, 500);
INSERT INTO bb.depot VALUES (3, '725 Electric Ave SE, Albuquerque, NM 87105', 3, 450);
INSERT INTO bb.depot VALUES (4, '1617 Candelaria Rd NE', 4, 500);
INSERT INTO bb.depot VALUES (5, '725 Electric Ave SE, Albuquerque, NM 87105', 5, 450);

INSERT INTO bb.dealer VALUES (1, 'Andrea Cantillo', 1);
INSERT INTO bb.dealer VALUES (2, 'JESSE PINKMAN', 2);
INSERT INTO bb.dealer VALUES (3, 'Andrea Cantillo', 3);
INSERT INTO bb.dealer VALUES (4, 'Badger', 4);
INSERT INTO bb.dealer VALUES (5, 'Skinny Pitt', 5);

INSERT INTO bb.customer VALUES (01, 90, 1);
INSERT INTO bb.customer VALUES (02, 87, 2);
INSERT INTO bb.customer VALUES (03, 51, 3);
INSERT INTO bb.customer VALUES (04, 99, 4);
INSERT INTO bb.customer VALUES (05, 98, 5);

INSERT INTO bb.deal VALUES (1, '2018-05-21', 1, 'mini mart', 01, 2300);
INSERT INTO bb.deal VALUES (2, '2018-05-21', 2, 'gun shop', 02, 5000);
INSERT INTO bb.deal VALUES (3, '2018-05-21', 3, 'mini mart', 03, 10500);
INSERT INTO bb.deal VALUES (4, '2018-05-21', 4, 'parking lot', 04, 360);
INSERT INTO bb.deal VALUES (5, '2018-05-21', 5, 'crosswalk', 05, 940);
