WITH housing AS (SELECT h.year, h.quarter, MSPUS, JTSJOL, MORTGAGE30US, UNRATE
FROM cleaned_avg_housing h 
JOIN cleaned_mortgage m ON h.year=m.year AND h.quarter=m.quarter
JOIN cleaned_unemployment_rate u ON h.year=u.year AND h.quarter=u.quarter
JOIN cleaned_job_posting p ON h.year=p.year AND h.quarter=p.quarter),
price_changes AS (SELECT year, quarter, MSPUS, MORTGAGE30US,  MSPUS - (LAG(MSPUS) OVER(ORDER BY year, quarter)) as qoq_price_change FROM housing
WHERE year >= 2019
ORDER BY year, quarter)

SELECT year, quarter, qoq_price_change, MORTGAGE30US FROM price_changes
ORDER BY qoq_price_change DESC
LIMIT 1




