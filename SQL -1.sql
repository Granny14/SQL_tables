CREATE TABLE "Books" (
	"book_ID"	INTEGER,
	"title"	TEXT NOT NULL,
	"description"	TEXT NOT NULL,
	"author_ID"	INTEGER NOT NULL,
	PRIMARY KEY("book_ID"),
	FOREIGN KEY("author_ID") REFERENCES "Authors"("author_ID")
);

CREATE TABLE "Authors" (
	"author_ID"	INTEGER,
	"firstName"	TEXT NOT NULL,
	"lastName"	TEXT NOT NULL,
	"nationality"	TEXT NOT NULL,
	PRIMARY KEY("author_ID" AUTOINCREMENT)
);

--count number of books
SELECT count(Title) as numBooksCounted
FROM Books;

--COUNT HOW MANY BOOKS AN AUTHOR HAS
SELECT A.firstName, A.lastName, COUNT(B.book_ID) AS numBooksCounted
FROM Authors A
JOIN Books B ON A.author_ID = B.author_ID
GROUP BY A.author_ID, A.firstName, A.lastName
ORDER BY numBooksCounted DESC
LIMIT 1;

--how many books there are according to nationality,
SELECT A.nationality, COUNT(B.book_ID) AS numBooksCounted
FROM Authors A
JOIN Books B ON A.author_ID = B.author_ID
GROUP BY A.nationality