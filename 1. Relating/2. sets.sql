-- When combining tables, make sure they have the same columns number, names and types

-- Select people that is either a translator or an author
SELECT "name" FROM "translators"
UNION
SELECT "name" FROM "authors";

-- Add a column to see who is an author
SELECT 'author' AS "profession", "name" FROM "authors";

-- Show the profession of each
SELECT 'author' AS "profession", "name" FROM "authors"
UNION
SELECT 'translator' AS "profession", "name" FROM "translators";

-- Get the people who are both
SELECT "name" FROM "authors"
INTERSECT
SELECT "name" FROM "translators";

-- Get only those who are only authors
SELECT "name" FROM "authors"
EXCEPT
SELECT "name" FROM "translators";

-- Select the book that Sophie Hughes has translated
-- and also has been translated by Margaret Jull Costa
SELECT "title" FROM "books" WHERE "id" = (
    SELECT "book_id" FROM "translated" WHERE "translator_id" = (
        SELECT "id" FROM "translators" WHERE "name" = 'Sophie Hughes'
    )
    INTERSECT
    SELECT "book_id" FROM "translated" WHERE "translator_id" = (
        SELECT "id" FROM "translators" WHERE "name" = 'Margaret Jull Costa'
    )
);
