#More basic queries:

--Find all employees
SELECT * FROM employee;


--Find all client
SELECT * FROM client;

--Find all employeess ordered by salary
SELECT * FROM employee ORDER BY salary;      --to get ordered data wrt to any column(by default in ASC order)
--SELECT * FROM employee ORDER BY salary DESC;  --order in descending

--Find all employees ordered by sex then name:
SELECT * FROM employee ORDER BY sex, first_name, last_name;    -data is 1st ordered wrt to sex column, then first_name & then last_name

--Find 1st 5 employees in the table:
SELECT * employee LIMIT 5;       --limits result shown to 5 rows

-Find 1st & last name of all employees:
SELECT first_name, last_name FROM employee;   --shows only result from first_name & last_name columns instead of all

--Find the forename & surnames of all employees:
SELECT first_name AS forename, last_name AS surname FROM employee;    --renames the column title displayed in the result: first_name as forename & last_name as surname

--Find out all the different genders
SELECT DISTINCT sex FROM employee;    --shows all the distinct values in the column sex



#SQL Functions: a block of code we can call to do some things for us

--Find the number of employees:
SELECT COUNT(emp_id) FROM employee;    --counts emp_ids present

--Find the number of female employees born after 1970:
SELECT COUNT(emp_id) FROM employee WHERE sex = 'F' AND birth_date > '1970-01-01';    

--Find the average of all employee's salaries:
SELECT AVG(salary) FROM employee;   --shows average of column salary

--Find the sum of all employee's salaries:
SELECT SUM(salary) FROM employee;   --shows sum of column salary


#Aggregation:
--Find out how many males & females there are:
SELECT COUNT(sex), sex FROM employee GROUP BY sex;    --it groups the result information by sex

--Find the total sales of each Salesman:
SELECT SUM(total_sale), emp_id FROM work_with GROUP BY emp_id;    --result displays total sale by each employee


#WILDCARDS:
-- % = any # characters; _ = one character

--Find any client's who are an LLC
SELECT * FROM client WHERE client_name LIKE '%LLC';    --using % means it should include any number of characters before LLC & LIKE is used to compare

--Find any branch suppliers who are in the label business
SELECT * FROM branch_supplier WHERE supplier_name LIKE '%Label%';  --match word Label before & after any strings

--Find any employee born in October
SELECT * FROM employee WHERE birth_date LIKE '____-10%';    --we use 4*_ to represent one character then match eaxctly -10 after that any string represented by %

--Find any clients who are schools
SELECT * FROM client WHERE client_name LIKE '%school%';



#Unions:
--Find a list of employee and branch names:
SELECT first_name FROM employee UNION SELECT branch_name FROM branch;        --UNION just returns both the query result in one single column
--We need to have same number of columns in both queries & same data type as well
--result column shows column title of column from 1st query or set by AS syntax

--Find a list of all clients & branch suppliers names:
SELECT client_name, client.branch_id FROM client UNION SELECT supplier_name, branch_supplier.branch_id FROM branch_supplier;

--Find a list of all money spent or earned by the company
SELECT salary FROM employee UNION SELECT total_sales FROM works_with;



#Joins:
--Used to combine rows from 2 or more tables based on related column between them
--4 types of JOIN: ()
--1. General JOIN(INNER JOIN): joins two tables whenever they have any column in common
--2. LEFT JOIN: joins both tables but all the result from left table gets included but only include values available from right table(NULL displayed if no value available)
--3. RIGHT JOIN: joins both tables but all the result from right table gets included but only include values available from left table(NULL displayed if no value available) 
--4. FULL OUTER JOIN: includes both result from LEFT JOIN & RIGHT JOIN(can not be used in MySQL)

INSERT INTO branch VALUES(4, 'Buffalo', NULL, NULL);


--Find all branches and the name of their managers:
SELECT employee.emp_id, employee.first_name, branch.branch_name FROM employee JOIN branch ON employee.emp_id =branch.mgr_id;     --JOIN combines employee table & branch table together as 1 table ON specific column

 
#Nested Queries:
--A query where we use multiple SELECT statements in order to get specific information
--usually use prefix while using column names in query
--In case of nested queries, RDBMS will execute the embedded query 1st then it will execute the outer query

--Fnd names of all employees who have sold over 30000 to a single client
SELECT employee.first_name, employee.last_name FROM employee WHERE employee.emp_id IN ( SELECT works_with.emp_id FROM works_with WHERE works_with.total_sales > 30000);

--Find all clents who are handled by the branch that Michael Scott manages, Assume you know Michael's ID:
SELECT client.client_name FROM client WHERE client.brach_id = ( SELECT branch.branch_id FROM branch WHERE branch.mgr_id = 102 LIMIT 1);     --there might be a case that 1 manager id is related to multiple branch, to avoid that situation we are limiting the query result to 1


#ON DELETE:
--if we need to delete a row when foreign key is associated

#ON DELETE SET NULL: if we delete any of the row then all the associated data from database will be set to NULL (used if deleted row is not important)
#ON DELETE CASCADE: if we delete any of the row then all the associated data in the database will be deleted (used if deleted row is super important, mostly in case of deleted row contains crucial values for primary key)


#Triggers:
--A Trigger is a block of SQL code which we can write which will define a certain action that should happen when a certain opertaion gets performed on the database.

--Exp.: create a table to show use of trigger:
CREATE TABLE trigger_test ( message VARCHAR(100));
--need to use command line to change the SQL delimiter(MySQL 5.7 Command Lne Client) > might ask login & pwd; enter: { mysql -u root -p } which should prompt you for pwd.
use database_name      --to change the current database

--Trigger1: (to add some trigger whenever a new employee is added)
DELIMITER $$              --sepcial keyword to change MySQL delimiter, to change delimiter from {;} to {$$}
CREATE                    --create a new trigger
    TRIGGER my_trigger BEFORE INSERT           --naming trigger name & defining the execution of the same; Can use for UPDATE & DELETE  and for BEFORE & AFTER as well
    ON employee           --table name
    FOR EACH ROW BEGIN    
	INSERT INTO trigger_test VALUES('added new employee');
    END$$
DELIMITER ;           --changed the delimiter again to {;}

--Add new employee: 
INSERT INTO employee VALUES(109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3);

--To see trigger result:
SELECT * FROM trigger_test;

--Result : a new row with message: {added new employee}


--Trigger2: (to add trigger to show first_name whenever a new employee is added)
DELIMITER $$              --sepcial keyword to change MySQL delimiter, to change delimiter from {;} to {$$}
CREATE                    --create a new trigger
    TRIGGER my_trigger1 BEFORE INSERT           --naming trigger name & defining the execution of the same
    ON employee           --table name
    FOR EACH ROW BEGIN    
	INSERT INTO trigger_test VALUES(NEW.first_name);
    END$$
DELIMITER ;           --changed the delimiter again to {;}

--Add new employee: 
INSERT INTO employee VALUES(110, 'Kevin', 'Malone', '1978-02-19', 'M', 69000, 106, 3);

--To see trigger result:
SELECT * FROM trigger_test;

--Result : 
-- added new employee
-- added new employee
-- Kevin


--Trigger3: (to add trigger to show message based on gender of new employee added)
DELIMITER $$              --sepcial keyword to change MySQL delimiter, to change delimiter from {;} to {$$}
CREATE                    --create a new trigger
    TRIGGER my_trigger2 BEFORE INSERT           --naming trigger name & defining the execution of the same
    ON employee           --table name
    FOR EACH ROW BEGIN 
	IF NEW.sex = 'M'  THEN   
	   INSERT INTO trigger_test VALUES('added male employee');
	ELSEIF NEW.sex = 'F' THEN 
	   INSERT INTO trigger_test VALUES('added female employee');
	ELSE
	   INSERT INO trigger_test VALUE('added other employee');
	END IF;
    END$$
DELIMITER ;           --changed the delimiter again to {;}

--Add new employee: 
INSERT INTO employee VALUES(111, 'Pam', 'Beesly', '1988-02-19', 'F', 69000, 106, 3);

--To see trigger result:
SELECT * FROM trigger_test;

--Result : 
-- added new employee
-- added new employee
-- Kevin
-- added new employee
-- Pam
-- added female


--TO DROP trigger: DROP TRIGGER my_trigger;



#ER Diagrams: 
--Entity: An object we want to model & store information about (rectangle box)
--Attributes: Specific peices of information about an entity. (oval shape)
--Primary Key: An attribute(s) that uniquely identify an entry in the database table (underlined)
--Composite Attribute: An attribute that can be broken up into sub-attributes (oval shape but from any attribute)
--Multi-value Attribute: An attribute that can have more than one value (double oval shape)
--Derive Attribute: An attribute that can be derived from the other attributes (dotted oval)
--Multiple Entities: You can define more than one entity in the diagram 
--Relationships: defines a relationship between two entities (vertical square)
--Total Participation: All members must participate in the relationship	 {Single line indicates partial participation & double line indicates total participation}
--Relationship Attribute: An attribute about the relationship (oval extending from relationship)
--Relationship Cardinality: the number of instances of an entity from a rlation that can be associated with the relation (1:1 ; 1:N ; N:M)
--Weak Entity: An enity that cannot be uniquely identified by its attributes alone (it depends on other entity) (double rectangle) ; Also it should have total participation in the identifying relationship
--Identifying relationship: A relationship that serves to uniquly identify the weak entity (double vertical square)
 


#ER diagram to Database table:
--1. Mapping of regualr rntity types : For each regular entity type create a relation(table) that includes all the simple attributes of that entity.
--2. Mapping of weak entity types: For each weak entity tupe create a relation(table) that includes all simple attributes of the weak entity.
-- The primary key of the new relation should be the partial key of the weak entity plus the primary key of its owner.
--3. Mapping of Binary 1:1 relatiosnhip types: Include one ide of the relationship as a foreign key in the other favor total participation
--4. Mapping of Binary 1:N relationship types: Include the 1 side's primary key as a foreign key on the N side relation(table)
--5. Mapping of Bnary M:N relationship types: Create a new relation(table) who's primary key is a combination of both entities' primary key's. Also include any relationship attributes.
--We can join the columns from different tables to show relations of primary keys & foreign keys. 
