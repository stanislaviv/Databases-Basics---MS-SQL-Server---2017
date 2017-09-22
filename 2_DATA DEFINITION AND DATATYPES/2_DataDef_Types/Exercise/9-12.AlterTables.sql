--task 9
ALTER TABLE Users
DROP CONSTRAINT [PK__Users__3214EC075ADEAC1B]

ALTER TABLE Users
ADD CONSTRAINT PK_Users PRIMARY KEY (Id,Username)

--task 10
ALTER TABLE Users
ADD CONSTRAINT CHK_PassLen_5symbols CHECK (LEN(Password) >= 5)

--task 11
ALTER TABLE Users
ADD CONSTRAINT DF_CurrentTime DEFAULT GETDATE() for LastLoginTime
--ADD DEFAULT GETDATE() for LastLoginTime

--task 12 - remove double constraint
ALTER TABLE Users
DROP CONSTRAINT PK_Users

--task 12 - ID  - Primary key
ALTER TABLE Users
ADD CONSTRAINT PK_Id PRIMARY KEY(Id)

--task -12 - add constraint - check Username lenght
ALTER TABLE Users
ADD CONSTRAINT Username_min_size CHECK (LEN(Username)>=3)

