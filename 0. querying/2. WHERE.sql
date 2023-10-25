-- Conditional select title and author from year 2023
SELECT "title", "author" FROM "longlist" WHERE "year" = 2023;

-- Conditional select title and author from year 2022
SELECT "title", "author" FROM "longlist" WHERE "year" = 2022;

-- Get title and format excluding records on hardcover
SELECT "title", "format" FROM "longlist" WHERE "format" != 'hardcover';

-- Now using <> operator
SELECT "title", "format" FROM "longlist" WHERE "format" <> 'hardcover';

-- Now using NOT keyword
SELECT "title", "format" FROM "longlist" WHERE NOT "format" == 'hardcover';

-- Select from years 2022 and 2023 using the OR operator
SELECT "title", "author" FROM "longlist" WHERE "year" = 2022
    OR "year" = 2023;

-- Combine () and AND to sepecify a selection
SELECT "title", "format" FROM "longlist"
    WHERE ("year" = 2022 OR "year" = 2023)
    AND "format" != 'hardcover';
