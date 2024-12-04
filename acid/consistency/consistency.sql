START TRANSACTION;

-- Step 1: Deduct $500 from Alice's account (id = 1)
UPDATE accounts
SET balance = balance - 500
WHERE id = 1;

-- Step 2: Add $500 to Bob's account (id = 2)
UPDATE accounts
SET balance = balance + 500
WHERE id = 2;

-- Step 3: Check consistency (total balance must remain the same)
SET @total_balance := 0;

SELECT SUM(balance) INTO @total_balance
FROM accounts;

-- Assume the initial total balance is 1500
IF @total_balance = 1500 THEN
    -- Commit the transaction if consistent
    COMMIT;
    SELECT 'Transaction successful and consistent!' AS status;
ELSE
    -- Rollback if inconsistency detected
    ROLLBACK;
    SELECT 'Transaction failed due to inconsistency!' AS status;
END IF;