CREATE DATABASE hotel;

USE hotel;

CREATE TABLE Guest (
  GuestID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(100),
  Phone VARCHAR(20),
  Address VARCHAR(100),
  City VARCHAR(50),
  State VARCHAR(50),
  Zip VARCHAR(10)
);

CREATE TABLE Room (
  RoomID INT PRIMARY KEY,
  RoomNumber INT,
  RoomType VARCHAR(50),
  RoomDescription VARCHAR(100),
  RoomRate DECIMAL(10,2),
  Capacity INT,
  Availability ENUM('Available', 'Occupied', 'Reserved')
);


CREATE TABLE Reservation (
  ReservationID INT PRIMARY KEY,
  GuestID INT,
  RoomID INT,
  CheckInDate DATE,
  CheckOutDate DATE,
  NumberOfAdults INT,
  NumberOfChildren INT,
  TotalAmount DECIMAL(10,2),
  FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
  FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);


CREATE TABLE Occupancy (
  OccupancyID INT PRIMARY KEY,
  ReservationID INT,
  RoomID INT,
  CheckInDate DATE,
  CheckOutDate DATE,
  FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID),
  FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

CREATE TABLE Transaction (
  TransactionID INT PRIMARY KEY,
  ReservationID INT,
  GuestID INT,
  TransactionDate DATE,
  PaymentMethod ENUM('Cash', 'Credit Card', 'Debit Card'),
  AmountPaid DECIMAL(10,2),
  FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID),
  FOREIGN KEY (GuestID) REFERENCES Guest(GuestID)
);

CREATE TABLE Inventory (
  InventoryID INT PRIMARY KEY,
  ItemName VARCHAR(50),
  ItemDescription VARCHAR(100),
  Quantity INT,
  Price DECIMAL(10,2),
  Location VARCHAR(50)
);

CREATE TABLE Employee (
  EmployeeID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(100),
  Phone VARCHAR(20),
  Address VARCHAR(100),
  City VARCHAR(50),
  State VARCHAR(50),
  Zip VARCHAR(10),
  Position VARCHAR(50),
  Salary DECIMAL(10,2)
);

CREATE TABLE Maintenance (
  MaintenanceID INT PRIMARY KEY,
  RoomID INT,
  MaintenanceDate DATE,
  Description VARCHAR(100),
  FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

CREATE TABLE Marketing (
  MarketingID INT PRIMARY KEY,
  CampaignName VARCHAR(50),
  CampaignDescription VARCHAR(100),
  StartDate DATE,
  EndDate DATE,
  Budget DECIMAL(10,2)
);

CREATE TABLE Security (
  SecurityID INT PRIMARY KEY,
  EmployeeID INT,
  Date DATE,
  TimeIn TIME,
  TimeOut TIME,
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

ALTER TABLE `hotel`.`inventory` 
ADD COLUMN `RoomID` INT NULL AFTER `Location`;


