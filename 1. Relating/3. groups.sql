select * from "books";

-- Get the average rating of each book grouping their ratings
SELECT "book_id", AVG("rating") AS "Average rating"
FROM "ratings" GROUP BY "book_id";

-- Get the rounded average ratings to 2 decimals
-- only get those above a 3.0
SELECT "book_id", ROUND(AVG("rating"), 2) AS "Average rating"
    FROM "ratings"
    GROUP BY "book_id"
    HAVING "Average rating" >= 3.0;

-- Get the title, average rating and number of ratings
-- of books having over 3.0 of average rating
SELECT title, ROUND(AVG(rating), 2) Rating, COUNT(rating) Ratings
    FROM ratings
    JOIN books ON books.id = ratings.book_id
        GROUP BY book_id
        HAVING Rating >= 3.0
        ORDER BY Rating DESC;
