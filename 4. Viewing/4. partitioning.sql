-- Use longlist.db

-- Get the books from a specific year
SELECT "id", "title" FROM "books"
WHERE "year" = 2022;

-- Create a View with one specific year
CREATE VIEW "2022" AS
SELECT "id", "title" FROM "books"
WHERE "year" = 2022;

SELECT * FROM "2022";

-- Create another View with a different year
CREATE VIEW "2021" AS
SELECT "id", "title" FROM "books"
WHERE "year" = 2021;

SELECT * FROM "2021";

-- We can't modify Views
-- UPDATE "2021" SET "title" = 'The Minor Detail'
-- WHERE "title" = 'Minor Detail';
--Parse error near line 4: cannot modify 2021 because it is a view
