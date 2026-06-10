-- show the rides count in order of seasons of the year 
SELECT
  member_casual,
  COUNT(ride_id) AS number_of_rides,
  CASE 
    -- Spring: March 21 to June 20
    WHEN (EXTRACT(MONTH FROM started_at) = 3 AND EXTRACT(DAY FROM started_at) >= 21) OR EXTRACT(MONTH FROM started_at) IN (4, 5) OR (EXTRACT(MONTH FROM started_at) = 6 AND EXTRACT(DAY FROM started_at) <= 20) THEN 'Spring'
    -- Summer: June 21 to September 22
    WHEN (EXTRACT(MONTH FROM started_at) = 6 AND EXTRACT(DAY FROM started_at) >= 21) OR EXTRACT(MONTH FROM started_at) IN (7, 8) OR (EXTRACT(MONTH FROM started_at) = 9 AND EXTRACT(DAY FROM started_at) <= 22) THEN 'Summer'
    -- Autumn: September 23 to December 20
    WHEN (EXTRACT(MONTH FROM started_at) = 9 AND EXTRACT(DAY FROM started_at) >= 23) OR EXTRACT(MONTH FROM started_at) IN (10, 11) OR (EXTRACT(MONTH FROM started_at) = 12 AND EXTRACT(DAY FROM started_at) <= 20) THEN 'Autumn'
    -- Winter: December 21 to March 20
    ELSE 'Winter' 
  END AS season
FROM `gda-projects-2026.cyclistic_data.cleaned_combined_trips`
GROUP BY member_casual, season
ORDER BY member_casual, number_of_rides DESC;