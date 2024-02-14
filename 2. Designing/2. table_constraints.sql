/*
SQLite means that some values must comply certain rules
for instance foreign keys must exist on other table
*/

-- Delete prior tables if they exist
DROP TABLE IF EXISTS "riders";
DROP TABLE IF EXISTS "stations";
DROP TABLE IF EXISTS "visits";

CREATE TABLE "riders" (
    "id" INTEGER,
    "name" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "stations" (
    "id" INTEGER,
    "name" TEXT,
    "line" TEXT,
    PRIMARY KEY("id")
);

-- Here the primary key is a unique combination of the id columns
-- CREATE TABLE "visits" (
--     "rider_id" INTEGER
--     "station_id" INTEGER,
--     PRIMARY KEY("rider_id", "station_id")
-- );

-- Here the primary key is the id column
-- CREATE TABLE "visits" (
--     "id" INTEGER,
--     "rider_id" INTEGER,
--     "station_id" INTEGER,
--     PRIMARY KEY("id")
-- );

-- We can also use the ROWID
-- SELECT rowid, * from visits;

-- Set the foreign keys on the external ids
CREATE TABLE "visits" (
    "id" INTEGER,
    "rider_id" INTEGER,
    "station_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("rider_id") REFERENCES "riders"("id"),
    FOREIGN KEY("station_id") REFERENCES "stations"("id")
);