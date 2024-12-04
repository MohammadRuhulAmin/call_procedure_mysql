START TRANSACTION;

-- Step 1: Check balance (Ensure sufficient funds exist)
SET @account_id = 1; -- Account ID to withdraw from
SET @withdraw_amount = 300; -- Withdrawal amount

-- Fetch the current balance
SELECT balance INTO @current_balance
FROM accounts
WHERE id = @account_id;

-- Check if balance is sufficient
IF @current_balance >= @withdraw_amount THEN
    -- Step 2: Deduct amount from account balance
    UPDATE accounts
    SET balance = balance - @withdraw_amount
    WHERE id = @account_id;

    -- Step 3: Commit the transaction
    COMMIT;
    SELECT 'Withdrawal successful!' AS status;
ELSE
    -- Insufficient funds: Rollback
    ROLLBACK;
    SELECT 'Insufficient balance. Transaction failed!' AS status;
END IF;