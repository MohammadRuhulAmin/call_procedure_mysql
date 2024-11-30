# Procedure 

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