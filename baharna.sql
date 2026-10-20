-- DSAN 6000 HW06 Question 2.2: Baharna population 
SELECT
    MIN(latitude) AS min_latitude,
    MIN(longitude) AS min_longitude,
    MAX(latitude) AS max_latitude,
    MAX(longitude) AS max_longitude,
    CAST(SUM(population) AS INTEGER) AS population
FROM default.full_2020
WHERE month = '2019-06'
  AND country = 'SAU'
  AND type = 'total_population'
  AND ST_Within(
      ST_Point(longitude, latitude),
      ST_Polygon('POLYGON ((48.94 25.12, 49.28 24.98, 49.72 25.04, 50.08 25.36, 50.22 25.82, 50.18 26.18, 50.22 26.48, 50.08 26.83, 49.77 26.95, 49.42 26.69, 49.14 26.36, 48.91 25.9, 48.82 25.48, 48.94 25.12))')
  );
