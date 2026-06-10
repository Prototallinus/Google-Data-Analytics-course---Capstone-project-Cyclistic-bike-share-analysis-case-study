-- Query to check total count of rows by month, year and total 
SELECT 
  EXTRACT(YEAR FROM started_at) AS year,
  EXTRACT(MONTH FROM started_at) AS month,
  COUNT(*) AS row_count,
  SUM(COUNT(*)) OVER() AS total_across_all_months
FROM (
  -- your UNION ALL query here (without final WHERE filters)
  SELECT * FROM `gda-projects-2026.cyclistic_data.202505divvytripdata`
  UNION ALL
  SELECT * FROM `gda-projects-2026.cyclistic_data.202506divvytripdata`
  UNION ALL
  SELECT * FROM `gda-projects-2026.cyclistic_data.202507divvytripdata`
  UNION ALL
  SELECT * FROM `gda-projects-2026.cyclistic_data.202508divvytripdata`
  UNION ALL
  SELECT * FROM `gda-projects-2026.cyclistic_data.202509divvytripdata`
  UNION ALL
  SELECT * FROM `gda-projects-2026.cyclistic_data.202510divvytripdata`
  UNION ALL
  SELECT * FROM `gda-projects-2026.cyclistic_data.202511divvytripdata`
  UNION ALL
  SELECT * FROM `gda-projects-2026.cyclistic_data.202512divvytripdata`
  UNION ALL
  SELECT * FROM `gda-projects-2026.cyclistic_data.202601divvytripdata`
  UNION ALL
  SELECT * FROM `gda-projects-2026.cyclistic_data.202602divvytripdata`
  UNION ALL
  SELECT * FROM `gda-projects-2026.cyclistic_data.202603divvytripdata`
  UNION ALL
  SELECT * FROM `gda-projects-2026.cyclistic_data.202604divvytripdata`
)
GROUP BY year, month
ORDER BY year, month;