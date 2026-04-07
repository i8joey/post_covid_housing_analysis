WITH housing AS (SELECT h.year, h.quarter, MSPUS, JTSJOL, MORTGAGE30US, UNRATE
FROM cleaned_avg_housing h 
JOIN cleaned_mortgage m ON h.year=m.year AND h.quarter=m.quarter
JOIN cleaned_unemployment_rate u ON h.year=u.year AND h.quarter=u.quarter
JOIN cleaned_job_posting p ON h.year=p.year AND h.quarter=p.quarter
WHERE h.year >= 2019
ORDER BY h.year, h.quarter),
price_changes AS (SELECT *, MSPUS - (LAG(MSPUS) OVER(ORDER BY year, quarter)) AS price_change
FROM housing)

SELECT year, quarter, ROUND(JTSJOL, 2) AS job_openings, price_change FROM price_changes



