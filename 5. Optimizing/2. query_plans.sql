-- This will show us how the Index is being used
EXPLAIN QUERY PLAN
SELECT * FROM "movies" WHERE "title" = 'Cars';
-- QUERY PLAN
-- `--SEARCH movies USING INDEX title_index (title=?)
-- Run Time: real 0.000 user 0.000100 sys 0.000017

-- Remove the INDEX to see the difference
DROP INDEX "title_index";
.schema

EXPLAIN QUERY PLAN
SELECT * FROM "movies" WHERE "title" = 'Cars';
-- QUERY PLAN
-- `--SCAN movies
-- Run Time: real 0.000 user 0.000089 sys 0.000045

-- Most DBMS automatically optimizes using indexes, for instance on primary keys
-- Using indexes has its trade-offs on space, and timing on inserting new data.
SELECT "title" FROM "movies" WHERE "id" IN (
    SELECT "movie_id" FROM "stars" WHERE "person_id" = (
        SELECT "id" FROM "people" WHERE "name" = 'Tom Hanks'
    )
);
-- Run Time: real 0.084 user 0.077888 sys 0.005448

-- In order to optimize this query using indexes we need to understand its plan
EXPLAIN QUERY PLAN
SELECT "title" FROM "movies" WHERE "id" IN (
    SELECT "movie_id" FROM "stars" WHERE "person_id" = (
        SELECT "id" FROM "people" WHERE "name" = 'Tom Hanks'
    )
);
-- QUERY PLAN
-- |--SEARCH movies USING INTEGER PRIMARY KEY (rowid=?)
-- `--LIST SUBQUERY 2
--    |--SCAN stars
--    `--SCALAR SUBQUERY 1
--       `--SCAN people

-- We can optimize the SCAN action on stars and people tables
-- Create an INDEX for each WHERE column on the SCAN actions
CREATE INDEX "person_index" ON "stars" ("person_id");
CREATE INDEX "name_index" ON "people" ("name");

EXPLAIN QUERY PLAN
SELECT "title" FROM "movies" WHERE "id" IN (
    SELECT "movie_id" FROM "stars" WHERE "person_id" = (
        SELECT "id" FROM "people" WHERE "name" = 'Tom Hanks'
    )
);
-- QUERY PLAN
-- |--SEARCH movies USING INTEGER PRIMARY KEY (rowid=?)
-- `--LIST SUBQUERY 2
--    |--SEARCH stars USING INDEX person_index (person_id=?)
--    `--SCALAR SUBQUERY 1
--       `--SEARCH people USING COVERING INDEX name_index (name=?)

-- COVERING INDEX: An index in which queried data can be retrieved from the index itself
-- We can have multiple columns in an INDEX
DROP INDEX "person_index";
CREATE INDEX "person_index" ON "stars" ("person_id", "movie_id");

EXPLAIN QUERY PLAN
SELECT "title" FROM "movies" WHERE "id" IN (
    SELECT "movie_id" FROM "stars" WHERE "person_id" = (
        SELECT "id" FROM "people" WHERE "name" = 'Tom Hanks'
    )
);
-- QUERY PLAN
-- |--SEARCH movies USING INTEGER PRIMARY KEY (rowid=?)
-- `--LIST SUBQUERY 2
--    |--SEARCH stars USING COVERING INDEX person_index (person_id=?)
--    `--SCALAR SUBQUERY 1
--       `--SEARCH people USING COVERING INDEX name_index (name=?)

-- We have optimized even further:
-- Run Time: real 0.000 user 0.000144 sys 0.000018
