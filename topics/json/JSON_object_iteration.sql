DELIMITER //

CREATE PROCEDURE IterateOverJSONObject()
BEGIN
    DECLARE JSON_OBJECT JSON;
    DECLARE author_key VARCHAR(255);  -- Changed variable name to avoid reserved word
    DECLARE VALUE INT;
    DECLARE i INT DEFAULT 0;
    DECLARE keys_count INT;
    DECLARE result VARCHAR(255) DEFAULT "";

    -- Example JSON object (you can modify this as needed)
    SET JSON_OBJECT = '{"John": 30, "Jane": 25, "Alice": 35, "Bob": 40}';

    -- Get the number of keys in the JSON object
    SET keys_count = JSON_LENGTH(JSON_KEYS(JSON_OBJECT));

    -- Loop through the keys of the JSON object
    WHILE i < keys_count DO
        -- Extract the key at index i
        SET author_key = JSON_UNQUOTE(JSON_EXTRACT(JSON_KEYS(JSON_OBJECT), CONCAT('$[', i, ']')));

        -- Extract the corresponding value for the key
        SET VALUE = JSON_UNQUOTE(JSON_EXTRACT(JSON_OBJECT, CONCAT('$."', author_key, '"')));

        -- Append the key-value pair to the result string
        SET result = CONCAT(result, author_key, ":", VALUE, ", ");

        -- Increment the counter to move to the next key
        SET i = i + 1;
    END WHILE;

    -- Remove the trailing comma and space
    SET result = LEFT(result, LENGTH(result) - 2);

    -- Return the concatenated result
    SELECT result AS key_value_pairs;

END //

DELIMITER ;


CALL IterateOverJSONObject();