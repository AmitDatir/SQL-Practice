-- QUE: 595.Big Countries: https://leetcode.com/problems/big-countries/
--Solution:
SELECT name, population, area FROM World
WHERE area >= 3000000 OR population >= 25000000;
