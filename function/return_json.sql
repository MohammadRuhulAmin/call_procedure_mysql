DELIMITER //

CREATE FUNCTION getMultipleRecords() RETURNS JSON DETERMINISTIC
BEGIN
    RETURN JSON_ARRAY(
        JSON_OBJECT('id', 1, 'name', 'Alice'),
        JSON_OBJECT('id', 2, 'name', 'Bob'),
        JSON_OBJECT('id', 3, 'name', 'Charlie')
    );
END //

DELIMITER ;


SELECT getMultipleRecords()