-- Order from least to greatest rating.
SELECT "title", "rating" FROM "longlist"
    ORDER BY "rating" LIMIT 10;

-- This is using ASC implicitly
SELECT "title", "rating" FROM "longlist"
    ORDER BY "rating" ASC LIMIT 10;

-- Get the records from greatest to least rating
SELECT "title", "rating" FROM "longlist"
    ORDER BY "rating" DESC LIMIT 10;

-- Prioritize ordering using votes also
SELECT "title", "rating" FROM "longlist"
    ORDER BY
        "rating" DESC,
        "votes" DESC
    LIMIT 10;

-- Include the votes
SELECT "title", "rating", "votes" FROM "longlist"
    ORDER BY
        "rating" DESC,
        "votes" DESC
    LIMIT 10;

-- Use ORDER BY for strings too
SELECT "title" FROM "longlist"
    ORDER BY "title";

-- Reverse the last selection
SELECT "title" FROM "longlist"
    ORDER BY "title" DESC;
