-- Use mfa.db
SELECT * FROM "collections";

-- Add a column for deleted items
ALTER TABLE "collections" ADD COLUMN "deleted" INTEGER DEFAULT 0;

-- Soft delete an item
UPDATE "collections" SET "deleted" = 1
WHERE "title" = 'Farmers working at dawn';

-- Create a view with only non-deleted items
CREATE VIEW "current_collections" AS
SELECT "id", "title", "accession_number", "acquired"
FROM "collections"
WHERE "deleted" = 0;

SELECT * FROM "current_collections";

-- We can't update a View
DELETE FROM "current_collections"
WHERE "title" = 'Imaginative landscape';
-- Parse error near line 4: cannot modify current_collections because it is a view

-- We can modify the View using a trigger, so the tables it uses are modified instead
CREATE TRIGGER "delete"
INSTEAD OF DELETE ON "current_collections"
FOR EACH ROW
BEGIN
    UPDATE "collections" SET "deleted" = 1
    WHERE "id" = OLD."id";
END;

.schema

-- Now we can execute the next query
DELETE FROM "current_collections"
WHERE "title" = 'Imaginative landscape';

SELECT * FROM "current_collections";

SELECT * FROM "collections";

-- Create a condition to handle the addition
-- this one needs a condition to verify that the collection already exists
-- DROP TRIGGER "insert_when_exists"
CREATE TRIGGER "insert_when_exists"
INSTEAD OF INSERT ON "current_collections"
FOR EACH ROW
WHEN NEW."accession_number" IN (
    SELECT "accession_number" FROM "collections"
)
BEGIN
    UPDATE "collections" SET "deleted" = 0
    WHERE "accession_number" = NEW."accession_number";
END;

.schema

-- Try to insert into the View
INSERT INTO "current_collections" ("title", "accession_number", "acquired")
VALUES ('Imaginative landscape', '56.496', NULL);

SELECT * FROM "current_collections";
