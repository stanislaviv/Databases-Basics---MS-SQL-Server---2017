CREATE TABLE Majors
	(
		MajorID INT PRIMARY KEY IDENTITY,
		[Name] VARCHAR(50)
	)

CREATE TABLE Subjects
	(
		SubjectID INT PRIMARY KEY IDENTITY,
		SubjectName VARCHAR(50) NOT NULL
	)

CREATE TABLE Students
	(
		StudentID INT PRIMARY KEY IDENTITY,
		StudentNumber INT UNIQUE NOT NULL,
		StudentName VARCHAR(50) NOT NULL,
		MajorID INT,
		CONSTRAINT FK_Student_Major FOREIGN KEY (MajorID) REFERENCES Majors(MajorID)
	) 

CREATE TABLE Payments
	(
		PaymentID INT PRIMARY KEY IDENTITY,
		PaymentDate DATE NOT NULL,
		PaymentAmount DECIMAL(15,2) NOT NULL,
		StudentID INT,
		CONSTRAINT FK_Payment_Stuent FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
	)

CREATE TABLE Agenda
	(
		StudentID INT,
		SubjectID INT,
		CONSTRAINT FK_Agenda_Student FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
		CONSTRAINT FK_Agenda_Subject FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID),
		CONSTRAINT PK_StudentID_SubjectID PRIMARY KEY (StudentID,SubjectID)
	)
