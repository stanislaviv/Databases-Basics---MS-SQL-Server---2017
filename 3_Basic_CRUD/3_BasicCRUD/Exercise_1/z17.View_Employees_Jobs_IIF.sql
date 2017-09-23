CREATE VIEW V_EmployeeNameJobTitle2 AS
SELECT FirstName + ' ' + IIF(MiddleName IS NULL,'',MiddleName) + ' ' + LastName AS [Full Name], JobTitle 
FROM Employees

GO

SELECT * FROM V_EmployeeNameJobTitle2
