-- DSAN 6000 HW06, Question 1.3
-- Compare youth and elderly population estimates across former North Yemen (YAR)
-- and South Yemen (PDRY) using the Yemen 2020 Athena table.
-- The partition name is elderly_60_plus (verified in Athena).

WITH classified AS (
    SELECT
        type,
        population,
        CASE
            WHEN adm1 IN (
                'Aden',
                'Abyan',
                'Al Mahrah',
                'Hadramawt',
                'Lahij',
                'Shabwah'
            ) THEN 'PDRY'
            WHEN adm1 IN (
                'Al Bayda''',
                'Sana''a',
                'Al Dali''',
                'Al Hudaydah',
                'Al Jawf',
                'Al Mahwit',
                'Amanat Al Asimah',
                'Amran',
                'Dhamar',
                'Hajjah',
                'Ibb',
                'Ma''rib',
                'Raymah',
                'Sa''dah',
                'Ta''izz'
            ) THEN 'YAR'
        END AS former_country
    FROM yemen_2020
    WHERE type IN (
        'elderly_60_plus',
        'youth_15_24'
    )
)
SELECT
    type,
    former_country,
    CAST(SUM(population) AS INTEGER) AS population
FROM classified
WHERE former_country IS NOT NULL
GROUP BY type, former_country
ORDER BY type, former_country;
