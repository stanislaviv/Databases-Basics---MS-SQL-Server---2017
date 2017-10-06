CREATE TABLE Persons
	(
		PersonID INT IDENTITY NOT NULL,
		FirstName VARCHAR(50),
		Salary DECIMAL(7,2),
		PassportID INT UNIQUE NOT NULL
	)

CREATE TABLE Passports
	(
		PassportID INT NOT NULL,
		PassportNumber NVARCHAR(50)
	)

INSERT INTO Persons (FirstName,Salary,PassportID) VALUES
	('Roberto', 43300.00, 102),
	('Tom', 56100.00, 103),
	('Yana', 60200.00, 101)

INSERT INTO Passports (PassportID,PassportNumber) VALUES
	(101, 'N34FG21B'),
	(102, 'K65LO4R7'),
	(103, 'ZE657QP2')

ALTER TABLE PERSONS
ADD CONSTRAINT PK_Persons PRIMARY KEY (PersonID)

ALTER TABLE Passports
ADD CONSTRAINT PK_Passports PRIMARY KEY(PassportID)

ALTER TABLE Persons
ADD CONSTRAINT FK_Persons_Passports 
FOREIGN KEY (PassportID) REFERENCES Passports(PassportID)
