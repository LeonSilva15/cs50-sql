-- Use % to match any title that includes the word "love"
SELECT "title" FROM "longlist"
    WHERE "title" LIKE "%love%";

-- Get only titles that starts with the word "The"
SELECT "title" FROM "longlist"
    WHERE "title" LIKE 'The%';

-- Get only titles that starts with the word "The" followed by a space and then anything
SELECT "title" FROM "longlist"
    WHERE "title" LIKE 'The %';

-- Get title with something between "The", "function" and anything else
SELECT "title" FROM "longlist"
    WHERE "title" LIKE "The%function%";

-- Use the underscore to get only one "any" character
SELECT "title" FROM "longlist"
    WHERE "title" LIKE "P_re";

-- Get titles that start with T followed by 3 "any" characters
SELECT "title" FROM "longlist"
    WHERE "title" LIKE "T___";

-- When looking for mpre individual characters, no records match that criteria
SELECT "title" FROM "longlist"
    WHERE "title" LIKE "T_____";

-- The LIKE operator allows us to be case insensitive
SELECT "title" FROM "longlist"
    WHERE "title" = 'pyre'; -- no results

SELECT "title" FROM "longlist"
    WHERE "title" LIKE 'pyre'; -- one result: Pyre
