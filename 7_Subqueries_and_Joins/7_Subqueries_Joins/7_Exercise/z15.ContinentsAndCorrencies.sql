WITH UsageCount_CTE (ContinentCode,CurrencyCode,CurrencyUsage) AS 
(

		SELECT ContinentCode,CurrencyCode, COUNT(CountryCode) AS [CurrencyUsage]
		  FROM Countries 
		GROUP BY ContinentCode,CurrencyCode
		HAVING COUNT(CountryCode) > 1
)

SELECT   UsageCountMax.ContinentCode,
		 ucCTE.CurrencyCode,
		 UsageCountMax.CurrencyUsage
		    FROM 
				(SELECT ContinentCode, MAX(CurrencyUSage) AS [CurrencyUsage]
				   FROM UsageCount_CTE
				 GROUP BY ContinentCode) AS UsageCountMax

JOIN UsageCount_CTE AS ucCTE
ON ucCTE.ContinentCode = UsageCountMax.ContinentCode 
AND ucCTE.CurrencyUsage = UsageCountMax.CurrencyUsage



