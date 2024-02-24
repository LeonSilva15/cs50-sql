-- Use longlist.db

-- A temporary view will only exist until closing the session (connection)
-- We can create views from other views
.schema

-- Query to an existing View
SELECT "year", ROUND(AVG("rating"), 2) FROM "average_book_ratings"
GROUP BY "year";

-- Create a Temporary View from another View
CREATE TEMPORARY VIEW "average_ratings_by_year" AS
SELECT "year", ROUND(AVG("rating"), 2) FROM "average_book_ratings"
GROUP BY "year";

SELECT * FROM "average_ratings_by_year";
