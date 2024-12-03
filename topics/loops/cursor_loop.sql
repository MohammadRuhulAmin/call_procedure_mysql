DELIMITER //

CREATE PROCEDURE ExampleCursorLoop()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE value_col INT;

    -- Declare a cursor
    DECLARE cursor_example CURSOR FOR SELECT col FROM sample_table;

    -- Declare a condition handler for the end of the cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Open the cursor
    OPEN cursor_example;

    -- Fetch rows in a loop
    REPEAT
        FETCH cursor_example INTO value_col;

        IF NOT done THEN
            -- Perform operations with the fetched value
            INSERT INTO another_table (col) VALUES (value_col);
        END IF;
    UNTIL done
    END REPEAT;

    -- Close the cursor
    CLOSE cursor_example;
END //

DELIMITER ;

CALL ExampleCursorLoop();