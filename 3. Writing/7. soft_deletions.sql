-- When necessary, we can have a column to mark deleted records
-- instead of removing them from the table

-- Add the "deleted" column to "collections"
ALTER TABLE "collections" ADD COLUMN "deleted" INTEGER DEFAULT 0;

.schema collections

SELECT * FROM "collections"

-- Soft delete a collection
UPDATE "collections" SET "deleted" = 1
    WHERE "title" = 'Farmers working at dawn';

-- Get not deleted collections
SELECT * FROM "collections" WHERE "deleted" != 1;

-- Get deleted collections
SELECT * FROM "collections" WHERE "deleted" = 1;

-- The ethical question: when to delete user data
