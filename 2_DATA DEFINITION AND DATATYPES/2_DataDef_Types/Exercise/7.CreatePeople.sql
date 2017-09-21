CREATE DATABASE People
USE People

CREATE TABLE People (
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(200) NOT NULL,
	Picture VARBINARY CHECK(DATALENGTH(Picture)<900*1024),
	Height DECIMAL(15,2),
	[Weight] DECIMAL(15,2),
	Gender  VARCHAR(1) CHECK(Gender ='m' OR Gender = 'f') NOT NULL,
	Birthdate DATE NOT NULL,
	Biography NVARCHAR(255)
)


INSERT INTO People ([Name], Picture,Height,[Weight],Gender, Birthdate, Biography) VALUES
('Stanislav',NULL,1.79,95,'m','1982-02-25','Stanislav is Business ANAlyst'),
('Violeta',NULL,1.82,80,'f','1982-02-25','Vili is DB specialist'),
('Alex',NULL,1.60,45,'m','1982-02-25','Alex is Junior BA'),
('Nikolay',NULL,1.80,105,'m','1982-02-25','Nikolay is Director'),
('Krasimir',NULL,1.80,90,'m','1982-02-25','Kasimir is facility manager')

