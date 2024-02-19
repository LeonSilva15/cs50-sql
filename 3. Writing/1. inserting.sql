-- Specify the table and the columns where the data will be inserted
-- Then specify the values
INSERT INTO "collections" ("id", "title", "accession_number", "acquired")
    VALUES (1, 'Profusion of flowers', '56.257', '1956-04-12');

INSERT INTO "collections" ("id", "title", "accession_number", "acquired")
    VALUES (2, 'Farmers working at dawn', '11.6152', '1911-08-03');

-- Not providing id, will automatically set the next number due to the PRIMARY KEY constraint
INSERT INTO "collections" ("title", "accession_number", "acquired")
    VALUES ('Spring out', '14.76', '1914-01-08');

-- The UNIQUE constraint will throw an error when trying to repeat unique values
-- Runtime error: UNIQUE constraint failed: collections.accession_number (19)
-- INSERT INTO "collections" ("title", "accession_number", "acquired")
--     VALUES ('Spring out', '14.76', '1914-01-08');

-- The NOT NULL constraint will throw the same error
-- Runtime error: NOT NULL constraint failed: collections.title (19)
-- INSERT INTO "collections" ("title", "accession_number", "acquired")
--     VALUES (NULL, NULL, '190-01-10');

-- INSERT multiple rows simultaneously
INSERT INTO "collections" ("title", "accession_number", "acquired")
    VALUES
        ('Imaginative landscape', '56.496', NULL),
        ('Peonies and butterfly', '06.1899', '1906-01-01');
