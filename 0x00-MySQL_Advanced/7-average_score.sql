DELIMITER $$

CREATE PROCEDURE ComputeAverageScoreForUser(
    IN user_id INT
)
BEGIN
    DECLARE sum_scores INT;
    DECLARE num_corrections INT;
    DECLARE average FLOAT;

    -- Calculate sum of scores and count of corrections for the user
    SELECT SUM(score), COUNT(*) INTO sum_scores, num_corrections FROM corrections WHERE user_id = user_id;

    -- Calculate average score
    IF num_corrections > 0 THEN
        SET average = sum_scores / num_corrections;
    ELSE
        SET average = 0;  -- Handle division by zero case
    END IF;

    -- Update users table with the calculated average score
    UPDATE users SET average_score = average WHERE id = user_id;

END $$

DELIMITER ;
