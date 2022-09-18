-- Que.: 196. Delete Duplicate Emails: https://leetcode.com/problems/delete-duplicate-emails/
--Solution:
DELETE p1 FROM Person p1, Person p2 WHERE p1.email = p2.email AND p1.id > p2.id;
