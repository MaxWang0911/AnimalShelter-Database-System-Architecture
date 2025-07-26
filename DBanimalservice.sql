/* (Databas, Assignment Part D, Spring 2022 */
/* Zheng Wang  zheng.wang-15@student.uts.edu.au*/
/* script name: DBanimalservice.SQL */
/* purpose: Builds PostgreSQL tables for Animal adoption and foster sysetem database */
/* date: 27/09/1980*/
/* The URL for the website related to this database is https://www.awlnsw.com.au/ */
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Order_T;
DROP TABLE IF EXISTS Order_detail;
DROP TABLE IF EXISTS Animal_for_foster_detail;
--=================================================================================================


CREATE TABLE Customer(
        Cust_ID      NUMERIC(5)    not null,
        Cust_Email   VARCHAR(30),
        Cust_Fname   VARCHAR(15),
        Cust_Lname   VARCHAR(20),
        Cust_Pho     NUMERIC(10),
        Cust_Street  VARCHAR(30),
        Cust_Sub     VARCHAR(20),
        Cust_City    VARCHAR(20),
        Cust_State   VARCHAR(4), 
        Cust_Pocode  NUMERIC(4),
        Cust_DivLN   NUMERIC(8),
        CONSTRAINT Customer_PK PRIMARY KEY (Cust_ID)
);

-- CREATE TABLE Customer_pet(
--         Cust_PetID       NUMERIC(5)    not null,
--         Cust_PetName     VARCHAR(20),
--         Cust_PetSpecie   VARCHAR(20),
--         Cust_PetDesexed  VARCHAR(3), Check (Cust_PetDesexed  in ('Yes', 'No')),
--         Cust_PetVacc     VARCHAR(3), Check (Cust_PetDesexed  in ('Yes', 'No')),
--         Cust_PetFWT      VARCHAR(3), check (Cust_PetDesexed  in ('Yes', 'No')),
--         Cust_ID          NUMERIC(5),
--         CONSTRAINT Cust_PetID_PK PRIMARY KEY(Cust_PetID),
--         CONSTRAINT Cust_PetID_FK FOREIGN KEY(Cust_ID) REFERENCES Customer(Cust_ID)
--);

-- CREATE TABLE Customer_people(
--         Cust_peopleID      NUMERIC(5)    not null,
--         Cust_peopleFname   VARCHAR(15),
--         Cust_peopleLname   VARCHAR(20), 
--         Cust_peopleage     NUMERIC(3),
--         Cust_ID            NUMERIC(5),
--         CONSTRAINT Customer_people_PK PRIMARY KEY( Cust_peopleID),
--         CONSTRAINT Customer_people_FK FOREIGN KEY(Cust_ID) REFERENCES Customer(Cust_ID)
-- );

 CREATE TABLE Branch(
        Bra_Code        VARCHAR(5)    not null,
        Bra_Name        VARCHAR(20),
        Bra_Pho         NUMERIC(10),
        Bra_Street      VARCHAR(30),
        Bra_Sub         VARCHAR(20),
        Bra_City	    VARCHAR(20),
        Bra_Pocode      NUMERIC(4),
        Bra_Email	    VARCHAR(30),
        Bra_Open        VARCHAR(40),	
        CONSTRAINT Branch_PK PRIMARY  KEY(Bra_Code)   
 );

CREATE TABLE Animal(
         Anim_No         NUMERIC(5)   not null,
         Anim_Name       VARCHAR(10),
         Anim_Type       VARCHAR(10) Check (Anim_Type in ('Dog', 'Puppy', 'Cat','Kitten', 'Bird', 'Fowl', 
         'Goat', 'Guinea Pig', 'Horse', 'Pig','Rabbit')),
         Anim_Gender     VARCHAR(15) Check (Anim_Gender in ('Male', 'Female')),
         Anim_Colour     VARCHAR(15),
         Anim_Age        NUMERIC(2),                                                                                                                                                                                                                                                                                                                                                                                                                                               
         Anim_Breed      VARCHAR(15),
         Anim_SecBreed   VARCHAR(15),
         Anim_Size       VARCHAR(15) Check (Anim_Size in ('Large', 'medium','Small')),
         Anim_Chip       NUMERIC(15),
         Bra_Code        VARCHAR(5),
         Anim_Comm       varchar(256),
         CONSTRAINT Animal_PK PRIMARY KEY(Anim_No),
         CONSTRAINT Animal_FK FOREIGN KEY(Bra_Code) REFERENCES Branch(Bra_Code)
);

-- Create table Animal_for_adoption(
--         Anim_No         NUMERIC(5),
--         Price           NUMERIC(3),
--         Healthc_check   VARCHAR(8),
--         CONSTRAINT Animal_for_adoption_PK PRIMARY KEY(Anim_No),
--         CONSTRAINT Animal_for_adoption_FK FOREIGN KEY(Anim_No) REFERENCES Animal(Anim_No)       
-- );

-- CREATE TABLE Medi_record(
--         Item_ID           NUMERIC(3)    NOT NULL,
--         Item_Type         VARCHAR(20),
--         Item_Description  VARCHAR(20),
--         IsRequired        VARCHAR(3),
--         CONSTRAINT Medi_record_PK PRIMARY KEY(Item_ID)
-- );

-- CREATE TABLE Animal_medirecord(
--         Anim_No         NUMERIC(5),
--         Item_ID         NUMERIC(3),
--         Check_Date      DATE,
--         CONSTRAINT Animal_medirecord_PK PRIMARY KEY(Anim_No,Item_ID),
--         CONSTRAINT Animal_medirecord_FK1 FOREIGN KEY(Anim_No) REFERENCES Animal_for_adoption(Anim_No),
--         CONSTRAINT Animal_medirecord_FK2 FOREIGN KEY(Item_ID) REFERENCES Medi_record(Item_ID)
-- );

-- CREATE TABLE Animal_for_foster(
--         Anim_No         NUMERIC(5),
--         CONSTRAINT Animal_for_foster_PK PRIMARY KEY(Anim_No),
--         CONSTRAINT Animal_for_foster_FK FOREIGN KEY(Anim_No) REFERENCES Animal(Anim_No)
-- );

CREATE TABLE Animal_for_foster_detail(
        Detail_Code     NUMERIC(5)      NOT NULL,
        Detail_Name     VARCHAR(20) ,
        Detail_Exp      VARCHAR(150),
        CONSTRAINT Animal_for_foster_detail_PK PRIMARY KEY(Detail_Code)   
);

-- CREATE TABLE Animal_Detail(
--         Detail_Code     NUMERIC(5),
--         Anim_No         NUMERIC(5),
--         Record_Date     Date,
--         CONSTRAINT Animal_Detail_PK PRIMARY KEY(Detail_Code,Anim_No),
--         CONSTRAINT Animal_Detail_FK1 FOREIGN KEY(Detail_Code) REFERENCES Animal_for_foster_detail(Detail_Code),
--         CONSTRAINT Animal_Detail_FK2 FOREIGN KEY(Anim_No)     REFERENCES Animal_for_foster(Anim_No)
-- );

CREATE TABLE Staff(
        Staff_code      VARCHAR(5)      NOT NULL,
        Staff_Fname     VARCHAR(15),
        Staff_Lname     VARCHAR(20),
        Staff_Email     VARCHAR(20),
        Staff_Mob       NUMERIC(10),
        MangaerID       VARCHAR(5),
        Bra_Code        VARCHAR(5),
        CONSTRAINT Staff_PK PRIMARY KEY(Staff_code),
        CONSTRAINT Staff_FK1 FOREIGN KEY(Bra_Code)  REFERENCES Branch(Bra_Code),
        CONSTRAINT Staff_FK2 FOREIGN KEY(MangaerID) REFERENCES Staff (Staff_code)
);


CREATE TABLE Reviewer(
        Staff_code     VARCHAR(5),
        Auth_No        VARCHAR(5),
        CONSTRAINT Reviewer_PK PRIMARY KEY(Staff_code),
        CONSTRAINT Reviewer_FK FOREIGN KEY(Staff_code) REFERENCES Staff (Staff_code)  
);


CREATE TABLE Coordinator(
         Staff_code     VARCHAR(5),
         Staff_Veh      VARCHAR(6),
         CONSTRAINT Coordinator_PK PRIMARY KEY(Staff_code),
         CONSTRAINT Coordinator_FK FOREIGN KEY(Staff_code) REFERENCES Staff (Staff_code)  
);

CREATE TABLE Order_T(
        Cust_ID                         NUMERIC(5),
        Order_ID                        NUMERIC(5)      NOT NULL,
        Oredr_Livtp                     VARCHAR(20) check( Oredr_Livtp in ('house', 'apartment', 'Townhouse', 'Villa','Duplex')),
        Order_Exp                       VARCHAR(20),
        Orde_Starttime                  date,
        Order_Trva                      VARCHAR(3) check (Order_Trva in ('yes', 'no', 'not sure')),
        Order_Famgr                     VARCHAR(3) check (Order_Famgr in ('yes', 'no')),
        CoordinatorCode                 VARCHAR(5),
        ReviewerCode                    VARCHAR(5),
        Anim_No                         NUMERIC(5),
        CONSTRAINT Order_T_PK  PRIMARY KEY (Cust_ID, Order_ID),
        CONSTRAINT Order_T_FK1 FOREIGN KEY (Cust_ID)         REFERENCES Customer(Cust_ID),
        CONSTRAINT Order_T_FK2 FOREIGN KEY (CoordinatorCode) REFERENCES Coordinator(Staff_code),
        CONSTRAINT Order_T_FK3 FOREIGN KEY (ReviewerCode)    REFERENCES Reviewer(Staff_code),
        CONSTRAINT Order_T_FK4 FOREIGN KEY (Anim_No)         REFERENCES Animal(Anim_No)
);

-- CREATE TABLE Bill(
--         Bill_No                         NUMERIC(8)      NOT NULL,
--         Cust_ID                         NUMERIC(5),
--         Order_ID                        NUMERIC(5),
--         Bill_Date                       date,
--         CONSTRAINT Bill_PK  PRIMARY KEY(Bill_No),
--         CONSTRAINT Bill_FK1 FOREIGN KEY(Cust_ID,Order_ID)  REFERENCES Order_T(Cust_ID,Order_ID)
        
--);

CREATE TABLE Order_detail( 

        Cust_ID                         NUMERIC(5),
        Order_ID                        NUMERIC(5),
        Detail_Code                     NUMERIC(5), 
        Order_date                      date,
        CONSTRAINT Order_detail_PK  PRIMARY KEY(Cust_ID, Order_ID, Detail_Code),
        CONSTRAINT Order_detail_FK1 FOREIGN KEY(Cust_ID,Order_ID)  REFERENCES Order_T(Cust_ID,Order_ID),
        CONSTRAINT Order_detail_FK2 FOREIGN KEY (Detail_Code) REFERENCES Animal_for_foster_detail(Detail_Code)
);
--=================================================================================================
-- Create and insert into the tables below

--Entities are used for testing
INSERT INTO Branch VALUES('yaya');
INSERT INTO Branch VALUES('Wawa');
INSERT INTO Branch VALUES('cici');
INSERT INTO Branch VALUES('okok');
INSERT INTO Branch VALUES('fefe');

INSERT INTO Animal(Anim_No, Bra_Code ) VALUES(33455, 'yaya');
INSERT INTO Animal(Anim_No, Bra_Code ) VALUES(33467, 'yaya');
INSERT INTO Animal(Anim_No, Bra_Code ) VALUES(33478, 'yaya');
INSERT INTO Animal(Anim_No, Bra_Code ) VALUES(33479, 'yaya');
INSERT INTO Animal(Anim_No, Bra_Code ) VALUES(33470, 'yaya');  

INSERT INTO Staff VALUES('ST201', 'AA ', 'EE ', 'EE@gmail.com', 1234567,  'ST201',  'yaya');
INSERT INTO Staff VALUES('ST202', 'BB ', 'FF',  'FF@GMAIL.com', 2345678,  'ST202',  'yaya');
INSERT INTO Staff VALUES('SS403', 'CC ', 'GG',  'gg@gmail.com', 3456789,  'SS403',  'yaya');
INSERT INTO Staff VALUES('SS401', 'DD ', 'HH',  'hh@gmail.com', 4567890,  'SS401',  'yaya');
INSERT INTO Staff VALUES('SS405', 'll ', 'mm',  'mm@gmail.com', 1111111,  'SS405',  'yaya');

INSERT INTO Staff(Staff_code, MangaerID, Bra_Code)VALUES('ST203', 'ST203','yaya');
INSERT INTO Staff(Staff_code, MangaerID, Bra_Code)VALUES('ST204', 'ST204','yaya');
INSERT INTO Staff(Staff_code, MangaerID, Bra_Code)VALUES('ST205', 'ST205','yaya');
INSERT INTO Staff(Staff_code, MangaerID, Bra_Code)VALUES('SS404', 'SS404','yaya');
INSERT INTO Staff(Staff_code, MangaerID, Bra_Code)VALUES('SS407', 'SS407','yaya');
INSERT INTO Staff(Staff_code, MangaerID, Bra_Code)VALUES('SS409', 'SS409','yaya');

INSERT INTO Coordinator VALUES('ST201', '41655C');
INSERT INTO Coordinator VALUES('ST202', '41655d');
INSERT INTO Coordinator VALUES('ST203', '41655e');
INSERT INTO Coordinator VALUES('ST204', '41655f');
INSERT INTO Coordinator VALUES('ST205', '41655g');

INSERT INTO Reviewer    VALUES('SS401', 'ABCDE');
INSERT INTO Reviewer    VALUES('SS403', 'SDFGH');
INSERT INTO Reviewer    VALUES('SS404', 'StFGH');
INSERT INTO Reviewer    VALUES('SS407', 'SuFGH');
INSERT INTO Reviewer    VALUES('SS409', 'SoFGH');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Entities are used in your Part D


INSERT INTO Customer VALUES(00001, 'jackwest@GMAIL.com',  'Jack', 'West',   0415123456, '1 south head Rd',  'Burwood',       'Canada bay',  'NSW', 2001, 12345678);
INSERT INTO Customer VALUES(00002, 'tomeast@gmail.com',   'Tom',  'East',   0416123456, '2 east highway',   'Seven hills',   'Canada bay',  'NSW', 2021, 23456789);
INSERT INTO Customer VALUES(00003, 'jimsouth@gmail.com',  'Jim',  'South',  0417123456, '198 waterside St',  'Eastwood',     'Inter West',  'NSW', 2022, 34567890);
INSERT INTO Customer VALUES(00004, 'maxnorth@gmail.com',  'Max',  'North',  0418123456, '27 rowson drive',  'liberty Grove', 'Inter West',  'NSW', 2022, 45678901);
INSERT INTO Customer VALUES(00005, 'Swanmiddle@gmail.com','Swan', 'Middle', 0419123456, '2 kens Rd',         'Double bay',   'Batmans bay', 'NSW', 2046, 56789012);


INSERT INTO Order_T VALUES(00001, 00101, 'house',      'have experiene', '09-Oct-2022', 'no', 'yes',  'ST201', 'SS403', 33455);
INSERT INTO Order_T VALUES(00002, 00102, 'apartment',  'have experiene', '09-Nov-2022', 'yes','yes',  'ST201', 'SS403', 33455);
INSERT INTO Order_T VALUES(00003, 00103, 'house',      'have experiene', '09-Dec-2022', 'no', 'yes',  'ST202', 'SS403', 33467);
INSERT INTO Order_T VALUES(00004, 00104, 'Duplex',     'no experiene',   '08-Oct-2022', 'no', 'yes',  'ST202', 'SS401', 33478);
INSERT INTO Order_T VALUES(00004, 00105, 'apartment',  'no experiene',   '20-Oct-2022', 'no', 'yes',  'ST202', 'SS401', 33478);

INSERT INTO Animal_for_foster_detail VALUES(50011, 'unhealth Dog',  'Dogs with health concerns');
INSERT INTO Animal_for_foster_detail VALUES(50012, 'biteer Dog',    'Dogs with behavioural concerns');
INSERT INTO Animal_for_foster_detail VALUES(50013, 'baby Dog',      'Dogs need bottle feed');
INSERT INTO Animal_for_foster_detail VALUES(50014, 'larger Dog',    'Dogs need more space');
INSERT INTO Animal_for_foster_detail VALUES(60015, 'baby cat',      'Cats need bottle feed');

INSERT INTO Order_detail VALUES(00001, 00101, 50014, '11-Jul-2022');
INSERT INTO Order_detail VALUES(00002, 00102, 50014, '12-Jul-2022');
INSERT INTO Order_detail VALUES(00003, 00103, 50011, '13-Jul-2022');
INSERT INTO Order_detail VALUES(00004, 00104, 50011, '14-Jul-2022');
INSERT INTO Order_detail VALUES(00004, 00105, 60015, '14-Jul-2022');


--=================================================================================================
-- Select * from TableName Statements
-- Note: Please write the “select * from TableName” statements in one line.

-- 2.b.1: Question: Get all information of all Customer from sysetem
-- 2.b.1: SELECT statement:

Select * from customer;

-- 2.b.2: Question: Get all information of all orders from sysetem
-- 2.b.2: SELECT statement:
Select * from Order_T;

-- 2.b.3: Question: Get all information of all animal details select in orders by customers
-- 2.b.3: SELECT statement:
Select * from Order_detail;

--=================================================================================================
-- 3.a: Question: 
-- 3.a: SELECT statement uinsg Group by:list cities name that customers live in, Get the number of customers from the same city
Select cust_city, count(*) as CustomerInCity from Customer Group by Cust_City;

-- 3.b: Question:  list all customers' full name in alphabetical order and  animal details selected by the customer in the order 
-- 3.b: SELECT statement uisng Inner Join:

SELECT  c.Cust_Fname, c.Cust_Lname, afd.Detail_Name
FROM Customer c INNER JOIN  Order_detail
                ON c.Cust_ID = Order_detail.Cust_ID
                INNER JOIN  Animal_for_foster_detail afd
                ON afd.Detail_Code = Order_detail.Detail_Code
                ORDER BY Cust_Fname;

-- 3.c: Question: list full name of customer who don't live in apartment
-- 3.c: SELECT statement using Sub Query:
SELECT Cust_Fname, Cust_Lname
FROM Customer C
WHERE C.Cust_ID in
(SELECT ORDER_T.Cust_ID FROM ORDER_T WHERE Oredr_Livtp not in  ('apartment'));
