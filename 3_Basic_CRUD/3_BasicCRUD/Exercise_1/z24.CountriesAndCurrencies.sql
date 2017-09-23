SELECT CountryName,CountryCode,
       IIF(CurrencyCode='EUR','Euro','Not Euro')
 FROM Countries
 ORDER BY CountryName ASC