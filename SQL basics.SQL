--SQL Commands:

--Most used Data types in SQL:
INT               -- Whole numbers
DECIMAL(x,y)      -- Decimal numbers(to store exact number, x denotes before decimal digits & y for after decimal digits)
VARCHAR(x)        -- String of text with length x
CHAR(x)           -- to add character
BLOB              -- Binary large data, stores large data
DATE              -- 'YYYY-MM-DD'
TIMESTAMP         -- 'YYYY-MM-DD HH:MM:SS' 

--Create table:      --creation of schema
CREATE TABLE table_name (        --name of the table instead of table_name   
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

