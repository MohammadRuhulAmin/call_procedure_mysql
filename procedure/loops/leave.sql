DELIMITER $$

CREATE PROCEDURE break_in_while_loop()
BEGIN
    DECLARE counter INT DEFAULT 1;
    DECLARE summation INT DEFAULT 0;

    -- Label the loop as 'while_loop'
    while_loop: WHILE counter <= 10 DO
        SET summation = summation + 5;

        -- Check if counter equals 5, then break the loop
        IF counter = 5 THEN
            LEAVE while_loop;  -- This will break the loop
        END IF;

        -- Increment the counter
        SET counter = counter + 1;
    END WHILE;

    -- Return the summation value
    SELECT summation;
END$$

DELIMITER ;

CALL break_in_while_loop();
