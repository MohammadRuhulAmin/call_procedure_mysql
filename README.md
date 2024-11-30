# Procedure in MySqL

A procedure in MySQL is a stored program or a set of SQL statements that are stored on the database server and can be executed on demand. Procedures allow you to encapsulate repetitive or complex operations, reducing duplication and improving maintainability.


create procedure syntax:

```sql
DELIMITER //
CREATE PROCEDURE procedure_name()
BEGIN 
    /* Query/ set of queries for execution */
    select * from employees;
END //
DELIMITER;
```

to call the procedure: 

```sql
call procedure_name();
```

Paramitarized procedure:

```sql
DELIMITER //
CREATE PROCEDURE procedure_name(IN lim INT, IN ofset INT)
BEGIN 
    SELECT * FROM application_documents ORDER BY id LIMIT lim OFFSET ofset;
END //
DELIMITER;

CALL procedure_name(500,10);
```

To drop a procedure:

```sql
drop procedure procedure_name;
```



To pass table / database dynamically:

```sql
DELIMITER //
CREATE PROCEDURE my_procedure(IN lim INT, IN db_name VARCHAR(25),IN tbl_name VARCHAR(25), IN ofset INT)
BEGIN 
    SET @query = CONCAT('SELECT * FROM ', tbl_name, ' ORDER BY id LIMIT ', lim, ' OFFSET ', ofset);
    PREPARE stmt FROM @query; /*This tells MySQL to prepare the query and associate it with the stmt identifier.*/
    EXECUTE stmt; /*This executes the SQL query stored in the stmt prepared statement. The query that was constructed dynamically (stored in @query) will now be run by MySQL.*/
    DEALLOCATE PREPARE stmt; /* This releases the memory and resources that were allocated to the prepared statement stmt. After this, the stmt identifier is no longer valid and can no longer be used. */
END //
DELIMITER ;

CALL my_procedure(10,'db_name','table_name',100);

```



paramitarized loop with brake statement:

```sql

DELIMITER //
CREATE PROCEDURE myxk_xx(IN myvar INT)
BEGIN
DECLARE counter INT DEFAULT 0;
DECLARE mystring VARCHAR(100) DEFAULT "";
myloop:
WHILE  counter <= myvar DO
   IF counter = myvar THEN 
   LEAVE myloop; 
   END IF;
   SET mystring = CONCAT(mystring, "x");
   SET counter = counter+1;
END WHILE;
SELECT mystring;

END //

DELIMITER;


CALL myxk_xx(10);


```

Nested while loop in procedure Example:


```sql
DELIMITER //
CREATE PROCEDURE ex_loop()
BEGIN
  DECLARE counter INT DEFAULT 0;
  DECLARE j INT DEFAULT 0;
  DECLARE i INT DEFAULT 0;
  DECLARE res VARCHAR(255) DEFAULT "";  
  WHILE i<=10 DO
    SET res = CONCAT("x",res);
    SET i = i + 1;
    SET j = 0;
    WHILE j<=2 DO
      SET res = CONCAT("_",res);
      SET j = j + 1;
    
    END WHILE;
  END WHILE;
  SELECT res;
END //
DELIMITER;
CALL ex_loop();

```