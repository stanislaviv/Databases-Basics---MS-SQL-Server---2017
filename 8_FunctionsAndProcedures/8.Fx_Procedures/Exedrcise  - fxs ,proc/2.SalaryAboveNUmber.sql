CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber (@Salary MONEY)
AS 
SELECT FirstName, LastName FROM Employees
WHERE Salary>=@Salary

EXEC usp_GetEmployeesSalaryAboveNumber 50000