USE Users

CREATE TABLE Users (
	Id BIGINT PRIMARY KEY IDENTITY,
	Username VARCHAR(30) NOT NULL UNIQUE,
	[Password] VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY CHECK(DATALENGTH(ProfilePicture)<900*1024),
	LastLoginTime SMALLDATETIME,
	IsDeleted VARCHAR(5) CHECK (IsDeleted = 'true' OR IsDeleted = 'false') NOT NULL
)


INSERT INTO Users(Username, [Password],ProfilePicture,LastLoginTime,IsDeleted) VALUES
('Stanislav','djnachnHDN034',NULL,'1982-02-25 12:45:38','false'),
('Borko','djnachnHDN034',NULL,'1982-02-25 12:45:38','false'),
('Ivan','djnachnHDN034',NULL,'1982-02-25 12:45:38','false'),
('Svetla','samolet57',NULL,'1982-02-25 12:45:38','false'),
('Neda','gotvach',NULL,'1982-02-25 12:45:38','false')
