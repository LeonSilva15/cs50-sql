-- Use .read "4.1 schema.sql" to create the database for this exercise
SELECT * FROM "artists";
SELECT * FROM "created";

-- Delete the undefined artist
-- This will throw an error due to the foreign key contraints
DELETE FROM "artists" WHERE "name" = 'Unidentified artist';

-- Delete de unidenified artist from the created table
DELETE FROM "created" WHERE "artist_id" = (
    SELECT "id" FROM "artists" WHERE "name" = 'Unidentified artist'
);

-- When defining the table we can create a constraint action
-- RESTRICT will prevent the action to be performed
-- CREATE TABLE "created" (
--     ...
--     FOREIGN KEY("artist_id") REFERENCES "artists"("id") ON DELETE RESTRICT,
-- );

-- NO ACTION will allow the operation and nothing else will happend
-- CREATE TABLE "created" (
--     ...
--     FOREIGN KEY("artist_id") REFERENCES "artists"("id") ON DELETE NO ACTION,
-- );

-- SET NULL will update the foreign key to NULL
-- CREATE TABLE "created" (
--     ...
--     FOREIGN KEY("artist_id") REFERENCES "artists"("id") ON DELETE SET NULL,
-- );

-- SET DEFULT will update the foreign key to the default value
-- CREATE TABLE "created" (
--     ...
--     FOREIGN KEY("artist_id") REFERENCES "artists"("id") ON DELETE SET DEFAULT,
-- );

-- CASCADE will apply the action to all the references
-- CREATE TABLE "created" (
--     ...
--     FOREIGN KEY("artist_id") REFERENCES "artists"("id") ON DELETE CASCADE,
-- );
