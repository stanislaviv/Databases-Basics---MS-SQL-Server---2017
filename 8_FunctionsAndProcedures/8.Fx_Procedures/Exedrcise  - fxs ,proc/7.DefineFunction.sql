CREATE FUNCTION ufn_IsWordComprised(@setOfLetters varchar(max), @word varchar(max))
RETURNS BIT
AS
BEGIN
	DECLARE @currentIndex int = 1;

	WHILE(@currentIndex <= LEN(@word))
		BEGIN

			DECLARE @currentLetter varchar(1) = SUBSTRING(@word, @currentIndex, 1);

				IF(CHARINDEX(@currentLetter, @setOfLetters)) = 0
					BEGIN
						RETURN 0;
					END

			SET @currentIndex += 1;
		END

	RETURN 1;
END


--testing - do not Submit in Judge

CREATE TABLE Testing (SetOfLetters varchar(max), Word varchar(max))
GO  -- DO NOT SUBMIT IN JUDGE "Go"

INSERT INTO Testing VALUES 
  ('oistmiahf', 'Sofia'), ('oistmiahf', 'halves'), ('bobr', 'Rob'), ('pppp', 'Guy')
GO  -- DO NOT SUBMIT IN JUDGE "Go"

SELECT SetOfLetters, Word,
  dbo.ufn_IsWordComprised(SetOfLetters, Word) AS Result
FROM Testing