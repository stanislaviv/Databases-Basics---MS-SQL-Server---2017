USE SoftUni_CRUD
SELECT DepartmentId,SUM(Salary) AS [TotalSalary] FROM Employees
GROUP BY DepartmentId
ORDER BY DepartmentId