-- Use the NULL keyword to get titles with no translator
SELECT "title", "translator" FROM "longlist"
    WHERE "translator" IS NULL;

-- Use the NULL keyword to get only titles with translator
SELECT "title", "translator" FROM "longlist"
    WHERE "translator" IS NOT NULL;
