CREATE DATABASE Libraries
USE Libraries

/*-------------------------------------------------------------------------------
--- Check to see if each table exists, Creating and replacing for the database---
---------------------------------------------------------------------------------*/

DROP TABLE Library_Branch 
DROP TABLE Book_Loans
DROP TABLE Books
DROP TABLE Publisher
DROP TABLE Borrower
DROP TABLE Book_Authors
DROP TABLE Book_Copies

	CREATE TABLE Library_Branch (
		BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		BranchName VARCHAR(50) NOT NULL,
		Address VARCHAR(50) NOT NULL
	);
	INSERT INTO Library_Branch 
	(BranchName, Address)
	VALUES
	('Sharpstown', '55 cherry Lane,Shapstown Utah'),
	('Central','10 Center St, Portland Oregon'),
	('Murray','2100 Mortimer Lane, Oregon'),
	('Eugene','43 E Bookgiver Ave, Oregon')
	;

	CREATE TABLE Publisher (
		PublisherID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
		PublisherName VARCHAR(50) NOT NULL,
		Address VARCHAR(50) NOT NULL,
		Phone VARCHAR(15)
	);
	INSERT INTO Publisher 
	(PublisherName, Address, Phone)
	VALUES
	('Simon & Schuster', '9994 SW. 1st Court Venice, FL', '936-246-9854'),
	('Henry Holt & Company', '306 James Lane Titusville FL', '847-459-6706'),
	('Simon & Brown', '995 E Middle River St Saginaw, MI', '374-390-0037'),
	('New American Library', '12 Saxon St Land O Lakes, FL', '821-913-8063'),
	('Harper & Brothers', '526 Spruce Road Middle River, MD', '245-436-9591'),
	('Pierre-Jules-Hetzel', '85 GreenView St Wadsworth, OH', '371-640-6836'),
	('Bantam Books', '287 Lyme Rd Westminster, MD', '813-372-9158'),
	('Gearge Allen & Unwin', '7895 Myers Street Bronx, NY', '307-362-6009'),
	('Geoffrey Bles', '898 East Carson St. Soddy Daisy, TN', '693-688-7108')

;

	CREATE TABLE Books (
		BookID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
		Title VARCHAR(50) NOT NULL,
		PublisherID INT NOT NULL CONSTRAINT fk_publisherid FOREIGN KEY REFERENCES Publisher(PublisherID) ON UPDATE CASCADE ON DELETE CASCADE,
	);
	INSERT INTO Books 
	(Title, PublisherID)
	VALUES
	('IT', 1),
	('The Dark Tower',1),						('Fire & Blood', 7 ),
	('The Lost Tribe', 2),					('The Fellowship of the Ring', 8),
	('White Fang',3),							('The Lion, the Witch, and the Wardrobe', 9),
	('Death Masks', 4),					('The Two Towers', 8),
	('Summer Night', 4),					('The Return of The King', 8),
	('Dead Beat', 4),						('Prince Caspian', 9),
	('Captains Fury', 4),					('The Voyage of the Dawn Treader', 9),
	('Moby Dick', 5),							('The Silver Chair', 9),
	('20000 Leagues Under the Sea', 6 ),	('A Daughter of the Snows', 3),
	('Frankenstein', 1),						('The Call of the Wild', 3),
	('Furies of Calgeron', 4),				('The Game', 3)
;
	
	CREATE TABLE Borrower (
		CardNo int NOT NULL PRIMARY KEY IDENTITY (100000,1),
		Name VARCHAR(25) NOT NULL,
		Address VARCHAR(50) NOT NULL,
		Phone VARCHAR(12) NOT NULL
	);
	INSERT INTO Borrower
	(Name, Address,Phone)
	VALUES
	('Jandice','28 Potters Lane', '555-345-1873'),
	('Jill','6 Leeton Ridge Ave.', '555-345-1873'),
	('Jack','8439 Bridgeton Street', '555-345-1873'),
	('William','542 Maple Street', '555-345-1873'),
	('Bret','722 Beech Lane', '555-345-1873'),
	('Vladimir','84677 Border Street', '555-345-1873'),
	('Robert','86 East Ridgeview Street', '555-345-1873'),
	('Jared','548 Rockwell Street', '555-345-1873')
	;
	
	CREATE TABLE Book_Authors (
		BookID Int Constraint fk_BookId
		FOREIGN KEY REFERENCES Books(BookID)
		ON UPDATE CASCADE ON DELETE CASCADE,
		AuthorName VARCHAR(50) NOT NULL
	);
	INSERT INTO Book_Authors 
	(BookID, AuthorName)
	VALUES
		
		(4, 'Jack London'),				(21, 'Jack London'),
		(22, 'Jack London'),			(23, 'Jack London'),
		(3, 'Mark Lee'),				(11, 'Mary Shelly'),
		(5, 'Jim Butcher'),				(6, 'Jim Butcher'),
		(7, 'Jim Butcher'),				(8, 'Jim Butcher'),
		(12, 'Jim Butcher'),			(9, 'Herman Melville'),
		(10, 'Jules Verne'),			(13, 'George R.R. Martin'),
		(14, 'J. R. R. Tolkein'),		(16, 'J. R. R. Tolkein'),
		(17, 'J. R. R. Tolkein'),		(15, 'C. S. Lewis'),
		(18, 'C. S. Lewis'),			(19, 'C. S. Lewis'),
		(20, 'C. S. Lewis'),			(1,'Stephen King'),
		(2,'Stephen King')
;
	
	CREATE TABLE Book_Loans (
		BookID INT NOT NULL	CONSTRAINT fk_bookLoans_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL CONSTRAINT fk_BranchID Foreign KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		CardNo int NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		DateOut Date NOT NULL,
		DateDue DATE NOT NULL,
	);
	         

INSERT INTO Book_Loans 
	(BookID,BranchID,CardNo,DateOut, DateDue)
	VALUES
		(1,1,100001,'2020-1-1','2020-2-1'),			(7,2,100002,'2020-1-13','2020-2-13'),
		(2,1,100001,'2020-1-1','2020-2-1'),			(8,2,100002,'2020-1-13','2020-2-13'),
		(3,2,100002,'2020-1-1','2020-2-1'),			(9,2,100002,'2020-1-18','2020-2-18'),
		(4,2,100002,'2020-1-1','2020-2-1'),			(10,3,100003,'2020-1-18','2020-2-18'),
		(5,3,100003,'2020-1-1','2020-2-1'),			(11,3,100003,'2020-1-15','2020-2-15'),
		(6,3,100003,'2020-1-1','2020-2-1'),			(12,4,100004,'2020-1-15','2020-2-15'),
		(7,4,100004,'2020-1-1','2020-2-1'),			(13,1,100001,'2020-1-12','2020-2-12'),
		(8,4,100004,'2020-1-1','2020-2-1'),			(14,2,100002,'2020-1-12','2020-2-12'),
		(9,1,100001,'2020-1-1','2020-2-1'),			(15,3,100003,'2020-1-11','2020-2-11'),
		(10,2,100002,'2020-1-1','2020-2-1'),		(16,4,100004,'2020-1-18','2020-2-18'),
		(11,3,100003,'2020-1-1','2020-2-1'),		(17,1,100005,'2019-1-1','2019-2-1'),
		(12,4,100004,'2020-1-1','2020-2-1'),		(18,1,100005,'2020-1-17','2020-2-17'),
		(13,1,100005,'2020-1-1','2020-2-1'),		(19,2,100002,'2020-1-15','2020-2-15'),
		(14,2,100006,'2020-1-1','2020-2-1'),		(20,2,100002,'2020-1-13','2020-2-13'),
		(15,2,100006,'2020-1-1','2020-2-1'),		(1,3,100003,'2020-1-11','2020-2-11'),
		(16,3,100003,'2020-1-1','2020-2-1'),		(2,3,100003,'2020-1-15','2020-2-15'),
		(17,3,100003,'2020-1-1','2020-2-1'),		(3,4,100004,'2020-1-17','2020-2-17'),
		(18,3,100003,'2020-1-5','2020-2-5'),		(4,4,100004,'2020-1-18','2020-2-18'),
		(19,4,100004,'2020-1-5','2020-2-5'),		(5,1,100001,'2020-1-1','2020-1-1'),
		(20,4,100004,'2020-1-5','2020-2-5'),		(6,2,100002,'2020-1-1','2020-1-1'),
		(1,4,100004,'2020-1-5','2020-2-5'),			(7,3,100007,'2020-1-1','2020-1-1'),
		(2,4,100004,'2020-1-10','2020-2-10'),		(8,4,100004,'2020-1-1','2020-1-1'),
		(3,1,100001,'2020-1-10','2020-2-10'),		(9,1,100001,'2020-1-1','2020-1-1'),
		(4,1,100001,'2020-1-10','2020-2-10'),		(10,2,100002,'2020-1-1','2020-1-1'),
		(5,1,100001,'2020-1-10','2020-2-10'),		(11,3,100003,'2020-1-1','2020-1-1'),
		(6,1,100001,'2020-1-13','2020-2-13'),		(12,4,100004,'2020-1-1','2020-1-1')
;
	
	CREATE TABLE Book_Copies (
		BookID INT NOT NULL CONSTRAINT fk_BookCopies_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL CONSTRAINT fk_BookCopies_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		Number_Of_Copies INT NOT NULL
	);
	
INSERT INTO Book_Copies 
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(1,1,3),(1,2,3),(1,3,3),(1,4,3),
	(2,1,3),(2,2,3),(2,3,3),(2,4,3),
	(3,1,3),(3,2,3),(3,3,3),(3,4,3),
	(4,1,3),(4,2,3),(4,3,3),(4,4,3),
	(5,1,3),(5,2,3),(5,3,3),(5,4,3),
	(6,1,3),(6,2,3),(6,3,3),(6,4,3),
	(7,1,3),(7,2,3),(7,3,3),(7,4,3),
	(8,1,3),(8,2,3),(8,3,3),(8,4,3),
	(9,1,3),(9,2,3),(9,3,3),(9,4,3),
	(10,1,3),(10,2,3),(10,3,3),(10,4,3),
	(11,1,3),(11,2,3),(11,3,3),(11,4,3),
	(12,1,3),(12,2,3),(12,3,3),(12,4,3),
	(13,1,3),(13,2,3),(13,3,3),(13,4,3),
	(14,1,3),(14,2,3),(14,3,3),(14,4,3),
	(15,1,3),(15,2,3),(15,3,3),(15,4,3),
	(16,1,3),(16,2,3),(16,3,3),(16,4,3),
	(17,1,3),(17,2,3),(17,3,3),(17,4,3),
	(18,1,3),(18,2,3),(18,3,3),(18,4,3),
	(19,1,3),(19,2,3),(19,3,3),(19,4,3),
	(20,1,3),(20,2,3),(20,3,3),(20,4,3)
;







/*-----------------------------------------------------------------------------
------------------------------PROCEDURES---------------------------------------
-----------------------------------------------------------------------------*/

CREATE PROCEDURE dbo.GetLastTribeinSharpstown
AS
SELECT a1.Number_Of_Copies FROM Book_Copies a1 
	INNER JOIN Books a2 ON a2.BookID = a1.BookID
	INNER JOIN Library_Branch a3 ON a3.BranchID = a1.BranchID
WHERE a2.Title = 'The Lost Tribe' AND a3.BranchName = 'Sharpstown'
GO

CREATE PROCEDURE dbo.FindLostTribe
AS
	SELECT a1.Number_Of_Copies FROM Book_Copies a1 
	INNER JOIN Books a2 ON a2.BookID = a1.BookID
	INNER JOIN Library_Branch a3 ON a3.BranchID = a1.BranchID
	WHERE a2.Title = 'The Lost Tribe'
GO
CREATE PROCEDURE dbo.ReturnIdleBorrower
AS
	SELECT Name FROM Borrower WHERE CardNo NOT IN (SELECT CardNo FROM Book_Loans );
GO
CREATE PROCEDURE dbo.SharpstownGetPastDue
AS
	SELECT a3.Title, a2.Name, a2.Address From Book_Loans a1
	INNER JOIN Books a3 ON a3.BookID = a1.BookID
	INNER JOIN Borrower a2 ON a2.CardNo = a1.CardNo
	INNER JOIN Library_Branch a4 ON a4.BranchID = a1.BranchID
	WHERE a1.DateOut = GETDATE()
GO
	

CREATE PROCEDURE dbo.GetLoanedBooksByBranch
AS
Select COUNT(a1.BookID) AS 'Loaned Books', a2.BranchName FROM Book_Loans a1 
	INNER JOIN Library_Branch a2 ON a2.BranchID = a1.BranchID
	 Group BY a2.BranchName
GO
CREATE PROCEDURE dbo.ReturnVIPBorrower
AS
SELECT	a1.Name FROM Borrower a1, Book_Loans a2
WHERE a1.CardNo = a2.CardNo
GROUP BY a1.Name
Having COUNT(*)>5;
GO

CREATE PROCEDURE dbo.ReturnCentralStephenKingBooks
AS
SELECT a1.Number_of_Copies, a2.title FROM Book_Copies a1
	INNER JOIN Books a2 ON a2.BookID = a1.BookID
	INNER JOIN Library_Branch a3 ON a3.BranchID = a1.BranchID
	Inner JOIN Book_Authors a4 ON a4.BookID = a1.BookID
	WHERE a4.AuthorName = 'stephen king' AND a3.BranchName = 'Central'
GO
