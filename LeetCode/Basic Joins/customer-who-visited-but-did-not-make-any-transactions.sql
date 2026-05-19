-- https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/

SELECT 
    V.customer_id,
    COUNT(*) AS count_no_trans
FROM Visits AS V
LEFT JOIN Transactions AS T
ON  V.visit_id = T.visit_id
WHERE transaction_id IS NULL
GROUP BY V.customer_id