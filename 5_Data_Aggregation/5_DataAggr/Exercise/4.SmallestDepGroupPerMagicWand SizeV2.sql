SELECT DepositGroup FROM WizzardDeposits
GROUP BY DepositGroup
HAVING AVG(MagicWandSize)= (
			     SELECT Min(WizzardWandSizes.AverageMagicWandSize) FROM (
		             SELECT DepositGroup, AVG(MagicWandSize) AS AverageMagicWandSize FROM WizzardDeposits
			     GROUP BY DepositGroup
			   ) AS [WizzardWandSizes]
			 )