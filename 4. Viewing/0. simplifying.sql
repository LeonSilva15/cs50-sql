-- Use longlist.db
-- We can use Views to simplify queries

-- Get the id of an author
SELECT "id" FROM "authors"
WHERE "name" = 'Fernanda Melchor';

-- Get the book ids that the author has written
SELECT "book_id" FROM "authored"
WHERE "author_id" = (
    SELECT "id" FROM "authors"
    WHERE "name" = 'Fernanda Melchor'
);

-- Get the book titles that specific author has written
SELECT "title" FROM "books"
WHERE "id" IN (
    SELECT "book_id" FROM "authored"
    WHERE "author_id" = (
        SELECT "id" FROM "authors"
        WHERE "name" = 'Fernanda Melchor'
    )
);

-- We simplify this last query using JOINS
SELECT "name", "title" FROM "authors"
JOIN "authored" ON "authors"."id" = "authored"."author_id"
JOIN "books" ON "books"."id" = "authored"."author_id";

-- We can creat a View to simplify this queries
-- DROP VIEW "longlist";
CREATE VIEW "longlist" AS
SELECT "name", "title" FROM "authors"
JOIN "authored" ON "authors"."id" = "authored"."author_id"
JOIN "books" ON "books"."id" = "authored"."book_id";
-- ORDER BY "title";

-- Visualize the DDL
.schema

-- Query from the View
SELECT * FROM "longlist";

-- Get the books an author has written
SELECT "title" FROM "longlist"
WHERE "name" = 'Fernanda Melchor';
