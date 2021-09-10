-- When considering average spend from receipts with 'rewardsReceiptStatus' of
-- ‘Accepted’ or ‘Rejected’, which is greater?

SELECT rewards_receipt_status,
	ROUND(AVG(total_spent::DECIMAL), 2)
FROM receipts
where rewards_receipt_status = 'FINISHED' or
	rewards_receipt_status = 'REJECTED'
GROUP BY rewards_receipt_status

-- Assumption: There is no 'ACCEPTED' status in the 'rewardsReceiptStatus' field,
-- assuming the status 'FINISHED' means the same thing as receipt accepted.

-- If we were to answer the next bullet point " When considering total number of 
-- items purchased from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or 
-- ‘Rejected’, which is greater? ", we would change the function 'AVG()' to 'COUNT()'.

