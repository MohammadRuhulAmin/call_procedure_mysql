DELIMITER //
CREATE PROCEDURE ifelse(IN var INT)
BEGIN
IF var > 0 THEN 
  SELECT "number is positive";
 ELSE 
   SELECT "number is negative";
END IF;
END //
DELIMITER;
