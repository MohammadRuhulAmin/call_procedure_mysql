DELIMITER //
CREATE PROCEDURE StoreAndPrintJSON()
BEGIN
    DECLARE json_result JSON;
    -- Storing JSON array in the variable
    SET json_result = JSON_ARRAY(1, "apple", TRUE, NULL);
    -- Printing the stored JSON array
    SELECT json_result AS my_json_array;
END //
DELIMITER ;

CALL StoreAndPrintJSON()