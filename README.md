# Harvard CS50 SQL
This repo contains my coursework from Harvard's CS50 SQL.

The course can be followed in the [official site](https://cs50.harvard.edu/sql/2024/).

## Installation
To follow this course, we use `SQLite`, which can be installed in MacOS using `brew`.
```
brew install sqlite
```
Start using `sqlite` with the next command. This will open the database using `sqlite3`
```
sqlite3 longlist.db
```
Get the full list of sqlite3 commands
```
.help
```
Exit the cli using
```
.quit
```
List the existing tables
```
.tables
```
Get the database DDL
```
.schema
```
Get a table DDL
```
.schema books
```
Execute a sql file
```
.read <FILE>
.read schema.sql
```
Import data from file
```
.import --<FORMAT> --<FLAGS> <FILE> <TABLE>
.import --csv --skip 1 mfa.csv collections
```
