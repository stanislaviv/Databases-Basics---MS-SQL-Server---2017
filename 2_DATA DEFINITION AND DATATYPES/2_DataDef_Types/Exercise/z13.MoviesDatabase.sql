CREATE DATABASE Movies

CREATE TABLE Directors (
	Id INT PRIMARY KEY IDENTITY,
	DirectorName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(max)
)

CREATE TABLE Genres (
	Id INT PRIMARY KEY IDENTITY,
	GenreName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(max)
)

CREATE TABLE Categories (
	Id INT PRIMARY KEY IDENTITY,
	CategoryName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(max)
)

CREATE TABLE Movies (
	Id INT PRIMARY KEY IDENTITY,
	Title NVARCHAR(50) NOT NULL,
	DirectorId INT FOREIGN KEY REFERENCES Directors(Id) NOT NULL,
	CopyrightYear DATE,
	Lenght INT NOT NULL,
	GenreId INT FOREIGN KEY REFERENCES Genres(Id) NOT NULL,
	CategoryID INT FOREIGN KEY REFERENCES Categories(Id) NOT NULL,
	Rating INT,
	Notes NVARCHAR(max)
)

INSERT INTO Directors (DirectorName, Notes) VALUES
('Alfred Hichkok','Classics'),
('Christopher Nolan', 'Just excellent'),
('Guy Ritchie', 'Second Best there is'),
('Quentin Tarantino', 'Slightly overrated IMO'),
('George Miller', 'Hopefully his career will not end soon')

INSERT INTO Genres (GenreName)VALUES
('Action'),
('Comedy'),
('Thriller'),
('Drama'),
('Sci-fi')


INSERT INTO Categories(CategoryName) VALUES
('Action'),
('Oscar Winners'),
('OLD School'),
('Arnold Schwarceneeger'),
('Zlatna Malnka')

INSERT INTO Movies (Title, DirectorId, Lenght, GenreId, CategoryId, Rating) VALUES
('Expendables',1,90,1,4,10),
('Snatch', 3, 120, 2, 1, 9.5),
('Dark Knight', 2, 130, 1, 2, 9.7),
('Mad Max : Fury Road', 5, 110, 1, 2, 9.9),
('Kill Bill', 4, 170, 1, 2, 8.5)