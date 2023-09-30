--SAFE mode in MySQL : prevents us from making unwanted changes, it is ON by default
--To turn of SAFE mode :
SET SQL_SAFE_UPDATES=0;   --to turn ON, set value to 1

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




  
Database:
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




Table:
--Create a new table:
CREATE TABLE table_name (       --create table schema
  column_name1 datatype constraint,
  column_name2 datatype constraint,
  column_name3 datatype constraint
);

--Insert row values:(when order of column defined & type is known to us)
INSERT INTO table_name VALUES(id, name, age);

--Insert values inside limited columns with specific order:
INSERT INTO table_name
  (colname1, colname2)
  VALUES
  (col1_v1, col2_v1),
  (col1_v2, col2_v2);

--To select & view entire table added:
SELECT * FROM table_name;

--To display all the tables created from the database in use:
SHOW TABLES;

--Delete any table:
DROP TABLE table_name;

--Exp.:
CREATE TABLE student (
  id INT PRIMARY KEY,   --Primary Key is always unique and not null
  name VARCHAR(50),
  age INT NOT NULL
); 
INSERT INTO student VALUES(1, "Amit", 25);
INSERT INTO student VALUES(2, "Abhi", 27);
SELECT * FROM student;



--KEYS:
PRIMARY KEY
-- It is a column(or set of columns) in a table that uniquely idetifies each row.(a unique key)
-- There is only 1 primary key and it should be NOT NULL

FOREIGN KEY
-- It is a column(or set of columns) in a table that refers to the primary key of another table
-- There can be multiple Foreign keys
-- Foreign keys can have duplicate and NULL values



--Constraints: (used to specify rules for data in a table)
NOT NULL
-- columns can not have NULL values
  
UNIQUE
-- all values in column are different
  
PRIMARY KEY
-- makes a column unique and not null but used only once
-- Define1:
CREATE TABLE table_name (       
  column_name1 datatype PRIMARY KEY
);
-- Define2:
CREATE TABLE table_name (      
  column_name1 datatype constraint,
  column_name2 datatype constraint,
  column_name3 datatype constraint,
  PRIMARY KEY (column_name1)         
);
-- Define3:
CREATE TABLE table_name (      
  column_name1 datatype constraint,
  column_name2 datatype constraint,
  column_name3 datatype constraint,
  PRIMARY KEY (column_name1, column_name2)     --in this case, both columns can have duplicate values but their combination should be unique     
);

FOREIGN KEY
-- prevent action that would destroy links between two tables
-- Define1:
CREATE TABLE table_name1 (      
  column_name1 datatype PRIMARY KEY,
  column_name2 datatype constraint,
  column_name3 datatype constraint,
  FOREIGN KEY (column_name3) REFERENCES table_name2 (column_name4)           --column_name4 will be a primary key of table_name2
);
--Use Database > Reverse Engineer option inside MySQL to visualize parent-child table relation with use of foreign key
--It displays EER diagram of tables created and displayed relation if any created using foreign key (Enhanced Entity-Relationship (EER))
--Parent table: table in which column of primary key is used as foreign key in other table
--Child table: table in which foreign key is defined

DEFAULT
-- sets the default value of a column
-- Define:
CREATE TABLE table_name (
  column_name1 datatype PRIMARY KEY
  column_name2 datatype DEFAULT (default value)
);

CHECK
-- it can limit the values allowed in a column
-- Define1:
CREATE TABLE table_name (
  column_name1 datatype CHECK(condition)   --exp: CHECK(age >= 18)
);
-- Define2:
CREATE TABLE table_name (      
  column_name1 datatype constraint,
  column_name2 datatype constraint,
  column_name3 datatype constraint,
  CONSTRAINT constraint_name CHECK (conditions)        --exp: CHECK(age >=18 AND/OR city="Delhi")
);



SELECT :
--Use to select any data from the database
-- Basic syntax:
SELECT col1, col2 FROM table_name;

-- To select all:
SELECT * FROM table_name;

-- To display unique values from the table column:
SELECT DISTINCT col1 FROM table_name;




WHERE clause:
--To define some conditions
-- Basic syntax:
SELECT col1, col2 FROM table_name
  WHERE conditions;               --exp.: WHERE marks > 80 OR city = "Mumbai";

--Using operators in WHERE:
Arithmatic Operator : + , - , * , / , %
Comparison Operator : =(equal to), !=(not equal to), > , < , >= , <=
Logical Operator : AND, OR, NOT, IN, BETWEEN, ALL, LIKE, ANY
Bitwise Operator : &(Bitwise AND), |(Bitwise OR)


  
--Operators:
AND 
--to check both conditions to be true
--Syntax:
SELECT * FROM table_name WHERE condition1 AND condition2;

OR 
--to check for one of the conditions to be true
--Syntax:
SELECT * FROM table_name WHERE condition1 OR condition2;

BETWEEN
--to select between given range
--Syntax:
SELECT * FROM table_name WHERE column1 BETWEEN value1 AND value2;  --both values are inclusive

IN
--to select value that matches any value in list
--Syntax:
SELECT * FROM table_name WHERE column1 IN (value1, value2);

NOT
--to negate the given condition
--Syntax:
SELECT * FROM table_name WHERE column1 NOT IN (value1, value2);  --reverse the given condition



LIMIT clause:
--sets upper limit on number of (tuples) rows to be returned
-- Basic syntax:
SELECT * FROM table_name
  WHERE conditions
  LIMIT number;               --exp.: SELECT * FROM student LIMIT 3;



ORDER BY clause: 
--to sort in ascending(ASC) or descending order(DESC)
-- Basic syntax:
SELECT * FROM table_name
  ORDER BY column1 ASC;               --exp.: SELECT * FROM student ORDER BY city ASC;
-- by default, ascending sort is applied if not stated


Aggregate functions:
--aggregate functions perform a calculation on a set of values and return a single value
COUNT() : --to get count of entries in a column
MAX() : --to get max value from the column
MIN() : --to get min value from the column
SUM() : --to get sum of all values from the column
AVG() : --to get avg of all values from the column



GROUP BY clause: 
--groups rows that have the same values into summary rows.
--It collects data from multiple records and groups the result by one or more column
--Generally, we use GROUP BY clause with some aggregation function
-- Basic syntax:
SELECT column1, fun(column2) FROM table_name
  GROUP BY column1;                           --exp.: SELECT city, count(name) FROM student GROUP BY city;

--we need to use GROUP BY clause on same number of columns as we used in SELECT clause without aggregate function



HAVING clause: 
--similar to WHERE clause i.e. applied some conditions on rows.
--Used when we want to apply any condition after grouping. 
-- Basic syntax:
SELECT column1, fun(column2) FROM table_name
  GROUP BY column1
  HAVING conditions;                           --exp.: SELECT count(name), city FROM student GROUP BY city HAVING max(marks) > 90;
--WHERE applies conditions on rows & HAVING applies conditions on groups



--General order of Commands:
  
SELECT column(s)
FROM table_name
WHERE condition
GROUP BY column(s)
HAVING condition
ORDER BY column(s) ASC;




--TABLE related queries:
UPDATE
--to update existing row
--Syntax:
UPDATE table_name
SET col1 = val1, col2 = val2
WHERE condition;                   --exp.: UPDATE student SET grade = "O" WHERE grade = "A";

DELETE
--to delete existing row
--Syntax:
DELETE from table_name
WHERE condition;                   --exp.: DELETE FROM student WHERE marks < 33;

TRUNCATE
--to delete table's data
--Syntax:
TRUNCATE TABLE table_name;
--DROP command delete the complete table where as TRUNCATE delete the data inside the table and not the table itself


ALTER
--to change schema(columns, datatypes, constraints)

--ADD column
ALTER TABLE table_name
ADD COLUMN column_name datatype constraint;       --exp.: ALTER TABLE student ADD COLUMN age INT NOT NULL DEFAULT 19;

--DROP column
ALTER TABLE table_name
DROP COLUMN column_name;                         --exp.: ALTER TABLE student DROP COLUMN age;

--RENAME table
ALTER TABLE table_name
RENAME TO new_table_name;                        --exp.: ALTER TABLE student RENAME TO stu;

--CHANGE column(rename)
ALTER TABLE table_name
CHANGE COLUMN old_column_name new_column_name new_datatype new_constraint;         --exp.: ALTER TABLE student CHANGE COLUMN age stu_age INT;

--MODIFY column(modify datatype, constraint)
ALTER TABLE table_name
MODIFY COLUMN column_name new_datatype new_constraint;                       --exp.: ALTER TABLE student MODIFY COLUMN age VARCHAR(2);





--Cascading for FOREIGN KEY:
ON DELETE CASCADE
--When we create foreign key using this option, it deletes the referencing rows in child table when the referenced row is deleted in the parent table which has a primary key.

ON UPDATE CASCADE
--When we create foreign key using this option, the referencing rows are updated in the child table when the referenced row is updated in the parent table which has a primary key.

-- Syntax:
CREATE TABLE table_name1 (      
  column_name1 datatype PRIMARY KEY,
  column_name2 datatype constraint,
  column_name3 datatype constraint,
  FOREIGN KEY (column_name3) REFERENCES table_name2 (column_name4)          
  ON DELETE CASCADE
  ON UPDATE CASCADE
);
--Exp.: 
CREATE TABLE student (      
  id INT PRIMARY KEY,
  courseID INT,
  FOREIGN KEY (courseID) REFERENCES course (id)          
  ON DELETE CASCADE
  ON UPDATE CASCADE
);




--Alias: We can use AS keyword to set an alias to particular table/column




Joins in SQL
--JOIN is used to combine rows from two or more tables, based on a related column between them
--Types of Joins:
INNER JOIN -- only common data available in both tables is shown
OUTER JOIN -- common data + data of one/more table is displayed 
  LEFT JOIN -- gives data of left table+ common data
  RIGHT JOIN -- gives data of right table+ common data
  FULL JOIN -- gives complete data of both the tables

INNER JOIN
--returns records that have matching values in both tables
--Syntax:
SELECT column(s)
FROM tableA                        --we can either take tableA or tableB for inner join as it will return only common data
INNER JOIN tableB
ON tableA.col_name = tableB.col_name;           --exp.: SELECT * FROM student as s INNER JOIN course as c ON s.student_id = c.student_id;

LEFT JOIN
--returns all records from LEFT table and the matched records from the RIGHT table
--Syntax:
SELECT column(s)
FROM tableA                        
LEFT JOIN tableB
ON tableA.col_name = tableB.col_name;           --exp.: SELECT * FROM student as s LEFT JOIN course as c ON s.student_id = c.student_id;

RIGHT JOIN
--returns all records from RIGHT table and the matched records from the LEFT table
--Syntax:
SELECT column(s)
FROM tableA                        
RIGHT JOIN tableB
ON tableA.col_name = tableB.col_name;           --exp.: SELECT * FROM student as s RIGHT JOIN course as c ON s.student_id = c.student_id;

FULL JOIN
--returns all records when there is a match in either left or right table
--no FULL JOIN command in MySQL, we can do it in ORACLE. We use UNION command to execute FULL JOIN
--Syntax in MySQL:
SELECT *
FROM tableA                        
LEFT JOIN tableB
ON tableA.col_name = tableB.col_name;
UNION                                 --it gives unique values between two tables,  does not give duplicate values
SELECT *
FROM tableA 
RIGHT JOIN tableB
ON tableA.col_name = tableB.col_name;           --exp.: SELECT * FROM student as s LEFT JOIN course as c ON s.student_id = c.student_id UNION SELECT * FROM student as s RIGHT JOIN course as c ON s.student_id = c.student_id;

LEFT EXCLUSIVE JOIN
--returns all records from LEFT table where no records match from the RIGHT table
--Syntax:
SELECT column(s)
FROM tableA                        
LEFT JOIN tableB
ON tableA.col_name = tableB.col_name
WHERE tableB.col_name IS NULL;           --exp.: SELECT * FROM student as s LEFT JOIN course as c ON s.student_id = c.student_id WHERE c.student_id IS NULL;

RIGHT EXCLUSIVE JOIN
--returns all records from RIGHT table where no records match from the LEFT table
--Syntax:
SELECT column(s)
FROM tableA                        
RIGHT JOIN tableB
ON tableA.col_name = tableB.col_name
WHERE tableA.col_name IS NULL;           --exp.: SELECT * FROM student as s RIGHT JOIN course as c ON s.student_id = c.student_id WHERE s.student_id IS NULL;

FULL EXCLUSIVE JOIN
-- returns all records from LEFT & RIGHT table where no records match from the both tables
--Syntax: ???

SELF JOIN
--it is a regular join but table is joined with itself.
--Syntax:
SELECT column(s)
FROM table as a                       
JOIN table as b
ON a.col_name = b.col_name;           --exp.: SELECT a.name as manager_name, b.name FROM employee as a JOIN employee as b ON a.id = b.manager_id;




UNION
--It is used to combine the result-set of two or more SELECT statements
--Gives UNIQUE records.
-- To use it: 1. every SELECT statement should have same no. of columns   2. columns must have similar data type  3. columns in every SELECT statement should be same order
--Syntax:
SELECT column(s) FROM tableA
UNION
SELECT column(s) FROM tableB

UNION ALL
--It is used to combine the result-set of two or more SELECT statements & gives duplicate values as well
--Syntax:
SELECT column(s) FROM tableA
UNION ALL
SELECT column(s) FROM tableB



--SQL sub-queries:
