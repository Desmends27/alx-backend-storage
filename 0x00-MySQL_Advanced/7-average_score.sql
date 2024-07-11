-- CREATE A stored proecedure ComputeAverageScoreForUser
-- Stores the average for a student
DELIMITER $$

CREATE PROCEDURE ComputeAverageScoreForUser(
    IN user_id INT
)
BEGIN
    DECLARE average FLOAT;

    -- Calculate average score for the user
    SELECT AVG(score) INTO average FROM corrections WHERE user_id = user_id;

    -- Update users table with the calculated average score
    UPDATE users SET average_score = average WHERE id = user_id;
    
END $$

DELIMITER ;
