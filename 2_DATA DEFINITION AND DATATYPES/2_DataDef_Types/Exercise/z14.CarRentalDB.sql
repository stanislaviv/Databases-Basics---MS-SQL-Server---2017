CREATE DATABASE CarRental
CREATE TABLE Categories
(
Id INT PRIMARY KEY IDENTITY,
Category VARCHAR(100) NOT NULL,
DailyRate INT NOT NULL,
WeeklyRate INT NOT NULL,
MonthlyRate INT NOT NULL,
WeekendRate INT NOT NULL
)

CREATE TABLE Cars
(
Id INT PRIMARY KEY IDENTITY,
PlateNumber VARCHAR(30) NOT NULL,
Make VARCHAR(50),
Model VARCHAR(50),
CarYear DATE,
CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
Doors INT NOT NULL,
Picture VARBINARY(MAX),
Condition VARCHAR(200),
Available BIT NOT NULL
)

CREATE TABLE Employees
(
Id INT PRIMARY KEY IDENTITY,
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(30) NOT NULL,
Title VARCHAR(30) NOT NULL,
Notes VARCHAR(2000)
)

CREATE TABLE Customers
(
Id INT PRIMARY KEY IDENTITY,
DriverLicenceNumber VARCHAR(30) NOT NULL,
FullName VARCHAR(50) NOT NULL,
Address VARCHAR(100) NOT NULL,
City VARCHAR(50) NOT NULL,
ZipCode VARCHAR(10),
Notes VARCHAR(MAX)
)

CREATE TABLE RentalOrders
(
Id INT PRIMARY KEY IDENTITY,
EmployeeId INT FOREIGN KEY REFERENCES Employees(Id),
CustomerId INT FOREIGN KEY REFERENCES Customers(Id),
CarId INT FOREIGN KEY REFERENCES Cars(Id),
CarCondition VARCHAR(200) NOT NULL,
TankLevel DECIMAL NOT NULL,
KilometrageStart DECIMAL,
KilometrageEnd DECIMAL,
TotalKilometrage DECIMAL NOT NULL,
StartDate DATE,
EndDate Date,
TotalDays INT NOT NULL,
RateApplied VARCHAR(20) NOT NULL,
TaxRate DECIMAL NOT NULL,
OrderStatus VARCHAR(50) NOT NULL,
Notes VARCHAR(MAX)
)

INSERT INTO Categories (Category, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
VALUES
('First Class', 20, 100, 300, 50),
('Economy Class', 15, 70, 250, 40),
('Worst Class Ever', 10, 50, 200, 30)

INSERT INTO Cars (PlateNumber, Doors, Condition, Available, CategoryId)
VALUES
('EH-5007', 5, 'Without a scratch', 1, 1),
('CA-1113', 4, 'Barely working', 1, 2),
('EH-1423', 5, 'You better choose another one', 0, 3)

INSERT INTO Employees (FirstName, LastName, Title)
VALUES
('Petar', 'Dimitrov', 'Mr'),
('Lidiya', 'Plamenova', 'Mrs'),
('Nikolay', 'Petkov', 'Mr')

INSERT INTO Customers (DriverLicenceNumber, FullName, Address, City)
VALUES
('1135123', 'Ariana Grande', 'Some USA Street', 'Los Angeles'),
('2134123', 'Tyler Durden', 'Basement', 'Chicago'),
('25123124', 'Tom Hardy', 'Hollywood', 'LA')

INSERT INTO RentalOrders (EmployeeId, CustomerId, CarId, CarCondition, TankLevel, TotalKilometrage, TotalDays, RateApplied, TaxRate, OrderStatus)
VALUES
(1, 2, 3, 'Flawless', 30.15, 50.34, 2, 'Standard', 15, 'Confirmed'),
(3, 2, 1, 'A bump here and there', 21.54, 120.15, 1, 'Discount', 10, 'Awaiting Confirmation'),
(1, 1, 2, 'Completely recycable', 50, 20.14, 3, 'Standard', 15, 'Awaiting Payment')