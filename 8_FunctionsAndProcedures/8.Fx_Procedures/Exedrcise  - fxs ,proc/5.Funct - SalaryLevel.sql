CREATE FUNCTION dbo.ufn_GetSalaryLevel(@salary money) 
RETURNS varchar(10)
AS
BEGIN

	DECLARE @salaryLevel varchar(10);

	IF(@salary < 30000)
		BEGIN
			SET @salaryLevel = 'Low';
		END
	ELSE IF(@salary >= 30000 AND @salary <= 50000)
		BEGIN
			SET @salaryLevel = 'Average';
		END
	ELSE IF(@salary > 50000)
		BEGIN
			SET @salaryLevel = 'High';
		END

	RETURN @salaryLevel;
END

--Testing DO NOT SUBMIT IN JUDGE
SELECT Salary, dbo.ufn_GetSalaryLevel(Salary) AS 'Salary Level'
FROM Employees
ORDER BY Salary
DESC