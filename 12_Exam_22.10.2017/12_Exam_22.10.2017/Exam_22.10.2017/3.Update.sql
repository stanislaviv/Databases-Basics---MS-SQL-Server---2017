UPDATE Reports
SET StatusId = 2
WHERE StatusId = 1 AND CategoryId =4

SELECT * FROM Reports
OrDER BY StatusId, CategoryId

SELECT * FROM Status
SELECT * FROM Categories