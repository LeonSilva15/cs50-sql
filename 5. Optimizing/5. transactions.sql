-- Transaction: A unit of work in a database
-- ACID:
    -- Atomicity
    -- Consistency
    -- Isolation
    -- Durability

-- BEGIN TRANSACTION;
-- ...
-- COMMIT;

-- Use bank.db
.schema
SELECT * FROM "accounts";

-- Simple update step by step
UPDATE "accounts" SET "balance" = "balance" + 10
WHERE "id" = 2;
UPDATE "accounts" SET "balance" = "balance" - 10
WHERE "id" = 1;

SELECT * FROM "accounts";

UPDATE "accounts" SET "balance" = "balance" + 10
WHERE "id" = 1;
UPDATE "accounts" SET "balance" = "balance" - 10
WHERE "id" = 2;

SELECT * FROM "accounts";

-- The inconvenience relies in the time gap between updates
-- We can use a transaction to complete an action before making it
-- available for other users
BEGIN TRANSACTION;
UPDATE "accounts" SET "balance" = "balance" + 10
WHERE "id" = 2;
UPDATE "accounts" SET "balance" = "balance" - 10
WHERE "id" = 1;
-- If another user selects this data, won't see any modification
COMMIT; -- All the changes will happen at once

-- If we have an error during the transaction, we can cancel it using ROLLBACK
BEGIN TRANSACTION;
UPDATE "accounts" SET "balance" = "balance" + 10
WHERE "id" = 2;
UPDATE "accounts" SET "balance" = "balance" - 10
WHERE "id" = 1;
-- The substraction failed:
-- Runtime error: CHECK constraint failed: balance (19)
ROLLBACK; -- We can rollback the transaction

-- Transactions prevent race condition vulnerabilities

-- We can use locks to prevent others to read from the database
-- using the EXCLUSIVE keyword
BEGIN EXCLUSIVE TRANSACTION;

SELECT * FROM "accounts";
-- Parse error: database is locked (5)
