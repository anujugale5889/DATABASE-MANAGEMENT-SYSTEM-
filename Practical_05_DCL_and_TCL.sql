-- Practical 5: DCL and TCL statements

/*
DCL controls access to database objects.
TCL controls transactions.

For GRANT and REVOKE, use an account that has permission to manage users.
The account syntax can vary by MySQL setup.
*/

CREATE DATABASE IF NOT EXISTS transaction_demo;
USE transaction_demo;

CREATE TABLE IF NOT EXISTS Account (
    account_id INT PRIMARY KEY,
    holder_name VARCHAR(50),
    balance DECIMAL(10,2)
);

INSERT INTO Account VALUES
(1, 'Riya', 5000),
(2, 'Karan', 3000)
ON DUPLICATE KEY UPDATE holder_name = VALUES(holder_name);

START TRANSACTION;

UPDATE Account
SET balance = balance - 500
WHERE account_id = 1;

SAVEPOINT after_debit;

UPDATE Account
SET balance = balance + 500
WHERE account_id = 2;

-- View the changes before committing.
SELECT * FROM Account;

COMMIT;

-- Example transaction to demonstrate ROLLBACK.
START TRANSACTION;
UPDATE Account SET balance = balance - 100 WHERE account_id = 1;
ROLLBACK;

SELECT * FROM Account;

-- Example permissions (replace the username/host as required).
-- GRANT SELECT ON transaction_demo.Account TO 'student_user'@'localhost';
-- REVOKE SELECT ON transaction_demo.Account FROM 'student_user'@'localhost';
