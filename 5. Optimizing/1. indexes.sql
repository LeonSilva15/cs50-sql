-- Indexes sepeed up the retrieval of the data

-- Create an index on the movie titles
CREATE INDEX "title_index" ON "movies" ("title");
-- Run Time: real 0.241 user 0.207234 sys 0.025980

-- Now when looking for a title is faster
SELECT * FROM "movies"
WHERE "title" = 'Cars';
-- 317219   |   Cars    |   2006
-- Run Time: real 0.000 user 0.000135 sys 0.000136
