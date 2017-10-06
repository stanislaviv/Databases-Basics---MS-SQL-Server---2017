CREATE TABLE Teachers
(
TeacherID int NOT NULL,
Name varchar(50),
ManagerID int
)

INSERT INTO Teachers(TeacherID, Name, ManagerID)
VALUES
(101, 'John', NULL),
(102, 'Maya', 106),
(103, 'Silvia', 106),
(104, 'Ted', 105),
(105, 'Mark', 101),
(106, 'Greta', 101)

ALTER TABLE Teachers
ADD CONSTRAINT PK_Teachers PRIMARY KEY(TeacherID)

ALTER TABLE Teachers
ADD CONSTRAINT FK_Teacher_Manager FOREIGN KEY (ManagerID) 
REFERENCES Teachers(TeacherID)