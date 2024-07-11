-- Creates a procedure ComputeAverageScoreForUser
-- Stores the average score as in student
DELIMITER $$

DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
	DECLARE sum_score INT;
	SELECT SUM(score) INTO sum_score
    FROM corrections
    WHERE user_id = user_id;
    UPDATE users
    SET
		average_score = sum_score / (SELECT COUNT(score) FROM corrections WHERE user_id = user_id)
	WHERE id = user_id;
END $$
DELIMITER ;
