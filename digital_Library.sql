CREATE DATABASE digital_library;
use digital_library;

-- 1. CREATE TABLE
-- Books table
CREATE TABLE Books (
BookID INT PRIMARY KEY,
Title VARCHAR(100),
Author VARCHAR(100),
Category VARCHAR(50)
);

-- Students Table
CREATE TABLE Students(
StudentID INT PRIMARY KEY,
StudentName VARCHAR(100) NOT NULL,
Email VARCHAR(100)
);

-- IssuedBooks Table
CREATE TABLE IssuedBooks (
IssuedID INT PRIMARY KEY,
BookID INT,
StudentID INT,
IssueDate DATE,
ReturnDate DATE,
FOREIGN KEY (BookID) REFERENCES Books(BookID),
FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);


-- 2. INSERT DATA

-- Insert into Books
INSERT INTO Books VALUES (1,'The Alchemist', 'Paulo coelho', 'Fiction');
INSERT INTO Books VALUES (2,'Brief History of Time', 'Stephen hawking', 'Science');
INSERT INTO Books VALUES (3,'Engineering Mathematics', 'Grewal', 'Maths');
INSERT INTO Books VALUES (4,'Concept of Physics Volume 1', 'H.C. Verma', 'Science');
INSERT INTO Books VALUES (5,'Geography', 'Husain', 'Social');
INSERT INTO Books VALUES (6,'Linear Algebra', 'Gilbert Strang', 'Maths');
INSERT INTO Books VALUES (7,'Concept of physics Vloume 2', 'H. C. Verma', 'Science');
INSERT INTO Books VALUES (8,'Indian Econoly', 'Ramesh Singh', 'Social');
INSERT INTO Books VALUES (9,'The Great Gatsby', 'Scott', 'Fiction');
INSERT INTO Books VALUES (10,'Norwegain Wood', 'Murakami', 'Fiction');

-- Insert into Students
INSERT INTO Students VALUES (1,'Manasa', 'manasa@gmail.com');
INSERT INTO Students VALUES (2,'Udaya', 'udaya@gmail.com');
INSERT INTO Students VALUES (3,'Gana', 'gana@gmail.com');
INSERT INTO Students VALUES (4,'Shalini', 'Shalini@gmail.com');
INSERT INTO Students VALUES (5,'Kavya', 'Kavya@gmail.com');
INSERT INTO Students VALUES (6,'Sravani', 'Sravs@gmail.com');
INSERT INTO Students VALUES (7,'arjun', 'arjun@gmail.com');


-- Insert into IssuedBooks
INSERT INTO IssuedBooks VALUES (101,1,1,'2026-01-16','2026-01-25');
INSERT INTO IssuedBooks VALUES (102,2,2,'2026-03-25', NULL);
INSERT INTO IssuedBooks VALUES (103,8,3,'2026-02-21', '2026-03-28');
INSERT INTO IssuedBooks VALUES (104,6,4,'2026-04-16', '2026-04-20');
INSERT INTO IssuedBooks VALUES (105,1,5,'2026-04-21', NULL);
INSERT INTO IssuedBooks VALUES (106,7,6,'2026-04-01', NULL);
INSERT INTO IssuedBooks VALUES (107,7,7,'2022-04-01', '2022-04-12' );

SELECT * FROM Books;
SELECT * FROM Students;
SELECT * FROM IssuedBooks;

-- OverDue Query 
SELECT 
    s.StudentName,
    b.Title,
    ib.IssueDate,
    DATEDIFF(CURDATE(), ib.IssueDate) AS Total_Days,
    DATEDIFF(CURDATE(), ib.IssueDate) - 14 AS Days_Late
FROM IssuedBooks ib
JOIN Students s ON ib.StudentID = s.StudentID
JOIN Books b ON ib.BookID = b.BookID
WHERE ib.ReturnDate IS NULL
AND DATEDIFF(CURDATE(), ib.IssueDate) > 14;


-- Popularity Index Query
SELECT 
    b.Category,
    COUNT(*) AS Total_Borrows
FROM IssuedBooks ib
JOIN Books b ON ib.BookID = b.BookID
GROUP BY b.Category
ORDER BY Total_Borrows DESC;


-- Data Clean up
SELECT *
FROM Students s
WHERE NOT EXISTS (
    SELECT 1
    FROM IssuedBooks ib
    WHERE ib.StudentID = s.StudentID
    AND ib.IssueDate >= CURDATE() - INTERVAL 3 YEAR
);


DELETE FROM Students s
WHERE NOT EXISTS (
    SELECT 1 FROM IssuedBooks ib
    WHERE ib.StudentID = s.StudentID
    AND ib.IssueDate >= CURDATE() - INTERVAL 3 YEAR
);



