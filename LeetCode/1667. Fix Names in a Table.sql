-- Que.: 1667. Fix Names in a Table: https://leetcode.com/problems/fix-names-in-a-table/
--Solution:
SELECT Users.user_id, CONCAT(UPPER(SUBSTR(Users.name,1,1)), LOWER(SUBSTR(Users.name,2))) AS name FROM Users ORDER BY Users.user_id;
