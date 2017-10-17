CREATE TABLE Deleted_Employees
(
EmployeeId int PRIMARY KEY IDENTITY,
FirstName varchar(50),
LastName varchar(50),
MiddleName varchar(50),
JobTitle varchar(50),
DepartmentId int,
Salary money
)

GO
CREATE TRIGGER tr_DeleteEmployee ON Employees AFTER DELETE
AS
INSERT INTO Deleted_Employees(FirstName, LastName, MiddleName, JobTitle, DepartmentId, Salary)
SELECT d.FirstName, d.LastName, d.MiddleName, d.JobTitle, d.DepartmentID, d.Salary 
FROM deleted AS d