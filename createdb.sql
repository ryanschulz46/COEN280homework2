-- Ryan Schulz
-- Assignment2
-- COEN 280 Spring 2019


CREATE TABLE IMDB_USER
(
 IMDB_ID VARCHAR(5) PRIMARY KEY,
 NAME VARCHAR(100) NOT NULL,
 EMAIL VARCHAR(100) NOT NULL,
 BIRTH_DATE DATE NOT NULL,
 BIRTH_PLACE VARCHAR(50)NOT NULL,
 GENDER VARCHAR(1)NOT NULL
);

CREATE TABLE PERSON
(
 PID VARCHAR(5) PRIMARY KEY,
 NAME VARCHAR(100) NOT NULL,
 BIRTH_DATE DATE NOT NULL,
 GENDER VARCHAR(1) NOT NULL,
 BIRTH_PLACE VARCHAR(50) NOT NULL,
 JOB_TYPE VARCHAR(20) NOT NULL
);

CREATE TABLE MOVIE
(MID VARCHAR(5) PRIMARY KEY,
 NAME VARCHAR(100) NOT NULL,
 DIRECTOR_ID VARCHAR (5) NOT NULL,
 YEAR INTEGER NOT NULL
);

CREATE TABLE GENRE
(
 MID VARCHAR(5),
 GENRE_TYPE VARCHAR(20) NOT NULL,
 PRIMARY KEY (MID,GENRE_TYPE),
 FOREIGN KEY (MID) REFERENCES MOVIE(MID) ON DELETE CASCADE
);

CREATE TABLE DIRECTOR
(
 PID VARCHAR(5) NOT NULL,
 MID VARCHAR(5) NOT NULL,
 PRIMARY KEY (MID,PID),
 FOREIGN KEY (MID) REFERENCES MOVIE(MID) ON DELETE CASCADE,
 FOREIGN KEY (PID) REFERENCES PERSON(PID) ON DELETE CASCADE
);

CREATE TABLE ACTOR
(
 PID VARCHAR(5) NOT NULL,
 MID VARCHAR(5) NOT NULL,
 PRIMARY KEY(MID, PID),
 FOREIGN KEY (MID) REFERENCES MOVIE(MID) ON DELETE CASCADE,
 FOREIGN KEY (PID) REFERENCES PERSON(PID) ON DELETE CASCADE
);

CREATE TABLE ROLES
(MID VARCHAR(5) NOT NULL,
 PID VARCHAR(5) NOT NULL,
 ROLE VARCHAR(25) NOT NULL,
 PRIMARY KEY(MID,PID,ROLE),
 FOREIGN KEY (MID) REFERENCES MOVIE(MID) ON DELETE CASCADE,
 FOREIGN KEY (PID) REFERENCES PERSON(PID) ON DELETE CASCADE
);

CREATE TABLE RATING
(
 MID VARCHAR(5) NOT NULL,
 IMDB_ID VARCHAR(5) NOT NULL,
 RATING VARCHAR(5) NOT NULL,
 DATE_DAY VARCHAR(5) NOT NULL,
 DATE_MON VARCHAR(5) NOT NULL,
 DATE_YR VARCHAR(5) NOT NULL,
 TIME_HR VARCHAR(5) NOT NULL,
 TIME_MIN VARCHAR(5) NOT NULL,
 TIME_SEC VARCHAR(5) NOT NULL,
 PRIMARY KEY (IMDB_ID, MID),
 FOREIGN KEY (IMDB_ID) REFERENCES IMDB_USER(IMDB_ID) ON DELETE CASCADE,
 FOREIGN KEY (MID) REFERENCES MOVIE(MID) ON DELETE CASCADE
);                                            

INSERT INTO MOVIE VALUES('M1','Scarface','P1',1988);
INSERT INTO MOVIE VALUES('M2','Scent of a women','P2',1995);
INSERT INTO MOVIE VALUES('M3','My big fat greek wedding','P4',2000);
INSERT INTO MOVIE VALUES('M4','Star Wars: The Force Awakens','P21',2015);
INSERT INTO MOVIE VALUES('M5','Mr. and Mrs Smith','P1',1965);
INSERT INTO MOVIE VALUES('M6','Star Wars: Episode III - Revenge of the Sith ','P21',2013);
INSERT INTO MOVIE VALUES('M7','Barely Lethal','P4',2014);
INSERT INTO MOVIE VALUES('M8','The Man with one red shoe','P1',1984);
INSERT INTO MOVIE VALUES('M9','The Polar Express','P2',2010);
INSERT INTO MOVIE VALUES('M10','Her','P2',2013);
INSERT INTO MOVIE VALUES('M11','Star Wars: Episode I - The Phantom Menace','P21',1999);
INSERT INTO MOVIE VALUES('M12','The Da Vinci Code','P4',2005);
INSERT INTO MOVIE VALUES('M13','The God Father part II','P1',1975);
INSERT INTO MOVIE VALUES('M15','Angels and Daemons','P2',2009);
INSERT INTO MOVIE VALUES('M16','The Island','P4',2010);
INSERT INTO MOVIE VALUES('M17','Moonlight','P30',2016);
INSERT INTO MOVIE VALUES('M18','Indiana Jones and the Kingdom of the Crystal Skull','P32',2008);
INSERT INTO MOVIE VALUES('M19','Indiana Jones and the Last Crusade','P32',1989);
INSERT INTO MOVIE VALUES('M20','Indiana Jones and the Temple of Doom','P32',1984);
INSERT INTO MOVIE VALUES('M21','Star Wars: Episode II - Attack of the Clones','P21',2002);
INSERT INTO MOVIE VALUES('M22','The Terminal ','P32',2004);
INSERT INTO MOVIE VALUES('M23','Catch me if you can ','P32',2002);
INSERT INTO MOVIE VALUES('M24','Minority Report ','P32',2002);
INSERT INTO MOVIE VALUES('M25','Saving Private Ryan','P32',1998);
INSERT INTO MOVIE VALUES('M26','Schindlers List','P32',1993);
INSERT INTO MOVIE VALUES('M27','Get To Know Your Rabbit','P1',1972);
INSERT INTO MOVIE VALUES('M28','Lights Out ','P1',2016);
INSERT INTO MOVIE VALUES('M29','Lucy','P4',2014);
INSERT INTO MOVIE VALUES('M30','Arthur and the Invisibles ','P4',2006);
INSERT INTO MOVIE VALUES('M31','The Big Blue','P4',1988);
INSERT INTO MOVIE VALUES('M32','Wise Guys','P1',1986);
INSERT INTO MOVIE VALUES('M33','The Black Dahlia','P1',2006);
INSERT INTO MOVIE VALUES('M34','Mission: Impossible','P1',1996);
INSERT INTO MOVIE VALUES('M35','Arthur and the Invisibles: The Making of the Years Greatest Adventure','P4',2007);
INSERT INTO MOVIE VALUES('M36','Arthur 3: The War of the Two Worlds','P4',2010);
INSERT INTO MOVIE VALUES('M37','Arthur and the Revenge of Maltazard ','P4',2009);
INSERT INTO MOVIE VALUES('M38','The adventures of Tintin','P32',2011);
INSERT INTO MOVIE VALUES('M39','War Horse','P32',2011);
INSERT INTO MOVIE VALUES('M40','Lincoln','P32',2012);

INSERT INTO PERSON VALUES('P1','Brian de forma',TO_DATE('1940-09-11','yyyy-mm-dd'),'M','New York','Director');
INSERT INTO PERSON VALUES('P2','Martin Brest',TO_DATE('1951-08-08','yyyy-mm-dd'),'M','San Jose','Director');
INSERT INTO PERSON VALUES('P3','Scarlett Johanson',TO_DATE('1984-11-22','yyyy-mm-dd'),'F','Austin','Actor');
INSERT INTO PERSON VALUES('P4','Luc Besson',TO_DATE('1975-05-30','yyyy-mm-dd'),'F','Paris','Director');
INSERT INTO PERSON VALUES('P5','Morgan Freeman',TO_DATE('1953-06-05','yyyy-mm-dd'),'M','Canberra','Actor');
INSERT INTO PERSON VALUES('P6','Al Pacino',TO_DATE('1956-11-12','yyyy-mm-dd'),'M','Portland','Actor');
INSERT INTO PERSON VALUES('P7','Angelina Jolie',TO_DATE('1970-03-03','yyyy-mm-dd'),'F','Seattle','Actor');
INSERT INTO PERSON VALUES('P8','Brad Pitt',TO_DATE('1975-04-04','yyyy-mm-dd'),'M','London','Actor');
INSERT INTO PERSON VALUES('P9','Tom Hanks',TO_DATE('1964-05-19','yyyy-mm-dd'),'M','Perth','Actor');
INSERT INTO PERSON VALUES('P10','Jessica Alba',TO_DATE('1983-08-07','yyyy-mm-dd'),'F','Seoul','Actor');
INSERT INTO PERSON VALUES('P11','Catherine Jones',TO_DATE('1969-09-29','yyyy-mm-dd'),'F','Swansea','Actor');
INSERT INTO PERSON VALUES('P12','Alex Parish',TO_DATE('1977-07-09','yyyy-mm-dd'),'F','San Jose','Actor');
INSERT INTO PERSON VALUES('P13','Leonardo DiCaprio',TO_DATE('1974-11-11','yyyy-mm-dd'),'M','Los Angeles','Actor');
INSERT INTO PERSON VALUES('P14','Tom Cruise',TO_DATE('1962-07-03','yyyy-mm-dd'),'M','New York','Actor');
INSERT INTO PERSON VALUES('P15','Harrison Ford',TO_DATE('1957-09-11','yyyy-mm-dd'),'M','Canberra','Actor');
INSERT INTO PERSON VALUES('P16','Julia Roberts',TO_DATE('1967-01-01','yyyy-mm-dd'),'F','Portland','Actor');
INSERT INTO PERSON VALUES('P17','Matt Damon',TO_DATE('1971-01-07','yyyy-mm-dd'),'M','Seattle','Actor');
INSERT INTO PERSON VALUES('P18','Jennifer Lawrence',TO_DATE('1962-02-02','yyyy-mm-dd'),'F','London','Actor');
INSERT INTO PERSON VALUES('P19','George Clooney',TO_DATE('1965-03-03','yyyy-mm-dd'),'M','Perth','Actor');
INSERT INTO PERSON VALUES('P20','Samantha Morton',TO_DATE('1977-05-03','yyyy-mm-dd'),'F','Notingham','Actor');
INSERT INTO PERSON VALUES('P21','George Lucas',TO_DATE('1968-05-14','yyyy-mm-dd'),'M','Modesto','Director');
INSERT INTO PERSON VALUES('P22','Ewan McGregor',TO_DATE('1968-03-31','yyyy-mm-dd'),'M','Perth','Actor');
INSERT INTO PERSON VALUES('P23','Hayden Christensen',TO_DATE('1981-04-19','yyyy-mm-dd'),'M','Vancouver','Actor');
INSERT INTO PERSON VALUES('P24','Liam Neeson',TO_DATE('1968-06-07','yyyy-mm-dd'),'M','Antrim','Actor');
INSERT INTO PERSON VALUES('P25','Natalie Portman',TO_DATE('1968-05-14','yyyy-mm-dd'),'F','Jerusalem','Actor');
INSERT INTO PERSON VALUES('P26','J.J. Abrams',TO_DATE('1966-06-27','yyyy-mm-dd'),'M','New York','Director');
INSERT INTO PERSON VALUES('P27','Daisy Ridley',TO_DATE('1992-04-10','yyyy-mm-dd'),'F','London','Actor');
INSERT INTO PERSON VALUES('P28','John Boyega',TO_DATE('1992-03-17','yyyy-mm-dd'),'M','London','Actor');
INSERT INTO PERSON VALUES('P29','Oscar Isaac',TO_DATE('1979-03-09','yyyy-mm-dd'),'M','Guatemala','Actor');
INSERT INTO PERSON VALUES('P30','Barry Jenkins',TO_DATE('1979-11-19','yyyy-mm-dd'),'M','Miami','Director');
INSERT INTO PERSON VALUES('P31','Mahershala Ali',TO_DATE('1974-02-16','yyyy-mm-dd'),'M','Oakland','Actor');
INSERT INTO PERSON VALUES('P32','Steven Spielberg',TO_DATE('1946-12-18','yyyy-mm-dd'),'M','Cincinnati','Director');
INSERT INTO PERSON VALUES('P33','Cate Blanchett',TO_DATE('1969-05-14','yyyy-mm-dd'),'F','Victoria','Actor');
INSERT INTO PERSON VALUES('P34','Harrison Ford',TO_DATE('1942-07-13','yyyy-mm-dd'),'M','Chicago','Actor');
INSERT INTO PERSON VALUES('P35','Sean Connery',TO_DATE('1930-08-25','yyyy-mm-dd'),'M','Edinburg','Actor');
INSERT INTO PERSON VALUES('P36','Kate Capshaw',TO_DATE('1953-11-03','yyyy-mm-dd'),'F','Fort Worth','Actor');
INSERT INTO PERSON VALUES('P37','Ralph Fiennes',TO_DATE('1962-12-22','yyyy-mm-dd'),'M','Ipswich','Actor');
INSERT INTO PERSON VALUES('P38','Teresa Palmer',TO_DATE('1986-02-26','yyyy-mm-dd'),'F','Adlaide','Actor');
INSERT INTO PERSON VALUES('P39','Gabriel Bateman',TO_DATE('2004-09-10','yyyy-mm-dd'),'F','Turlock','Actor');
INSERT INTO PERSON VALUES('P40','Daniel Day-Lewis',TO_DATE('1957-04-19','yyyy-mm-dd'),'M','London','Actor');
INSERT INTO PERSON VALUES('P41','Jeremy Irvine',TO_DATE('1990-04-19','yyyy-mm-dd'),'M','Cambridge','Actor');
INSERT INTO PERSON VALUES('P42','Emily Watson',TO_DATE('1967-01-14','yyyy-mm-dd'),'F','London','Actor');
INSERT INTO PERSON VALUES('P43','Jamie Bell',TO_DATE('1986-03-14','yyyy-mm-dd'),'M','Billingam','Actor');
INSERT INTO PERSON VALUES('P44','Andy Serkis',TO_DATE('1964-04-20','yyyy-mm-dd'),'M','London','Actor');
INSERT INTO PERSON VALUES('P45','Roy Scheider',TO_DATE('1932-11-10','yyyy-mm-dd'),'M','Little Rock','Actor');
INSERT INTO PERSON VALUES('P46','Robert Shaw',TO_DATE('1927-07-09','yyyy-mm-dd'),'M','Mayo','Actor');
INSERT INTO PERSON VALUES('P47','Tom Smothers',TO_DATE('1937-02-02','yyyy-mm-dd'),'M','New York','Actor');
INSERT INTO PERSON VALUES('P48','John Astin',TO_DATE('1930-03-30','yyyy-mm-dd'),'M','Baltimore','Actor');
INSERT INTO PERSON VALUES('P49','Danny DeVito',TO_DATE('1944-11-17','yyyy-mm-dd'),'M','New Jersey','Actor');
INSERT INTO PERSON VALUES('P50','Joe Piscopo',TO_DATE('1951-06-17','yyyy-mm-dd'),'M','New Jersey','Actor');
INSERT INTO PERSON VALUES('P51','Mia Farrow',TO_DATE('1942-02-09','yyyy-mm-dd'),'F','Los Angeles','Actor');
INSERT INTO PERSON VALUES('P52','Freddie Highmore',TO_DATE('1992-02-14','yyyy-mm-dd'),'M','London','Actor');

INSERT INTO IMDB_USER VALUES('ID1','John Smith','john@yahoo.com',TO_DATE('1995-10-05','yyyy-mm-dd'),'FL','M');
INSERT INTO IMDB_USER VALUES('ID2','Juan Carlos','juan@gmail.com',TO_DATE('1995-10-05','yyyy-mm-dd'),'AK','M');
INSERT INTO IMDB_USER VALUES('ID3','Jane Chapel','Jane@gmail.com',TO_DATE('1995-10-05','yyyy-mm-dd'),'IL','F');
INSERT INTO IMDB_USER VALUES('ID4','Aditya Awasthi','adi@yahoo.com',TO_DATE('1995-10-05','yyyy-mm-dd'),'CA','M');
INSERT INTO IMDB_USER VALUES('ID5','James Williams','james@hotmail.com',TO_DATE('1995-10-05','yyyy-mm-dd'),'NY','M');
INSERT INTO IMDB_USER VALUES('ID6','Mike Brown','mike@yahoo.com',TO_DATE('1995-10-05','yyyy-mm-dd'),'NC','M');
INSERT INTO IMDB_USER VALUES('ID7','Bob Jones','bob@yahoo.com',TO_DATE('1995-10-05','yyyy-mm-dd'),'NY ','M');
INSERT INTO IMDB_USER VALUES('ID8','Wei Zhang','wei@gmail.com',TO_DATE('1995-10-05','yyyy-mm-dd'),'NV','F');
INSERT INTO IMDB_USER VALUES('ID9','Mark Davis','mark@gmail.com',TO_DATE('1995-10-05','yyyy-mm-dd'),'CA','M');
INSERT INTO IMDB_USER VALUES('ID10','Daniel Garcia','daniel@yahoo.com',TO_DATE('1995-10-05','yyyy-mm-dd'),'NJ','M');
INSERT INTO IMDB_USER VALUES('ID11','Maria Rodriguez','maria@hotmail.com',TO_DATE('1995-10-05','yyyy-mm-dd'),'CA','F');
INSERT INTO IMDB_USER VALUES('ID12','Freya Wilson','freya@yahoo.com',TO_DATE('1995-10-05','yyyy-mm-dd'),'NJ','F');

INSERT INTO RATING VALUES('M1','ID1','1','29','10','2006','23','17','16');
INSERT INTO RATING VALUES('M2','ID1','4.5','29','10','2006','23','23','44');
INSERT INTO RATING VALUES('M3','ID1','4','29','10','2006','23','30','8');
INSERT INTO RATING VALUES('M4','ID1','2','29','10','2006','23','16','52');
INSERT INTO RATING VALUES('M5','ID1','4','29','10','2006','23','29','30');
INSERT INTO RATING VALUES('M6','ID1','4.5','29','10','2006','23','25','15');
INSERT INTO RATING VALUES('M7','ID1','3.5','29','10','2006','23','17','37');
INSERT INTO RATING VALUES('M8','ID1','5','29','10','2006','23','24','49');
INSERT INTO RATING VALUES('M9','ID1','3.5','29','10','2006','23','17','0');
INSERT INTO RATING VALUES('M10','ID1','2','29','10','2006','23','16','42');
INSERT INTO RATING VALUES('M11','ID1','4','29','10','2006','23','28','21');
INSERT INTO RATING VALUES('M12','ID1','3','29','10','2006','23','17','5');
INSERT INTO RATING VALUES('M13','ID1','4.5','29','10','2006','23','17','49');
INSERT INTO RATING VALUES('M15','ID1','0.5','29','10','2006','23','17','8');
INSERT INTO RATING VALUES('M16','ID1','4.5','29','10','2006','23','26','17');
INSERT INTO RATING VALUES('M17','ID1','4','29','10','2006','23','24','45');
INSERT INTO RATING VALUES('M18','ID1','3.5','29','10','2006','23','28','52');
INSERT INTO RATING VALUES('M19','ID1','4.5','29','10','2006','23','28','56');
INSERT INTO RATING VALUES('M20','ID1','4','29','10','2006','23','30','5');
INSERT INTO RATING VALUES('M21','ID1','2.5','29','10','2006','23','16','56');
INSERT INTO RATING VALUES('M1','ID2','4','29','10','2006','23','25','11');
INSERT INTO RATING VALUES('M2','ID2','4','29','10','2006','23','17','20');
INSERT INTO RATING VALUES('M3','ID2','4','29','10','2006','23','17','46');
INSERT INTO RATING VALUES('M4','ID2','4.5','29','10','2006','23','24','1');
INSERT INTO RATING VALUES('M5','ID2','2.5','29','10','2006','23','26','3');
INSERT INTO RATING VALUES('M6','ID2','2','29','10','2006','23','16','39');
INSERT INTO RATING VALUES('M7','ID2','1.5','29','10','2006','23','17','33');
INSERT INTO RATING VALUES('M8','ID2','4','29','10','2006','23','29','25');
INSERT INTO RATING VALUES('M9','ID2','4','29','10','2006','23','29','35');
INSERT INTO RATING VALUES('M10','ID2','4.5','29','10','2006','23','30','50');
INSERT INTO RATING VALUES('M11','ID2','3','29','10','2006','23','17','56');
INSERT INTO RATING VALUES('M12','ID2','3','29','10','2006','23','22','26');
INSERT INTO RATING VALUES('M13','ID2','4.5','29','10','2006','23','17','52');
INSERT INTO RATING VALUES('M15','ID3','3.5','29','10','2006','23','24','54');
INSERT INTO RATING VALUES('M16','ID3','4.5','29','10','2006','23','30','12');
INSERT INTO RATING VALUES('M17','ID3','1.5','29','10','2006','23','26','8');
INSERT INTO RATING VALUES('M18','ID3','3','29','10','2006','23','29','16');
INSERT INTO RATING VALUES('M19','ID3','3','29','10','2006','23','22','43');
INSERT INTO RATING VALUES('M20','ID3','3.5','29','10','2006','23','25','24');
INSERT INTO RATING VALUES('M21','ID3','3.5','29','10','2006','23','30','34');
INSERT INTO RATING VALUES('M1','ID3','3','29','10','2006','23','26','11');
INSERT INTO RATING VALUES('M2','ID3','2.5','29','10','2006','23','29','51');
INSERT INTO RATING VALUES('M3','ID3','3.5','29','10','2006','23','30','40');
INSERT INTO RATING VALUES('M4','ID3','4','29','10','2006','23','26','21');
INSERT INTO RATING VALUES('M5','ID3','0.5','29','10','2006','23','21','25');
INSERT INTO RATING VALUES('M6','ID3','4','29','10','2006','23','28','12');
INSERT INTO RATING VALUES('M7','ID3','3.5','29','10','2006','23','25','8');
INSERT INTO RATING VALUES('M8','ID3','4.5','29','10','2006','23','24','15');
INSERT INTO RATING VALUES('M9','ID4','3.5','29','10','2006','23','30','36');
INSERT INTO RATING VALUES('M10','ID4','4.5','29','10','2006','23','25','18');
INSERT INTO RATING VALUES('M11','ID4','5','29','10','2006','23','24','51');
INSERT INTO RATING VALUES('M12','ID5','3','4','12','2005','6','23','16');
INSERT INTO RATING VALUES('M13','ID5','4','4','12','2005','6','22','4');
INSERT INTO RATING VALUES('M15','ID5','5','4','12','2005','6','24','43');
INSERT INTO RATING VALUES('M16','ID5','4','4','12','2005','6','21','8');
INSERT INTO RATING VALUES('M17','ID5','3','19','8','2007','19','7','25');
INSERT INTO RATING VALUES('M18','ID6','3.5','4','12','2005','6','41','48');
INSERT INTO RATING VALUES('M19','ID6','3.5','4','12','2005','6','41','1');
INSERT INTO RATING VALUES('M20','ID6','5','4','12','2005','6','31','48');
INSERT INTO RATING VALUES('M21','ID6','5','19','8','2007','19','10','52');
INSERT INTO RATING VALUES('M22','ID6','3.5','4','12','2005','6','41','22');
INSERT INTO RATING VALUES('M23','ID6','3','9','7','2006','9','6','16');
INSERT INTO RATING VALUES('M24','ID7','4','4','12','2005','6','39','34');
INSERT INTO RATING VALUES('M25','ID7','3','4','12','2005','6','42','31');
INSERT INTO RATING VALUES('M26','ID7','4','9','7','2006','9','6','12');
INSERT INTO RATING VALUES('M27','ID7','5','4','12','2005','6','41','44');
INSERT INTO RATING VALUES('M28','ID7','5','4','12','2005','6','17','15');
INSERT INTO RATING VALUES('M29','ID7','4','4','12','2005','6','6','20');
INSERT INTO RATING VALUES('M30','ID7','1','19','8','2007','19','7','18');
INSERT INTO RATING VALUES('M31','ID7','5','4','12','2005','6','39','39');
INSERT INTO RATING VALUES('M32','ID7','5','4','12','2005','6','5','43');
INSERT INTO RATING VALUES('M33','ID8','5','30','8','2007','4','28','31');
INSERT INTO RATING VALUES('M34','ID8','5','19','8','2007','19','10','32');
INSERT INTO RATING VALUES('M35','ID8','5','19','8','2007','19','10','18');
INSERT INTO RATING VALUES('M36','ID8','3.5','4','12','2005','6','41','32');
INSERT INTO RATING VALUES('M37','ID8','5','4','12','2005','6','23','8');
INSERT INTO RATING VALUES('M38','ID8','5','4','12','2005','6','40','56');
INSERT INTO RATING VALUES('M39','ID8','4','4','12','2005','6','42','23');
INSERT INTO RATING VALUES('M40','ID8','5','4','12','2005','6','18','13');
INSERT INTO RATING VALUES('M12','ID8','5','4','12','2005','6','38','34');
INSERT INTO RATING VALUES('M13','ID9','3','4','12','2005','6','6','51');
INSERT INTO RATING VALUES('M15','ID9','3.5','4','12','2005','6','31','31');
INSERT INTO RATING VALUES('M16','ID9','5','9','7','2006','9','5','53');
INSERT INTO RATING VALUES('M17','ID9','0.5','4','12','2005','6','6','37');
INSERT INTO RATING VALUES('M18','ID9','4','4','12','2005','6','27','19');
INSERT INTO RATING VALUES('M19','ID9','4','4','12','2005','6','17','48');
INSERT INTO RATING VALUES('M20','ID9','4','4','12','2005','6','40','36');
INSERT INTO RATING VALUES('M21','ID9','3','4','12','2005','6','6','9');
INSERT INTO RATING VALUES('M22','ID9','5','9','7','2006','9','5','50');
INSERT INTO RATING VALUES('M23','ID9','5','4','12','2005','6','5','49');
INSERT INTO RATING VALUES('M24','ID9','4','4','12','2005','6','28','30');
INSERT INTO RATING VALUES('M25','ID10','5','4','12','2005','6','25','10');
INSERT INTO RATING VALUES('M26','ID10','0.5','4','12','2005','6','40','5');
INSERT INTO RATING VALUES('M27','ID10','5','4','12','2005','6','19','2');
INSERT INTO RATING VALUES('M28','ID10','3.5','4','12','2005','6','42','58');
INSERT INTO RATING VALUES('M29','ID10','3.5','4','12','2005','6','40','38');
INSERT INTO RATING VALUES('M30','ID10','4','4','12','2005','6','22','20');
INSERT INTO RATING VALUES('M31','ID10','5','19','8','2007','19','2','15');
INSERT INTO RATING VALUES('M32','ID10','4','4','12','2005','6','39','11');
INSERT INTO RATING VALUES('M33','ID10','5','19','8','2007','19','4','30');
INSERT INTO RATING VALUES('M34','ID10','2.5','4','12','2005','6','17','27');
INSERT INTO RATING VALUES('M35','ID10','4','4','12','2005','6','31','25');
INSERT INTO RATING VALUES('M36','ID10','5','4','12','2005','6','25','58');
INSERT INTO RATING VALUES('M37','ID10','3','4','12','2005','6','43','4');
INSERT INTO RATING VALUES('M38','ID10','3.5','4','12','2005','6','31','50');
INSERT INTO RATING VALUES('M39','ID10','3.5','4','12','2005','6','27','4');
INSERT INTO RATING VALUES('M40','ID10','2','9','7','2006','9','5','47');
INSERT INTO RATING VALUES('M12','ID10','5','4','12','2005','6','26','53');
INSERT INTO RATING VALUES('M13','ID10','5','4','12','2005','6','23','40');
INSERT INTO RATING VALUES('M15','ID10','3.5','4','12','2005','6','41','53');
INSERT INTO RATING VALUES('M16','ID10','5','4','12','2005','6','25','15');
INSERT INTO RATING VALUES('M17','ID10','5','4','12','2005','6','19','18');
INSERT INTO RATING VALUES('M18','ID10','1','9','7','2006','9','5','41');
INSERT INTO RATING VALUES('M19','ID10','5','4','12','2005','6','29','8');
INSERT INTO RATING VALUES('M20','ID10','5','19','8','2007','19','6','20');
INSERT INTO RATING VALUES('M21','ID11','5','9','7','2006','9','9','38');
INSERT INTO RATING VALUES('M22','ID11','5','4','12','2005','6','24','34');
INSERT INTO RATING VALUES('M23','ID11','4','4','12','2005','6','22','2');
INSERT INTO RATING VALUES('M24','ID11','5','9','7','2006','9','5','34');
INSERT INTO RATING VALUES('M25','ID11','4','4','12','2005','6','16','25');
INSERT INTO RATING VALUES('M40','ID12','1','4','12','2005','6','20','21');

INSERT INTO ROLES VALUES('M1','P5','Jessica');
INSERT INTO ROLES VALUES('M1','P6','robert');
INSERT INTO ROLES VALUES('M2','P5','John');
INSERT INTO ROLES VALUES('M2','P6','Mark');
INSERT INTO ROLES VALUES('M3','P9','Alex');
INSERT INTO ROLES VALUES('M3','P7','Julie');
INSERT INTO ROLES VALUES('M4','P27','Rey');
INSERT INTO ROLES VALUES('M4','P28','Finn ');
INSERT INTO ROLES VALUES('M4','P29','Poe');
INSERT INTO ROLES VALUES('M5','P7','Jennifer');
INSERT INTO ROLES VALUES('M5','P8','Tom');
INSERT INTO ROLES VALUES('M5','P5','Milo');
INSERT INTO ROLES VALUES('M6','P23','Anakin Skywalker');
INSERT INTO ROLES VALUES('M6','P25','Padme');
INSERT INTO ROLES VALUES('M6','P22','Obi-Wan Kenobi');
INSERT INTO ROLES VALUES('M7','P10','Jane');
INSERT INTO ROLES VALUES('M7','P5','Brad');
INSERT INTO ROLES VALUES('M8','P9','Lucas');
INSERT INTO ROLES VALUES('M8','P10','Juanita');
INSERT INTO ROLES VALUES('M9','P9','Clayne');
INSERT INTO ROLES VALUES('M9','P9','Jane');
INSERT INTO ROLES VALUES('M9','P9','Brad');
INSERT INTO ROLES VALUES('M9','P9','Lucas');
INSERT INTO ROLES VALUES('M9','P9','Bradley');
INSERT INTO ROLES VALUES('M9','P9','Justin');
INSERT INTO ROLES VALUES('M9','P17','Martin');
INSERT INTO ROLES VALUES('M9','P19','Mike');
INSERT INTO ROLES VALUES('M10','P3','Travis');
INSERT INTO ROLES VALUES('M10','P5','Alexander');
INSERT INTO ROLES VALUES('M10','P6','Justin');
INSERT INTO ROLES VALUES('M11','P22','Obi-Wan Kenobi');
INSERT INTO ROLES VALUES('M11','P24','Qui-Gon Jinn');
INSERT INTO ROLES VALUES('M11','P25','Padme');
INSERT INTO ROLES VALUES('M12','P9','Gatek');
INSERT INTO ROLES VALUES('M12','P10','Rose');
INSERT INTO ROLES VALUES('M12','P3','maria');
INSERT INTO ROLES VALUES('M13','P5','Travis');
INSERT INTO ROLES VALUES('M13','P6','Alexander');
INSERT INTO ROLES VALUES('M13','P16','Pearl');
INSERT INTO ROLES VALUES('M15','P12','Sofia');
INSERT INTO ROLES VALUES('M15','P18','chrissy');
INSERT INTO ROLES VALUES('M15','P9','Mike');
INSERT INTO ROLES VALUES('M16','P10','Martin');
INSERT INTO ROLES VALUES('M16','P15','Bill');
INSERT INTO ROLES VALUES('M16','P16','Emilia');
INSERT INTO ROLES VALUES('M17','P31','Juan');
INSERT INTO ROLES VALUES('M18','P33','Irina');
INSERT INTO ROLES VALUES('M18','P34','Indiana Jones ');
INSERT INTO ROLES VALUES('M19','P34','Indiana Jones ');
INSERT INTO ROLES VALUES('M19','P35','Henry');
INSERT INTO ROLES VALUES('M20','P34','Indiana Jones ');
INSERT INTO ROLES VALUES('M20','P36','Willie');
INSERT INTO ROLES VALUES('M21','P23','Anakin Skywalker');
INSERT INTO ROLES VALUES('M21','P25','Padme');
INSERT INTO ROLES VALUES('M21','P22','Obi-Wan Kenobi');
INSERT INTO ROLES VALUES('M22','P9','Viktor ');
INSERT INTO ROLES VALUES('M22','P11','Amelia');
INSERT INTO ROLES VALUES('M23','P9','Carl');
INSERT INTO ROLES VALUES('M23','P13','Frank');
INSERT INTO ROLES VALUES('M24','P14','John');
INSERT INTO ROLES VALUES('M24','P20','Agatha');
INSERT INTO ROLES VALUES('M25','P9','Captain Miller');
INSERT INTO ROLES VALUES('M25','P17','Private Ryan');
INSERT INTO ROLES VALUES('M26','P24','Oskar');
INSERT INTO ROLES VALUES('M26','P37','Amon');
INSERT INTO ROLES VALUES('M27','P47','Donald Beeman');
INSERT INTO ROLES VALUES('M27','P48','Mr. Turnbull');
INSERT INTO ROLES VALUES('M28','P38','Rebecca');
INSERT INTO ROLES VALUES('M28','P39','Martin');
INSERT INTO ROLES VALUES('M29','P3','Lucy');
INSERT INTO ROLES VALUES('M29','P5','Professor Norman');
INSERT INTO ROLES VALUES('M30','P51','Granny');
INSERT INTO ROLES VALUES('M30','P52','Arthur');
INSERT INTO ROLES VALUES('M31','P5','Broddy');
INSERT INTO ROLES VALUES('M31','P6','Quint');
INSERT INTO ROLES VALUES('M32','P49','Harry');
INSERT INTO ROLES VALUES('M32','P50','Moe');
INSERT INTO ROLES VALUES('M33','P3','Kay');
INSERT INTO ROLES VALUES('M34','P14','Ethan Hunt');
INSERT INTO ROLES VALUES('M35','P51','Granny');
INSERT INTO ROLES VALUES('M35','P52','Arthur');
INSERT INTO ROLES VALUES('M36','P51','Granny');
INSERT INTO ROLES VALUES('M37','P52','Arthur');
INSERT INTO ROLES VALUES('M38','P44','Captain haddock');
INSERT INTO ROLES VALUES('M38','P43','Tintin');
INSERT INTO ROLES VALUES('M39','P42','Rose');
INSERT INTO ROLES VALUES('M39','P41','Albert');
INSERT INTO ROLES VALUES('M40','P40','Abraham Lincoln');

INSERT INTO GENRE VALUES('M1','Action');
INSERT INTO GENRE VALUES('M2','Action');
INSERT INTO GENRE VALUES('M2','Comedy');
INSERT INTO GENRE VALUES('M3','Comedy');
INSERT INTO GENRE VALUES('M3','Drama');
INSERT INTO GENRE VALUES('M4','Action');
INSERT INTO GENRE VALUES('M5','Comedy');
INSERT INTO GENRE VALUES('M5','Action');
INSERT INTO GENRE VALUES('M6','Action');
INSERT INTO GENRE VALUES('M7','Action');
INSERT INTO GENRE VALUES('M8','Comedy');
INSERT INTO GENRE VALUES('M9','Comedy');
INSERT INTO GENRE VALUES('M10','Drama');
INSERT INTO GENRE VALUES('M11','Action');
INSERT INTO GENRE VALUES('M12','Action');
INSERT INTO GENRE VALUES('M12','Drama');
INSERT INTO GENRE VALUES('M13','Action');
INSERT INTO GENRE VALUES('M13','Drama');
INSERT INTO GENRE VALUES('M15','Action');
INSERT INTO GENRE VALUES('M15','Drama');
INSERT INTO GENRE VALUES('M16','Action');
INSERT INTO GENRE VALUES('M16','Comedy');
INSERT INTO GENRE VALUES('M17','Drama');
INSERT INTO GENRE VALUES('M18','Action');
INSERT INTO GENRE VALUES('M19','Action');
INSERT INTO GENRE VALUES('M20','Action');
INSERT INTO GENRE VALUES('M21','Action');
INSERT INTO GENRE VALUES('M22','Comedy');
INSERT INTO GENRE VALUES('M23','Action');
INSERT INTO GENRE VALUES('M24','Action');
INSERT INTO GENRE VALUES('M25','Action');
INSERT INTO GENRE VALUES('M26','Drama');
INSERT INTO GENRE VALUES('M26','Action');
INSERT INTO GENRE VALUES('M27','Comedy');
INSERT INTO GENRE VALUES('M27','Drama');
INSERT INTO GENRE VALUES('M28','Drama');
INSERT INTO GENRE VALUES('M29','Action');
INSERT INTO GENRE VALUES('M30','Comedy');
INSERT INTO GENRE VALUES('M31','Drama');
INSERT INTO GENRE VALUES('M32','Comedy');
INSERT INTO GENRE VALUES('M33','Drama');
INSERT INTO GENRE VALUES('M34','Action');
INSERT INTO GENRE VALUES('M35','Comedy');
INSERT INTO GENRE VALUES('M36','Comedy');
INSERT INTO GENRE VALUES('M37','Comedy');
INSERT INTO GENRE VALUES('M38','Drama');
INSERT INTO GENRE VALUES('M38','Comedy');
INSERT INTO GENRE VALUES('M39','Drama');
INSERT INTO GENRE VALUES('M39','Comedy');
INSERT INTO GENRE VALUES('M40','Drama');

INSERT INTO DIRECTOR VALUES('P1','M1');
INSERT INTO DIRECTOR VALUES('P2','M2');
INSERT INTO DIRECTOR VALUES('P4','M3');
INSERT INTO DIRECTOR VALUES('P21','M4');
INSERT INTO DIRECTOR VALUES('P1','M5');
INSERT INTO DIRECTOR VALUES('P21','M6');
INSERT INTO DIRECTOR VALUES('P4','M7');
INSERT INTO DIRECTOR VALUES('P1','M8');
INSERT INTO DIRECTOR VALUES('P2','M9');
INSERT INTO DIRECTOR VALUES('P2','M10');
INSERT INTO DIRECTOR VALUES('P21','M11');
INSERT INTO DIRECTOR VALUES('P4','M12');
INSERT INTO DIRECTOR VALUES('P1','M13');
INSERT INTO DIRECTOR VALUES('P2','M15');
INSERT INTO DIRECTOR VALUES('P4','M16');
INSERT INTO DIRECTOR VALUES('P30','M17');
INSERT INTO DIRECTOR VALUES('P32','M18');
INSERT INTO DIRECTOR VALUES('P32','M19');
INSERT INTO DIRECTOR VALUES('P32','M20');
INSERT INTO DIRECTOR VALUES('P21','M21');
INSERT INTO DIRECTOR VALUES('P32','M22');
INSERT INTO DIRECTOR VALUES('P32','M23');
INSERT INTO DIRECTOR VALUES('P32','M24');
INSERT INTO DIRECTOR VALUES('P32','M25');
INSERT INTO DIRECTOR VALUES('P32','M26');
INSERT INTO DIRECTOR VALUES('P1','M27');
INSERT INTO DIRECTOR VALUES('P1','M28');
INSERT INTO DIRECTOR VALUES('P4','M29');
INSERT INTO DIRECTOR VALUES('P4','M30');
INSERT INTO DIRECTOR VALUES('P4','M31');
INSERT INTO DIRECTOR VALUES('P1','M32');
INSERT INTO DIRECTOR VALUES('P1','M33');
INSERT INTO DIRECTOR VALUES('P1','M34');
INSERT INTO DIRECTOR VALUES('P4','M35');
INSERT INTO DIRECTOR VALUES('P4','M36');
INSERT INTO DIRECTOR VALUES('P4','M37');
INSERT INTO DIRECTOR VALUES('P32','M38');
INSERT INTO DIRECTOR VALUES('P32','M39');
INSERT INTO DIRECTOR VALUES('P32','M40');

INSERT INTO ACTOR VALUES('P10','M12');
INSERT INTO ACTOR VALUES('P10','M16');
INSERT INTO ACTOR VALUES('P10','M7');
INSERT INTO ACTOR VALUES('P10','M8');
INSERT INTO ACTOR VALUES('P11','M22');
INSERT INTO ACTOR VALUES('P12','M15');
INSERT INTO ACTOR VALUES('P13','M23');
INSERT INTO ACTOR VALUES('P14','M24');
INSERT INTO ACTOR VALUES('P14','M34');
INSERT INTO ACTOR VALUES('P15','M16');
INSERT INTO ACTOR VALUES('P16','M13');
INSERT INTO ACTOR VALUES('P16','M16');
INSERT INTO ACTOR VALUES('P17','M25');
INSERT INTO ACTOR VALUES('P17','M9');
INSERT INTO ACTOR VALUES('P18','M15');
INSERT INTO ACTOR VALUES('P19','M9');
INSERT INTO ACTOR VALUES('P20','M24');
INSERT INTO ACTOR VALUES('P22','M11');
INSERT INTO ACTOR VALUES('P22','M21');
INSERT INTO ACTOR VALUES('P22','M6');
INSERT INTO ACTOR VALUES('P23','M21');
INSERT INTO ACTOR VALUES('P23','M6');
INSERT INTO ACTOR VALUES('P24','M11');
INSERT INTO ACTOR VALUES('P24','M26');
INSERT INTO ACTOR VALUES('P25','M11');
INSERT INTO ACTOR VALUES('P25','M21');
INSERT INTO ACTOR VALUES('P25','M6');
INSERT INTO ACTOR VALUES('P27','M4');
INSERT INTO ACTOR VALUES('P28','M4');
INSERT INTO ACTOR VALUES('P29','M4');
INSERT INTO ACTOR VALUES('P3','M10');
INSERT INTO ACTOR VALUES('P3','M12');
INSERT INTO ACTOR VALUES('P3','M29');
INSERT INTO ACTOR VALUES('P3','M33');
INSERT INTO ACTOR VALUES('P31','M17');
INSERT INTO ACTOR VALUES('P33','M18');
INSERT INTO ACTOR VALUES('P34','M18');
INSERT INTO ACTOR VALUES('P34','M19');
INSERT INTO ACTOR VALUES('P34','M20');
INSERT INTO ACTOR VALUES('P35','M19');
INSERT INTO ACTOR VALUES('P36','M20');
INSERT INTO ACTOR VALUES('P37','M26');
INSERT INTO ACTOR VALUES('P38','M28');
INSERT INTO ACTOR VALUES('P39','M28');
INSERT INTO ACTOR VALUES('P40','M40');
INSERT INTO ACTOR VALUES('P41','M39');
INSERT INTO ACTOR VALUES('P42','M39');
INSERT INTO ACTOR VALUES('P43','M38');
INSERT INTO ACTOR VALUES('P44','M38');
INSERT INTO ACTOR VALUES('P47','M27');
INSERT INTO ACTOR VALUES('P48','M27');
INSERT INTO ACTOR VALUES('P49','M32');
INSERT INTO ACTOR VALUES('P5','M1');
INSERT INTO ACTOR VALUES('P5','M10');
INSERT INTO ACTOR VALUES('P5','M13');
INSERT INTO ACTOR VALUES('P5','M2');
INSERT INTO ACTOR VALUES('P5','M29');
INSERT INTO ACTOR VALUES('P5','M5');
INSERT INTO ACTOR VALUES('P5','M7');
INSERT INTO ACTOR VALUES('P50','M32');
INSERT INTO ACTOR VALUES('P51','M30');
INSERT INTO ACTOR VALUES('P51','M35');
INSERT INTO ACTOR VALUES('P51','M36');
INSERT INTO ACTOR VALUES('P52','M30');
INSERT INTO ACTOR VALUES('P52','M35');
INSERT INTO ACTOR VALUES('P52','M37');
INSERT INTO ACTOR VALUES('P6','M1');
INSERT INTO ACTOR VALUES('P6','M10');
INSERT INTO ACTOR VALUES('P6','M13');
INSERT INTO ACTOR VALUES('P6','M2');
INSERT INTO ACTOR VALUES('P7','M3');
INSERT INTO ACTOR VALUES('P7','M5');
INSERT INTO ACTOR VALUES('P8','M31');
INSERT INTO ACTOR VALUES('P8','M5');
INSERT INTO ACTOR VALUES('P9','M12');
INSERT INTO ACTOR VALUES('P9','M15');
INSERT INTO ACTOR VALUES('P9','M22');
INSERT INTO ACTOR VALUES('P9','M23');
INSERT INTO ACTOR VALUES('P9','M25');
INSERT INTO ACTOR VALUES('P9','M3');
INSERT INTO ACTOR VALUES('P9','M31');
INSERT INTO ACTOR VALUES('P9','M8');
INSERT INTO ACTOR VALUES('P9','M9');

