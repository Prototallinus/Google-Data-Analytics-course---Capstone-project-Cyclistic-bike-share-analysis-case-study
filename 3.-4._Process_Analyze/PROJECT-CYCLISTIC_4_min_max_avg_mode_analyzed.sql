WITH day_counts AS (
  -- Step 1: Count rides for every day of the week per user type
  SELECT 
    member_casual,
    day_of_week_start_name,
    COUNT(ride_id) AS day_ride_count,
    -- Step 2: Rank the days from most popular (1) to least popular (7)
    ROW_NUMBER() OVER(
      PARTITION BY member_casual 
      ORDER BY COUNT(ride_id) DESC
    ) AS day_rank
  FROM `gda-projects-2026.cyclistic_data.cleaned_combined_trips`
  GROUP BY member_casual, day_of_week_start_name
),

most_popular_day AS (
  -- Step 3: Keep only the single most frequent day (the Mode) for each group
  SELECT 
    member_casual,
    day_of_week_start_name AS mode_day_of_week
  FROM day_counts
  WHERE day_rank = 1
)

-- Step 4: Combine the main summary statistics with the mode day
SELECT
  t.member_casual,
  COUNT(t.ride_id) AS total_rides,
  ROUND(AVG(t.ride_length_minutes), 2) AS average_ride_length_minutes,
  ROUND(MAX(t.ride_length_minutes), 2) AS max_ride_length_minutes,
  ROUND(MIN(t.ride_length_minutes), 2) AS min_ride_length_minutes,
  m.mode_day_of_week AS mode_day_of_week
FROM `gda-projects-2026.cyclistic_data.cleaned_combined_trips` t
JOIN most_popular_day m 
  ON t.member_casual = m.member_casual
GROUP BY t.member_casual, m.mode_day_of_week;