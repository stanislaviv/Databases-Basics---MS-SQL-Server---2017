CREATE DATABASE Hotels

USE Hotels

CREATE TABLE Employees (
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(max)
)

INSERT INTO Employees (FirstName,LastName,Notes) VALUES
('John','Smith','bellboy'),
('Angelina','Jolie','receptionist'),
('Dimitur','Berbatov','PR')

CREATE TABLE Customers (
	AccountNumber INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	PhoneNumber NVARCHAR(50) NOT NULL,
	EmergencyName NVARCHAR(50),
	EmergencyNumber NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(max)
)

INSERT INTO Customers (FirstName,LastName,PhoneNumber,EmergencyName,EmergencyNumber,Notes) VALUES
('Ivan','Petkov','+359887 4273474','Krasimir','34244','Regular Customer'),
('John','Wick','34324324','His Dog','2324324234','Angry Customer'),
('Arnold','Swarzeneeger','99999999','SkyNet','14324242','He will save the world')

CREATE TABLE RoomStatus
(
RoomStatus varchar(20) PRIMARY KEY NOT NULL,
Notes varchar(max)
)

INSERT INTO RoomStatus (RoomStatus,Notes)
VALUES
('Clean','available for guests'),
('Dirty','do not accommodate guests yet'),
('Unavailable','repairs needed')

CREATE TABLE RoomTypes
(
RoomType varchar(20) PRIMARY KEY NOT NULL,
Notes varchar(max)
)

INSERT INTO RoomTypes (RoomType)
VALUES
('Regular'),
('Luxury'),
('VIP')

CREATE TABLE BedTypes
(
BedType varchar(20) PRIMARY KEY NOT NULL,
Notes varchar(max)
)

INSERT INTO BedTypes (BedType)
VALUES
('Single'),
('Double'),
('King size')

CREATE TABLE Rooms
(
	RoomNumber INT PRIMARY KEY IDENTITY(100,10),
	RoomType varchar(20) FOREIGN KEY REFERENCES RoomTypes(RoomType) NOT NULL,
	BedType varchar(20) FOREIGN KEY REFERENCES BedTypes(BedType) NOT NULL,
	Rate decimal(7,2) NOT NULL,
	RoomStatus varchar(20) FOREIGN KEY REFERENCES RoomStatus(RoomStatus) NOT NULL,
	Notes varchar(max)
)

INSERT INTO Rooms (RoomType, BedType, Rate, RoomStatus)
VALUES 
('Luxury', 'Double', 55.223, 'Clean'),
('Regular', 'King size', 89.223, 'Dirty'),
('VIP', 'Single', 333.223, 'Unavailable')

CREATE TABLE Payments
(
Id INT PRIMARY KEY IDENTITY,
EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
PaymentDate DATE NOT NULL,
AccountNumber INT FOREIGN KEY REFERENCES Customers(AccountNumber) NOT NULL,
FirstDateOccupied DATE,
LastDateOccupied DATE,
TotalDays AS datediff(day, FirstDateOccupied, LastDateOccupied),
AmountCharged decimal (7,2) NOT NULL,
TaxRate decimal (7,2) NOT NULL,
TaxAmount AS AmountCharged * TaxRate,
PaymentTotal AS AmountCharged + AmountCharged * TaxRate,
Notes varchar(max)
)

INSERT INTO Payments (EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, AmountCharged,TaxRate)
VALUES
(1, '2016-03-21', 1,'2016-03-22', '2016-03-27', 666.45, 0.2),
(2, '2006-04-11', 2, '2006-04-12', '2006-04-22', 1444.45, 0.2),
(3, '2017-08-26', 3, '2017-08-26', '2017-08-29', 166.45, 0.2)

CREATE TABLE Occupancies 
(
Id INT PRIMARY KEY IDENTITY,
EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
DateOccupied DATE,
AccountNumber INT FOREIGN KEY REFERENCES Customers(AccountNumber) NOT NULL,
RoomNumber INT FOREIGN KEY REFERENCES Rooms(RoomNumber),
RateApplied decimal (7,2) NOT NULL,
PhoneCharge decimal (7,2),
Notes varchar(max)
)

INSERT INTO Occupancies (EmployeeId, AccountNumber, RoomNumber, RateApplied)
VALUES
(1, 1, 110, 45.66),
(2, 2, 120, 115.10),
(3, 3, 100, 239.25)
