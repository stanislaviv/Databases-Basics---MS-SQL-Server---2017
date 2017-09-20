
CREATE PROC p_AddAccount @ClientId INT, @AccountTypeId INT AS
INSERT INTO Accounts (ClientId, AccountTypeId) 
VALUES (@ClientId, @AccountTypeId)

p_AddAccount 2, 2

SELECT * FROM Accounts