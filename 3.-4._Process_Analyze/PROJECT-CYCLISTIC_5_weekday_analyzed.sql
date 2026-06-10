-- show the rides in order of most frequent days of the week 
SELECT
  member_casual,
  day_of_week_start_name,
  COUNT(ride_id) AS number_of_rides
FROM `gda-projects-2026.cyclistic_data.cleaned_combined_trips`
GROUP BY member_casual, day_of_week_start_name
ORDER BY member_casual, number_of_rides DESC;