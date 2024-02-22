SELECT * FROM "created";

-- Update a row using external references
-- Multiple columns can be updated simultaneously
UPDATE "created" SET "artist_id" = (
    SELECT "id" FROM "artists"
        WHERE "name" = 'Li Yin'
) WHERE "collection_id" = (
    SELECT "id" FROM "collections"
        WHERE "title" = 'Farmers working at dawn'
);

-- Import the votes.csv table into a new db
-- sqlite3 votes.db
-- .import --csv votes.csv votes
SELECT "title", COUNT("title") FROM "votes" GROUP BY "title";

-- Update the rows to remove white spaces
UPDATE "votes" SET "title" = TRIM("title");

-- Set all titles to upper case
UPDATE "votes" SET "title" = UPPER("title");

-- We can update values using multiple conditions
UPDATE "votes" SET "title" = 'FARMERS WORKING AT DAWN'
    WHERE "title" = 'FARMERS WORKING'
        OR "title" = 'FAMERS WORKING AT DAWN'
        OR "title" = 'FARMESR WORKING AT DAWN'

-- Using the LIKE keyword makes the previous query easier
UPDATE "votes" SET "title" = 'FARMERS WORKING AT DAWN'
    WHERE "title" LIKE 'FA%';

UPDATE "votes" SET "title" = 'IMAGINATIVE LANDSCAPE'
    WHERE "title" LIKE 'Imagin%';

UPDATE "votes" SET "title" = 'PROFUSION OF FLOWERS'
    WHERE "title" LIKE 'PROFUSION%';
