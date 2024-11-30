DELIMITER //
CREATE PROCEDURE lpx()
BEGIN
DECLARE counter INT DEFAULT 0;
WHILE counter <5 DO
    INSERT INTO index_tbl(counter) VALUES (counter);
    SET counter = counter + 1;
END WHILE;

END //
DELIMITER;