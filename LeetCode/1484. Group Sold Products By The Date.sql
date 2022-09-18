-- Que.: 1484. Group Sold Products By The Date: https://leetcode.com/problems/group-sold-products-by-the-date/
--Solution:
SELECT sell_date, COUNT(DISTINCT(product)) AS num_sold, GROUP_CONCAT(DISTINCT product ORDER BY product) AS products FROM Activities GROUP BY sell_date;
