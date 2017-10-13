CREATE FUNCTION ufn_CalculateFutureValue(@sum money, @yearlyInterestRate float, @yearsCount int)
RETURNS MONEY
AS
BEGIN

RETURN @sum * POWER(1 + @yearlyInterestRate, @yearsCount)

END