DROP SCHEMA if exists beyondHairCut;
CREATE SCHEMA IF NOT EXISTS beyondHairCut;
Use beyondHairCut;

CREATE TABLE Address(
  AddressId INT AUTO_INCREMENT,
  Street VARCHAR(255) NOT NULL,
  City VARCHAR(255) NOT NULL,
  State VARCHAR(255) NOT NULL,
  Zip INT NOT NULL,
  Country Varchar(255),
  CONSTRAINT pk_Address_AddressId PRIMARY KEY (AddressId )
);

CREATE TABLE Store(
StoreId INT AUTO_INCREMENT,
AddressId Int NOT NULL,
Phone INT NOT NULL,
CONSTRAINT pk_Store_StoreId PRIMARY KEY (StoreId),
CONSTRAINT fk_Store_AddressId FOREIGN KEY (AddressId)
    REFERENCES Address(AddressId)
);

CREATE TABLE Customer(
CustomerId Int AUTO_increment,
Gender ENUM('Male', 'Female'),
UserName Varchar(255) NOT NULL,
PassWord Varchar(255) NOT NULL,
FirstName Varchar(255) NOT NULL,
LastName Varchar(255) NOT NULL,
DOB Date,
AddressId Int NOT NULL,
CONSTRAINT pk_Customer_UserName PRIMARY KEY (CustomerId),
CONSTRAINT fk_Customer_AddressId FOREIGN KEY (AddressId)
    REFERENCES Address(AddressId)
);

CREATE TABLE CreditCard (
  CardNumber BIGINT NOT NULL,
  Expiration DATE NOT NULL,
  CustomerId Int, 
  CONSTRAINT pk_CreditCards_CardNumber PRIMARY KEY (CardNumber),
  CONSTRAINT fk_Customer_CustomerId FOREIGN KEY (CustomerId)
	REFERENCES CUSTOMER(CustomerId)
);


CREATE TABLE Otherservice(
SeviceId INT AUTO_INCREMENT,
Services ENUM('Massage', 'Waxing', 'Manicure Nails', 'Pedicure Nails', 'hot Towel','Beard', 'Bow Tinting', 'Lash Tinting'),
Duration Int,
About VARCHAR(255) NOT NULL,
Price Int,
CONSTRAINT pk_Otherservice_SeviceId PRIMARY KEY (SeviceId)
);


CREATE TABLE Advertisement(
AdvertisementId INT AUTO_INCREMENT,
Description LONGBLOB,
URL VARCHAR(2083) NOT NULL,
CONSTRAINT pk_Advertisement_AdvertisementId PRIMARY KEY (AdvertisementId)
);

CREATE TABLE Barber(
BarberId INT AUTO_INCREMENT,
FirstName Varchar(255) NOT NULL,
LastName Varchar(255) NOT NULL,
Picture LONGBLOB,
About Varchar(255),
Rating Enum('0','1','2','3','4','5'),
Gender ENUM('Male', 'Female'),
StoreId INT NOT NULL,
CONSTRAINT pk_Barber_BarberId PRIMARY KEY (BarberId)
);


CREATE TABLE Hairstyle(
Style VARCHAR(255) NOT NULL,
Gender ENUM('MALE', 'FEMALE'),
Picture LONGBLOB,
Instance LONGBLOB,
Price Int,
CONSTRAINT pk_Hairstyle_Style PRIMARY KEY (Style)
);


CREATE TABLE Appointment (
StoreId INT NOT NULL,
AppointmentId INT auto_increment,
Date DATETIME NOT NULL,
#Duration Time,
CustomerId INT NOT NULL,
BarberId INT NOT NULL,
Style VARCHAR(255),
#Price INT,
#ENUM('Flat-top','Butch-cut','mullet','Buzz-cut','Caesar-cut',
#'Comb-over','Crew-cut','Bowl cut','Bob-cut',
#'Bouffant','Long-wave','Long-straight','Short-straight',
#'Pony-hair','Short-wave') NOT NULL,
# Rating Enum('1', '1.5','2', '2.5','3','3.5','4','4.5','5') NOT NULL,
# Charge Double NOT NULL,
CONSTRAINT pk_Appointment_AppointmentId PRIMARY KEY (AppointmentId),
CONSTRAINT fk_Appointment_BarberId foreign key (BarberId)
references Barber(BarberId),
CONSTRAINT fk_Appointment_CustomerId foreign key (CustomerId)
references Customer(CustomerId),
CONSTRAINT fk_Appoitment_Style foreign key (Style)
references Hairstyle(Style)

);


CREATE TABLE Comment (
  CommentId INT AUTO_INCREMENT,
  time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  Content VARCHAR(1024) NOT NULL,
  BarberId Int Not Null,
  CustomerId INT Not Null,
  CONSTRAINT pk_Comment_CommentId PRIMARY KEY (CommentId),
  CONSTRAINT fk_Comment_BarberId FOREIGN KEY (BarberId)
    REFERENCES Barber(BarberId),
    #ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT fk_Comment_CustomerId FOREIGN KEY (CustomerId)
    REFERENCES Customer(CustomerId)
    #ON UPDATE CASCADE ON DELETE SET NULL
);

INSERT INTO `beyondHairCut`.`Hairstyle` (`Style`, `Gender`, `Price`) VALUES ('Bob Cut', 'Female', '20');
INSERT INTO `beyondHairCut`.`Hairstyle` (`Style`, `Gender`, `Price`) VALUES ('Bouffant', 'Female', '30');
INSERT INTO `beyondHairCut`.`Hairstyle` (`Style`, `Gender`, `Price`) VALUES ('Bowl Cut', 'Male', '15');
INSERT INTO `beyondHairCut`.`Hairstyle` (`Style`, `Gender`, `Price`) VALUES ('Butch Cut', 'Male', '15');
INSERT INTO `beyondHairCut`.`Hairstyle` (`Style`, `Gender`, `Price`) VALUES ('Buzz Cut', 'Male', '15');
INSERT INTO `beyondHairCut`.`Hairstyle` (`Style`, `Gender`, `Price`) VALUES ('Caeser Cut', 'Male', '20');
INSERT INTO `beyondHairCut`.`Hairstyle` (`Style`, `Gender`, `Price`) VALUES ('Comb Over', 'Male', '20');
INSERT INTO `beyondHairCut`.`Hairstyle` (`Style`, `Gender`, `Price`) VALUES ('Crew Cut', 'Male', '15');
INSERT INTO `beyondHairCut`.`Hairstyle` (`Style`, `Gender`, `Price`) VALUES ('Flat Top', 'Male', '15');
INSERT INTO `beyondHairCut`.`Hairstyle` (`Style`, `Gender`, `Price`) VALUES ('High Top', 'Male', '20');
INSERT INTO `beyondHairCut`.`Hairstyle` (`Style`, `Gender`, `Price`) VALUES ('Long Straight', 'Female', '25');
INSERT INTO `beyondHairCut`.`Hairstyle` (`Style`, `Gender`, `Price`) VALUES ('Long Wave', 'Female', '30');
INSERT INTO `beyondHairCut`.`Hairstyle` (`Style`, `Gender`, `Price`) VALUES ('Mullet', 'Female', '20');
INSERT INTO `beyondHairCut`.`Hairstyle` (`Style`, `Gender`, `Price`) VALUES ('Pony Hair', 'Female', '25');
INSERT INTO `beyondHairCut`.`Hairstyle` (`Style`, `Gender`, `Price`) VALUES ('Short Straight', 'Female', '20');
INSERT INTO `beyondHairCut`.`Hairstyle` (`Style`, `Gender`, `Price`) VALUES ('Short Wave', 'Female', '30');
INSERT INTO `beyondHairCut`.`Hairstyle` (`Style`, `Price`) VALUES ('NA', '0');
#INSERT INTO `beyondHairCut`.`Hairstyle` (`Style`, `Gender`, `Price`) VALUES ('Not Sure', 'NA', '0');
#UPDATE `beyondHairCut`.`Hairstyle` SET `Gender`='Male' WHERE `Style`='duckass';

ALTER TABLE `beyondHairCut`.`Hairstyle` 
ADD COLUMN `Duration` INT(11) NULL AFTER `Price`;
UPDATE `beyondHairCut`.`Hairstyle` SET `Duration`='50' WHERE `Style`='Bob Cut';
UPDATE `beyondHairCut`.`Hairstyle` SET `Duration`='60' WHERE `Style`='Bouffant';
UPDATE `beyondHairCut`.`Hairstyle` SET `Duration`='30' WHERE `Style`='Bowl Cut';
UPDATE `beyondHairCut`.`Hairstyle` SET `Duration`='20' WHERE `Style`='Butch Cut';
UPDATE `beyondHairCut`.`Hairstyle` SET `Duration`='40' WHERE `Style`='Buzz Cut';
UPDATE `beyondHairCut`.`Hairstyle` SET `Duration`='40' WHERE `Style`='Caeser Cut';
UPDATE `beyondHairCut`.`Hairstyle` SET `Duration`='20' WHERE `Style`='Comb Over';
UPDATE `beyondHairCut`.`Hairstyle` SET `Duration`='50' WHERE `Style`='Crew Cut';
UPDATE `beyondHairCut`.`Hairstyle` SET `Duration`='20' WHERE `Style`='duckass';
UPDATE `beyondHairCut`.`Hairstyle` SET `Duration`='30' WHERE `Style`='Flat Top';
UPDATE `beyondHairCut`.`Hairstyle` SET `Duration`='40' WHERE `Style`='High Top';
UPDATE `beyondHairCut`.`Hairstyle` SET `Duration`='50' WHERE `Style`='Long Straight';
UPDATE `beyondHairCut`.`Hairstyle` SET `Duration`='30' WHERE `Style`='Long Wave';
UPDATE `beyondHairCut`.`Hairstyle` SET `Duration`='30' WHERE `Style`='Mullet';
UPDATE `beyondHairCut`.`Hairstyle` SET `Duration`='0' WHERE `Style`='NA';
UPDATE `beyondHairCut`.`Hairstyle` SET `Duration`='30' WHERE `Style`='Pony Hair';
UPDATE `beyondHairCut`.`Hairstyle` SET `Duration`='40' WHERE `Style`='Short Straight';
UPDATE `beyondHairCut`.`Hairstyle` SET `Duration`='50' WHERE `Style`='Short Wave';

INSERT INTO `beyondHairCut`.`Address` (`AddressId`, `Street`, `City`, `State`, `Zip`) VALUES ('0', 'NA', 'NA', 'NA', '0');
