DELIMITER //

CREATE PROCEDURE CreateAndPrintJSON()
BEGIN
    DECLARE json_obj JSON;

    -- Creating a JSON object with key-value pairs
    SET json_obj = JSON_OBJECT('name', 'John', 'age', 30, 'city', 'New York');

    -- Printing the stored JSON object
    SELECT json_obj AS my_json_object;
END //

DELIMITER ;


CALL CreateAndPrintJSON()