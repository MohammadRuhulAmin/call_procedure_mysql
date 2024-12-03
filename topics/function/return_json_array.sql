DELIMITER //

CREATE FUNCTION getMultipleRecordsFromQuery() RETURNS JSON DETERMINISTIC
BEGIN
    DECLARE json_result JSON;
    SELECT JSON_ARRAYAGG(
               JSON_OBJECT('id', id, 'event', EVENT, 'model', model)
           )
    INTO json_result
    FROM audits;
    RETURN json_result;
END //

DELIMITER ;

SELECT getMultipleRecordsFromQuery();

