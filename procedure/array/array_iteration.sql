DELIMITER //

CREATE PROCEDURE I()
BEGIN
    DECLARE json_array_elem JSON;
    DECLARE author_name VARCHAR(255);
    DECLARE i INT DEFAULT 0;
    DECLARE array_length INT;
    DECLARE result VARCHAR(255) DEFAULT "";

    -- Example JSON array (you can modify this as needed)
    SET json_array_elem = JSON_ARRAY("John", "Jane", "Alice", "Bob");

    -- Get the length of the JSON array
    SET array_length = JSON_LENGTH(json_array_elem);

    -- Loop through the JSON array
    WHILE i < array_length DO
        -- Extract the element at index i (JSON arrays are 0-indexed)
        SET author_name = JSON_UNQUOTE(JSON_EXTRACT(json_array_elem, CONCAT('$[', i, ']')));

        -- Append the author name to the result string
        SET result = CONCAT(result, author_name, ",");

        -- Increment the counter to move to the next index
        SET i = i + 1;
    END WHILE;

    -- Remove the trailing comma from the result string
    SET result = LEFT(result, LENGTH(result) - 1);

    -- Return the concatenated authors list
    SELECT result AS authors_list;

END //

DELIMITER ;