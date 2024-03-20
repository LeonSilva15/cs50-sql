-- Vacuum reduces the size of our database after deleting data
-- It returns the unused bits to the OS

-- In the terminal:
-- $ du movies.db 
-- 327712  movies.db

DROP INDEX "person_index";
.schema

-- In the terminal:
-- $ du movies.db 
-- 327712  movies.db

DROP INDEX "name_index";
.schema

-- In the terminal:
-- $ du movies.db 
-- 327712  movies.db

-- Now we use the VACUUM command:
VACUUM;
-- In the terminal:
-- $ du movies.db 
-- 196640  movies.db
