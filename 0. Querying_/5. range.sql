-- Create a range selection using comparison operators
SELECT "title", "year" FROM "longlist"
    WHERE "year" >= 2019 AND "year" <= 2022;

-- Get same result using the BETWEEN keyword
SELECT "title", "year" FROM "longlist"
    WHERE "year" BETWEEN 2019 AND 2022;

-- Select books with a rating above 4.0
SELECT "title", "rating" FROM "longlist"
    WHERE "rating" > 4.0;

-- Get books with rating above 4.0 and more than 10k votes
SELECT "title", "rating", "votes" FROM "longlist"
    WHERE "rating" > 4.0 AND "votes" > 10000;

-- Select only books with less than 300 pages
SELECT "title", "pages" FROM "longlist"
    WHERE "pages" < 300;
