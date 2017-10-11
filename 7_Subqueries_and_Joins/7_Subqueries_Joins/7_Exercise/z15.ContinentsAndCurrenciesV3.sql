SELECT ContinentCode,CurrencyCode,CurrencyUsage
  FROM

		 (SELECT ContinentCode,CurrencyCode,CurrencyUsage,
			DENSE_RANK() OVER (PARTITION BY(ContinentCode) 
				   		 ORDER BY CurrencyUsage DESC) AS [Rank]

				FROM (SELECT	ContinentCode,
						CurrencyCode, 
						COUNT(CurrencyCode) AS [CurrencyUsage]
				  FROM		Countries
				GROUP BY	CurrencyCode,ContinentCode
				HAVING		COUNT(CurrencyCode) >1 ) AS currencies) AS RankedCurrencies

WHERE [Rank] = 1
ORDER BY ContinentCode
		