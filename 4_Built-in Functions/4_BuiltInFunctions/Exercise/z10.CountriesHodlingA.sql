USE Geography
SELECT CountryName, IsoCode 
FROM Countries
WHERE LEN(CountryName) - LEN(REPLACE(CountryName, 'a', '')) >= 3
--WHERE CountryName LIKE '%A%A%A%'
ORDER BY IsoCode