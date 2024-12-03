DELIMITER //

CREATE PROCEDURE SelectToJSONArray()
BEGIN
    DECLARE author_array JSON;
   
    -- Convert the result of the SELECT query into a JSON array
    SELECT JSON_ARRAYAGG(author_name)
    INTO author_array
    FROM blogs;

    -- Print the JSON array
    SELECT author_array AS author_names_json_array;
END //

DELIMITER ;

CALL SelectToJSONArray();