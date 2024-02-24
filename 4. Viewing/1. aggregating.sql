-- Use longlist.db
.schema ratings

-- Having a long query with JOIN and Functions
SELECT "book_id", "title", "year", ROUND(AVG("rating"), 2) AS "rating"
FROM "ratings"
JOIN "books" ON "ratings"."book_id" = "books"."id"
GROUP BY "book_id";

-- Create a view
-- DROP VIEW "average_book_ratings" 
CREATE VIEW "average_book_ratings" AS
SELECT "book_id", "title", "year", ROUND(AVG("rating"), 2) AS "rating"
FROM "ratings"
JOIN "books" ON "ratings"."book_id" = "books"."id"
GROUP BY "book_id";

SELECT * FROM "average_book_ratings";
