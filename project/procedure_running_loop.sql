DELIMITER //
CREATE PROCEDURE chx_running_loop_control()
BEGIN
  DECLARE loop_control INT DEFAULT 1; -- Start from 1
  DECLARE total_records INT DEFAULT 0;
  -- Fetch the total number of records
  SELECT COUNT(ID) INTO total_records 
  FROM table_x 
  WHERE case_status_id = 1;
  -- Loop through the records
  WHILE loop_control <= total_records DO
      -- Call another procedure (ensure this exists and is correctly defined)
      CALL challan_data_migration_procedure();
      -- Increment the loop control variable
      SET loop_control = loop_control + 1;
  END WHILE;
END //
DELIMITER ;


-- SHOW PROCEDURE STATUS WHERE NAME = 'challan_data_migration_procedure';