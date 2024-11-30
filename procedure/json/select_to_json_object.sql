DELIMITER //

CREATE PROCEDURE SelectToJSONObject()
BEGIN
    DECLARE json_result JSON;

    -- Convert the SELECT query result to JSON object
    SELECT JSON_OBJECT('author_name', author_name, 'post_title', title, 'author_photo',author_photo)
    INTO json_result
    FROM blogs
    LIMIT 1;  -- Modify based on the number of rows you want to return

    -- Print the resulting JSON object
    SELECT json_result AS blog_post_json;
END //

DELIMITER ;


CALL SelectToJSONObject()