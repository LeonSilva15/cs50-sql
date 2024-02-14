/*
SQLite has 5 storage classes
    NULL
        - No value
    INTEGER
        - Numbers with no floating value
    REAL
        - Floating value
    TEXT
        - Strings
    BLOB
        - Binary large objects

These storage classes contains multiple data types inside of themselves, for instance INTEGER:
    Includes 7 data types:
        0, 1, 2, 3, 4, 6 and 8 bytes integers

Type afinities
    SQLite has 5 type affinities. When inserting a value, SQLite will try to convert the value to type
        the column has the affinity for.
    TEXT: Characters
    NUMERIC: Either integers or floating values
    INTEGER: Whole numbers
    REAL: Decimal values
    BLOB: Binary large objects
*/

-- Delete prior tables if they exist
DROP TABLE IF EXISTS "riders";
DROP TABLE IF EXISTS "stations";
DROP TABLE IF EXISTS "visits";

CREATE TABLE "riders" (
    "id" INTEGER,
    "name" TEXT
);

CREATE TABLE "stations" (
    "id" INTEGER,
    "name" TEXT,
    "line" TEXT
);

CREATE TABLE "visits" (
    "rider_id" INTEGER
    "station_id" INTEGER
);
