SELECT
    adm1,
    MIN(latitude) AS min_latitude,
    MIN(longitude) AS min_longitude,
    MAX(latitude) AS max_latitude,
    MAX(longitude) AS max_longitude,
    CAST(SUM(population) AS INTEGER) AS population
FROM yemen_2020
WHERE type = 'total_population'
  AND adm1 IN ('Aden', 'Sana''a')
GROUP BY adm1
ORDER BY adm1;
