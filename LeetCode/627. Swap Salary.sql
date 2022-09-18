-- Que.: 627. Swap Salary: https://leetcode.com/problems/swap-salary/
--Solution:
UPDATE Salary SET sex = (CASE WHEN sex = 'm' THEN 'f' else 'm' END);
