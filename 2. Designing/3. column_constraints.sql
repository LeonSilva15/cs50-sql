/*
SQLite has 4 column constraints
    - CHECK
        - Any custom rule, like arithmetic comparisons
    - DEFAULT
        - Use a default value whenever no value is provided
    - NOT NULL
        - No NULL values allowed
    - UNIQUE
        - All the values in the column are unique

    When using PRIMARY KEY, it applies: UNIQUE and NOT NULL
    When using FOREIGN KEY, it applies: NOT NULL
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

-- Station name and line required
-- Station names must be unique
CREATE TABLE "stations" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "line" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "visits" (
    "id" INTEGER,
    "rider_id" INTEGER,
    "station_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("rider_id") REFERENCES "riders"("id"),
    FOREIGN KEY("station_id") REFERENCES "stations"("id")
);
