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
About Varchar(255) NOT NULL,
Rating Enum('0','1','2','3','4','5') NOT NULL,
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
Duration Time,
CustomerId INT NOT NULL,
BarberId INT NOT NULL,
Style VARCHAR(255),
Price INT,
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


