CREATE PROCEDURE usp_AssignProject(@emloyeeId int, @projectID int)
AS
BEGIN TRANSACTION

DECLARE @currentEmpProjectsCount int = 
(SELECT COUNT(ProjectID)
FROM EmployeesProjects
WHERE EmployeeID = @emloyeeId)

IF(@currentEmpProjectsCount >= 3)
BEGIN
	ROLLBACK
	RAISERROR('The employee has too many projects!', 16, 1)
	RETURN
END

INSERT INTO EmployeesProjects
VALUES
(@emloyeeId, @projectID)

COMMIT