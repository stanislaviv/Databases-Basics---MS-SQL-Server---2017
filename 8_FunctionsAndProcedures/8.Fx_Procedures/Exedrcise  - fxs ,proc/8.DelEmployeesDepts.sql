CREATE PROC usp_DeleteEmployeesFromDepartment (@departmentId INT)
AS
ALTER TABLE Departments
ALTER COLUMN ManagerID INT NULL

DELETE FROM EmployeesProjects
WHERE EmployeeID IN (
						SELECT EmployeeID FROM Employees
						WHERE DepartmentID = @departmentId
					)

UPDATE Employees
SET ManagerID = NULL
WHERE ManagerID IN (
						SELECT EmployeeID FROM Employees
						WHERE DepartmentID = @departmentId
				   )


UPDATE Departments
SET ManagerID = NULL
WHERE ManagerID IN (
						SELECT EmployeeID FROM Employees
						WHERE DepartmentID = @departmentId
				   )

DELETE FROM Employees
WHERE EmployeeID IN (
						SELECT EmployeeID FROM Employees
						WHERE DepartmentID = @departmentId
				    )

DELETE FROM Departments
WHERE DepartmentID = @departmentId
SELECT COUNT(*) AS [Employees Count] FROM Employees AS e
JOIN Departments AS d
ON d.DepartmentID = e.DepartmentID
WHERE e.DepartmentID = @departmentId
