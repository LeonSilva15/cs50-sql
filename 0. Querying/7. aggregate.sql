-- Use AVG to get the average rating
SELECT AVG("rating") FROM "longlist";

-- Use ROUND to get a rounded result
SELECT ROUND( AVG("rating"), 2 ) FROM "longlist";

-- Rename the result column using the "as" keyword
SELECT ROUND( AVG("rating"), 2 ) AS "Average rating"
    FROM "longlist";

-- Get the maximum rating
SELECT MAX("rating") FROM "longlist";

-- Get the minimum rating
SELECT MIN("rating") FROM "longlist";

-- Use SUM to get the total number of votes
SELECT SUM("votes") FROM "longlist";

-- Count the number of columns using COUNT
SELECT COUNT(*) FROM "longlist";

-- Count the number of transltors
SELECT COUNT("translator") FROM "longlist";

-- When using MAX and MIN with string we get the alphabetical order:
-- Wretchedness  |  A New Name: Septology VI-VII
SELECT MAX("title"), MIN("title") FROM "longlist";

-- Get the count of publishers
-- But this gets every record that has a Publisher
SELECT COUNT("publisher") FROM "longlist";

-- Use DISTINCT to get the list of the publishers without repeating the records
SELECT DISTINCT "publisher" FROM "longlist";

-- Combine DISTINCT and COUNT to get the number of publishers
SELECT COUNT( DISTINCT("publisher") ) FROM "longlist";
