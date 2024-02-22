-- We use trigger to execute commands everytime an action happens
-- CREATE TRIGGER name
-- [AFTER | BEFORE] [INSERT | UPDATE OF column | DELETE] ON table
-- FOR EACH ROW
-- BEGIN
--     ...;
-- END;

CREATE TABLE "transactions" (
    "id" INTEGER,
    "title" TEXT,
    "action" TEXT,
    PRIMARY KEY("id")
);

-- Register the sell transaction everytime a collection is sold
CREATE TRIGGER "sell"
BEFORE DELETE ON "collections"
FOR EACH ROW
BEGIN
    INSERT INTO "transactions" ("title", "action")
    VALUES (OLD."title", 'sold');
END;
-- DROP TRIGGER "sell"

DELETE FROM "collections" WHERE "title" = 'Profusion of flowers';

SELECT * FROM "collections";
SELECT * FROM "transactions";

-- Register the addition too
CREATE TRIGGER "buy"
AFTER INSERT ON "collections"
FOR EACH ROW
BEGIN
    INSERT INTO "transactions" ("title", "action")
    VALUES (NEW."title", 'bought');
END;
-- DROP TRIGGER "buy"

INSERT INTO "collections" ("title", "accession_number", "acquired")
    VALUES ('Profusion of flowers', '56.247', '1956-04-12');

SELECT * FROM "collections";
SELECT * FROM "transactions";
