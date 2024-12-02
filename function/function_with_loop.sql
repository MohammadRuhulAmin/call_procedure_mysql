DELIMITER //

CREATE FUNCTION functionWithLoop(num INT) RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
  DECLARE i INT DEFAULT 0;
  DECLARE mystring TEXT DEFAULT "";  
  WHILE i<=num DO
    SET mystring = CONCAT(mystring,"x");
    SET i = i+1;
  END WHILE;
  RETURN mystring;
END //

DELIMITER;
   
SELECT functionWithLoop(260);