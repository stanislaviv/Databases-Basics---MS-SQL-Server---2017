SELECT TOP (2) DepositGroup 
	FROM (SELECT TOP (2) DepositGroup,AVG(MagicWandSize) AS [AverageWandSize] FROM WizzardDeposits
		  GROUP BY DepositGroup
		  ORDER BY AverageWandSize ASC) 

AS [DepositGroup]


