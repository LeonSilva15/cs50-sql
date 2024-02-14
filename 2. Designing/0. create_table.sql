-- Delete prior tables if they exist
DROP TABLE IF EXISTS "riders";
DROP TABLE IF EXISTS "stations";
DROP TABLE IF EXISTS "visits";

-- Create a basic table for riders
CREATE TABLE "riders" (
    "id",
    "name"
);

-- Create a basic table for stations
CREATE TABLE "stations" (
    "id",
    "name",
    "line"
);

-- Create a table to relate riders and stations
CREATE TABLE "visits" (
    "rider_id",
    "station_id"
);

