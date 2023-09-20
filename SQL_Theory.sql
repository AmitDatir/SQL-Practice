--Database:
--Create a new database:
CREATE DATABASE db_name;
--Create database only if not created earlier:
CREATE DATABASE IF NOT EXISTS db_name;   --Shows only warning, instead of error if database already exist
--Delete any database:
DROP DATABASE db_name;
--Delete database only if it exist:
DROP DATABASE IF EXISTS db_name;   --Shows only warning, instead of error if database does not exist
--Use specific database:
USE db_name;
--To display all the database created:
SHOW DATABASES;




--Table:
--Create a new table:
CREATE TABLE table_name (
  column_name1 datatype constraint,
  column_name2 datatype constraint,
  column_name3 datatype constraint
);
--Insert row values:
INSERT INTO table_name VALUES(id, name, age);
--To view entire table added:
SELECT * FROM table_name;
--To display all the tables created from the database in use:
SHOW TABLES;

--Exp.:
CREATE TABLE student (
  id INT PRIMARY KEY,   
  name VARCHAR(50),
  age INT NOT NULL
); 
INSERT INTO student VALUES(1, "Amit", 25);
INSERT INTO student VALUES(2, "Abhi", 27);



--SQL Datatypes:
CHAR(x)  --Stores String(0-255), stores character with Fixed memory allocation
VARCHAR(x)  --Stores String(0-255), stores character only upto given length of string
BLOB(x)  --Stores large binary objects/large string(0-65535) 
INT  --Stores integers(-2147 to 483648 || 2147 to 483647)
TINYINT  --Stores small integers(-128 TO 127)
BIGINT  --Stores big integers(-9223372036854775808 to 9223372036854775807)
BIT(x)  --Stores x-bit values, x value ranges from 1 to 64
FLOAT  --Stores decimal number, precision upto 23 digits
DOUBLE  --Stores decimal number, precision from 24 to 53 digits
BOOLEAN  --Boolean values 0 or 1
DATE  --date in format YYYY-MM-DD ranging from 1000-01-01 to 9999-12-31
YEAR  --year in 4 digit from 1901 to 2155

--Signed & Unsigned datatypes:By default, all numeric datatypes can include negative values(Signed Datatypes). We can define specific numeric data types as unsigned datatype, to include only positive values
--Unsigned: TINYINT UNSIGNED(0 to 255)
--Signed: TINYINT (-128 to 127)



--Types of SQL Commands:
DDL(Data Definition Language) : Create, alter, rename, truncate & Drop
DQL(Data Query Language) : Select
DML(Data Manipulation Language) : insert, update & delete
DCL(Data Control Language) : grant & revoke permission to user
TCL(Transaction Control Language) : Start Transaction, commit, rollback
