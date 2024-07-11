-- Creates a procedure ComputeAverageScoreForUser
-- Stores the average score as in student
DELIMITER $$

CREATE PROCEDURE ComputeAverageScoreForUser(
    IN user_id INT
)
BEGIN
    DECLARE sum_scores INT;
    DECLARE average FLOAT;

    -- Calculate sum of scores and count of corrections for the user
    SELECT SUM(score) INTO sum_scores FROM corrections WHERE user_id = user_id;

    -- Update users table with the calculated average score
    UPDATE users SET
	average = sum_scores / (SELECT COUNT(score) FROM corrections WHERE user_id = users_id)
	WHERE id = user_id

END $$

DELIMITER ;
