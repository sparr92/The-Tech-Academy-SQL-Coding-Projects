USE master
CREATE DATABASE db_LibraryMgmtSys
	GO
USE db_LibraryMgmtSys

CREATE TABLE LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
);

CREATE TABLE PUBLISHER (
	PublisherName VARCHAR(200) PRIMARY KEY NOT NULL,
	Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(100) NOT NULL
);

CREATE TABLE BOOKS (
	BookID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Title VARCHAR(100) UNIQUE,
	PublisherName VARCHAR(200) NOT NULL,
	CONSTRAINT fk_PublisherName FOREIGN KEY (PublisherName)
	REFERENCES PUBLISHER(PublisherName)
);

CREATE TABLE BORROWER (
	Name VARCHAR(50) NOT NULL,
	CardNo INT PRIMARY KEY NOT NULL,
	Address VARCHAR(75) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE BOOK_COPIES (
	BookID VARCHAR(100) FOREIGN KEY REFERENCES BOOKS(Title),
	BranchID INT NOT NULL,
	Number_Of_Copies INT NOT NULL,
	CONSTRAINT fk_BcBranchID FOREIGN KEY (BranchID)
	REFERENCES LIBRARY_BRANCH(BranchID)
);

CREATE TABLE BOOK_LOANS (
	BookID VARCHAR(100) FOREIGN KEY REFERENCES BOOKS(Title),
	BranchID INT NOT NULL,
	CardNo INT NOT NULL,
	DateOut DATE,
	DateDue DATE,
	CONSTRAINT fk_BlBranchID FOREIGN KEY (BranchID)
	REFERENCES LIBRARY_BRANCH(BranchID),
	CONSTRAINT fk_CardNo FOREIGN KEY (CardNo)
	REFERENCES BORROWER(CardNo)
);

CREATE TABLE BOOK_AUTHORS (
	BookID INT NOT NULL,
	AuthorName VARCHAR(50) NOT NULL,
	CONSTRAINT fk_BaBookID FOREIGN KEY (BookID)
	REFERENCES BOOKS (BookID)
);

INSERT INTO LIBRARY_BRANCH
	(BranchName, Address)
	VALUES
	('Sharpstown', '111 Mathewson St'),
	('Central', '150 Empire St'),
	('Rochambeau', '708 Hope St'),
	('Athenaeum', '251 Benefit St')
;

INSERT INTO PUBLISHER
	(PublisherName, Address, Phone)
	VALUES
	('CreateSpace Independent Publishing', '410 Terry Ave', '(206) 266-1000'),
	('HarperCollins Publishers', '195 Broadway', '(212) 207-7000'),
	('Knopf Doubleday Publishing Group', '1745 Broadway', '(718) 413-8769'),
	('Penguin Random House', '405 Murray Hill Pkwy', '(201) 933-9292'),
	('Routledge Publishing', '711 3rd Ave', '(212) 216-7800'),
	('Seven Stories Press', '140 Watts Street', '(212) 226-8760')
;

INSERT INTO BOOKS
	(Title, PublisherName)
	VALUES
	('Ansichten eines Clowns', 'Routledge Publishing'),
	('Are Prisons Obsolete?', 'Seven Stories Press'),
	('Atemschaukel', 'Penguin Random House'),
	('Autobiography of Red', 'Knopf Doubleday Publishing Group'),
	('Beyond Female Masochism', 'Penguin Random House'),
	('Bloodchild and Other Stories', 'Seven Stories Press'),
	('Carrie', 'Knopf Doubleday Publishing Group'),
	('Day In Day Out: A Novel', 'HarperCollins Publishers'),
	('The Dead Zone', 'Penguin Random House'),
	('The Dispossessed', 'HarperCollins Publishers'),
	('Frankenstein; Or, The Modern Prometheus', 'Penguin Random House'),
	('Gender Trouble', 'Routledge Publishing'),
	('Kafka on the Shore', 'Penguin Random House'),
	('Kein Ort. Nirgends', 'Knopf Doubleday Publishing Group'),
	('Living My Life', 'Knopf Doubleday Publishing Group'),
	('The Lost Tribe', 'CreateSpace Independent Publishing'),
	('Lysistrata', 'HarperCollins Publishers'),
	('Mother Night', 'Penguin Random House'),
	('NW', 'Penguin Random House'),
	('On Beauty', 'Penguin Random House'),
	('Poems', 'Penguin Random House'),
	('Reel to Real: Race, Sex and Class at the Movies', 'Routledge Publishing'),
	('The Second Sex', 'Knopf Doubleday Publishing Group'),
	('V', 'HarperCollins Publishers'),
	('The Virgin of Flames', 'Penguin Random House')
;

INSERT INTO BORROWER
	(Name, CardNo, Address, Phone)
	VALUES
	('Arendt, Johanna', '14074321', '370 Riverside Drive', '(212) 864-6410'),
	('Ballion, Susan Janet', '18670455', '140 E 14th St', '(212) 992-8500'),
	('Basquiat, Jean-Michel', '19140032', '456 North Camden Dr', '(310) 271-9400'),
	('Blochman, Lawrence', '19548064', '370 Riverside Drive', '(212) 864-6410'),
	('Drake, Nicholas Rodney', '20157934', '112 Haverstock Hill', '+44 20 7586 6746'),
	('Elliott-Said, Marianne Joan', '20459288', '118 High St', '+44 20 3285 6000'),
	('Hagen, Catherine', '34307231', 'Grainauer Str. 11', '+49 (0)30-215 74 30'),
	('Lovecraft, Howard Phillips', '36889046', '585 Blackstone Blvd', '(401) 272-1314'),
	('Murphy, Peter', '42703425', 'Knesebeckstraße 1-2', '+49 30 2540020'),
	('Nurmi, Maila', '55089233', '6000 Santa Monica Blvd', '(323) 469-1181'),
	('Parr, Sarah', '59332268', '939 SW Morrison St', '(503) 290-5362'),
	('Peterson, Cassandra', '67358352',  '325 N Larchmont Blvd #313', '(323) 666-5050'),
	('Rooke, Pamela', '71259051', '430 Kings Road', '+44 20 7352 6551'),
	('Sperber, Klaus', '81853079', '666 5th Ave', '(800) 282-2882')
;

INSERT INTO BOOK_COPIES
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	('Ansichten eines Clowns', '2', '2'),
	('Ansichten eines Clowns', '3', '1'),
	('Ansichten eines Clowns', '4', '2'),
	('Are Prisons Obsolete?', '2', '3'),
	('Are Prisons Obsolete?', '3', '1'),
	('Atemschaukel', '2', '2'),
	('Atemschaukel', '4', '1'),
	('Autobiography of Red', '2', '2'),
	('Autobiography of Red', '3', '1'),
	('Autobiography of Red', '4', '1'),
	('Beyond Female Masochism', '2', '2'),
	('Beyond Female Masochism', '4', '1'),
	('Bloodchild and Other Stories', '1', '2'),
	('Bloodchild and Other Stories', '2', '3'),
	('Bloodchild and Other Stories', '3', '2'),
	('Bloodchild and Other Stories', '4', '1'),
	('Carrie', '1', '3'),
	('Carrie', '2', '6'),
	('Carrie', '3', '3'),
	('Carrie', '4', '2'),
	('Day In Day Out: A Novel', '2', '2'),
	('Day In Day Out: A Novel', '4', '1'),
	('The Dead Zone', '1', '2'),
	('The Dead Zone', '2', '4'),
	('The Dead Zone', '3', '3'),
	('The Dead Zone', '4', '1'),
	('The Dispossessed', '1', '2'),
	('The Dispossessed', '2', '4'),
	('The Dispossessed', '3', '3'),
	('The Dispossessed', '4', '1'),
	('Frankenstein; Or, The Modern Prometheus', '1', '3'),
	('Frankenstein; Or, The Modern Prometheus', '2', '4'),
	('Frankenstein; Or, The Modern Prometheus', '3', '3'),
	('Frankenstein; Or, The Modern Prometheus', '4', '2'),
	('Gender Trouble', '2', '2'),
	('Gender Trouble', '3', '1'),
	('Kafka on the Shore', '1', '2'),
	('Kafka on the Shore', '2', '3'),
	('Kafka on the Shore', '3', '2'),
	('Kafka on the Shore', '4', '2'),
	('Kein Ort. Nirgends', '2', '2'),
	('Kein Ort. Nirgends', '4', '1'),
	('Living My Life', '2', '2'),
	('Living My Life', '4', '2'),
	('The Lost Tribe', '1', '2'),
	('The Lost Tribe', '2', '1'),
	('The Lost Tribe', '3', '1'),
	('Lysistrata', '2', '3'),
	('Lysistrata', '3', '1'),
	('Lysistrata', '4', '1'),
	('Mother Night', '1', '2'),
	('Mother Night', '2', '4'),
	('Mother Night', '3', '2'),
	('Mother Night', '4', '1'),
	('NW', '1', '2'),
	('NW', '2', '4'),
	('NW', '3', '2'),
	('NW', '4', '1'),
	('On Beauty', '1', '2'),
	('On Beauty', '2', '3'),
	('On Beauty', '3', '2'),
	('On Beauty', '4', '1'),
	('Poems', '1', '1'),
	('Poems', '2', '2'),
	('Poems', '3', '2'),
	('Poems', '4', '2'),
	('Reel to Real: Race, Sex and Class at the Movies', '2', '3'),
	('Reel to Real: Race, Sex and Class at the Movies', '3', '1'),
	('The Second Sex', '1', '1'),
	('The Second Sex', '2', '3'),
	('The Second Sex', '3', '2'),
	('The Second Sex', '4', '2'),
	('V', '2', '3'),
	('V', '3', '2'),
	('V', '4', '3'),
	('The Virgin of Flames', '2', '2'),
	('The Virgin of Flames', '3', '1')
;
	
INSERT INTO BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	('Ansichten eines Clowns', '2', '14074321', '2019-07-15', '2019-09-15'), /* Borr.: Arendt*/
	('Ansichten eines Clowns', '4', '34307231', '2019-06-12', '2019-08-12'), /* Borr.: Hagen*/
	('Ansichten eines Clowns', '4', '81853079', '2019-06-07', '2019-08-07'), /* Borr.: Klaus*/
	('Are Prisons Obsolete?', '2', '14074321', '2019-07-15', '2019-09-15'),  /* Borr.: Arendt*/
	('Are Prisons Obsolete?', '2', '19140032', '2019-05-27', '2019-07-27'),  /* Borr.: Basq.*/
	('Atemschaukel', '2', '14074321', '2019-07-15', '2019-09-15'),  /* Borr.: Arendt*/
	('Atemschaukel', '2', '81853079', '2019-06-07', '2019-08-07'), /* Borr.: Klaus*/
	('Autobiography of Red', '2', '14074321', '2019-07-15', '2019-09-15'),  /* Borr.: Arendt*/
	('Autobiography of Red', '4', '18670455', '2019-06-27', '2019-08-27'), /* Borr.: Sioux*/
	('Beyond Female Masochism', '2', '14074321', '2019-07-15', '2019-09-15'),  /* Borr.: Arendt*/
	('Beyond Female Masochism', '4', '81853079', '2019-06-07', '2019-08-07'), /* Borr.: Klaus*/
	('Bloodchild and Other Stories', '2', '34307231', '2019-06-12', '2019-08-12'), /* Borr.: Hagen*/
	('Bloodchild and Other Stories', '4', '36889046', '2019-06-10', '2019-08-10'), /* Borr.: HP*/
	('Carrie', '1', '19548064', '2019-05-26', '2019-07-26'), /* Borr.: Bloch.*/
	('Carrie', '4', '36889046', '2019-06-10', '2019-08-10'), /* Borr.: HP*/
	('Day In Day Out: A Novel', '2', '14074321', '2019-07-15', '2019-09-15'),  /* Borr.: Arendt*/
	('Day In Day Out: A Novel', '2', '34307231', '2019-06-12', '2019-08-12'), /* Borr.: Hagen*/
	('Day In Day Out: A Novel', '4', '81853079', '2019-06-07', '2019-08-07'), /* Borr.: Klaus*/
	('The Dead Zone', '1', '19548064', '2019-05-26', '2019-07-26'), /* Borr.: Bloch.*/
	('The Dead Zone', '4', '36889046', '2019-06-10', '2019-08-10'),  /* Borr.: HP*/
	('The Dispossessed', '2', '34307231', '2019-06-12', '2019-08-12'), /* Borr.: Hagen*/
	('The Dispossessed', '3', '20459288', '2019-07-18', '2019-09-18'), /* Borr.: Poly*/
	('Frankenstein; Or, The Modern Prometheus', '4', '36889046', '2019-06-10', '2019-08-10'), /* Borr.: HP*/
	('Frankenstein; Or, The Modern Prometheus', '4', '42703425', '2019-07-10', '2019-09-10'), /* Borr.: Murph.*/
	('Frankenstein; Or, The Modern Prometheus', '3', '67358352', '2019-06-22', '2019-08-22'),  /* Borr.: Elv.*/
	('Gender Trouble', '2', '14074321', '2019-07-15', '2019-09-15'),  /* Borr.: Arendt*/
	('Kafka on the Shore', '4', '18670455', '2019-06-27', '2019-08-27'), /* Borr.: Sioux*/
	('Kafka on the Shore', '3', '20157934', '2019-07-03', '2019-09-03'), /* Borr.: Drake*/
	('Kafka on the Shore', '4', '81853079', '2019-06-07', '2019-08-07'), /* Borr.: Klaus*/
	('Kein Ort. Nirgends', '2', '14074321', '2019-07-15', '2019-09-15'),  /* Borr.: Arendt*/
	('Kein Ort. Nirgends', '2', '34307231', '2019-06-12', '2019-08-12'), /* Borr.: Hagen*/
	('Living My Life', '2', '14074321', '2019-07-15', '2019-09-15'),  /* Borr.: Arendt*/
	('Living My Life', '2', '19140032', '2019-05-27', '2019-07-27'), /* Borr.: Basq.*/
	('The Lost Tribe', '2', '14074321', '2019-07-15', '2019-09-15'),  /* Borr.: Arendt*/
	('Lysistrata', '2', '14074321', '2019-07-15', '2019-09-15'),  /* Borr.: Arendt*/
	('Lysistrata', '3', '20459288', '2019-07-18', '2019-09-18'), /* Borr.: Poly*/
	('Lysistrata', '2', '55089233', '2019-05-28', '2019-07-28'), /* Borr.: Vamp.*/
	('Mother Night', '3', '18670455', '2019-06-27', '2019-08-27'), /* Borr.: Sioux*/
	('Mother Night', '3', '67358352', '2019-06-22', '2019-08-22'), /* Borr.: Elv.*/
	('Mother Night', '1', '71259051', '2019-05-30', '2019-07-30'), /* Borr.: Jord.*/
	('NW', '3', '20157934', '2019-07-03', '2019-09-03'), /* Borr.: Drake*/
	('NW', '3', '20459288', '2019-07-18', '2019-09-18'), /* Borr.: Poly*/
	('NW', '4', '34307231', '2019-06-12', '2019-08-12'), /* Borr.: Hagen*/
	('On Beauty', '2', '14074321', '2019-07-15', '2019-09-15'),  /* Borr.: Arendt*/
	('On Beauty', '2', '19140032', '2019-05-27', '2019-07-27'), /* Borr.: Basq.*/
	('On Beauty', '3', '20459288', '2019-07-18', '2019-09-18'), /* Borr.: Poly*/
	('Poems', '3', '18670455', '2019-06-27', '2019-08-27'), /* Borr.: Sioux*/
	('Poems', '3', '20157934', '2019-07-03', '2019-09-03'), /* Borr.: Drake*/
	('Poems', '4', '42703425', '2019-07-10', '2019-09-10'), /* Borr.: Murph.*/
	('Poems', '2', '55089233', '2019-05-28', '2019-07-28'), /* Borr.: Vamp.*/
	('Poems', '4', '81853079', '2019-06-07', '2019-08-07'), /* Borr.: Klaus*/
	('Reel to Real: Race, Sex and Class at the Movies', '2', '19140032', '2019-05-27', '2019-07-27'), /* Borr.: Basq.*/
	('The Second Sex', '2', '14074321', '2019-07-15', '2019-09-15'),  /* Borr.: Arendt*/
	('The Second Sex', '3', '20459288', '2019-07-18', '2019-09-18'), /* Borr.: Poly*/
	('The Second Sex', '2', '34307231', '2019-06-12', '2019-08-12'), /* Borr.: Hagen*/
	('V', '2', '19140032', '2019-05-27', '2019-07-27'),  /* Borr.: Basq.*/
	('V', '3', '20157934', '2019-07-03', '2019-09-03'), /* Borr.: Drake*/
	('V', '3', '67358352', '2019-06-22', '2019-08-22'),  /* Borr.: Elv.*/
	('V', '2', '71259051', '2019-05-30', '2019-07-30'),  /* Borr.: Jord.*/
	('The Virgin of Flames', '2', '19140032', '2019-05-27', '2019-07-27'), /* Borr.: Basq.*/
	('The Virgin of Flames', '3', '20157934', '2019-07-03', '2019-09-03') /* Borr.: Drake*/
;

INSERT INTO BOOK_AUTHORS
	(BookID, AuthorName)
	VALUES
	('1', 'Böll, Heinrich'),
	('2', 'Davis, Angela'),
	('3', 'Müller, Herta'),
	('4', 'Carson, Anne'),
	('5', 'Haug, Frigga'),
	('6', 'Butler, Octavia'),
	('7', 'King, Stephen'),
	('8', 'Mora, Terezia'),
	('9', 'King, Stephen'),
	('10', 'Le Guin, Ursula'),
	('11', 'Shelley, Mary'),
	('12', 'Butler, Judith'),
	('13', 'Murakami, Haruki'),
	('14', 'Wolf, Christa'),
	('15', 'Goldman, Emma'),
	('16', 'Caldwell, Matthew'),
	('17', 'Aristophanes'),
	('18', 'Vonnegut, Kurt'),
	('19', 'Smith, Zadie'),
	('20', 'Smith, Zadie'),
	('21', 'Bishop, Elizabeth'),
	('22', 'hooks, bell'),
	('23', 'Beauvoir, Simone de'),
	('24', 'Pynchon, Thomas'),
	('25', 'Abani, Chris')
;




/* 1.*/
SELECT
	c.BookID, c.Number_Of_Copies, l.BranchName
FROM BOOK_COPIES c
LEFT JOIN BOOKS b ON c.BookID = b.Title
INNER JOIN LIBRARY_BRANCH l ON c.BranchID = l.BranchID
WHERE c.BookID = 'The Lost Tribe' AND l.BranchName = 'Sharpstown'
;

/* 2.*/
SELECT
	l.BranchName, c.BookID, c.Number_Of_Copies
FROM BOOK_COPIES c
LEFT JOIN BOOKS b ON c.BookID = b.Title
INNER JOIN LIBRARY_BRANCH l ON c.BranchID = l.BranchID
WHERE c.BookID = 'The Lost Tribe'
;

/* 3.*/
SELECT Name FROM BORROWER b
WHERE NOT EXISTS (
	SELECT * FROM BOOK_LOANS l
		WHERE b.CardNo = l.CardNo
);

/* 4.*/
SELECT
	lb.BranchID, lb.BranchName,
	bl.CardNo, bl.BookID
	Name, b.Address
FROM LIBRARY_BRANCH lb
INNER JOIN BOOK_LOANS bl ON lb.BranchID = bl.BranchID
INNER JOIN BORROWER b ON bl.Cardno = b.CardNo
WHERE BranchName = 'Sharpstown' AND DateDue = CONVERT(VARCHAR(10), getdate(), 111)
;

/* 5.*/
SELECT
	BranchName, COUNT(*)
FROM BOOK_COPIES b, LIBRARY_BRANCH l
WHERE b.BranchId = l.BranchId
GROUP BY l.BranchName
;

/* 6.*/
SELECT b.CardNo, b.Name, b.Address, COUNT(*) AS 'NoOfBooksOut'
FROM BORROWER b, BOOK_LOANS l
WHERE B.CardNo = L.CardNo
GROUP BY b.CardNo, b.Name, b.Address
HAVING COUNT(*) > 5
;


/* 7.*/
SELECT b.Title, c.Number_Of_Copies, l.BranchName, a.AuthorName
FROM BOOKS b
LEFT JOIN BOOK_AUTHORS a ON b.BookID = a.BookID
INNER JOIN BOOK_COPIES c ON b.Title = c. BookID
INNER JOIN LIBRARY_BRANCH l ON c.BranchID = l.BranchID
WHERE a.AuthorName = 'King, Stephen' AND l.BranchName = 'Central'
;