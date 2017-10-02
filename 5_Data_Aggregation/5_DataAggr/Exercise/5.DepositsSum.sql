SELECT DepositGroup, ROUND(SUM(DepositAmount),2) AS TotalSum
FROM WizzardDeposits
GROUP BY DepositGroup