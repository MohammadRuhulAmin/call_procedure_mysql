
DELIMITER //
CREATE PROCEDURE summation(IN valx INT, IN valy INT, OUT res INT)
BEGIN
  -- Use SET to assign value to the OUT parameter
  SET res = valx + valy;
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE division(IN resx INT, OUT resy INT)
BEGIN
   DECLARE result INT; -- Local variable to store the result from `summation`
   -- Call the `summation` procedure
   CALL summation(23, 44, result);
   -- Perform the division and assign to the OUT parameter
   SET resy = result / resx;
END //
DELIMITER ;

CALL division(12,@resux);
SELECT @resux;