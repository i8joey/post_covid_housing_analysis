WITH housing AS (SELECT h.year, h.quarter, MSPUS, JTSJOL, MORTGAGE30US, UNRATE
FROM cleaned_avg_housing h 
JOIN cleaned_mortgage m ON h.year=m.year AND h.quarter=m.quarter
JOIN cleaned_unemployment_rate u ON h.year=u.year AND h.quarter=u.quarter
JOIN cleaned_job_posting p ON h.year=p.year AND h.quarter=p.quarter
WHERE h.year >= 2019
ORDER BY h.year, h.quarter)

SELECT year, ROUND(AVG(MSPUS), 2) AS avg_housing_price, ROUND(AVG(UNRATE), 2) AS avg_unemployment_rate FROM housing
GROUP BY year



