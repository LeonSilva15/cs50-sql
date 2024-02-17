-- Delete a table
DROP TABLE "riders";

-- Rename a table
ALTER TABLE "visits" RENAME TO "swipes";

-- Add a column
ALTER TABLE "swipes" ADD COLUMN "ttpe" TEXT;

-- Rename a column
ALTER TABLE "swipes" RENAME COLUMN "ttpe" TO "type";

-- Delete a column
ALTER TABLE "swipes" DROP COLUMN "type";
