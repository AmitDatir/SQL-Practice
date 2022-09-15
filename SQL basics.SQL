--BAISC SQL QUERIES:

--Most used Data types in SQL:
INT               -- Whole numbers
DECIMAL(x,y)      -- Decimal numbers(to store exact number, x denotes before decimal digits & y for after decimal digits)
VARCHAR(x)        -- String of text with length x
BLOB              -- Binary large data, stores large data
DATE              -- 'YYYY-MM-DD'
TIMESTAMP         -- 'YYYY-MM-DD HH:MM:SS' 

--Comparison Operator:
=   :  equals
<>  :  not equals
>   :  greater than
<   :  less than
>=  :  greater than or equal
<=  :  less than or equal

--Create table:      --creation of schema
CREATE TABLE table_name (        --name of the column instead of table_name   
     student_id INT PRIMARY KEY,   
     name VARCHAR(20),
     major VARCHAR(20)
);                --All SQL keywords are written in CAPS for easy identification

--To add primary key later:
CREATE TABLE table_name (
     student_id INT,   
     name VARCHAR(20),
     major VARCHAR(20),
     PRIMARY KEY(student_id)
); 

--Describing created table:
DESCRIBE table_name;        --describes information of created table

--Deleting the table:
DROP TABLE table_name;

--Addition of extra columns:
ALTER TABLE table_name ADD gpa DECIMAL(3,2);   --name of column instead of gpa

--Delete unwanted column:
ALTER TABLE table_name DROP COLUMN gpa;



--INSERT:
--Inserting info into table:
INSERT INTO table_name VALUES(1, 'Jack', 'Biology');   --enter data in same order as column order; can be used to enter multiple enteries


--Grabbing all the info from table:
SELECT * FROM table_name;    --shows all the data from table

--To add only known column info:
INSERT INTO table_name(student_id, name) VALUES(3, 'Claire');    --whenever we do not enter any column data, it is shown as Null

--We can not enter duplicate enteries in Primary key column
--All the commands are ended with ;



--Constraints: 
--To make column to have NOT NULL value & UNIQUE value:
CREATE TEABLE table_name(
	student_id INT,
	name VARCHAR(20) NOT NULL,      --make column 'name' to not have NULL value
	major VARCHAR(20) UNIQUE,       --every row for column will be UNIQUE, will get an error message for duplicate enteries
	PRIMARY KEY(student_id)
);
--instad of NOT NULL, if we enter NULL >> we will have all values as NULL

--To set DEFAULT value of any column:
CREATE TEABLE table_name(
	student_id INT,
	name VARCHAR(20), 
	major VARCHAR(20) DEFAULT 'undecided',     --if we do not insert any value for major, then undecided will be saved
	PRIMARY KEY(student_id)
);

--To AUTO INCREMENT any column values:
CREATE TEABLE table_name(
	student_id INT AUTO_INCREMENT,       --value of column student_id starts from 1 & goes on even if we don't insert it anywhere 
 	name VARCHAR(20), 
	major VARCHAR(20) 
	PRIMARY KEY(student_id)
);



--Update:
--UPDATE any value from table:
UPDATE table_name
SET column_name = new_value
WHERE column_name = old_value;   --all old values are updated with new values in the table

--UPDATE for any specific condition:
UPDATE table_name
SET column_name = new_value
WHERE any_column = value_of_column;

--using OR condition for UPDATE:
UPDATE table_name
SET column_name = new_value
WHERE column1 = value1 OR column1= value2;

--UPDATE multiple values:
UPDATE table_name
SET column1 = value1, column2 = value2
WHERE any_column = value_of_column;

--UPDATE same value in all column:
UPDATE table_name
SET column_name = new_value;      --without WHERE statement, there is no condition & selected column will have new value for all rows



--Delete:
--DELETE all the rows from table:
DELETE FROM table_name;     --table is still there with all rows deleted

--DELETE specific row:
DELETE FROM table_name
WHERE column_name = value1;

--using AND condition for DELETE:
DELETE FROM table_name
WHERE column1 = value1 AND column2 = value2;



--Basic Queries:

--SELECT keyword:
--to show all the info from table:
SELECT * FROM table_name;

--to show specific column details from table:
SELECT column_name FROM table_name;

--to show multiple columns:
SELECT column1, column2 FROM table_name;
-- OR:
SELECT table_name.column1, table_name.column2 
FROM table_name;

--to show data in ordered view:
SELECT table_name.column1, table_name.column2 
FROM table_name
ORDER BY column1;      -- both columns will be shown in alphabetical/ordered view of column1
-- to show in descending/ascending order:
ORDER BY column3 DESC;    --ASC for ascending order 


--to show data in multiple order:
SELECT *
FROM table_name
ORDER BY column1, column2 DESC;    -- 1st in order of column1, if same entries then descending order of column2

--limit result shown;
SELECT *
FROM table_name
ORDER BY column1 DESC
LIMIT x;         -- x: any number of rows we want to show
 

--Filter:(WHERE)
SELECT *           -- or column3, column4
FROM table_name
WHERE column1 = value1 OR column2 = value2;   -- or AND column2 = value2

--multiple values from 1 column:
SELECT *
FROM table_name
WHERE column1 IN (value1, value2, value3);
