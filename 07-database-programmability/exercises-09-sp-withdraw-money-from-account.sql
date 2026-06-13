CREATE PROCEDURE sp_withdraw_money(
	account_id INT, 
	money_amount NUMERIC(19, 4)
)
AS
$$
	DECLARE
		current_balance NUMERIC(19, 4);
	BEGIN
		current_balance := (SELECT balance FROM accounts WHERE id = account_id);
		IF current_balance < money_amount THEN
			RAISE NOTICE 'NOTICE: Insufficient balance to withdraw %', money_amount;
		ELSE
			UPDATE accounts
			SET
				balance = balance - money_amount
			WHERE
				id = account_id;
		END IF;
	END
$$
LANGUAGE plpgsql;

-- CALL sp_withdraw_money(3, 5050.7500);
-- SELECT * FROM accounts
-- WHERE id = 3;

-- CALL sp_withdraw_money(6, 5437.0000);
-- SELECT * FROM accounts
-- WHERE id = 6;