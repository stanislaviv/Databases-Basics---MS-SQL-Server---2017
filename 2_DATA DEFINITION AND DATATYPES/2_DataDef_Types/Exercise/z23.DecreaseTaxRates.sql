USE Hotels

UPDATE Payments SET TaxRate = TaxRate - 0.03*TaxRate
SELECT TaxRate FROM Payments