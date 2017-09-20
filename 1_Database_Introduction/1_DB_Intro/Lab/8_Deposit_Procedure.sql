CREATE PROC p_Deposit @AccountId INT, @Amount DECIMAL(15, 2) AS
UPDATE Accounts
SET Balance += @Amount
WHERE Id = @AccountId

p_Deposit 6,50.50

select*from v_ClientBalances