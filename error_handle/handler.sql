DELIMITER //

CREATE FUNCTION example_function(input_value INT) RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(50);
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION /* This defines a block to handle SQL execptions. In this example any SQL exception will trigger the 
    handler, and a default message will be returned.('Error occured during processing') */
        BEGIN
            -- Handle the exception and set a default value or return an error
            RETURN 'Error occurred during processing';
        END;

    -- Your main logic goes here
    IF input_value < 0 THEN
        SIGNAL SQLSTATE '45000' /* SIGNAL is used to raise a custom error */
        SET MESSAGE_TEXT = 'Input value cannot be negative';
    ELSE
        SET result = CONCAT('Processed value: ', input_value);
    END IF;

    RETURN result;
END;
//

DELIMITER ;
/*
The HANDLER is safety net for unanticipated SQL erros (if the function encounters a database-level error)
The SIGNAL is for anticipated, application-specific errors where you want fine-grained control over the error message.
*/