DELIMITER //
CREATE PROCEDURE nested_loop2(IN cnt INT)
BEGIN
DECLARE i INT DEFAULT 0;
DECLARE j INT DEFAULT 0;
DECLARE res VARCHAR (255) DEFAULT "";


WHILE i <= cnt DO
  SET res = CONCAT(res ,"x");
  WHILE j <= 5 DO
  SET res = CONCAT(res, "y");
  SET j = j+1;
  END WHILE;
  SET j = 0;  
  SET i = i+1;
END WHILE; 

SELECT res;
END //
DELIMITER;

CALL nested_loopx(5);