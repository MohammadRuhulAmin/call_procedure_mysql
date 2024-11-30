DELIMITER //
CREATE PROCEDURE app_docs(IN xlim INT,IN offst INT)
BEGIN
  SELECT * FROM application_documents ORDER BY id LIMIT xlim OFFSET offst;
END //
DELIMITER;

call app_docs(100,50);
