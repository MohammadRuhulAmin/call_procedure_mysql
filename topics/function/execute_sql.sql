DELIMITER //

CREATE FUNCTION GenerateQueryResult(num INT) RETURNS INT DETERMINISTIC
BEGIN
DECLARE total_count INT DEFAULT 0;
SELECT COUNT(id) INTO total_count FROM audits WHERE id > num;
RETURN total_count;
END //

DELIMITER;

SELECT GenerateQueryResult(5)