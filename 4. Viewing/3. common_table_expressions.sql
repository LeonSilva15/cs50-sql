-- Use longlist.db

-- CTE Common Table Expression
-- A Temporary View that exists only for the duration of a query

-- DROP the possibly existing view
DROP VIEW "average_book_ratings";
.schema

-- Use a CTE to get the average ratings per year
WITH "average_book_ratings" AS (
    SELECT "book_id", "title", "year", ROUND(AVG("rating"), 2) AS "rating"
    FROM "ratings"
    JOIN "books" ON "ratings"."book_id" = "books"."id"
    GROUP BY "book_id"
)
SELECT "year", ROUND(AVG("rating"), 2) AS "rating"
FROM "average_book_ratings"
GROUP BY "year";
