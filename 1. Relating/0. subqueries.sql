-- Select the book published by the publisher with a specific id
SELECT "title" FROM "books"
WHERE "publisher_id" = 5;

-- Select the same books using a subquery
-- Assuming we don't know the publisher's id but the name
SELECT "title" FROM "books"
WHERE "publisher_id" = (
    SELECT "id" FROM "publishers"
    WHERE "publisher" = 'Fitzcarraldo Editions'
);

-- Do the selction by steps
SELECT "id" FROM "publishers"
WHERE "publisher" = 'MacLehose Press';
SELECT "title" FROM "books"
WHERE "publisher_id" = 12;

-- Combine the previous two using subqueries
SELECT "title" FROM "books" WHERE "publisher_id" = (
    SELECT "id" FROM "publishers"
    WHERE "publisher" = 'MacLehose Press'
);

-- Get all the ratings of the book In Memory of Memory
SELECT "rating" FROM "ratings" WHERE "book_id" = (
    SELECT "id" FROM "books" WHERE "title" = 'In Memory of Memory'
);

-- Get average of all the ratings of the book In Memory of Memory
SELECT AVG("rating") FROM "ratings" WHERE "book_id" = (
    SELECT "id" FROM "books" WHERE "title" = 'In Memory of Memory'
);

-- Get the author of Flights
SELECT "name" FROM "authors"
WHERE "id" = (
    SELECT "author_id" FROM "authored"
    WHERE "book_id" = (
        SELECT "id" FROM "books"
        WHERE "title" = 'Flights'
    )
);

-- Select multiple values using the IN keyword and subqueries
SELECT "title" FROM "books" WHERE "id" IN (
    SELECT "book_id" FROM "authored" WHERE "author_id" IN (
        SELECT "id" FROM "authors" WHERE "name" IN (
            'Jon Fosse',
            'Maria Stepanova',
            'Han Kang'
        )
    )
);
