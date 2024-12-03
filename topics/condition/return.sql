DELIMITER //

CREATE PROCEDURE GradeEvaluation(IN score INT, OUT grade VARCHAR(25))
BEGIN
  IF score >= 90 AND score<=100 THEN SET grade = 'A+';
  ELSEIF score >= 70 AND score < 80 THEN SET grade = 'A';
  ELSEIF score >=60 AND score <70 THEN SET grade = 'A-';
  ELSE SET grade = 'F';
  END IF;
END //
DELIMITER;


CALL gradeEvaluation(75, @grade);
SELECT @grade AS 'final result';