DELIMITER $$

CREATE PROCEDURE WithdrawAmount(
    IN account_id INT,          -- Account ID to withdraw from
    IN withdraw_amount DECIMAL(10,2), -- Amount to withdraw
    OUT status_message VARCHAR(255)   -- Output message
)
BEGIN
    DECLARE current_balance DECIMAL(10,2); -- Variable to store current balance
    DECLARE insufficient_funds EXCEPTION;  -- Custom exception for insufficient funds

    -- Step 1: Start a transaction
    START TRANSACTION;

    -- Step 2: Get the current balance
    SELECT balance INTO current_balance
    FROM accounts
    WHERE id = account_id
    FOR UPDATE; -- Lock the row for this transaction

    -- Step 3: Check if the balance is sufficient
    IF current_balance IS NULL THEN
        -- If account does not exist
        SET status_message = 'Account not found!';
        ROLLBACK; -- Undo any changes
    ELSEIF current_balance < withdraw_amount THEN
        -- If insufficient funds
        SET status_message = 'Insufficient funds!';
        ROLLBACK; -- Undo any changes
    ELSE
        -- Step 4: Deduct the amount from the balance
        UPDATE accounts
        SET balance = balance - withdraw_amount
        WHERE id = account_id;

        -- Step 5: Commit the transaction
        COMMIT;
        SET status_message = 'Withdrawal successful!';
    END IF;
END$$

DELIMITER ;


CALL WithdrawAmount(1, 300, @message); -- Withdraw $300 from Alice's account
SELECT @message AS status;


CALL WithdrawAmount(2, 600, @message); -- Withdraw $600 from Bob's account
SELECT @message AS status;


CALL WithdrawAmount(999, 100, @message); -- Withdraw from a non-existing account
SELECT @message AS status;
