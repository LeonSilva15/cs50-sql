-- Use movies.db

-- Looking for a movie in a big database is expensive
SELECT * FROM "movies"
WHERE "title" = 'Cars';

-- We can measure this using .timer
.timer on
-- .timer off

SELECT * FROM "movies"
WHERE "title" = 'Cars';
-- 317219   |   Cars    |   2006
-- Run Time: real 0.045 user 0.040075 sys 0.005056

-- When the data is unsorted, we have to look and compare one by one
-- this is called scannig
