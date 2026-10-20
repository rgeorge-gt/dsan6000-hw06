-- DSAN 6000 HW06, Question 1.
SELECT
    MIN(latitude) AS min_latitude,
    MIN(longitude) AS min_longitude,
    MAX(latitude) AS max_latitude,
    MAX(longitude) AS max_longitude,
    CAST(SUM(population) AS INTEGER) AS population
FROM yemen_2020
WHERE type = 'total_population'
  AND ST_Within(
      ST_Point(longitude, latitude),
      ST_Polygon('POLYGON ((43.4 13.15, 43.75 13.3, 44.08 13.48, 44.48 13.9, 44.83 14.18, 45.3 14.62, 45.75 15.08, 46.4 15.42, 47.05 15.8, 47.78 16.4, 48.5 17.45, 49.4 18.35, 50.35 18.7, 51.4 18.85, 52.2 18.55, 52.65 17.85, 53.1 16.72, 52.75 16.45, 52.18 16.2, 51.6 15.92, 50.78 15.38, 49.73 14.81, 48.83 14.42, 47.88 14.02, 46.92 13.6, 45.92 13.2, 45.03 12.73, 44.35 12.65, 43.57 12.55, 43.28 12.69, 43.3 13.06, 43.4 13.15))')
  );
