-- Import the data with no id into a temporary table
-- .import --csv mfa2.csv temp

-- After using the .import command into a temporary table,
-- we can use this new data using a SELECT
INSERT INTO "collections" ("title", "accession_number", "acquired")
    SELECT "title", "accession_number", "acquired" FROM "temp";

-- Drop the temporary table
DROP TABLE "temp";
