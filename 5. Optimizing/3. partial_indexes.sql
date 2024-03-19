-- Partial Index is an index that includes only a subset of rows from a table

-- Create a Partial INDEX for only recent movies
CREATE INDEX "recents" ON "movies" ("title")
WHERE "year" > 2023;

EXPLAIN QUERY PLAN
SELECT "title" FROM "movies"
WHERE "year" > 2023;
-- QUERY PLAN
-- `--SCAN movies USING INDEX recents
-- Run Time: real 0.000 user 0.000044 sys 0.000012

DROP INDEX "recents";

EXPLAIN QUERY PLAN
SELECT "title" FROM "movies"
WHERE "year" > 2023;
-- QUERY PLAN
-- `--SCAN movies USING INDEX recents
-- Run Time: real 0.000 user 0.000046 sys 0.000011
 