CREATE DATABASE Library_Managementdb;

/*----------------creating tables----------------*/

USE Library_Managementdb;

CREATE TABLE publisher (
		PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
		PublisherAddress VARCHAR(200) NOT NULL,
		PublisherPhone VARCHAR(50) NOT NULL 
	);
        
CREATE TABLE book (
		BookID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		Title VARCHAR(100) NOT NULL,
		PublisherName VARCHAR(100) NOT NULL,
        CONSTRAINT FOREIGN KEY (PublisherName) REFERENCES publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
	);

CREATE TABLE library_branch (
		BranchID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		BranchName VARCHAR(100) NOT NULL,
		BranchAddress VARCHAR(200) NOT NULL
	);

CREATE TABLE borrower (
		CardNo INT PRIMARY KEY NOT NULL,
		BorrowerName VARCHAR(100) NOT NULL,
		BorrowerAddress VARCHAR(200) NOT NULL,
		BorrowerPhone VARCHAR(50) NOT NULL
	);

CREATE TABLE book_loans (
		LoansID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		BookID INT NOT NULL,
        CONSTRAINT FOREIGN KEY (BookID) REFERENCES book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL,
        CONSTRAINT FOREIGN KEY (BranchID) REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		CardNo INT NOT NULL,
        CONSTRAINT FOREIGN KEY (CardNo) REFERENCES borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		DateOut VARCHAR(50) NOT NULL,
		DueDate VARCHAR(50) NOT NULL
	);
	 CREATE TABLE book_copies (
		CopiesID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		BookID INT NOT NULL,
        CONSTRAINT FOREIGN KEY (BookID) REFERENCES book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL,
        CONSTRAINT FOREIGN KEY (BranchID) REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		No_Of_Copies INT NOT NULL
	);

CREATE TABLE book_authors (
		AuthorID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		BookID INT NOT NULL,
        CONSTRAINT FOREIGN KEY (BookID) REFERENCES book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		AuthorName VARCHAR(50) NOT NULL
	);
    
/*----------------inserting values into table----------------*/  

INSERT INTO publisher
		(PublisherName, PublisherAddress, PublisherPhone)
		VALUES
		('DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Chilton Books','Not Available','Not Available'),
		('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),
		('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),		
		('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),
		('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507'),
		('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),
		('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
		('Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
		('W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500'),
		('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
		('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745');
    
INSERT INTO book
		(Title, PublisherName)
		VALUES 
		('The Name of the Wind', 'DAW Books'),
		('It', 'Viking'),
		('The Green Mile', 'Signet Books'),
		('Dune', 'Chilton Books'),
		('The Hobbit', 'George Allen & Unwin'),
		('Eragon', 'Alfred A. Knopf'),
		('A Wise Mans Fear', 'DAW Books'),
		('Harry Potter and the Philosophers Stone', 'Bloomsbury'),
		('Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
		('The Giving Tree', 'Harper and Row'),
		('The Hitchhikers Guide to the Galaxy', 'Pan Books'),
		('Brave New World', 'Chalto & Windus'),
		('The Princess Bride', 'Harcourt Brace Jovanovich'),
		('Fight Club', 'W.W. Norton'),
		('Holes', 'Scholastic'),
		('Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
		('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
		('The Fellowship of the Ring', 'George Allen & Unwin'),
		('A Game of Thrones', 'Bantam'),
		('The Lost Tribe', 'Picador USA');

INSERT INTO library_branch
		(BranchName, BranchAddress)
		VALUES
		('Sharpstown','32 Corner Road, New York, NY 10012'),
		('Central','491 3rd Street, New York, NY 10014'),
		('Saline','40 State Street, Saline, MI 48176'),
		('Ann Arbor','101 South University, Ann Arbor, MI 48104');
        
INSERT INTO borrower
		(CardNo, BorrowerName, BorrowerAddress, BorrowerPhone)
		VALUES
		('100','Joe Smith','1321 4th Street, New York, NY 10014','212-312-1234'),
		('101','Jane Smith','1321 4th Street, New York, NY 10014','212-931-4124'),
		('102','Tom Li','981 Main Street, Ann Arbor, MI 48104','734-902-7455'),
		('103','Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),
		('104','Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),
		('105','Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),
		('106','Haley Jackson','231 52nd Avenue New York, NY 10014','212-419-9935'),
		('107','Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513');
        
INSERT INTO book_copies
		(BookID, BranchID, No_Of_Copies)
		VALUES
		('1','1','5'),
		('2','1','5'),
		('3','1','5'),
		('4','1','5'),
		('5','1','5'),
		('6','1','5'),
		('7','1','5'),
		('8','1','5'),
		('9','1','5'),
		('10','1','5'),
		('11','1','5'),
		('12','1','5'),
		('13','1','5'),
		('14','1','5'),
		('15','1','5'),
		('16','1','5'),
		('17','1','5'),
		('18','1','5'),
		('19','1','5'),
		('20','1','5'),
		('1','2','5'),
		('2','2','5'),
		('3','2','5'),
		('4','2','5'),
		('5','2','5'),
		('6','2','5'),
		('7','2','5'),
		('8','2','5'),
		('9','2','5'),
		('10','2','5'),
		('11','2','5'),
		('12','2','5'),
		('13','2','5'),
		('14','2','5'),
		('15','2','5'),
		('16','2','5'),
		('17','2','5'),
		('18','2','5'),
		('19','2','5'),
		('20','2','5'),
		('1','3','5'),
		('2','3','5'),
		('3','3','5'),
		('4','3','5'),
		('5','3','5'),
		('6','3','5'),
		('7','3','5'),
		('8','3','5'),
		('9','3','5'),
		('10','3','5'),
		('11','3','5'),
		('12','3','5'),
		('13','3','5'),
		('14','3','5'),
		('15','3','5'),
		('16','3','5'),
		('17','3','5'),
		('18','3','5'),
		('19','3','5'),
		('20','3','5'),
		('1','4','5'),
		('2','4','5'),
		('3','4','5'),
		('4','4','5'),
		('5','4','5'),
		('6','4','5'),
		('7','4','5'),
		('8','4','5'),
		('9','4','5'),
		('10','4','5'),
		('11','4','5'),
		('12','4','5'),
		('13','4','5'),
		('14','4','5'),
		('15','4','5'),
		('16','4','5'),
		('17','4','5'),
		('18','4','5'),
		('19','4','5'),
		('20','4','5');
        
INSERT INTO book_authors
		(BookID, AuthorName)
		VALUES
		('1','Patrick Rothfuss'),
		('2','Stephen King'),
		('3','Stephen King'),
		('4','Frank Herbert'),
		('5','J.R.R. Tolkien'),
		('6','Christopher Paolini'),
		('6','Patrick Rothfuss'),
		('8','J.K. Rowling'),
		('9','Haruki Murakami'),
		('10','Shel Silverstein'),
		('11','Douglas Adams'),
		('12','Aldous Huxley'),
		('13','William Goldman'),
		('14','Chuck Palahniuk'),
		('15','Louis Sachar'),
		('16','J.K. Rowling'),
		('17','J.K. Rowling'),
		('18','J.R.R. Tolkien'),
		('19','George R.R. Martin'),
		('20','Mark Lee');
        
INSERT INTO book_loans
		(BookID, BranchID, CardNo, DateOut, DueDate)
		VALUES
		('1','1','100','1/1/18','2/2/18'),
		('2','1','100','1/1/18','2/2/18'),
		('3','1','100','1/1/18','2/2/18'),
		('4','1','100','1/1/18','2/2/18'),
		('5','1','102','1/3/18','2/3/18'),
		('6','1','102','1/3/18','2/3/18'),
		('7','1','102','1/3/18','2/3/18'),
		('8','1','102','1/3/18','2/3/18'),
		('9','1','102','1/3/18','2/3/18'),
		('11','1','102','1/3/18','2/3/18'),
		('12','2','105','12/12/17','1/12/18'),
		('10','2','105','12/12/17','1/12/17'),
		('20','2','105','2/3/18','3/3/18'),
		('18','2','105','1/5/18','2/5/18'),
		('19','2','105','1/5/18','2/5/18'),
		('19','2','100','1/3/18','2/3/18'),
		('11','2','106','1/7/18','2/7/18'),
		('1','2','106','1/7/18','2/7/18'),
		('2','2','100','1/7/18','2/7/18'),
		('3','2','100','1/7/18','2/7/18'),
		('5','2','105','12/12/17','1/12/18'),
		('4','3','103','1/9/18','2/9/18'),
		('7','3','102','1/3/18','2/3/18'),
		('17','3','102','1/3/18','2/3/18'),
		('16','3','104','1/3/18','2/3/18'),
		('15','3','104','1/3/18','2/3/18'),
		('15','3','107','1/3/18','2/3/18'),
		('14','3','104','1/3/18','2/3/18'),
		('13','3','107','1/3/18','2/3/18'),
		('13','3','102','1/3/18','2/3/18'),
		('19','3','102','12/12/17','1/12/18'),
		('20','4','103','1/3/18','2/3/18'),
		('1','4','102','1/12/18','2/12/18'),
		('3','4','107','1/3/18','2/3/18'),
		('18','4','107','1/3/18','2/3/18'),
		('12','4','102','1/4/18','2/4/18'),
		('11','4','103','1/15/18','2/15/18'),
		('9','4','103','1/15/18','2/15/18'),
		('7','4','107','1/1/18','2/2/18'),
		('4','4','103','1/1/18','2/2/18'),
		('1','4','103','2/2/17','3/2/18'),
		('20','4','103','1/3/18','2/3/18'),
		('1','4','102','1/12/18','2/12/18'),
		('3','4','107','1/13/18','2/13/18'),
		('18','4','107','1/13/18','2/13/18'),
		('12','4','102','1/14/18','2/14/18'),
		('11','4','103','1/15/18','2/15/18'),
		('9','4','103','1/15/18','2/15/18'),
		('7','4','107','1/19/18','2/19/18'),
		('4','4','103','1/19/18','2/19/18'),
		('1','4','103','1/22/18','2/22/18');
        
/*----------------------------------------QUERIES----------------------------------------*/

/* 1. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */
SELECT book_copies.BranchID, library_branch.BranchName, book_copies.No_Of_Copies, book.Title
FROM book_copies
INNER JOIN book ON book_copies.BookID = book.BookID
INNER JOIN library_branch ON book_copies.BranchID = library_branch.BranchID
WHERE book.Title = 'The Lost Tribe' AND library_branch.BranchName = 'Sharpstown';


/* 2. How many copies of the book titled "The Lost Tribe" are owned by each library branch? */
SELECT book_copies.BranchID, library_branch.BranchName, book_copies.No_Of_Copies, book.Title
FROM book_copies
INNER JOIN book ON book_copies.BookID = book.BookID
INNER JOIN library_branch ON book_copies.BranchID = library_branch.BranchID
WHERE book.Title = 'The Lost Tribe';


/*#3- Retrieve the names of all borrowers who do not have any books checked out. */
SELECT BorrowerName FROM borrower
WHERE NOT EXISTS
(SELECT * FROM book_loans WHERE book_loans.CardNo = borrower.CardNo);


/* #4- For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.  */
SELECT library_branch.BranchName, book.Title, borrower.BorrowerName, borrower.BorrowerAddress,
	   book_loans.DateOut, book_loans.DueDate
FROM book_loans
INNER JOIN book ON book_loans.BookID = book.BookID
INNER JOIN borrower ON book_loans.CardNo = borrower.CardNo
INNER JOIN library_branch ON book_loans.BranchID = library_branch.BranchID
WHERE book_loans.DueDate = 2/2/18 AND library_branch.BranchName = 'Sharpstown';


/* #5- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.  */
SELECT library_branch.BranchName, book_loans.BranchID
FROM book_loans
INNER JOIN library_branch ON book_loans.BranchID = library_branch.BranchID
GROUP BY library_branch.BranchName;


/* #6- Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out. */
SELECT borrower.BorrowerName, borrower.BorrowerAddress
FROM book_loans
INNER JOIN borrower ON book_loans.CardNo = borrower.CardNo
GROUP BY borrower.BorrowerName, borrower.BorrowerAddress
HAVING borrower.BorrowerName = 'Joe Smith';


/* #7- For each book authored by "J.K. Rowling", retrieve the title and the number of copies owned by the library branch whose name is "Central".*/
SELECT library_branch.BranchName, book.Title, book_copies.No_Of_Copies
FROM book_authors
INNER JOIN book ON book_authors.BookID = book.BookID
INNER JOIN book_copies ON book_authors.BookID = book_copies.BookID
INNER JOIN library_branch ON book_copies.BranchID = library_branch.BranchID
WHERE library_branch.BranchName = 'Central' AND book_authors.AuthorName = 'J.K. Rowling';