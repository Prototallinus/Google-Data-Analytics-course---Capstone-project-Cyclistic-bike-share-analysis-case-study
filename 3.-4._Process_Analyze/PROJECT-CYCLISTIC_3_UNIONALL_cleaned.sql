-- 1. Create a combined table from all 12 monthly tables
--    We use UNION ALL to stack rows vertically (keeps duplicates if any)
WITH combined AS (
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
),

-- 2. fix data types
all_trips AS( 
  SELECT
    ride_id,            
    rideable_type,      
    started_at,         
    ended_at,           
    member_casual,      
    start_station_name, 
    end_station_name,
    SAFE_CAST(start_station_id AS STRING) AS start_station_id,
    SAFE_CAST(end_station_id AS STRING) AS end_station_id,
    SAFE_CAST(start_lat AS FLOAT64) AS start_lat,
    SAFE_CAST(start_lng AS FLOAT64) AS start_lng,
    SAFE_CAST(end_lat AS FLOAT64) AS end_lat, 
    SAFE_CAST(end_lng AS FLOAT64) AS end_lng
FROM combined
)

SELECT 
  ride_id,
  -- rideable_type,
  started_at,
  ended_at,
  member_casual,
  -- start_station_name,
  -- end_station_name,
  -- start_station_id,
  -- end_station_id,
  -- start_lat,
  -- start_lng,
  -- end_lat,
  -- end_lng,
  FORMAT('%02d:%02d:%02d', 
    DIV(TIMESTAMP_DIFF(ended_at, started_at, SECOND), 3600),                           -- Hours
    MOD(DIV(TIMESTAMP_DIFF(ended_at, started_at, SECOND), 60), 60),                    -- Minutes
    MOD(TIMESTAMP_DIFF(ended_at, started_at, SECOND), 60)                              -- Seconds
  ) AS ride_length_hhmmss,
  --- SAFE_CAST(ride_length_hhmmss AS FLOAT64) AS ride_length_number, THIS IS WRONG 'cause one cannot use ride_length_hhmmss in the exact same SELECT block where you just created it. SQL compiles the whole block at once, so it doesn't recognize that name yet. Moreover, even if SQL could see it, a clock format string like "01:05:09" contains colons (:). BigQuery cannot convert colons into a raw float decimal number (FLOAT64), which will return NULL or fail completely
  ROUND(TIMESTAMP_DIFF(ended_at, started_at, SECOND) / 60, 2) AS ride_length_minutes, 
  EXTRACT(DAYOFWEEK FROM started_at) AS day_of_week_start_number,
  FORMAT_TIMESTAMP('%A', started_at) AS day_of_week_start_name
FROM all_trips
WHERE 
  started_at IS NOT NULL
  AND ended_at IS NOT NULL
  AND TIMESTAMP_DIFF(ended_at, started_at, SECOND) > 60   -- positive duration (use 60 SECOND to filter out rides >1 min)
