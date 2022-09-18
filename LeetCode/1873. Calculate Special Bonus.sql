-- Que.: 1873. Calculate Special Bonus: https://leetcode.com/problems/calculate-special-bonus/
--Solution:
SELECT employee_id, CASE WHEN employee_id % 2 = 0 OR name LIKE 'M%' then 0 ELSE salary END AS bonus FROM Employees ORDER BY employee_id;
