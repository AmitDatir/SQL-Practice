/*
182. Duplicate Emails : https://leetcode.com/problems/duplicate-emails/description/
*/



SELECT DISTINCT P1.Email FROM Person P1,Person P2 

WHERE P1.id <> P2.id AND P1.Email=P2.Email
