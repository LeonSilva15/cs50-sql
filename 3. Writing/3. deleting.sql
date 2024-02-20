-- Empty a table
-- DELETE FROM "collections";

-- Delete using a criteria
DELETE FROM "collections" WHERE "title" = 'Spring outing';

-- Remove rows using the NULL value
DELETE FROM "collections" WHERE "acquired" IS NULL;

-- Remove using a date comparison
DELETE FROM "collections" WHERE "acquired" < '1909-01-01';

select * from "collections";