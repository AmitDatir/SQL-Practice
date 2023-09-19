--Database:
--Create a new database:
CREATE DATABASE db_name;
--Delete any database:
DROP DATABASE db_name;
--Use specific database:
USE db_name;



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

--Exp.:
CREATE TABLE student (
  id INT PRIMARY KEY,   
  name VARCHAR(50),
  age INT NOT NULL
); 
INSERT INTO student VALUES(1, "Amit", 25);
INSERT INTO student VALUES(2, "Abhi", 27);
