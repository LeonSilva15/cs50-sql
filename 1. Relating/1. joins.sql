-- This is how the database looks
SELECT * FROM "sea_lions";
SELECT * FROM "migrations";

-- LEFT JOIN, RIGTH JOIN and FULL JOIN are part of the OUTER JOINs
-- JOIN and NATURAL JOIN are part of the INNER JOINs

-- Extend the sea_lions table with the migrations table using JOIN
-- This will repeated column names
SELECT * FROM "sea_lions"
    JOIN "migrations" ON "migrations"."id" = "sea_lions"."id";
-- id	name	species	id	distance	days
-- 10484	Ayah	Zalophus californianus	10484	1000	107
-- 11728	Spot	Zalophus californianus	11728	1531	56
-- 11729	Tiger	Zalophus californianus	11729	1370	37
-- 11732	Mabel	Zalophus californianus	11732	1622	62
-- 11734	Rick	Zalophus californianus	11734	1491	58

-- Prioritize data from the left table using LEFT JOIN
-- This shows all the data from sea_lions
-- only filtering the migrations data to be displayed
SELECT * FROM "sea_lions"
    LEFT JOIN "migrations" ON "migrations"."id" = "sea_lions"."id";
-- id	name	species	id	distance	days
-- 10484	Ayah	Zalophus californianus	10484	1000	107
-- 11728	Spot	Zalophus californianus	11728	1531	56
-- 11729	Tiger	Zalophus californianus	11729	1370	37
-- 11732	Mabel	Zalophus californianus	11732	1622	62
-- 11734	Rick	Zalophus californianus	11734	1491	58
-- 11790	Jolee	Zalophus californianus	NULL	NULL	NULL

-- Prioritize data from rigth table using RIGHT JOIN
SELECT * FROM "sea_lions"
    RIGHT JOIN "migrations" ON "migrations"."id" = "sea_lions"."id";
-- id	name	species	id	distance	days
-- 10484	Ayah	Zalophus californianus	10484	1000	107
-- 11728	Spot	Zalophus californianus	11728	1531	56
-- 11729	Tiger	Zalophus californianus	11729	1370	37
-- 11732	Mabel	Zalophus californianus	11732	1622	62
-- 11734	Rick	Zalophus californianus	11734	1491	58
-- NULL	NULL	NULL	11735	2723	82
-- NULL	NULL	NULL	11736	1571	52
-- NULL	NULL	NULL	11737	1957	92

-- Get all the data from both and join the ones with matching id
SELECT * FROM "sea_lions"
    FULL JOIN "migrations" ON "migrations"."id" = "sea_lions"."id";
-- id	name	species	id	distance	days
-- 10484	Ayah	Zalophus californianus	10484	1000	107
-- 11728	Spot	Zalophus californianus	11728	1531	56
-- 11729	Tiger	Zalophus californianus	11729	1370	37
-- 11732	Mabel	Zalophus californianus	11732	1622	62
-- 11734	Rick	Zalophus californianus	11734	1491	58
-- 11790	Jolee	Zalophus californianus	NULL	NULL	NULL
-- NULL	NULL	NULL	11735	2723	82
-- NULL	NULL	NULL	11736	1571	52
-- NULL	NULL	NULL	11737	1957	92

-- Combine the matching columns
SELECT * from "sea_lions"
    NATURAL JOIN "migrations";
-- id	name	species	distance	days
-- 10484	Ayah	Zalophus californianus	1000	107
-- 11728	Spot	Zalophus californianus	1531	56
-- 11729	Tiger	Zalophus californianus	1370	37
-- 11732	Mabel	Zalophus californianus	1622	62
-- 11734	Rick	Zalophus californianus	1491	58
