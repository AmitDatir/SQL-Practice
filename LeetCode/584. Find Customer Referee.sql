-- Que.: 584. Find Customer Referee: https://leetcode.com/problems/find-customer-referee/?envType=study-plan&id=sql-i
--Solution:
SELECT name FROM Customer WHERE referee_id != 2 OR referee_id IS null;
