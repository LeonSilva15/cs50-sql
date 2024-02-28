-- Use rideshare.db
-- SQLite can't handle access control
-- all the users can access the entire database

-- Given this table
SELECT * FROM "rides";

-- We want to share only this data to omit personal information
SELECT "id", "origin", "destination" FROM "rides";

-- Add explicit anonymous rider
SELECT "id", "origin", "destination", 'Anonymous' as "rider"
FROM "rides";

-- Create a view to hide the personal information
CREATE VIEW "analysis" AS
SELECT "id", "origin", "destination", 'Anonymous' as "rider"
FROM "rides";

.schema

SELECT * FROM "analysis";
