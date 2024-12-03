DELIMITER //

CREATE PROCEDURE ExampleRepeatLoop()
BEGIN
    DECLARE counter INT DEFAULT 1;
    DECLARE myString VARCHAR(100) DEFAULT "";
    -- REPEAT loop
    REPEAT
        -- Perform some operation
        SET myString = CONCAT(myString,"x");

        -- Increment counter
        SET counter = counter + 1;
    UNTIL counter > 10
    END REPEAT;
    SELECT myString AS myRes;
END //

DELIMITER ;

CALL ExampleRepeatLoop()
