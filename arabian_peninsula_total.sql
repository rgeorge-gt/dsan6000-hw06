-- HW6 Question 2.1: Combined estimated population of Yemen, Oman, Saudi Arabia.
SELECT
    CAST(SUM(population) AS INTEGER) AS population
FROM default.full_2020
WHERE month = '2019-06'
  AND country IN ('YEM', 'OMN', 'SAU')
  AND type = 'total_population';
