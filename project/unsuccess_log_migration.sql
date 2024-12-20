DELIMITER //

CREATE PROCEDURE challan_unsuccess_log_migration()
BEGIN
    DECLARE error_message VARCHAR(255);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS	CONDITION 1 error_message = MESSAGE_TEXT;
        ROLLBACK;
        SET autocommit = 1;
        SELECT error_message AS Error;
    END;
    SET autocommit = 0;
    START TRANSACTION;
    INSERT INTO db_name.table_x 
    SELECT * 
    FROM db_name.table_x 
    WHERE id IN (SELECT table_x FROM table_x.challan_unsuccess_log);
    UPDATE pg_service_rnd.challan_unsuccess_log 
    SET `status` = 1 
    WHERE `status` = -1;
    COMMIT;

    -- Re-enable autocommit
    SET autocommit = 1;
END //

DELIMITER ;