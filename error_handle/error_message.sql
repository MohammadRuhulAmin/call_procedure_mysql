DELIMITER //
CREATE FUNCTION safe_division(numerator INT, denominator INT)
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
    -- Validate the denominator
    IF denominator = 0 THEN
        -- Raise a custom error for division by zero
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Division by zero attempted in function';
    END IF;
    -- If valid, return the result
    RETURN CONCAT('Result: ', numerator / denominator);
END //
DELIMITER ;
SELECT safe_division(1,0);